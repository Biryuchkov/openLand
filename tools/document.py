# -*- coding: utf-8 -*-
'''
/***************************************************************************
 document for openland (cadastral engineer tools)
 copyright            : (C) 2013 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from datetime import *
import uuid 
from document_ui import Ui_DialogDocument
from common import *
from appliedfile import AppliedFile

class Document(QDialog, Ui_DialogDocument):
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
        self.connect(self.toolBox, SIGNAL("currentChanged(int)"), self.toolCurrentChanged)
        self.connect(self.treeWidgetAppliedFiles, SIGNAL("doubleClicked(QModelIndex)"), self.showAppliedFile)

        self.dlgAppliedFile = None

        self.guidDocument = None
        self.selectedGuid = None

        listTypeDocument = attributesBySearchCondition('cl_type_document', 'true', ['id', 'znachenie'])
        if len(listTypeDocument) > 0:
            self.comboBoxDocumentType.addItem('', None)        
            for typeDocument in listTypeDocument:
                self.comboBoxDocumentType.addItem(typeDocument['znachenie'], typeDocument['id'])        
            
            self.comboBoxDocumentType.setCurrentIndex(0)
        
    def fillTree(self):
        guidDocument = ''
        self.treeWidget.clear()
        lastSelectedDocumentItem = None
        
        params = paramByName([['interface/isOnlyUserData', 'bool'], 
                              ['database/user', 'str']])
        searchCondition = 'true'
        if params[0]:
            userName = params[1]
            searchCondition = '\"create_user\" = \'' + userName + '\''
        
        listDocument = attributesBySearchCondition('pb_document', searchCondition, attributesNamesDocument)
        for everyDocument in listDocument:
            guidDocument = str(everyDocument['guid'])
            dateDoc     = everyDocument['date'].toString('yyyy-MM-dd')
            numberDoc   = reNull(everyDocument['number_doc'], '')
            nameDoc     = reNull(everyDocument['name'], '')

            itemForInsert = QTreeWidgetItem([dateDoc, numberDoc, nameDoc])
            itemForInsert.setData(3, 0, guidDocument)
            self.treeWidget.addTopLevelItem(itemForInsert)
            if guidDocument == self.guidDocument:
                lastSelectedDocumentItem = itemForInsert

        if lastSelectedDocumentItem != None:
            self.treeWidget.setCurrentItem(lastSelectedDocumentItem)
            self.pushButtonSelect.setEnabled(True)

    def fillLinesEdit(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.guidDocument = str(self.treeWidget.selectedItems()[0].data(3, 0))
            if self.guidDocument != None:
                attributesDocument = attributesByKeys('pb_document', 'guid', [self.guidDocument], attributesNamesDocument)
                attributesCreator = attributesByKeys('pb_document', 'guid', [self.guidDocument], attributesNamesCreator)
                # guid пропускаем
                attributesDocument = attributesDocument[0]
                attributesCreator = attributesCreator[0]
                currentIndex = self.comboBoxDocumentType.findData(attributesDocument['code_document'])           
                self.comboBoxDocumentType.setCurrentIndex(currentIndex)
                self.lineEditName.setText(reNull(attributesDocument['name'], ''))
                self.lineEditSeries.setText(reNull(attributesDocument['series'], ''))
                self.lineEditNumberDoc.setText(attributesDocument['number_doc'])
                self.dateEditDateDoc.setDate(attributesDocument['date'])
                self.lineEdItissueOrgan.setText(reNull(attributesDocument['issue_organ'], ''))
                self.lineEditNumberReg.setText(reNull(attributesDocument['number_reg'], ''))
                self.dateEditDateReg.setDate(attributesDocument['date_reg'])
                self.dateEditDurationStarted.setDate(attributesDocument['duration_started'])
                self.dateEditDurationStopped.setDate(attributesDocument['duration_stopped'])
                self.lineEditRegister.setText(reNull(attributesDocument['register'], ''))
                self.lineEditDescDoc.setText(reNull(attributesDocument['desc_doc'], ''))
                self.lineEditIssueOrganCode.setText(reNull(attributesDocument['issue_organ_code'], ''))
                self.lineEditCreateUser.setText(reNull(attributesCreator['create_user'], ''))
                self.lineEditCreateDate.setText(reNull(attributesCreator['create_date'], ''))

                self.treeWidgetAppliedFiles.clear()
                attributesDocumentAppliedFile = attributesByKeys('pb_document_applied_file', 'guid_document', [self.guidDocument], attributesNamesDocumentAppliedFile)
                if len(attributesDocumentAppliedFile) > 0:
                    listGuidFile = []
                    for everyDocument in attributesDocumentAppliedFile:
                        if everyDocument['guid_file'] > ' ':
                            listGuidFile.append(str(everyDocument['guid_file']))

                    if len(listGuidFile) > 0:
                        attributesAppliedFile = attributesByKeys('pb_applied_file', 'guid', listGuidFile, attributesNamesAppliedFile)
                    
                        if len(listGuidFile) > 0:
                            for everyFile in attributesAppliedFile:
                                itemForInsert = QTreeWidgetItem([everyFile['kind'], everyFile['path']])
                                itemForInsert.setData(2, 0, str(everyFile['guid']))
                                self.treeWidgetAppliedFiles.addTopLevelItem(itemForInsert)
                    
                self.pushButtonSelect.setEnabled(True)

            else:
                self.pushButtonSelect.setEnabled(False)

    def selectData(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.selectedGuid = self.guidDocument = self.treeWidget.selectedItems()[0].data(3, 0)
            self.close()

    def addData(self):
        if self.toolBox.currentWidget() == self.pageAttributes:
            guidDocument = str(uuid.uuid4())

            listValues = []
            listValues.append(guidDocument)
            listValues.append(self.comboBoxDocumentType.itemData(self.comboBoxDocumentType.currentIndex()))
            listValues.append(self.lineEditName.text())
            listValues.append(self.lineEditSeries.text())
            listValues.append(self.lineEditNumberDoc.text())
            listValues.append(self.dateEditDateDoc.date())
            listValues.append(self.lineEdItissueOrgan.text())
            listValues.append(self.lineEditNumberReg.text())
            listValues.append(self.dateEditDateReg.date())
            listValues.append(self.dateEditDurationStarted.date())
            listValues.append(self.dateEditDurationStopped.date())
            listValues.append(self.lineEditRegister.text())
            listValues.append(self.lineEditDescDoc.text())
            listValues.append(self.lineEditIssueOrganCode.text())

            if insertFeatures('pb_document', attributesNamesDocument, [listValues]):
                self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Выполнено добавление документа')
                self.guidDocument = guidDocument

            else:
                self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Ошибка добавления документа')

            self.fillTree()

        elif self.toolBox.currentWidget() == self.pageAppliedFiles:
            if len(self.treeWidget.selectedItems()) == 1:
                self.guidDocument = self.treeWidget.selectedItems()[0].data(3, 0)

                if self.dlgAppliedFile == None:
                    self.dlgAppliedFile = AppliedFile(self.iface)

                self.dlgAppliedFile.typeAppliedFile = None
                self.dlgAppliedFile.nameAppliedFile = None
                self.dlgAppliedFile.pathAppliedFile = None
                self.dlgAppliedFile.fillLinesEdit()

                self.dlgAppliedFile.exec_()

                if self.dlgAppliedFile.pathAppliedFile != None:
                    guidAppliedFile  = str(uuid.uuid4())
                
                    listValues = []
                    listValues.append(guidAppliedFile)
                    listValues.append(self.dlgAppliedFile.typeAppliedFile)
                    listValues.append(self.dlgAppliedFile.nameAppliedFile)
                    listValues.append(self.dlgAppliedFile.pathAppliedFile)
        
                    if insertFeatures('pb_applied_file', attributesNamesAppliedFile, [listValues]):
                        listValues = []
                        listValues.append([self.guidDocument, guidAppliedFile])
            
                        if insertFeatures('pb_document_applied_file', ['guid_document', 'guid_file'], listValues):
                            self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Выполнено добавление приложенного файла')
                            self.fillLinesEdit()

                        else:
                            self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Ошибка добавления приложенного файла')

                    else:
                        self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Ошибка добавления приложенного файла')

    def editData(self):
        if len(self.treeWidget.selectedItems()) == 1:

            self.pushButtonAdd.setEnabled(False)
            self.pushButtonEdit.setEnabled(False)
            self.pushButtonSave.setEnabled(True)
            self.pushButtonDel.setEnabled(False)

    def delData(self):
        if self.toolBox.currentWidget() == self.pageAttributes:
            if len(self.treeWidget.selectedItems()) == 1:
                self.guidDocument = str(self.treeWidget.selectedItems()[0].data(3, 0))
                docForDelete = self.treeWidget.currentItem().text(0)
                reply = QMessageBox.question(self, u'Потверждение', u'Удалить информацию о документе ' + docForDelete + '?', okay|cancel, defaultButton=cancel)
                if reply == okay:
                    if deleteById('pb_document', self.guidDocument):
                        self.guidDocument = None
                        self.refreshData()
                        self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Выполнено удаление документа')
                    else:
                        self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Ошибка удаления документа')

        elif self.toolBox.currentWidget() == self.pageAppliedFiles:
            currentItem = self.treeWidgetAppliedFiles.currentItem()
            if currentItem != None:
                guidFile = str(currentItem.data(2, 0))
                searchCondition = '\"guid_document\" = \'' + str(self.guidDocument) + '\' AND \"guid_file\" = \'' + str(guidFile) +'\''
                listAttributesDocumentAppliedFile = attributesBySearchCondition('pb_document_applied_file', searchCondition, ['guid'])

                if len(listAttributesDocumentAppliedFile) == 1:
                    guidForDelete = str(listAttributesDocumentAppliedFile[0]['guid'])

                    if deleteById('pb_document_applied_file', guidForDelete):
                        deleteById('pb_applied_file', guidFile)
                        self.fillLinesEdit()
                        self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Удалён файл из списка')

                    else:
                        self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Ошибка удаления файла из списка')

    def saveData(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.guidDocument = self.treeWidget.selectedItems()[0].data(3, 0)

            listValues = []
            listValues.append(self.guidDocument)
            listValues.append(self.comboBoxDocumentType.itemData(self.comboBoxDocumentType.currentIndex()))
            listValues.append(self.lineEditName.text())
            listValues.append(self.lineEditSeries.text())
            listValues.append(self.lineEditNumberDoc.text())
            listValues.append(self.dateEditDateDoc.date())
            listValues.append(self.lineEdItissueOrgan.text())
            listValues.append(self.lineEditNumberReg.text())
            listValues.append(self.dateEditDateReg.date())
            listValues.append(self.dateEditDurationStarted.date())
            listValues.append(self.dateEditDurationStopped.date())
            listValues.append(self.lineEditRegister.text())
            listValues.append(self.lineEditDescDoc.text())
            listValues.append(self.lineEditIssueOrganCode.text())

            if updateFeature('pb_document', self.guidDocument, attributesNamesDocument, listValues):
                self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Выполнено обновление атрибутов документа')
            else:
                self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Ошибка обновления атрибутов документа')

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

    def toolCurrentChanged(self, indexCurrentItem):
        if indexCurrentItem == 0:
            self.pushButtonAdd.setEnabled(True)
            self.pushButtonEdit.setEnabled(True)
            self.pushButtonDel.setEnabled(True)
            self.pushButtonSave.setEnabled(True)
            self.pushButtonAdd.setToolTip(u'Добавить документ')
            self.pushButtonDel.setToolTip(u'Удалить документ')

        else:
            self.pushButtonAdd.setEnabled(True)
            self.pushButtonEdit.setEnabled(False)
            self.pushButtonDel.setEnabled(True)
            self.pushButtonSave.setEnabled(False)
            self.pushButtonAdd.setToolTip(u'Добавить приложенный файл')
            self.pushButtonDel.setToolTip(u'Удалить приложенный файл')
    
    def showAppliedFile(self):
        currentItem = self.treeWidgetAppliedFiles.currentItem()
        if currentItem != None:
            if not systemShowFile(currentItem):
                self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Ошибка. Файл не найден')
    
    def closeDialog(self):
        self.guidDocument = None
        self.close()

#        QMessageBox.information(self.iface.mainWindow(), 'test', str(1))
