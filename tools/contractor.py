# -*- coding: utf-8 -*-
'''
/***************************************************************************
 contractor for openland (cadastral engineer tools)
 copyright            : (C) 2013 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from datetime import *
import uuid 
from contractor_ui import Ui_DialogContractor
from common import *

class Contractor(QDialog, Ui_DialogContractor):
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

        self.guidContractor = None
        self.selectedGuid = None

    def fillTree(self):
        guidContractor = ''
        self.treeWidget.clear()
        lastSelectedContractorItem = None

        listContractor = attributesBySearchCondition('pb_contractor', 'true', 
                                                     attributesNamesContractor)
        for everyContractor in listContractor:
            guidContractor  = everyContractor['guid']
            surname         = everyContractor['surname']
            first           = everyContractor['first']
            patronymic      = everyContractor['patronymic']

            itemForInsert = QTreeWidgetItem([surname, first, patronymic])
            itemForInsert.setData(3, 0, guidContractor)
            self.treeWidget.addTopLevelItem(itemForInsert)
            if self.guidContractor == guidContractor:
                lastSelectedContractorItem = itemForInsert

        if lastSelectedContractorItem != None:
            self.treeWidget.setCurrentItem(lastSelectedContractorItem)
            self.pushButtonSelect.setEnabled(True)

    def fillLinesEdit(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.guidContractor = str(self.treeWidget.selectedItems()[0].data(3, 0))
            if self.guidContractor != None:
                attributesContractor = attributesByKeys('pb_contractor', 'guid', 
                                                        [self.guidContractor], 
                                                        attributesNamesContractor)
                # guid пропускаем
                self.lineEditSurname.setText(attributesContractor[0]['surname'])
                self.lineEditFirst.setText(attributesContractor[0]['first'])
                self.lineEditPatronymic.setText(attributesContractor[0]['patronymic'])
                self.lineEditNCertificate.setText(attributesContractor[0]['n_certificate'])
                self.lineEditTelephone.setText(attributesContractor[0]['telephone'])
                self.lineEditAddress.setText(attributesContractor[0]['address'])
                self.lineEditEmail.setText(attributesContractor[0]['email'])
                self.lineEditOrganization.setText(attributesContractor[0]['organization'])

                self.pushButtonSelect.setEnabled(True)

            else:
                self.pushButtonSelect.setEnabled(False)
    
    def selectData(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.selectedGuid = self.guidContractor = self.treeWidget.selectedItems()[0].data(3, 0)
            self.close()
    
    def addData(self):
        guidContractor = str(uuid.uuid4())
        # 'guid', 'surname', 'first', 'patronymic', 'n_certificate', 'telephone', 'address', 'email', 'organization'
        #     0          1        2             3                4            5          6        7               8
        listValues = []
        listValues.append(guidContractor)
        listValues.append(self.lineEditSurname.text())
        listValues.append(self.lineEditFirst.text())
        listValues.append(self.lineEditPatronymic.text())
        listValues.append(self.lineEditNCertificate.text())
        listValues.append(self.lineEditTelephone.text())
        listValues.append(self.lineEditAddress.text())
        listValues.append(self.lineEditEmail.text())
        listValues.append(self.lineEditOrganization.text())

        if insertFeatures('pb_contractor', attributesNamesContractor, [listValues]):
            self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Выполнено добавление атрибутов кадастрового инженера.')
            self.guidContractor = guidContractor
        else:
            self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Ошибка добавления атрибутов кадастрового инженера.')

        self.fillTree()

    def editData(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.pushButtonAdd.setEnabled(False)
            self.pushButtonEdit.setEnabled(False)
            self.pushButtonSave.setEnabled(True)
            self.pushButtonDel.setEnabled(False)

    def delData(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.guidContractor = str(self.treeWidget.selectedItems()[0].data(3, 0))
            fioForDelete = self.treeWidget.currentItem().text(0)
            reply = QMessageBox.question(self, u'Потверждение', 
                                         u'Удалить информацию о кадастровом инженере ' + fioForDelete + '?', 
                                         okay|cancel, defaultButton=cancel)
            if reply == okay:
                if deleteById('pb_contractor', self.guidContractor):
                    self.guidContractor = None
                    self.refreshData()
                    self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Выполнено удаление атрибутов кадастрового инженера.')
                else:
                    self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Ошибка удаления атрибутов кадастрового инженера.')

    def saveData(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.guidContractor = self.treeWidget.selectedItems()[0].data(3, 0)

            listValues = []
            listValues.append(self.guidContractor)
            listValues.append(self.lineEditSurname.text())
            listValues.append(self.lineEditFirst.text())
            listValues.append(self.lineEditPatronymic.text())
            listValues.append(self.lineEditNCertificate.text())
            listValues.append(self.lineEditTelephone.text())
            listValues.append(self.lineEditAddress.text())
            listValues.append(self.lineEditEmail.text())
            listValues.append(self.lineEditOrganization.text())

            if updateFeature('pb_contractor', self.guidContractor, attributesNamesContractor, listValues):
                self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Выполнено обновление атрибутов кадастрового инженера.')

            else:
                self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Ошибка обновления атрибутов кадастрового инженера.')

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
        self.guidContractor = None
        self.close()
    
#        QMessageBox.information(self.iface.mainWindow(), 'test', str())
