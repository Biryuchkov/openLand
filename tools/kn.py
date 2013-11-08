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
from kn_ui import Ui_DialogKn

class kn(QDialog,  Ui_DialogKn):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        self.connect(self.pushButtonSave, SIGNAL("clicked()"), self.saveKn)        
        self.connect(self.pushButtonClose, SIGNAL("clicked()"), self.closeDlg)        
        self.connect(self.pushButtonAddDocument, SIGNAL("clicked()"), self.doAddDocument)        
        self.connect(self.pushButtonEditDocument, SIGNAL("clicked()"), self.doEditDocument)        
        self.connect(self.pushButtonDelDocument, SIGNAL("clicked()"), self.doDelDocument)        

        self.dlgDocument = None

        self.id_kn = 0
        self.id_uchastok = 0
        self.tip_kn = 0
        self.action = ''

################################################################################
    def dlgFill(self):
        if self.tip_kn in (1, 4):
            self.lineEditKn.setEnabled(True)

        elif self.tip_kn == 2:
            self.lineEditKn.setEnabled(True)
            self.lineEditDefinition.setEnabled(True)
            self.lineEditOther.setEnabled(True)

        elif self.tip_kn == 3:
            self.lineEditKn.setEnabled(True)
            self.lineEditNumber.setEnabled(True)

        listAttributesKn = attributesByKeys('pb_kn', 'id', [self.id_kn], 
                                            attributesNamesKn)
        if len(listAttributesKn) == 1:
            dictAttributesKn = listAttributesKn[0]

            if self.tip_kn in (1, 4):
                self.lineEditKn.setText(reNull(dictAttributesKn['kn'], ''))

            elif self.tip_kn == 2:
                self.treeWidget.setEnabled(True)
                self.pushButtonAddDocument.setEnabled(True)
                self.pushButtonEditDocument.setEnabled(True)
                self.pushButtonDelDocument.setEnabled(True)

                self.lineEditKn.setText(reNull(dictAttributesKn['kn'], ''))
                self.lineEditDefinition.setText(reNull(dictAttributesKn['definition'], ''))
                self.lineEditOther.setText(reNull(dictAttributesKn['other'], ''))

                self.treeWidget.clear()
                listGuidDocument = attributesByKeys('pb_kn_document', 'id_kn', 
                                                    [self.id_kn], ['guid_document'])
                if len(listGuidDocument) > 0:
                    listGuid = [str(every['guid_document']) for every in listGuidDocument]
                    listAttributesDocument = attributesByKeys('pb_document', 'guid', 
                                                              listGuid, 
                                                              attributesNamesDocument)
                    for dictAttributesDocument in listAttributesDocument:
                        guidDocument = str(dictAttributesDocument['guid'])
                        numberDoc = reNull(dictAttributesDocument['number_doc'], '')
                        nameDoc = reNull(dictAttributesDocument['name'], '')

                        itemForInsert = QTreeWidgetItem([numberDoc, nameDoc])
                        itemForInsert.setData(2, 0, guidDocument)
                        self.treeWidget.addTopLevelItem(itemForInsert)

            elif self.tip_kn == 3:
                self.lineEditKn.setText(reNull(dictAttributesKn['kn'], ''))
                self.lineEditNumber.setText(reNull(dictAttributesKn['number'], ''))
        
################################################################################
    def saveKn(self):
        if self.action == 'add':
            listNames = []
            listValues = []
            
            if self.tip_kn in (1, 4):
                listNames = ['id_uchastok', 'tip_kn', 'kn']

                listValues.append(self.id_uchastok)
                listValues.append(self.tip_kn)
                listValues.append(self.lineEditKn.text())

            elif self.tip_kn == 2:
                listNames = ['id_uchastok', 'tip_kn', 'kn', 'definition', 'other']

                listValues.append(self.id_uchastok)
                listValues.append(self.tip_kn)
                listValues.append(self.lineEditKn.text())
                listValues.append(self.lineEditDefinition.text())
                listValues.append(self.lineEditOther.text())

            elif self.tip_kn == 3:
                listNames = ['id_uchastok', 'tip_kn', 'kn', 'number']

                listValues.append(self.id_uchastok)
                listValues.append(self.tip_kn)
                listValues.append(self.lineEditKn.text())
                listValues.append(self.lineEditNumber.text())

            if (len(listValues) > 0) and (len(listNames) == len(listValues)):
                if not insertFeatures('pb_kn', listNames, [listValues]):
                    QMessageBox.warning(self.iface.mainWindow(), u'Ошибка редактирования данных', 
                                                                 u'Произошла ошибка при создании кадастрового номера')

        elif self.action == 'edit':
            listNames = []
            listValues = []
            
            if self.tip_kn in (1, 4):
                listNames = ['id_uchastok', 'tip_kn', 'kn']

                listValues.append(self.id_uchastok)
                listValues.append(self.tip_kn)
                listValues.append(self.lineEditKn.text())

            elif self.tip_kn == 2:
                listNames = ['id_uchastok', 'tip_kn', 'kn', 'definition', 'other']
                listValues.append(self.id_uchastok)
                listValues.append(self.tip_kn)
                listValues.append(self.lineEditKn.text())
                listValues.append(self.lineEditDefinition.text())
                listValues.append(self.lineEditOther.text())

            elif self.tip_kn == 3:
                listNames = ['id_uchastok', 'tip_kn', 'kn', 'number']

                listValues.append(self.id_uchastok)
                listValues.append(self.tip_kn)
                listValues.append(self.lineEditKn.text())
                listValues.append(self.lineEditNumber.text())

            if (len(listValues) > 0) and (len(listNames) == len(listValues)):
                if not updateFeature('pb_kn', self.id_kn, listNames, listValues):
                    QMessageBox.warning(self.iface.mainWindow(), u'Ошибка редактирования данных', 
                                                                 u'Произошла ошибка при редактировании кадастрового номера')
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
            listNames = ['id_kn', 'guid_document']
            listValues = [[self.id_kn, self.dlgDocument.guidDocument]]

            if insertFeatures('pb_kn_document', listNames, listValues):
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
                searchCondition = '\"id_kn\" = ' + str(self.id_kn) + ' AND \"guid_document\" = \'' + str(guidDocument) +'\''
                listAttributesSection = attributesBySearchCondition('pb_kn_document', 
                                                                     searchCondition, 
                                                                     ['guid'])
                if len(listAttributesSection) == 1:
                    guidForDelete = str(listAttributesSection[0]['guid'])
                    if deleteById('pb_kn_document', guidForDelete):
                        self.dlgFill()

                    else:
                        QMessageBox.warning(self.iface.mainWindow(), u'Ошибка', 
                                                                     u'Произошла ошибка удаления документа из списка')
                            
################################################################################
    def closeDlg(self):
        self.done(0)

#        QMessageBox.information(self.iface.mainWindow(), 'test', str())
