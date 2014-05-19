# -*- coding: utf-8 -*-
'''
/***************************************************************************
 createMultiContour for openland (cadastral engineer tools)
 copyright            : (C) 2012 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from common import *
from createmulticontour_ui import Ui_createMultiContour
import uuid 

class createMultiContour(QDialog,  Ui_createMultiContour):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        QObject.connect(self.pushButtonOk, SIGNAL("clicked()"), self.doCreate)
        QObject.connect(self.pushButtonCancel, SIGNAL("clicked()"), self.doCancel)

        fillComboBox(self.comboBoxKvr, 'ln_kvartal', 'id', 'kn', 0)
        self.comboBoxKvr.setCurrentIndex(0)
        self.selectionCount = 0
        self.idKv           = 0
        self.idParent       = 0
        self.guid           = str(uuid.uuid4())
        self.progress       = QProgressBar()

    def doCreate(self):
        progressMessageBar = self.iface.messageBar().createMessage(u'Создание МЗУ...')
        self.progress.setMaximum(self.selectionCount * 2)
        self.progress.setAlignment(Qt.AlignLeft|Qt.AlignVCenter)
        progressMessageBar.layout().addWidget(self.progress)
        self.iface.messageBar().pushWidget(progressMessageBar, 
                                           self.iface.messageBar().INFO)

        self.idKv = self.comboBoxKvr.itemData(self.comboBoxKvr.currentIndex())
        if self.idKv < 1:
            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка', 
                                                         u'Не выбран кадастровый квартал.')
            self.iface.messageBar().clearWidgets()
            return

        dicAttributesSelection = attributesFromSelection('ln_uchastok', ['id'])
        listIdSelection = []
        for every in dicAttributesSelection:
            listIdSelection.append(int(every['id']))

        listParent = attributesByKeys('pb_parcel_parcel', 'id_children', 
                                      listIdSelection, ['id_parent'])
        if len(listParent) > 0:
            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка', 
                                                         u'Один или несколько из выбранных ЗУ уже входят в состав другого ЗУ')
            self.iface.messageBar().clearWidgets()
            return
        
        listValues = []
        listValues.append(self.idKv)
        listValues.append(gv['multiContourCode'])
        listValues.append(self.guid)
        listValues.append(idCurrentMSK())
        listValues.append(QgsGeometry())

        if insertFeatures('ln_uchastok', 
                          ['id_kvartal', 'id_vid_uchastka', 'guid', 'id_msk', 'geom'], 
                          [listValues]):
            self.idParent = valueByFieldValue('ln_uchastok', 'id', 'i', 'guid', 
                                              self.guid, 's')
        else:
            self.idParent = 0

        if (self.idParent > 0):
            i = n = 1
            listAllValues = []
            for every in dicAttributesSelection:
                idOne = int(every['id'])

                listValues = []
                listValues.append(self.idParent)
                listValues.append(idOne)
                listAllValues.append(listValues) 

            if insertFeatures('pb_parcel_parcel', ['id_parent', 'id_children'], 
                              listAllValues):
                n += 1
                self.progress.setValue(n)

                for every in dicAttributesSelection:
                    idOne = int(every['id'])
                    listValues = []
                    listValues.append(i)
                    listValues.append(gv['oneContourCode'])
                    listValues.append(u':ЗУ1(' +str(i)+ ')')

                    if updateFeature('ln_uchastok', idOne, 
                                     ['nomer_kontura', 'id_vid_uchastka', 'oboznachenie_na_plane'], 
                                     listValues):
                        i += 1

                    n += 1
                    self.progress.setValue(n)

        else:
            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка', 
                                                         u'Ошибка определения идентификатора многоконтурного участка')
        self.iface.messageBar().clearWidgets()
        self.close()
            
    def doCancel(self):
        self.close()

#        QMessageBox.information(self.iface.mainWindow(), 'test', str())
