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
        self.parcels = []
        self.idParcels = []

    def toPrepare(self):
        selection = self.layerUc.selectedFeatures()
        self.selectionCount = len(selection)
        if self.selectionCount > 1:
            selectParcel = attributesFromSelection('ln_uchastok', ['id', 'kn'])
            self.idParcels = [int(every['id']) for every in selectParcel]
            self.parcels = [[int(every['id']), every['kn']] for every in selectParcel]

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
            for i in self.parcels:
                self.comboBoxZU.addItem(i[1], i[0])

            return True

        else:
            QMessageBox.warning(self.iface.mainWindow(), u"Ошибка выбора данных", 
                                                         u'Необходимо выбрать не менее двух участков для выполнения процедуры объединения.')
            return False

    def doAdd(self):
        if len(self.parcels) < 2:
            self.close()
            
        idBase = self.comboBoxZU.itemData(self.comboBoxZU.currentIndex())
        if not (idBase > 0):
            self.close()

        self.progressBar.setRange(0,0)

        attributesBaseParcel = attributesByKeys('ln_uchastok', 
                                                'id', [idBase], 
                                                ['id', 'geom-polygon'], True)
        if len(attributesBaseParcel) == 1:
            geomNewPolygon = attributesBaseParcel[0]['geom-polygon']
            geomNew = QgsGeometry().fromPolygon(geomNewPolygon)
        else:
            QMessageBox.warning(self.iface.mainWindow(), u"Ошибка", 
                                                         u'Не определена геометрия основного ЗУ')
            self.close()

        for everyParcel in self.parcels:
            idEveryParcel = everyParcel[0]
            knEveryParcel = everyParcel[1]

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
            
            if idEveryParcel == idBase: 
                continue

            attributesEveryParcel = attributesByKeys('ln_uchastok',
                                                     'id', [idEveryParcel],
                                                     ['geom-polygon'], True)
            if len(attributesEveryParcel) == 1:
                geomEveryPolygon =  attributesEveryParcel[0]['geom-polygon']
                geomEvery = QgsGeometry().fromPolygon(geomEveryPolygon)
                geomNew = geomNew.combine(geomEvery)
            else:
                QMessageBox.warning(self.iface.mainWindow(), u"Ошибка", 
                                                             u'Не определена геометрия ЗУ ' + knEveryParcel)
                self.close()
                    
        if (geomNew != None) and geomNew.isGeosValid():
            listNames = ['kn', 'id_sposob_obrazovaniya', 
                         'oboznachenie_na_plane', 'geom']
            listValues = ['', gv['methodCombination'], 
                          '', geomNew]

            if updateFeature('ln_uchastok', idBase, listNames, listValues):
                self.idParcels.pop(self.idParcels.index(idBase))
                if not deleteFeatures('ln_uchastok', self.idParcels):
                    QMessageBox.warning(self.iface.mainWindow(), u"Ошибка", 
                                                                 u'Не удалось удалить предыдущие ЗУ')
            else:
                QMessageBox.warning(self.iface.mainWindow(), u"Ошибка", 
                                                             u'Не удалось обновить атрибуты объединенного ЗУ')
        else:
            QMessageBox.warning(self.iface.mainWindow(), u"Ошибка", 
                                                         u'Некорректная геометрия объединенного ЗУ')
                
        self.layerUc.removeSelection()
        self.layerUc.select(idBase)
        self.canvas.refresh()

        self.progressBar.setRange(0, 100)
        self.progressBar.setValue(100)
        self.close()

    def doCancel(self):
        self.close()

#        QMessageBox.information(self.iface.mainWindow(), u'test', str())
