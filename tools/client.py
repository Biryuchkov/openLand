# -*- coding: utf-8 -*-
'''
/***************************************************************************
 client for openland (cadastral engineer tools)
 copyright            : (C) 2013 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
import uuid 
from client_ui import Ui_DialogClient
from common import *
from person import Person

class Client(QDialog, Ui_DialogClient):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        self.dlgPerson = None
        
        self.connect(self.pushButtonSelect, SIGNAL("clicked()"), self.selectData)        
        self.connect(self.pushButtonAdd, SIGNAL("clicked()"), self.addData)        
        self.connect(self.pushButtonEdit, SIGNAL("clicked()"), self.editData)        
        self.connect(self.pushButtonDel, SIGNAL("clicked()"), self.delData)        
        self.connect(self.pushButtonSave, SIGNAL("clicked()"), self.saveData)        
        self.connect(self.pushButtonRefresh, SIGNAL("clicked()"), self.refreshData)        
        self.connect(self.pushButtonClose, SIGNAL("clicked()"), self.closeDialog)        
        self.connect(self.treeWidget, SIGNAL("itemSelectionChanged()"), self.fillLinesEdit)
        self.connect(self.comboBoxClientType, SIGNAL("currentIndexChanged(int)"), self.fillTree)
        self.connect(self.pushButtonAgent, SIGNAL("clicked()"), self.personDialog)        
        self.connect(self.pushButtonClose, SIGNAL("clicked()"), self.closeDialog)        

        self.layerClient = get_vector_layer_by_name(gln['pb_client'])
        self.layerPerson = get_vector_layer_by_name(gln['pb_fiz_liczo'])
        self.layerOrganization = get_vector_layer_by_name(gln['pb_yur_liczo'])
        self.layerGovernance = get_vector_layer_by_name(gln['pb_governance'])
        self.layerForeignOrganization = get_vector_layer_by_name(gln['pb_foreign_organization'])

        self.guidClient = None
        self.guidPerson = None
        self.guidOrganization = None
        self.guidForeignOrganization = None
        self.guidGovernance = None
        self.selectedGuid = None
#        self.title = None

    def fillTree(self, currentIndexComboBoxClientType):
        guidClient = ''
        if currentIndexComboBoxClientType == None:
            currentIndexComboBoxClientType = 0
        
        self.layerClient.setSubsetString('')
        self.layerPerson.setSubsetString('')
        self.layerOrganization.setSubsetString('')
        self.layerForeignOrganization.setSubsetString('')
        self.layerGovernance.setSubsetString('')
        
        self.treeWidget.clear()
        lastSelectedClientDataItem = None

        if currentIndexComboBoxClientType == 0:
            self.tabPerson.setEnabled(True)
            self.tabOrganization.setEnabled(False)
            self.tabWidget.setCurrentWidget(self.tabPerson)
        else:
            self.tabPerson.setEnabled(False)
            self.tabOrganization.setEnabled(True)
            self.tabWidget.setCurrentWidget(self.tabOrganization)

        if currentIndexComboBoxClientType == 0:
            self.fillTreeData(self.layerPerson, self.guidPerson)

        elif currentIndexComboBoxClientType == 1:
            self.lineEditCountry.setEnabled(False)
            self.fillTreeData(self.layerOrganization, self.guidOrganization)            

        elif currentIndexComboBoxClientType == 2:
            self.lineEditCountry.setEnabled(True)
            self.fillTreeData(self.layerForeignOrganization, 
                              self.guidForeignOrganization)            

        elif currentIndexComboBoxClientType == 3:
            self.lineEditCountry.setEnabled(False)
            self.fillTreeData(self.layerGovernance, self.guidGovernance)            

        if lastSelectedClientDataItem != None:
            self.treeWidget.setCurrentItem(lastSelectedClientDataItem)
            self.pushButtonSelect.setEnabled(True)
    
    def fillTreeData(self, layerClientData, guidCurrentClientData):
        if layerClientData == None:
            return

        providerClientData = layerClientData.dataProvider()
        feat = QgsFeature()

        column1 = column2 = column3 = u''

        for feat in providerClientData.getFeatures(QgsFeatureRequest().setFlags(QgsFeatureRequest.NoGeometry)):
            att = feat.attributes()
            guidClientData = att[layerClientData.fieldNameIndex('guid')]

            if layerClientData == self.layerPerson:
                column1 = att[layerClientData.fieldNameIndex('familiya')]
                column2 = att[layerClientData.fieldNameIndex('imya')]
                column3 = reNull(att[layerClientData.fieldNameIndex('otchestvo')], '')

            elif layerClientData == self.layerOrganization:
                column1 = att[layerClientData.fieldNameIndex('nazvanie')]
                column2 = u''
                column3 = u''

            elif layerClientData == self.layerGovernance:
                column1 = att[layerClientData.fieldNameIndex('name')]
                column2 = u''
                column3 = u''

            elif layerClientData == self.layerForeignOrganization:
                column1 = att[layerClientData.fieldNameIndex('name')]
                column2 = att[layerClientData.fieldNameIndex('country')]
                column3 = u''

            itemForInsert = QTreeWidgetItem([column1, column2, column3])
            itemForInsert.setData(3, 0, str(guidClientData))
            self.treeWidget.addTopLevelItem(itemForInsert)
                
            if guidCurrentClientData == guidClientData:
                lastSelectedClientDataItem = itemForInsert
        
        del feat
    
    def fillLinesEdit(self):
        if len(self.treeWidget.selectedItems()) > 0:
            currentIndexComboBoxClientType = self.comboBoxClientType.currentIndex()
            self.Client = None
            self.guidPerson = None
            self.guidOrganization = None
            self.guidForeignOrganization = None
            self.guidGovernance = None
            listGuidClient = []

            self.lineEditSurname.setText('')
            self.lineEditFirst.setText('')
            self.lineEditPatronymic.setText('')
            self.lineEditOrganization.setText('')
            self.lineEditCountry.setText('')
            self.comboBoxAgent.setCurrentIndex(-1)
            self.lineEditAppointment.setText('')

            if currentIndexComboBoxClientType == 0:                             # Физическое лицо
                self.guidPerson = self.treeWidget.selectedItems()[0].data(3, 0)
                if self.guidPerson != None:
                    attributesPerson = attributesByKeys('pb_fiz_liczo', 'guid', [self.guidPerson], attributesNamesPerson)
                    self.lineEditSurname.setText(attributesPerson[0]['familiya'])
                    self.lineEditFirst.setText(attributesPerson[0]['imya'])
                    self.lineEditPatronymic.setText(reNull(attributesPerson[0]['otchestvo'], ''))

                    listGuidClient = attributesByKeys('pb_client', 'guid_fiz_liczo', [self.guidPerson], ['guid'])
                    if len(listGuidClient) == 1:
                        self.guidClient = listGuidClient[0]['guid']
                    else:
                        self.guidClient = None

                    self.pushButtonSelect.setEnabled(True)
                else:
                    self.pushButtonSelect.setEnabled(False)

            elif currentIndexComboBoxClientType == 1:                           # Российское юридическое лицо
                self.guidOrganization = self.treeWidget.selectedItems()[0].data(3, 0)
                if self.guidOrganization != None:
                    attributesOrganization = attributesByKeys('pb_yur_liczo', 'guid', [self.guidOrganization], attributesNamesOrganization)
                    attributesClient = attributesByKeys('pb_client', 'guid_yur_liczo', [self.guidOrganization], attributesNamesClient)
                    if len(attributesOrganization) == len(attributesClient) == 1:
                        self.lineEditOrganization.setText(attributesOrganization[0]['nazvanie'])
                        fillComboBox(self.comboBoxAgent, 'pb_fiz_liczo', 'guid', ['familiya', 'imya', 'otchestvo'], attributesClient[0]['guid_agent'])
                        self.lineEditAppointment.setText(reNull(attributesClient[0]['appointment'], ''))

                        self.guidClient = attributesClient[0]['guid']

                        self.pushButtonSelect.setEnabled(True)
                else:
                    self.pushButtonSelect.setEnabled(False)

            elif currentIndexComboBoxClientType == 2:                           # Иностранное юридическое лицо
                self.guidForeignOrganization = self.treeWidget.selectedItems()[0].data(3, 0)
                if self.guidForeignOrganization != None:
                    attributesForeignOrganization = attributesByKeys('pb_foreign_organization', 'guid', [self.guidForeignOrganization], attributesNamesForeignOrganization)
                    attributesClient = attributesByKeys('pb_client', 'guid_foreign_organization', [self.guidForeignOrganization], attributesNamesClient)
                    if len(attributesForeignOrganization) == len(attributesClient) == 1:
                        self.lineEditOrganization.setText(attributesForeignOrganization[0]['name'])
                        self.lineEditCountry.setText(reNull(attributesForeignOrganization[0]['country'], ''))
                        fillComboBox(self.comboBoxAgent, 'pb_fiz_liczo', 'guid', ['familiya', 'imya', 'otchestvo'], attributesClient[0]['guid_agent'])
                        self.lineEditAppointment.setText(reNull(attributesClient[0]['appointment'], ''))

                        self.guidClient = attributesClient[0]['guid']

                        self.pushButtonSelect.setEnabled(True)
                else:
                    self.pushButtonSelect.setEnabled(False)

            elif currentIndexComboBoxClientType == 3:                           # Орган государственной власти, орган местного самоуправления
                self.guidGovernance = self.treeWidget.selectedItems()[0].data(3, 0)
                if self.guidGovernance != None:
                    attributesGovernance = attributesByKeys('pb_governance', 'guid', [self.guidGovernance], attributesNamesGovernance)
                    attributesClient = attributesByKeys('pb_client', 'guid_governance', [self.guidGovernance], attributesNamesClient)
                    if len(attributesGovernance) == len(attributesClient) == 1:
                        self.lineEditOrganization.setText(attributesGovernance[0]['name'])
                        fillComboBox(self.comboBoxAgent, 'pb_fiz_liczo', 'guid', ['familiya', 'imya', 'otchestvo'], attributesClient[0]['guid_agent'])
                        self.lineEditAppointment.setText(reNull(attributesClient[0]['appointment'], ''))

                        self.guidClient = attributesClient[0]['guid']

                        self.pushButtonSelect.setEnabled(True)
                else:
                    self.pushButtonSelect.setEnabled(False)

    def selectData(self):
        if len(self.treeWidget.selectedItems()) > 0:
            currentIndexComboBoxClientType = self.comboBoxClientType.currentIndex()
            if currentIndexComboBoxClientType == 0:                             # Физическое лицо
                self.guidPerson = self.treeWidget.selectedItems()[0].data(3, 0)
                self.guidOrganization = None
                self.guidForeignOrganization = None
                self.guidGovernance = None
                listGuidClient = attributesByKeys('pb_client', 'guid_fiz_liczo', [str(self.guidPerson)], ['guid'])

            elif currentIndexComboBoxClientType == 1:                           # Российское юридическое лицо
                self.guidPerson = None
                self.guidOrganization = self.treeWidget.selectedItems()[0].data(3, 0)
                self.guidForeignOrganization = None
                self.guidGovernance = None
                listGuidClient = attributesByKeys('pb_client', 'guid_yur_liczo', [str(self.guidOrganization)], ['guid'])

            elif currentIndexComboBoxClientType == 2:                           # Иностранное юридическое лицо
                self.guidPerson = None
                self.guidOrganization = None
                self.guidForeignOrganization = self.treeWidget.selectedItems()[0].data(3, 0)
                self.guidGovernance = None
                listGuidClient = attributesByKeys('pb_client', 'guid_foreign_organization', [str(self.guidForeignOrganization)], ['guid'])

            elif currentIndexComboBoxClientType == 3:                           # Орган государственной власти, орган местного самоуправления
                self.guidPerson = None
                self.guidOrganization = None
                self.guidForeignOrganization = None
                self.guidGovernance = self.treeWidget.selectedItems()[0].data(3, 0)
                listGuidClient = attributesByKeys('pb_client', 'guid_governance', [str(self.guidGovernance)], ['guid'])
            
            if len(listGuidClient) == 1:
                self.selectedGuid = self.guidClient = listGuidClient[0]['guid']
#                self.title = self.treeWidget.selectedItems()[0].text()
            else:
                self.selectedGuid = self.guidClient = None

            self.close()

    def addData(self):
        currentIndexComboBoxClientType = self.comboBoxClientType.currentIndex()
        guidClientData = str(uuid.uuid4())                                                                         
        guidClient = str(uuid.uuid4())                                                                         

        if currentIndexComboBoxClientType == 0:                                 # Физическое лицо
            listValues = []
            listValues.append(guidClientData)
            listValues.append(self.lineEditSurname.text())
            listValues.append(self.lineEditFirst.text())
            listValues.append(reNull(self.lineEditPatronymic.text(), ''))

            if insertFeatures('pb_fiz_liczo', attributesNamesPerson, [listValues]):
                self.guidPerson = guidClientData
                listNames  = ['guid', 'guid_fiz_liczo']
                listValues = []
                listValues.append(guidClient)
                listValues.append(guidClientData)

                if insertFeatures('pb_client', listNames, [listValues]):
                    self.guidClient = guidClient

        elif currentIndexComboBoxClientType == 1:                               # Юридическое лицо
            listValues = []
            listValues.append(guidClientData)
            listValues.append(self.lineEditOrganization.text())

            if insertFeatures('pb_yur_liczo', attributesNamesOrganization, [listValues]):
                self.guidOrganization = guidClientData
                listNames  = ['guid', 'guid_yur_liczo', 'guid_agent', 'appointment']
                listValues = []
                listValues.append(guidClient)
                listValues.append(guidClientData)
                listValues.append(self.comboBoxAgent.itemData(self.comboBoxAgent.currentIndex()))
                listValues.append(reNull(self.lineEditAppointment.text(), ''))

                if insertFeatures('pb_client', listNames, [listValues]):
                    self.guidClient = guidClient

        elif currentIndexComboBoxClientType == 2:                               # Иностранное юридическое лицо
            listValues = []
            listValues.append(guidClientData)
            listValues.append(self.lineEditOrganization.text())
            listValues.append(self.lineEditCountry.text())

            if insertFeatures('pb_foreign_organization', attributesNamesForeignOrganization, [listValues]):
                self.guidForeignOrganization = guidClientData
                listNames  = ['guid', 'guid_foreign_organization', 'guid_agent', 'appointment']
                listValues = []
                listValues.append(guidClient)
                listValues.append(guidClientData)
                listValues.append(self.comboBoxAgent.itemData(self.comboBoxAgent.currentIndex()))
                listValues.append(reNull(self.lineEditAppointment.text(), ''))

                if insertFeatures('pb_client', listNames, [listValues]):
                    self.guidClient = guidClient

        elif currentIndexComboBoxClientType == 3:                               # Орган государственной власти, орган местного самоуправления
            listValues = []
            listValues.append(guidClientData)
            listValues.append(self.lineEditOrganization.text())

            if insertFeatures('pb_governance', attributesNamesGovernance, [listValues]):
                self.guidGovernance = guidClientData
                listNames  = ['guid', 'guid_governance', 'guid_agent', 'appointment']
                listValues = []
                listValues.append(guidClient)
                listValues.append(guidClientData)
                listValues.append(self.comboBoxAgent.itemData(self.comboBoxAgent.currentIndex()))
                listValues.append(reNull(self.lineEditAppointment.text(), ''))

                if insertFeatures('pb_client', listNames, [listValues]):
                    self.guidClient = guidClient
    
        self.fillTree(currentIndexComboBoxClientType)

    def editData(self):
        if len(self.treeWidget.selectedItems()) > 0:

            self.pushButtonAdd.setEnabled(False)
            self.pushButtonEdit.setEnabled(False)
            self.pushButtonSave.setEnabled(True)
            self.pushButtonDel.setEnabled(False)

    def delData(self):
        if len(self.treeWidget.selectedItems()) > 0:
            reply = QMessageBox.question(self, u'Потверждение', u'Удалить информацию о выбранном клиенте ?', okay|cancel, defaultButton=cancel)
            if reply == okay:
                currentIndexComboBoxClientType = self.comboBoxClientType.currentIndex()

                if currentIndexComboBoxClientType == 0:                         # Физическое лицо
                    self.guidPerson = self.treeWidget.selectedItems()[0].data(3, 0)
                    if deleteById('pb_fiz_liczo', self.guidPerson):
                        self.guidPerson = self.guidClient = None
                        self.refreshData()

                elif currentIndexComboBoxClientType == 1:                       # Юридическое лицо
                    self.guidOrganization = self.treeWidget.selectedItems()[0].data(3, 0)
                    if deleteById('pb_yur_liczo', self.guidOrganization):
                        self.guidOrganization = self.guidClient = None
                        self.refreshData()

                elif currentIndexComboBoxClientType == 2:                       # Иностранное юридическое лицо
                    self.guidForeignOrganization = self.treeWidget.selectedItems()[0].data(3, 0)
                    if deleteById('pb_foreign_organization', self.guidForeignOrganization):
                        self.guidForeignOrganization = self.guidClient = None
                        self.refreshData()

                elif currentIndexComboBoxClientType == 3:                       # Орган государственной власти, орган местного самоуправления
                    self.guidGovernance = self.treeWidget.selectedItems()[0].data(3, 0)
                    if deleteById('pb_governance', self.guidGovernance):
                        self.guidGovernance = self.guidClient = None
                        self.refreshData()

    def saveData(self):
        if len(self.treeWidget.selectedItems()) > 0:
            currentIndexComboBoxClientType = self.comboBoxClientType.currentIndex()
            if currentIndexComboBoxClientType == 0:                             # Физическое лицо
                self.guidPerson = self.treeWidget.selectedItems()[0].data(3, 0)

                listValues = []
                listValues.append(self.guidPerson)
                listValues.append(self.lineEditSurname.text())
                listValues.append(self.lineEditFirst.text())
                listValues.append(reNull(self.lineEditPatronymic.text(), ''))

                updateFeature('pb_fiz_liczo', self.guidPerson, attributesNamesPerson, listValues)

            elif currentIndexComboBoxClientType == 1:                           # Юридическое лицо
                self.guidOrganization = self.treeWidget.selectedItems()[0].data(3, 0)

                listValues = []
                listValues.append(self.guidOrganization)
                listValues.append(self.lineEditOrganization.text())
                updateFeature('pb_yur_liczo', self.guidOrganization, attributesNamesOrganization, listValues)

                listNames  = ['guid', 'guid_yur_liczo', 'guid_agent', 'appointment']
                listValues = []
                listValues.append(self.guidClient)
                listValues.append(self.guidOrganization)
                listValues.append(self.comboBoxAgent.itemData(self.comboBoxAgent.currentIndex()))
                listValues.append(reNull(self.lineEditAppointment.text(), ''))
                updateFeature('pb_client', self.guidClient, listNames, listValues)

            elif currentIndexComboBoxClientType == 2:                           # Иностранное юридическое лицо
                self.guidForeignOrganization = self.treeWidget.selectedItems()[0].data(3, 0)

                listValues = []
                listValues.append(self.guidForeignOrganization)
                listValues.append(self.lineEditOrganization.text())
                listValues.append(self.lineEditCountry.text())
                updateFeature('pb_foreign_organization', self.guidForeignOrganization, attributesNamesForeignOrganization, listValues)

                listNames = ['guid', 'guid_foreign_organization', 'guid_agent', 'appointment']
                listValues = []
                listValues.append(self.guidClient)
                listValues.append(self.guidForeignOrganization)
                listValues.append(self.comboBoxAgent.itemData(self.comboBoxAgent.currentIndex()))
                listValues.append(reNull(self.lineEditAppointment.text(), ''))
                updateFeature('pb_client', self.guidClient, listNames, listValues)

            elif currentIndexComboBoxClientType == 3:                           # Орган государственной власти, орган местного самоуправления
                self.guidGovernance = self.treeWidget.selectedItems()[0].data(3, 0)

                listValues = []
                listValues.append(self.guidGovernance)
                listValues.append(self.lineEditOrganization.text())
                updateFeature('pb_governance', self.guidGovernance, attributesNamesGovernance, listValues)

                listNames = ['guid', 'guid_governance', 'guid_agent', 'appointment']
                listValues = []
                listValues.append(self.guidClient)
                listValues.append(self.guidGovernance)
                listValues.append(self.comboBoxAgent.itemData(self.comboBoxAgent.currentIndex()))
                listValues.append(reNull(self.lineEditAppointment.text(), ''))
                updateFeature('pb_client', self.guidClient, attributesNamesClient, listValues)

            self.fillTree(currentIndexComboBoxClientType)

            self.pushButtonAdd.setEnabled(True)
            self.pushButtonEdit.setEnabled(True)
            self.pushButtonSave.setEnabled(False)
            self.pushButtonDel.setEnabled(True)

    def refreshData(self):
        currentIndexComboBoxClientType = self.comboBoxClientType.currentIndex()
        self.pushButtonAdd.setEnabled(True)
        self.pushButtonEdit.setEnabled(True)
        self.pushButtonSave.setEnabled(False)
        self.pushButtonDel.setEnabled(True)
        self.fillTree(currentIndexComboBoxClientType)
        self.fillLinesEdit()

    def personDialog(self):
        if self.dlgPerson == None:
            self.dlgPerson = Person(self.iface)
            self.dlgPerson.fillTree()

        self.dlgPerson.guidPerson = None
        
        self.dlgPerson.exec_()
        if self.dlgPerson.guidPerson != None:
            fillComboBox(self.comboBoxAgent, 'pb_fiz_liczo', 'guid', 'familiya', self.dlgPerson.guidPerson)

    def closeDialog(self):
        self.guidClient = None
        self.close()

#        QMessageBox.information(self.iface.mainWindow(), 'test', str(1))
