# -*- coding: utf-8 -*-
'''
/***************************************************************************
 commontexts for openland (cadastral engineer tools)
 copyright            : (C) 2013 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
import uuid 
from commontexts_ui import Ui_DialogText
from common import *

class CommonText(QDialog, Ui_DialogText):
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
        
        self.guidCommonText = None
        self.valueCommonText = None
        self.typeCommonText = None
        
    def fillTree(self):
        guidCommonText = ''
        listCommonText = []
        if self.typeCommonText != None:
            listCommonText = attributesBySearchCondition('pb_common_text', 
                                                         '\"text_type\"=' + str(self.typeCommonText), 
                                                         attributesNamesCommonText)
        self.treeWidget.clear()
        lastSelectedCommonTextItem = None
        for everyCommonText in listCommonText:
            guidCommonText = str(everyCommonText['guid'])
            title = everyCommonText['text_value']
            title = title[:100]

            itemForInsert = QTreeWidgetItem([title])
            itemForInsert.setData(1, 0, guidCommonText)
            self.treeWidget.addTopLevelItem(itemForInsert)
            if self.guidCommonText == guidCommonText:
                lastSelectedCommonTextItem = itemForInsert
        
        if lastSelectedCommonTextItem != None:
            self.treeWidget.setCurrentItem(lastSelectedCommonTextItem)
            self.pushButtonSelect.setEnabled(True)

    def fillLinesEdit(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.guidCommonText = str(self.treeWidget.selectedItems()[0].data(1, 0))
            if self.guidCommonText != None:
                attributesCommonText = attributesByKeys('pb_common_text', 'guid', 
                                                        [self.guidCommonText], 
                                                        attributesNamesCommonText)
                self.textEdit.setText(attributesCommonText[0]['text_value'])
                self.valueCommonText = attributesCommonText[0]['text_value']

                self.pushButtonSelect.setEnabled(True)

            else:
                self.pushButtonSelect.setEnabled(False)

    def selectData(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.guidCommonText = self.treeWidget.selectedItems()[0].data(1, 0)
            self.valueCommonText = self.textEdit.toPlainText()
            self.close()

    def addData(self):
        guidCommonText = str(uuid.uuid4())                                                                         
        if self.typeCommonText == None:
            return

        # 'guid', 'text_type', 'text_value'
        #     0            1             2
        listValues = []
        listValues.append(guidCommonText)
        listValues.append(self.typeCommonText)
        listValues.append(self.textEdit.toPlainText())

        if insertFeatures('pb_common_text', attributesNamesCommonText, [listValues]):
            self.guidCommonText = guidCommonText

        self.fillTree()

    def editData(self):
        if len(self.treeWidget.selectedItems()) == 1:

            self.pushButtonAdd.setEnabled(False)
            self.pushButtonEdit.setEnabled(False)
            self.pushButtonSave.setEnabled(True)
            self.pushButtonDel.setEnabled(False)

    def delData(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.guidCommonText = str(self.treeWidget.selectedItems()[0].data(1, 0))
            textForDelete = self.treeWidget.currentItem().text(0)[:100]
            reply = QMessageBox.question(self, u'Потверждение', 
                                         u'Удалить текст ' + textForDelete + '?', 
                                         okay|cancel, defaultButton=cancel)
            if reply == okay:
                if deleteById('pb_common_text', self.guidCommonText):
                    self.guidCommonText = None
                    self.refreshData()

    def saveData(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.guidCommonText = self.treeWidget.selectedItems()[0].data(1, 0)
            
            # 'guid', 'text_type', 'text_value'
            #     0            1             2
            listValues = []
            listValues.append(self.guidCommonText)
            listValues.append(self.typeCommonText)
            listValues.append(self.textEdit.toPlainText())
            
            updateFeature('pb_common_text', self.guidCommonText, 
                          attributesNamesCommonText, listValues)

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
        self.guidCommonText = None
        self.valueCommonText = None
        self.close()

#        QMessageBox.information(self.iface.mainWindow(), 'test', str())
