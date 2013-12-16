# -*- coding: utf-8 -*-
'''
/***************************************************************************
 kn for openland (cadastral engineer tools)
 copyright            : (C) 2012 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from common import *
from document import Document
from ownerneighbour_ui import Ui_DialogOwnerNeighbour

import uuid 

class OwnerNeighbour(QDialog,  Ui_DialogOwnerNeighbour):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        self.connect(self.pushButtonSave, SIGNAL("clicked()"), self.saveON)        
        self.connect(self.pushButtonClose, SIGNAL("clicked()"), self.closeDlg)        
        self.connect(self.pushButtonAddDocument, SIGNAL("clicked()"), self.doAddDocument)        
        self.connect(self.pushButtonEditDocument, SIGNAL("clicked()"), self.doEditDocument)        
        self.connect(self.pushButtonDelDocument, SIGNAL("clicked()"), self.doDelDocument)        

        self.dlgDocument = None

        self.guidON = ''
        self.guidPN = ''
        self.action = ''

################################################################################
    def dlgFill(self):
        if self.guidON == '':
            return

        listAttributesON = attributesByKeys('pb_owner_neighbour', 
                                            'guid', [self.guidON], 
                                            attributesNamesOwnerNeighbour)
        if len(listAttributesON) == 1:
            dictAttributesON = listAttributesON[0]

            self.lineEditNameRight.setText(reNull(dictAttributesON['name_right'], ''))
            self.lineEditNameOwner.setText(reNull(dictAttributesON['name_owner'], ''))
            self.lineEditContactAddress.setText(reNull(dictAttributesON['contact_address'], ''))

            self.treeWidget.clear()
            listGuidDocument = attributesByKeys('pb_owner_neighbour_document', 
                                                'guid_owner_neighbour', [self.guidON], 
                                                attributesNamesOwnerNeighbourDoc)

            if len(listGuidDocument) > 0:
                listGuid = [str(every['guid_document']) for every in listGuidDocument]
                listAttributesDocument = attributesByKeys('pb_document', 
                                                          'guid', listGuid, 
                                                          attributesNamesDocument)
                for dictAttributesDocument in listAttributesDocument:
                    guidDocument = str(dictAttributesDocument['guid'])
                    numberDoc = reNull(dictAttributesDocument['number_doc'], '')
                    nameDoc   = reNull(dictAttributesDocument['name'], '')

                    itemForInsert = QTreeWidgetItem([numberDoc, nameDoc])
                    itemForInsert.setData(2, 0, guidDocument)
                    self.treeWidget.addTopLevelItem(itemForInsert)

        
################################################################################
    def saveON(self):
        listNames = ['guid_parcel_neighbour', 'name_right', 'name_owner', 
                     'contact_address']
        listValues = []
        listValues.append(self.guidPN)
        listValues.append(self.lineEditNameRight.text())
        listValues.append(self.lineEditNameOwner.text())
        listValues.append(self.lineEditContactAddress.text())

        if (self.action == 'add') and (len(listNames) == len(listValues)):
            if not insertFeatures('pb_owner_neighbour', listNames, [listValues]):
                QMessageBox.warning(self.iface.mainWindow(), u'Ошибка редактирования данных', 
                                                             u'Произошла ошибка при создании правообладателя смежного ЗУ')

        elif (self.action == 'edit') and (len(listNames) == len(listValues)):
            if not updateFeature('pb_owner_neighbour', self.guidON, 
                                 listNames, listValues):
                QMessageBox.warning(self.iface.mainWindow(), u'Ошибка редактирования данных', 
                                                             u'Произошла ошибка при редактировании правообладателя смежного ЗУ')
        else:
            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка вызова диалога редактирования', 
                                                         u'Не определена цель вызова диалога.')
        self.done(1)

################################################################################
    def doAddDocument(self):
        if self.dlgDocument == None:
            self.dlgDocument = Document(self.iface)
            self.dlgDocument.fillTree()
        
        self.dlgDocument.selectedGuid = None

        self.dlgDocument.exec_()
        if self.dlgDocument.selectedGuid != None:
            if self.guidON == '':
                self.guidON = str(uuid.uuid4())
                listNames  = ['guid', 'guid_parcel_neighbour', 'name_right', 
                              'name_owner', 'contact_address']
                listValues = []
                listValues.append(self.guidON)
                listValues.append(self.guidPN)
                listValues.append(self.lineEditNameRight.text())
                listValues.append(self.lineEditNameOwner.text())
                listValues.append(self.lineEditContactAddress.text())

                if not insertFeatures('pb_owner_neighbour', listNames, [listValues]):
                    QMessageBox.warning(self.iface.mainWindow(), u'Ошибка редактирования данных', 
                                                                 u'Произошла ошибка при создании правообладателя смежного ЗУ')
                    return
                else:
                    self.action = 'edit'

            listNames   = ['guid_owner_neighbour', 'guid_document']
            listValues  = [[self.guidON, self.dlgDocument.guidDocument]]

            if insertFeatures('pb_owner_neighbour_document', 
                              listNames, listValues):
                self.dlgFill()

            else:
                QMessageBox.warning(self.iface.mainWindow(), u'Ошибка', 
                                                             u'Произошла ошибка добавления документа')
    
################################################################################
    def doEditDocument(self):
        currentTreeItem = self.treeWidget.currentItem()
        if currentTreeItem == None:
            self.pushButtonEditDocument.setEnabled(True)
            self.pushButtonDelDocument.setEnabled(True)
            return

        if self.dlgDocument == None:
            self.dlgDocument = Document(self.iface)
            
        self.dlgDocument.guidDocument = currentTreeItem.data(2, 0)
        self.dlgDocument.fillTree()
        self.dlgDocument.exec_()
        self.dlgFill()

################################################################################
    def doDelDocument(self):
        currentItem = self.treeWidget.currentItem()
        if currentItem != None:
            guidDocument = str(currentItem.data(2, 0))
            if guidDocument > ' ':
                searchCondition  = '\"guid_owner_neighbour\" = \'' + str(self.guidON) + '\''
                searchCondition += ' AND \"guid_document\" = \'' + str(guidDocument) +'\''

                listAttributesSection = attributesBySearchCondition('pb_owner_neighbour_document', 
                                                                     searchCondition, 
                                                                     ['guid'])
                if len(listAttributesSection) == 1:
                    guidForDelete = str(listAttributesSection[0]['guid'])
                    if deleteById('pb_owner_neighbour_document', guidForDelete):
                        self.dlgFill()

                    else:
                        QMessageBox.warning(self.iface.mainWindow(), u'Ошибка', 
                                                                     u'Произошла ошибка удаления документа из списка')
                            
################################################################################
    def closeDlg(self):
        self.done(0)

#        QMessageBox.information(self.iface.mainWindow(), 'test', str())
