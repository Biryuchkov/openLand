# -*- coding: utf-8 -*-
'''
/***************************************************************************
 subparcel for openland (cadastral engineer tools)
 copyright            : (C) 2013 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from datetime import *
import uuid 
from subparcel_ui import Ui_DialogSubParcel
from common import *

class SubParcel(QDialog, Ui_DialogSubParcel):
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

        self.guidSubParcel = None
        self.selectedGuid = None

    def fillTree(self):
        guidSubParcel = ''
        self.treeWidget.clear()
        lastSelectedSubParcelItem = None

        listSubParcel = attributesBySearchCondition('pb_subparcel', 'true', 
                                                    attributesNamesSubParcel)
        for everySubParcel in listSubParcel:
            guidSubParcel = str(everySubParcel['guid'])
            kn = everySubParcel['cadastral_number']
            nr = everySubParcel['number_record']

            itemForInsert = QTreeWidgetItem([kn, nr])
            itemForInsert.setData(2, 0, guidSubParcel)
            self.treeWidget.addTopLevelItem(itemForInsert)
            if self.guidSubParcel == guidSubParcel:
                lastSelectedSubParcelItem = itemForInsert

        if lastSelectedSubParcelItem != None:
            self.treeWidget.setCurrentItem(lastSelectedSubParcelItem)
            self.pushButtonSelect.setEnabled(True)

    def fillLinesEdit(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.guidSubParcel = self.treeWidget.selectedItems()[0].data(2, 0)
            if self.guidSubParcel != None:
                attributesSubParcel = attributesByKeys('pb_subparcel', 'guid', 
                                                       [self.guidSubParcel], 
                                                       attributesNamesSubParcel)
                # guid пропускаем
                self.lineEditCadastralNumber.setText(reNull(attributesSubParcel[0]['cadastral_number'], ''))
                self.lineEditNumberRecord.setText(reNull(attributesSubParcel[0]['number_record'], ''))

                self.pushButtonSelect.setEnabled(True)

            else:
                self.pushButtonSelect.setEnabled(False)

    def selectData(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.selectedGuid = self.guidSubParcel = self.treeWidget.selectedItems()[0].data(2, 0)
            self.close()

    def addData(self):
        guidSubParcel = str(uuid.uuid4())
        listValues = []
        listValues.append(guidSubParcel)
        listValues.append(reNull(self.lineEditCadastralNumber.text(), ''))
        listValues.append(reNull(self.lineEditNumberRecord.text(), ''))

        if insertFeatures('pb_subparcel', attributesNamesSubParcel, [listValues]):
            self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Выполнено добавление атрибутов ЧЗУ')
            self.guidSubParcel = guidSubParcel
        else:
            self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Ошибка добавления атрибутов ЧЗУ')

        self.fillTree()

    def editData(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.pushButtonAdd.setEnabled(False)
            self.pushButtonEdit.setEnabled(False)
            self.pushButtonSave.setEnabled(True)
            self.pushButtonDel.setEnabled(False)

    def delData(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.guidSubParcel = self.treeWidget.selectedItems()[0].data(2, 0)
            knForDelete = self.treeWidget.currentItem().text(0)
            reply = QMessageBox.question(self, u'Потверждение', 
                                         u'Удалить информацию о ЧЗУ ' + knForDelete + '?', 
                                         okay|cancel, defaultButton=cancel)
            if reply == okay:
                if deleteById('pb_subparcel', self.guidSubParcel):
                    self.guidSubParcel = None
                    self.refreshData()
                    self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Выполнено удаление атрибутов ЧЗУ')
                else:
                    self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Ошибка удаления атрибутов ЧЗУ')

    def saveData(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.guidSubParcel = self.treeWidget.selectedItems()[0].data(2, 0)

            listValues = []
            listValues.append(self.guidSubParcel)
            listValues.append(reNull(self.lineEditCadastralNumber.text(), ''))
            listValues.append(reNull(self.lineEditNumberRecord.text(), ''))

            if updateFeature('pb_subparcel', self.guidSubParcel, 
                             attributesNamesSubParcel, listValues):
                self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Выполнено обновление атрибутов ЧЗУ')

            else:
                self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Ошибка обновления атрибутов ЧЗУ')

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
        self.guidSubParcel = None
        self.close()

#        QMessageBox.information(self.iface.mainWindow(), 'test', str())
