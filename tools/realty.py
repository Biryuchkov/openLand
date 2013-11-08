# -*- coding: utf-8 -*-
'''
/***************************************************************************
 realty for openland (cadastral engineer tools)
 copyright            : (C) 2013 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from datetime import *
import uuid 
from realty_ui import Ui_DialogRealty
from common import *

class Realty(QDialog, Ui_DialogRealty):
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

        self.guidRealty = None
        self.selectedGuid = None

    def fillTree(self):
        guidRealty = ''
        self.treeWidget.clear()
        lastSelectedRealtyItem = None

        listRealty = attributesBySearchCondition('pb_oks', 'true', 
                                                 attributesNamesRealty)
        for everyRealty in listRealty:
            guidRealty  = str(everyRealty['guid'])
            knZu        = everyRealty['cadastral_number']
            knRealty    = everyRealty['cadastral_number_other_number']

            itemForInsert = QTreeWidgetItem([knZu, knRealty])
            itemForInsert.setData(2, 0, guidRealty)
            self.treeWidget.addTopLevelItem(itemForInsert)
            if self.guidRealty == guidRealty:
                lastSelectedRealtyItem = itemForInsert

        if lastSelectedRealtyItem != None:
            self.treeWidget.setCurrentItem(lastSelectedRealtyItem)
            self.pushButtonSelect.setEnabled(True)

    def fillLinesEdit(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.guidRealty = self.treeWidget.selectedItems()[0].data(2, 0)
            if self.guidRealty != None:
                attributesRealty = attributesByKeys('pb_oks', 'guid', 
                                                    [self.guidRealty], 
                                                    attributesNamesRealty)
                # guid пропускаем
                self.lineEditCadastralNumber.setText(reNull(attributesRealty[0]['cadastral_number'], ''))
                self.lineEditCadastralNumberOtherNumber.setText(reNull(attributesRealty[0]['cadastral_number_other_number'], ''))
                self.lineEditNameOKS.setText(reNull(attributesRealty[0]['name_oks'], ''))

                self.pushButtonSelect.setEnabled(True)

            else:
                self.pushButtonSelect.setEnabled(False)

    def selectData(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.selectedGuid = self.guidRealty = self.treeWidget.selectedItems()[0].data(2, 0)
            self.close()

    def addData(self):
        guidRealty = str(uuid.uuid4())
        listValues = []
        listValues.append(guidRealty)
        listValues.append(reNull(self.lineEditCadastralNumber.text(), ''))
        listValues.append(reNull(self.lineEditCadastralNumberOtherNumber.text(), ''))
        listValues.append(self.lineEditNameOKS.text())

        if insertFeatures('pb_oks', attributesNamesRealty, [listValues]):
            self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Выполнено добавление объекта капитального строительства')
            self.guidRealty = guidRealty
        else:
            self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Ошибка добавления атрибутов объекта капитального строительства')

        self.fillTree()

    def editData(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.pushButtonAdd.setEnabled(False)
            self.pushButtonEdit.setEnabled(False)
            self.pushButtonSave.setEnabled(True)
            self.pushButtonDel.setEnabled(False)

    def delData(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.guidRealty = self.treeWidget.selectedItems()[0].data(2, 0)
            knForDelete = self.treeWidget.currentItem().text(0)
            reply = QMessageBox.question(self, u'Потверждение', u'Удалить информацию об объекта капитального строительства ' + knForDelete + '?', okay|cancel, defaultButton=cancel)
            if reply == okay:
                if deleteById('pb_oks', self.guidRealty):
                    self.guidRealty = None
                    self.refreshData()
                    self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Выполнено удаление атрибутов объекта капитального строительства')
                else:
                    self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Ошибка удаления атрибутов объекта капитального строительства')

    def saveData(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.guidRealty = self.treeWidget.selectedItems()[0].data(2, 0)

            listValues = []
            listValues.append(self.guidRealty)
            listValues.append(reNull(self.lineEditCadastralNumber.text(), ''))
            listValues.append(reNull(self.lineEditCadastralNumberOtherNumber.text(), ''))
            listValues.append(self.lineEditNameOKS.text())

            if updateFeature('pb_oks', self.guidRealty, attributesNamesRealty, listValues):
                self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Выполнено обновление атрибутов объекта капитального строительства')

            else:
                self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Ошибка обновления атрибутов объекта капитального строительства')

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
        self.guidRealty = None
        self.close()

#        QMessageBox.information(self.iface.mainWindow(), 'test', str(1))
