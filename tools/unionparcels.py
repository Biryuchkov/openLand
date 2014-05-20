# -*- coding: utf-8 -*-
'''
/***************************************************************************
 unionParcels for openLand (cadastral engineer tools)
 copyright            : (C) 2013 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from common import *
from unionparcels_ui import Ui_UnionParcels

import uuid 

class unionParcels(QDialog,  Ui_UnionParcels):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        QObject.connect(self.pushButtonOk, SIGNAL("clicked()"), self.doAdd)
        QObject.connect(self.pushButtonCancel, SIGNAL("clicked()"), self.doCancel)

        self.layerUc = get_vector_layer_by_name(gln['ln_uchastok'])

        self.selectionCount = 0
        self.parcels        = []
        self.idParcels      = []
        self.guid           = str(uuid.uuid4())
        self.progress       = QProgressBar()

    def toPrepare(self):
        selection = self.layerUc.selectedFeatures()
        self.selectionCount = len(selection)
        if self.selectionCount > 1:
            selectParcel = attributesFromSelection('ln_uchastok', ['id', 'kn', 
                                                                   'id_kvartal'])
            self.idParcels = [int(every['id']) for every in selectParcel]
            self.parcels = [[int(every['id']), every['kn'], every['id_kvartal']] 
                            for every in selectParcel]

            if len(self.idParcels) > 1:
                listParent = attributesByKeys('pb_parcel_parcel', 'id_children', 
                                              self.idParcels, ['id_parent'])
                if len(listParent) > 0:
                    QMessageBox.warning(self.iface.mainWindow(), u"Ошибка выбора данных", 
                                                                 u'Один из выбранных полигонов является контуром, входящим в ЕЗП или ЧЗУ. Объединение невозможно.')
                    return False
            else:
                QMessageBox.warning(self.iface.mainWindow(), u"Ошибка", 
                                                             u'Не определены идентификаторы ЗУ. Объединение невозможно.')
                return False

            self.lineEditSelectedCount.setText(str(self.selectionCount))
            return True

        else:
            QMessageBox.warning(self.iface.mainWindow(), u"Ошибка выбора данных", 
                                                         u'Необходимо выбрать не менее двух участков для выполнения процедуры объединения.')
            return False

    def doAdd(self):
        if len(self.parcels) < 2:
            self.iface.messageBar().clearWidgets()
            self.close()
            
        progressMessageBar = self.iface.messageBar().createMessage(u'Создание ЗУ путём обединения...')
        self.progress.setMaximum(self.selectionCount)
        self.progress.setAlignment(Qt.AlignLeft|Qt.AlignVCenter)
        progressMessageBar.layout().addWidget(self.progress)
        self.iface.messageBar().pushWidget(progressMessageBar, 
                                           self.iface.messageBar().INFO)
        listValues = []
        listValues.append(self.guid)
        listValues.append(idCurrentMSK())
        listValues.append(QgsGeometry())

        if insertFeatures('ln_uchastok', 
                          ['guid', 'id_msk', 'geom'], 
                          [listValues]):
            idBase = valueByFieldValue('ln_uchastok', 'id', 'i', 'guid', 
                                              self.guid, 's')
        else:
            idBase = 0

        if not (idBase > 0):
            self.iface.messageBar().clearWidgets()
            self.close()

        geomNew = None
        n = 0
        for everyParcel in self.parcels:
            n += 1
            self.progress.setValue(n)
            idEveryParcel = everyParcel[0]
            knEveryParcel = everyParcel[1]
            idKvartal     = everyParcel[2]

            listNames  = ['id_uchastok', 'tip_kn', 'kn']
            listValues = [idBase, int(gv['prevKn']), knEveryParcel]

            if not insertFeatures('pb_kn', listNames, [listValues]):
                QMessageBox.warning(self.iface.mainWindow(), u"Ошибка", 
                                                             u'Не добавлен предыдущий кадастровый номер ' + knEveryParcel)

            searchCondition = '\"id_uchastok\" = ' + str(idEveryParcel)
            listIdPointForDelete = attributesBySearchCondition('ln_tochka', 
                                                               searchCondition,
                                                               ['id'])
            if len(listIdPointForDelete) > 0:
                listIdPoint = [every['id'] for every in listIdPointForDelete]
                deleteFeatures('ln_tochka', listIdPoint)

            listIdBorderForDelete = attributesBySearchCondition('ln_granica', 
                                                                searchCondition,
                                                                ['id'])
            if len(listIdBorderForDelete) > 0:
                listIdBorder = [every['id'] for every in listIdBorderForDelete]
                deleteFeatures('ln_granica', listIdBorder)
            
            updateFeature('ln_uchastok', idEveryParcel, ['pre'], [1])
            
            attributesEveryParcel = attributesByKeys('ln_uchastok',
                                                     'id', [idEveryParcel],
                                                     ['geom-polygon'], True)
            if len(attributesEveryParcel) == 1:
                geomEveryPolygon =  attributesEveryParcel[0]['geom-polygon']
                geomEvery = QgsGeometry().fromPolygon(geomEveryPolygon)
                if geomNew == None:
                    geomNew = geomEvery
                else:
                    geomNew = geomNew.combine(geomEvery)
            else:
                QMessageBox.warning(self.iface.mainWindow(), u"Ошибка", 
                                                             u'Не определена геометрия ЗУ ' + knEveryParcel)
                self.iface.messageBar().clearWidgets()
                self.close()
                    
        if (geomNew != None) and geomNew.isGeosValid() and idKvartal > 0:
            listNames = ['kn', 'id_sposob_obrazovaniya', 'oboznachenie_na_plane', 
                        'geom', 'id_kvartal']
            listValues = ['' , gv['methodCombination'], u':ЗУ1', 
                        geomNew, idKvartal]

            if not updateFeature('ln_uchastok', idBase, listNames, listValues):
                QMessageBox.warning(self.iface.mainWindow(), u"Ошибка", 
                                                             u'Не удалось обновить атрибуты объединенного ЗУ')
        else:
            QMessageBox.warning(self.iface.mainWindow(), u"Ошибка", 
                                                         u'Некорректная геометрия объединенного ЗУ \
                                                         или не определен код квартала для него. ')
                
        self.layerUc.removeSelection()
        self.layerUc.select(idBase)
        self.iface.messageBar().clearWidgets()
        self.canvas.refresh()
        self.close()

    def doCancel(self):
        self.close()

#        QMessageBox.information(self.iface.mainWindow(), u'test', str())
