# -*- coding: utf-8 -*-
'''
/***************************************************************************
 meanssurvey for openland (cadastral engineer tools)
 copyright            : (C) 2013 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from datetime import *
import uuid 
from meanssurvey_ui import Ui_DialogMeansSurvey
from common import *

class MeansSurvey(QDialog, Ui_DialogMeansSurvey):
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

        self.guidMeansSurvey = None
        self.selectedGuid = None

    def fillTree(self):
        guidMeansSurvey = ''
        self.treeWidget.clear()
        lastSelectedMeansSurveyItem = None

        listMeansSurvey = attributesBySearchCondition('pb_sredstva_izmereniya', 
                                                      'true', 
                                                      attributesNamesMeansSurvey)
        for everyMeansSurvey in listMeansSurvey:
            guidMeansSurvey = str(everyMeansSurvey['guid'])
            name = reNull(everyMeansSurvey['naimenovanie'], u'Не указано наименование!')

            itemForInsert = QTreeWidgetItem([name])
            itemForInsert.setData(1, 0, guidMeansSurvey)
            self.treeWidget.addTopLevelItem(itemForInsert)
            if self.guidMeansSurvey == guidMeansSurvey:
                lastSelectedMeansSurveyItem = itemForInsert

        if lastSelectedMeansSurveyItem != None:
            self.treeWidget.setCurrentItem(lastSelectedMeansSurveyItem)
            self.pushButtonSelect.setEnabled(True)

    def fillLinesEdit(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.guidMeansSurvey = self.treeWidget.selectedItems()[0].data(1, 0)
            if self.guidMeansSurvey != None:
                attributesMeansSurvey = attributesByKeys('pb_sredstva_izmereniya', 
                                                         'guid', 
                                                         [self.guidMeansSurvey], 
                                                         attributesNamesMeansSurvey)
                # guid пропускаем
                self.lineEditName.setText(reNull(attributesMeansSurvey[0]['naimenovanie'], ''))
                self.lineEditCertificate.setText(reNull(attributesMeansSurvey[0]['sertifikat'], ''))
                self.lineEditCertificateVerification.setText(reNull(attributesMeansSurvey[0]['svidetelstvo'], ''))

                self.pushButtonSelect.setEnabled(True)

            else:
                self.pushButtonSelect.setEnabled(False)

    def selectData(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.selectedGuid = self.guidMeansSurvey = self.treeWidget.selectedItems()[0].data(1, 0)
            self.close()

    def addData(self):
        guidMeansSurvey = str(uuid.uuid4())
        listValues = []
        listValues.append(guidMeansSurvey)
        listValues.append(self.lineEditName.text())
        listValues.append(self.lineEditCertificate.text())
        listValues.append(self.lineEditCertificateVerification.text())

        if insertFeatures('pb_sredstva_izmereniya', attributesNamesMeansSurvey, 
                          [listValues]):
            self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Выполнено добавление атрибутов прибора')
            self.guidMeansSurvey = guidMeansSurvey
        else:
            self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Ошибка добавления атрибутов прибора')

        self.fillTree()

    def editData(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.pushButtonAdd.setEnabled(False)
            self.pushButtonEdit.setEnabled(False)
            self.pushButtonSave.setEnabled(True)
            self.pushButtonDel.setEnabled(False)

    def delData(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.guidMeansSurvey = self.treeWidget.selectedItems()[0].data(1, 0)
            nameForDelete = self.treeWidget.currentItem().text(0)
            reply = QMessageBox.question(self, u'Потверждение', 
                                         u'Удалить информацию о приборе ' + nameForDelete + '?', 
                                         okay|cancel, defaultButton=cancel)
            if reply == okay:
                if deleteById('pb_sredstva_izmereniya', self.guidMeansSurvey):
                    self.guidMeansSurvey = None
                    self.refreshData()
                    self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Выполнено удаление атрибутов прибора')
                else:
                    self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Ошибка удаления атрибутов прибора')

    def saveData(self):
        if len(self.treeWidget.selectedItems()) == 1:
            self.guidMeansSurvey = self.treeWidget.selectedItems()[0].data(1, 0)

            listValues = []
            listValues.append(self.guidMeansSurvey)
            listValues.append(self.lineEditName.text())
            listValues.append(self.lineEditCertificate.text())
            listValues.append(self.lineEditCertificateVerification.text())

            if updateFeature('pb_sredstva_izmereniya', self.guidMeansSurvey, 
                             attributesNamesMeansSurvey, listValues):
                self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Выполнено обновление атрибутов прибора')

            else:
                self.labelMessage.setText(datetime.now().strftime('%H:%M:%S') + u' Ошибка обновления атрибутов прибора')

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
        self.guidMeansSurvey = None
        self.close()

#        QMessageBox.information(self.iface.mainWindow(), 'test', str())
