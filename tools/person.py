# -*- coding: utf-8 -*-
'''
/***************************************************************************
 person for openland (cadastral engineer tools)
 copyright            : (C) 2013 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
import uuid 
from person_ui import Ui_DialogPerson
from common import *

class Person(QDialog, Ui_DialogPerson):
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

        self.guidPerson = None

    def fillTree(self):
        guidPerson = ''
        self.treeWidget.clear()
        lastSelectedPersonItem = None

        listPerson = attributesBySearchCondition('pb_fiz_liczo', 'true', 
                                                 attributesNamesPerson)
        column1 = column2 = column3 = u''
        # 'guid', 'familiya', 'imya', 'otchestvo'
        #     0           1       2            3
        for everyPerson in listPerson:
            guidPerson = str(everyPerson['guid'])
            column1 = everyPerson['familiya']
            column2 = everyPerson['imya']
            column3 = everyPerson['otchestvo']

            itemForInsert = QTreeWidgetItem([column1, column2, column3])
            itemForInsert.setData(3, 0, guidPerson)
            self.treeWidget.addTopLevelItem(itemForInsert)
                
            if self.guidPerson == guidPerson:
                lastSelectedPersonItem = itemForInsert

        if lastSelectedPersonItem != None:
            self.treeWidget.setCurrentItem(lastSelectedPersonItem)
            self.pushButtonSelect.setEnabled(True)
    
    def fillLinesEdit(self):
        if len(self.treeWidget.selectedItems()) > 0:
            self.guidPerson = self.treeWidget.selectedItems()[0].data(3, 0)
            if self.guidPerson != None:
                attributesPerson = attributesByKeys('pb_fiz_liczo', 'guid', 
                                                    [self.guidPerson], 
                                                    attributesNamesPerson)
                # guid пропускаем
                self.lineEditSurname.setText(attributesPerson[0]['familiya'])
                self.lineEditFirst.setText(attributesPerson[0]['imya'])
                self.lineEditPatronymic.setText(attributesPerson[0]['otchestvo'])

                self.pushButtonSelect.setEnabled(True)
            else:
                self.pushButtonSelect.setEnabled(False)

    def selectData(self):
        if len(self.treeWidget.selectedItems()) > 0:
            self.guidPerson = self.treeWidget.selectedItems()[0].data(3, 0)
            self.close()

    def addData(self):
        guidPerson = str(uuid.uuid4())                                                                         

        listValues = []
        listValues.append(guidPerson)
        listValues.append(self.lineEditSurname.text())
        listValues.append(self.lineEditFirst.text())
        listValues.append(reNull(self.lineEditPatronymic.text(), ''))

        if insertFeatures('pb_fiz_liczo', attributesNamesPerson, [listValues]):
            self.guidPerson = guidPerson

        self.fillTree()

    def editData(self):
        if len(self.treeWidget.selectedItems()) > 0:

            self.pushButtonAdd.setEnabled(False)
            self.pushButtonEdit.setEnabled(False)
            self.pushButtonSave.setEnabled(True)
            self.pushButtonDel.setEnabled(False)

    def delData(self):
        if len(self.treeWidget.selectedItems()) > 0:
            fioForDelete = self.treeWidget.currentItem().text(0)
            reply = QMessageBox.question(self, u'Потверждение', 
                                               u'Удалить информацию о ' + fioForDelete + '?', 
                                               okay|cancel, defaultButton=cancel)
            if reply == okay:
                self.guidPerson = self.treeWidget.selectedItems()[0].data(3, 0)
                if deleteById('pb_fiz_liczo', self.guidPerson):
                    self.guidPerson = None
                    self.refreshData()

    def saveData(self):
        if len(self.treeWidget.selectedItems()) > 0:
            self.guidPerson = self.treeWidget.selectedItems()[0].data(3, 0)

            listValues = []
            listValues.append(self.guidPerson)
            listValues.append(self.lineEditSurname.text())
            listValues.append(self.lineEditFirst.text())
            listValues.append(reNull(self.lineEditPatronymic.text(), ''))

            updateFeature('pb_fiz_liczo', self.guidPerson, 
                          attributesNamesPerson, listValues)

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
        self.guidPerson = None
        self.close()

#        QMessageBox.information(self.iface.mainWindow(), 'test', str())
