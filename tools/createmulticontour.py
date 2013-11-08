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
        self.idKv = 0
        self.idParent = 0
        self.guid = str(uuid.uuid4())

    def doCreate(self):
        self.progressBar.setValue(0)

        self.idKv = self.comboBoxKvr.itemData(self.comboBoxKvr.currentIndex())
        if self.idKv < 1:
            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка', 
                                                         u'Не выбран кадастровый квартал.')
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

                    self.progressBar.setValue(int(n / self.selectionCount * 100))
                    n += 1

        else:
            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка', 
                                                         u'Ошибка определения идентификатора многоконтурного участка')
        self.close()
            
    def doCancel(self):
        self.close()

#        QMessageBox.information(self.iface.mainWindow(), 'test', str())
