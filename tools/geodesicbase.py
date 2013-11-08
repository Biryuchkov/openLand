# -*- coding: utf-8 -*-
'''
/***************************************************************************
 geodesicbase for openland (cadastral engineer tools)
 copyright            : (C) 2013 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from datetime import *
import uuid 
from geodesicbase_ui import Ui_DialogGeodesicBase
from common import *

class GeodesicBase(QDialog, Ui_DialogGeodesicBase):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)
        self.connect(self.pushButtonSelect, SIGNAL("clicked()"), self.selectData)        
        self.connect(self.pushButtonAdd, SIGNAL("clicked()"), self.addData)        
        self.connect(self.pushButtonEdit, SIGNAL("clicked()"), self.editData)        
        self.connect(self.pushButtonDel, SIGNAL("clicked()"), self.delData)        
        self.connect(self.pushButtonSave, SIGNAL("clicked()"), self.saveData)        
        self.connect(self.pushButtonRefresh, SIGNAL("clicked()"), self.refreshData)        
        self.connect(self.pushButtonClose, SIGNAL("clicked()"), self.closeDialog)        
        self.connect(self.treeWidget, SIGNAL("itemSelectionChanged()"), self.fillLinesEdit)

        self.guidGeodesicBase   = None
        self.selectedGuid       = None
        self.idCurrentMsk       = None

    def fillTree(self):
        guidGeodesicBase = ''
        self.treeWidget.clear()
        lastSelectedGeodesicBaseItem = None

        listGeodesicBase = attributesBySearchCondition('pb_geo_osnova', 'true', 
                                                       attributesNamesGeodesicBase)
        for everyGeodesicBase in listGeodesicBase:
            guidGeodesicBase = str(everyGeodesicBase['guid'])
            name    = everyGeodesicBase['nazvanie_punkta']
            x       = str(everyGeodesicBase['x'])
            y       = str(everyGeodesicBase['y'])

            itemForInsert = QTreeWidgetItem([name, x, y])
            itemForInsert.setData(3, 0, guidGeodesicBase)
            self.treeWidget.addTopLevelItem(itemForInsert)
            if self.guidGeodesicBase == guidGeodesicBase:
                lastSelectedGeodesicBaseItem = itemForInsert

        if lastSelectedGeodesicBaseItem != None:
            self.treeWidget.setCurrentItem(lastSelectedGeodesicBaseItem)
            self.pushButtonSelect.setEnabled(True)

    def fillLinesEdit(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.guidGeodesicBase = self.treeWidget.selectedItems()[0].data(3, 0)
            if self.guidGeodesicBase != None:
                attributesGeodesicBase = attributesByKeys('pb_geo_osnova', 'guid', 
                                                          [self.guidGeodesicBase], 
                                                          attributesNamesGeodesicBase)
                # guid пропускаем
                self.lineEditPName.setText(attributesGeodesicBase[0]['nazvanie_punkta'])
                self.lineEditPKind.setText(reNull(attributesGeodesicBase[0]['tip_znaka'], ''))
                self.lineEditPKlass.setText(reNull(attributesGeodesicBase[0]['klass_geo_seti'], ''))
                self.lineEditOrdX.setText(str(attributesGeodesicBase[0]['x']))
                self.lineEditOrdY.setText(str(attributesGeodesicBase[0]['y']))

                self.pushButtonSelect.setEnabled(True)

            else:
                self.pushButtonSelect.setEnabled(False)

    def selectData(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.selectedGuid = self.guidGeodesicBase = self.treeWidget.selectedItems()[0].data(3, 0)
            self.close()

    def addData(self):
        guidGeodesicBase  = str(uuid.uuid4())
        self.idCurrentMsk = str(idCurrentMSK())
        # 'guid', 'id_sistema_koordinat', 'nazvanie_punkta', 'tip_znaka', 'klass_geo_seti', 'x', 'y'
        #     0                       1                  2            3                 4    5    6 
        try:
            x = float(self.lineEditOrdX.text())
        except:
            x = 0.0
            self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Ошибка преобразования X')

        try:
            y = float(self.lineEditOrdY.text())
        except:
            y = 0.0
            self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Ошибка преобразования Y')

        listValues = []
        listValues.append(guidGeodesicBase)
        listValues.append(self.idCurrentMsk)
        listValues.append(self.lineEditPName.text())
        listValues.append(self.lineEditPKind.text())
        listValues.append(self.lineEditPKlass.text())
        listValues.append(x)
        listValues.append(y)

        if insertFeatures('pb_geo_osnova', attributesNamesGeodesicBase, [listValues]):
            self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Выполнено добавление атрибутов пункта геодезической сети')
            self.guidGeodesicBase = guidGeodesicBase
        else:
            self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Ошибка добавления атрибутов пункта геодезической сети')

        self.fillTree()

    def editData(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.pushButtonAdd.setEnabled(False)
            self.pushButtonEdit.setEnabled(False)
            self.pushButtonSave.setEnabled(True)
            self.pushButtonDel.setEnabled(False)

    def delData(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.guidGeodesicBase = self.treeWidget.selectedItems()[0].data(3, 0)
            nameForDelete = self.treeWidget.currentItem().text(0)
            reply = QMessageBox.question(self, u'Потверждение', 
                                         u'Удалить информацию о пункте геодезической сети ' + nameForDelete + '?', 
                                         okay|cancel, defaultButton=cancel)
            if reply == okay:
                if deleteById('pb_geo_osnova', self.guidGeodesicBase):
                    self.guidGeodesicBase = None
                    self.refreshData()
                    self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Выполнено удаление атрибутов пункта геодезической сети')
                else:
                    self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Ошибка удаления атрибутов пункта геодезической сети')

    def saveData(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.guidGeodesicBase = self.treeWidget.selectedItems()[0].data(3, 0)
            self.idCurrentMsk = str(idCurrentMSK())

            try:
                x = float(self.lineEditOrdX.text())
            except:
                x = 0.0
                self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Ошибка преобразования X')

            try:
                y = float(self.lineEditOrdY.text())
            except:
                y = 0.0
                self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Ошибка преобразования Y')

            listValues = []
            listValues.append(self.guidGeodesicBase)
            listValues.append(self.idCurrentMsk)
            listValues.append(self.lineEditPName.text())
            listValues.append(self.lineEditPKind.text())
            listValues.append(self.lineEditPKlass.text())
            listValues.append(x)
            listValues.append(y)

            if updateFeature('pb_geo_osnova', self.guidGeodesicBase, 
                             attributesNamesGeodesicBase, listValues):
                self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Выполнено обновление атрибутов пункта геодезической сети')

            else:
                self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Ошибка обновления атрибутов пункта геодезической сети')

            self.fillTree()

            self.pushButtonAdd.setEnabled(True)
            self.pushButtonEdit.setEnabled(True)
            self.pushButtonSave.setEnabled(False)
            self.pushButtonDel.setEnabled(True)

    def refreshData(self):
        self.pushButtonAdd.setEnabled(True)
        self.pushButtonEdit.setEnabled(True)
        self.pushButtonSave.setEnabled(False)
        self.pushButtonDel.setEnabled(True)
        self.fillTree()
        self.fillLinesEdit()

    def closeDialog(self):
        self.guidGeodesicBase = None
        self.close()

#        QMessageBox.information(self.iface.mainWindow(), 'test', str())
