# -*- coding: utf-8 -*-
'''
/***************************************************************************
 mp for openland (cadastral engineer tools)
 copyright            : (C) 2013 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from datetime import *
import uuid 

from mp_ui import Ui_DialogMP
from common import *
from contractor import Contractor
from commontexts import CommonText
from client import Client
from appliedfile import AppliedFile
from document import Document
from geodesicbase import GeodesicBase
from meanssurvey import MeansSurvey
from realty import Realty
from subparcel import SubParcel
from xmlmpcreate import XmlMpCreate

class mpDialog(QDialog, Ui_DialogMP):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        self.dlgContractor = None        
        self.dlgCommonText = None        
        self.dlgClient = None        
        self.dlgAppliedFile = None
        self.dlgDocument = None
        self.dlgGeodesicBase = None
        self.dlgMeansSurvey = None
        self.dlgRealty = None
        self.dlgSubParcel = None
        self.dlgCreateXmlMp = None
        
        self.connect(self.pushButtonCloseDialog, SIGNAL("clicked()"), self.closeDialog)        
        self.connect(self.pushButtonCreateNewMp, SIGNAL("clicked()"), self.createNewMp)        
        self.connect(self.pushButtonDeleteMp, SIGNAL("clicked()"), self.deleteMp)        
        self.connect(self.pushButtonCreateXML, SIGNAL("clicked()"), self.createXmlMp)        
        self.connect(self.pushButtonFindMp, SIGNAL("clicked()"), self.findMp)        

        self.connect(self.pushButtonAddSectionMp, SIGNAL("clicked()"), self.addSection)        
        self.connect(self.pushButtonSaveData, SIGNAL("clicked()"), self.saveData)        
        self.connect(self.pushButtonEditData, SIGNAL("clicked()"), self.editData)        
        self.connect(self.pushButtonDeleteSectionMp, SIGNAL("clicked()"), self.delSection)        
        self.connect(self.pushButtonRefreshData, SIGNAL("clicked()"), self.refreshData)        
        
        self.connect(self.pushButtonEditContractor, SIGNAL("clicked()"), self.contractorDialog)        
        self.connect(self.pushButtonPurpose, SIGNAL("clicked()"), self.commonTextDialogForPurpose)        
        self.connect(self.pushButtonReason, SIGNAL("clicked()"), self.commonTextDialogForReason)        
        self.connect(self.pushButtonEditClient, SIGNAL("clicked()"), self.clientDialog)        
        self.connect(self.pushButtonConclusion, SIGNAL("clicked()"), self.commonTextDialogForConclusion)        

        self.connect(self.comboBoxMp, SIGNAL("currentIndexChanged(int)"), self.comboBoxMpIndexChanged)
        self.connect(self.treeWidget, SIGNAL("itemSelectionChanged()"), self.treeItemChanged)
        self.connect(self.tabWidget, SIGNAL("currentChanged(int)"), self.tabCurrentChanged)
        self.connect(self.treeWidgetParcel, SIGNAL("doubleClicked(QModelIndex)"), self.showParcelOnMap)
        self.connect(self.treeWidgetSurvey, SIGNAL("doubleClicked(QModelIndex)"), self.showAppliedFile)
        self.connect(self.treeWidgetSchemeGeodesicPlotting, SIGNAL("doubleClicked(QModelIndex)"), self.showAppliedFile)
        self.connect(self.treeWidgetSchemeDispositionParcels, SIGNAL("doubleClicked(QModelIndex)"), self.showAppliedFile)
        self.connect(self.treeWidgetDiagramParcels, SIGNAL("doubleClicked(QModelIndex)"), self.showAppliedFile)
        self.connect(self.treeWidgetAgreementDocument, SIGNAL("doubleClicked(QModelIndex)"), self.showAppliedFile)
        self.connect(self.treeWidgetNodalPointSchemes, SIGNAL("doubleClicked(QModelIndex)"), self.showAppliedFile)
        self.connect(self.treeWidgetAppendix, SIGNAL("itemSelectionChanged()"), self.treeItemAppendixChanged)
        self.connect(self.toolBox, SIGNAL("currentChanged(int)"), self.toolBoxCurrentChanged)

        self.guidMP = []                                                        # Список GUID активных МП 
        self.guidCurrentMP = None                                               # Идентификатор активного МП
        self.attributesValuesMP = []                                            # Спикок атрибутов одного, выбранного МП
        self.dictXmlIdSection = {}                                              # Словарь соответствия [имя XML] => [ID] для разделов(подразделов) межевового плана
        self.numberSchemaXML = 4                                                # Номер версии схемы XML
        self.dicXmlToolBoxItem = {}                                             # Словарь соответствия [имя XML] => QWidget в составе QToolBox
        
        self.comboBoxEDocCodeType.addItem(u'О постановке на учёт', '014')        
        self.comboBoxEDocCodeType.addItem(u'О внесении изменений', '015')        
        self.comboBoxEDocCodeType.setCurrentIndex(0)
        self.spinBoxShemaVersion.setValue(self.numberSchemaXML)
        self.lineEditMpGUID.setText('')
        self.dateEditDateWork.setDate(datetime.now())
        self.dateEditAcceptWork.setDate(datetime.now())

        self.dicXmlToolBoxItem['Documents'] = self.pageDocument
        self.dicXmlToolBoxItem['Geodesic_Bases'] = self.pageGeodesicBase
        self.dicXmlToolBoxItem['Means_Survey'] = self.pageMeansSurvey
        self.dicXmlToolBoxItem['Realty'] = self.pageRealty
        self.dicXmlToolBoxItem['SubParcels'] = self.pageSubParcel
    
    '''
    Заполнение данными корневого уровня дерева разделов межевого плана
    '''
    def fillTree(self):
        self.treeWidget.clear()
        self.dictXmlIdSection = {}
        searchCondition = '\"id_parent\" = 0 AND \"number_version_mp\" = ' + str(self.numberSchemaXML)
        topLevelElements = attributesBySearchCondition('cl_section_mp', searchCondition, attributesNamesSectionMP)
        
        for oneElement in topLevelElements:
            self.dictXmlIdSection[oneElement['xml_name']] = oneElement['id']
            nameElement = oneElement['name']
            orderSort   = str(oneElement['sort_order'])
            treeTopLevelItem = QTreeWidgetItem([nameElement, orderSort])
            treeTopLevelItem.setData(2, 0, oneElement['xml_name'])
            self.fillPosterity(treeTopLevelItem, oneElement['id'])
            self.treeWidget.addTopLevelItem(treeTopLevelItem)
        
        self.treeWidget.sortItems(2, 0)

        self.treeItemChanged()

    '''
    Заполнение данными дочерних уровней дерева разделов межевого плана
    '''                                                                                                       
    def fillPosterity(self, treeItem, idParent):
        if treeItem == None: 
            return

        searchCondition = '\"id_parent\" = ' + str(idParent)+ ' AND \"number_version_mp\" = ' + str(self.numberSchemaXML)
        childElements = attributesBySearchCondition('cl_section_mp', searchCondition, attributesNamesSectionMP)
        childElements.sort()
        
        for oneElement in childElements:
            currentItem = QTreeWidgetItem([oneElement['name']])
            currentItem.setData(2, 0, oneElement['xml_name'])
            treeItem.addChild(currentItem)
            self.dictXmlIdSection[oneElement['xml_name']] = oneElement['id']
            self.fillPosterity(currentItem, int(oneElement['id']))
    
    #
    def mpSelectionParcel(self):
        if len(self.guidMP) == 0:
            listParcelId = attributesFromSelection('ln_uchastok', ['id'])
            if len(listParcelId) > 0:
                listId = [int(every['id']) for every in listParcelId]
                listParentParcelId = attributesByKeys('pb_parcel_parcel', 'id_children', listId, ['id_parent'])

                if len(listParentParcelId) > 0:
                    listParentId = [int(every['id_parent']) for every in listParentParcelId]
                    listAllId = listId + listParentId
                    
                    listId = []
                    for oneId in listAllId:
                        if listId.count(oneId) == 0:
                            listId.append(oneId)

                listGuidMp = attributesByKeys('pb_mp_section_data', 'id_parcel', listId, ['guid_mp'])
                if len(listGuidMp) > 0:
                    self.guidMP = [every['guid_mp'] for every in listGuidMp]

                    self.comboBoxMp.clear()
                    self.showMessage(u'Найдено межевых планов в количестве ' + str(len(self.guidMP)))
                    self.fillComboBoxMp()
                else:
                    self.guidMP = []
    
################################################################################
    '''
    Заполнение списка межевых планов
    '''
    def fillComboBoxMp(self):        
        if len(self.guidMP) > 0:
            params = paramByName([['interface/isOnlyUserData', 'bool'], 
                                  ['database/user', 'str']])
            if params[0]:
                userName = params[1]
                listGuid = "("
                for everyGuidMp in self.guidMP:
                    listGuid = listGuid + "\'"+ everyGuidMp +"\',"
                listGuid = listGuid[:len(listGuid) - 1] + ")"

                searchCondition = '\"guid\" IN ' + listGuid + ' AND \"create_user\" = \'' + userName + '\''
                listMP = attributesBySearchCondition('pb_mp', searchCondition, 
                                          ['date_work', 'guid', 'reason'])
            else:
                listMP = attributesByKeys('pb_mp', 'guid', self.guidMP, 
                                          ['date_work', 'guid', 'reason'])
            if len(listMP) > 0:
                self.showMessage(u'Выбраны межевые планы в количестве ' + 
                                 str(len(listMP)))
                listMP.sort()
                listMP.reverse()
                for oneMP in listMP:
                    titleComboBox = oneMP['date_work'].toString('yyyy-MM-dd') +' '+ oneMP['reason'][:32] +' '+ oneMP['guid'][:8]
                    self.comboBoxMp.addItem(titleComboBox, oneMP['guid'])        
            
                self.comboBoxMp.setCurrentIndex(0)

            else:
                self.showMessage(u'Не выбраны межевые планы для работы')
        else:
            self.comboBoxMp.clear()
            self.showMessage(u'Не выбраны межевые планы для работы')

################################################################################
    '''
    Обновление заголовка после редактировании атрибутов межевого плана
    '''
    def updateTitleComboBoxMp(self):        
        if self.guidCurrentMP > ' ':
            attributesMP = attributesByKeys('pb_mp', 
                                            'guid', 
                                            [self.guidCurrentMP], 
                                            ['date_work', 'guid', 'reason'])
            if len(attributesMP) == 1:
                titleComboBox = attributesMP[0]['date_work'].toString('yyyy-MM-dd') +' '+ attributesMP[0]['reason'][:32] +' '+ attributesMP[0]['guid'][:8]
                currentIndex = self.comboBoxMp.currentIndex()
                self.comboBoxMp.setItemText(currentIndex, titleComboBox)
            

    '''
    Заполнение данными закладки с определеным индексом
    '''
    def fillTabData(self, indexTabData):
        self.pushButtonAddSectionMp.setEnabled(False)
        self.pushButtonSaveData.setEnabled(False)
        self.pushButtonEditData.setEnabled(False)
        self.pushButtonDeleteSectionMp.setEnabled(False)
        self.pushButtonRefreshData.setEnabled(False)
            
        self.guidCurrentMP = self.comboBoxMp.itemData(self.comboBoxMp.currentIndex())
        if self.guidCurrentMP > None:
            self.attributesValuesMP = attributesByKeys('pb_mp', 'guid', 
                                      [self.guidCurrentMP], attributesNamesMP)
            attributesValuesCreator = attributesByKeys('pb_mp', 'guid', 
                                      [self.guidCurrentMP], attributesNamesCreator)
            
            if len(self.attributesValuesMP) == 1:
                self.attributesValuesMP = self.attributesValuesMP[0]
                attributesValuesCreator = attributesValuesCreator[0]

            else:        
                self.attributesValuesMP = []
            self.pushButtonCreateXML.setEnabled(True)
            self.pushButtonDeleteMp.setEnabled(True)

        else:
           self.attributesValuesMP = []
           self.pushButtonCreateXML.setEnabled(False)
           self.pushButtonDeleteMp.setEnabled(False)

        # Электронный документ & Титульный лист & Заключение КИ
        if indexTabData in (0, 1, 6):
            if len(self.attributesValuesMP) > 1:
                self.tabWidget.setCurrentIndex(indexTabData)
                self.pushButtonEditData.setEnabled(True)
                self.pushButtonRefreshData.setEnabled(True)

                if self.attributesValuesMP['codetype'] == '014':
                    self.comboBoxEDocCodeType.setCurrentIndex(0)
                else:
                    self.comboBoxEDocCodeType.setCurrentIndex(1)

                self.spinBoxShemaVersion.setValue(int(self.attributesValuesMP['version']))
                self.lineEditMpGUID.setText(self.attributesValuesMP['guid'])
                self.lineEditCreateUser.setText(reNull(attributesValuesCreator['create_user'], u'Не указано'))
                self.lineEditCreateDate.setText(reNull(attributesValuesCreator['create_date'], u'Не указано'))
                self.dateEditDateWork.setDate(self.attributesValuesMP['date_work'])
                fillComboBox(self.comboBoxContractor, 'pb_contractor', 'guid', ['surname', 'first', 'patronymic'], self.attributesValuesMP['guid_contractor'])
                checkDataNull(self.attributesValuesMP['purpose'], self.textEditPurpose)
                self.textEditReason.setText(self.attributesValuesMP['reason'])

                self.comboBoxClient.clear()
                listTitle = []
                title = ''

                strGuidClient = self.attributesValuesMP['guid_client']
                if strGuidClient > ' ':
                    attributesValuesClient = attributesByKeys('pb_client', 'guid', [strGuidClient], attributesNamesClient)
                                                                                        
                    if len(attributesValuesClient) == 1:
                        attributesValuesClient = attributesValuesClient[0]
                        if attributesValuesClient['guid_fiz_liczo'] > ' ':              # Физическое лицо
                            listTitle = attributesByKeys('pb_fiz_liczo', 'guid', [attributesValuesClient['guid_fiz_liczo']], ['familiya', 'imya', 'otchestvo'])
                            title = listTitle[0]['familiya'] + ' ' + listTitle[0]['imya'] + ' ' + reNull(listTitle[0]['otchestvo'], '')

                        elif attributesValuesClient['guid_yur_liczo'] > ' ':            # Российское юридическое лицо
                            listTitle = attributesByKeys('pb_yur_liczo', 'guid', [attributesValuesClient['guid_yur_liczo']], ['nazvanie'])
                            title = listTitle[0]['nazvanie']

                        elif attributesValuesClient['guid_governance'] > ' ':           # Орган государственной власти, орган местного самоуправления
                            listTitle = attributesByKeys('pb_governance', 'guid', [attributesValuesClient['guid_governance']], ['name'])
                            title = listTitle[0]['name']

                        elif attributesValuesClient['guid_foreign_organization'] > ' ': # Иностранное юридическое лицо
                            listTitle = attributesByKeys('pb_foreign_organization', 'guid', [attributesValuesClient['guid_foreign_organization']], ['name', 'country'])
                            title = listTitle[0]['name'] + ' ' + listTitle[0]['country']

                    self.comboBoxClient.addItem(title, strGuidClient)
                    self.comboBoxClient.setCurrentIndex(0)
                
                self.dateEditAcceptWork.setDate(reNull(self.attributesValuesMP['date_accept'], QDate(2000, 01, 01)))
                checkDataNull(self.attributesValuesMP['conclusion'], self.textEditConclusion)
            
            else:
                self.lineEditMpGUID.clear()
                self.dateEditDateWork.setDate(QDate(2000, 01, 01))
                self.comboBoxContractor.setCurrentIndex(0)
                self.textEditPurpose.clear()
                self.textEditReason.clear()
                self.comboBoxClient.clear()
                self.dateEditAcceptWork.setDate(QDate(2000, 01, 01))
                self.textEditConclusion.clear()

                self.pushButtonEditData.setEnabled(False)
                self.pushButtonRefreshData.setEnabled(False)
                self.showMessage(u'Нет атрибутов межевого плана')

        # Пакет информации
        elif indexTabData == 2:
            if len(self.attributesValuesMP) > 1:
                self.tabWidget.setCurrentIndex(indexTabData)
                self.pushButtonAddSectionMp.setEnabled(True)
                self.pushButtonDeleteSectionMp.setEnabled(True)
                self.pushButtonRefreshData.setEnabled(True)

                currentTreeItem = self.treeWidget.currentItem()
                currentTreeItemData = currentTreeItem.data(2, 0)

                self.treeWidgetParcel.clear()
                listAttributesSection = []
                listIdParcel = []
                listAttributesParcel = []

                idCurrentSection = self.dictXmlIdSection[currentTreeItemData]
                searchCondition = '\"guid_mp\" = \'' + str(self.guidCurrentMP) + '\' AND \"id_section_mp\" = ' + str(idCurrentSection)
                listAttributesSection = attributesBySearchCondition('pb_mp_section_data', searchCondition, attributesNamesMpSectionData)
                if len(listAttributesSection) > 0:
                    for everySection in listAttributesSection:
                        listIdParcel.append(int(everySection['id_parcel'])) 

                if len(listIdParcel) > 0:
                    listAttributesParcel = attributesByKeys('ln_uchastok', 'id', listIdParcel, ['id', 'kn', 'oboznachenie_na_plane'])

                if len(listAttributesParcel) > 0: 
#                    if currentTreeItemData == 'NewParcel':
                    for everyParcel in listAttributesParcel:
                        itemForInsert = QTreeWidgetItem([everyParcel['kn'], everyParcel['oboznachenie_na_plane']])
                        itemForInsert.setData(2, 0, int(everyParcel['id']))
                        self.treeWidgetParcel.addTopLevelItem(itemForInsert)
            
            else:
                self.treeWidgetParcel.clear()

                self.pushButtonAddSectionMp.setEnabled(False)
                self.pushButtonDeleteSectionMp.setEnabled(False)
                self.pushButtonRefreshData.setEnabled(False)
                self.showMessage(u'Нет атрибутов пакета информации')

        # Система координат
        elif indexTabData == 3:
            if self.guidCurrentMP > ' ':
                searchCondition = '\"guid_mp\" = \'' + str(self.guidCurrentMP) + '\' AND \"id_parcel\" > 0' 
                attributesValuesMpSectionData = attributesBySearchCondition('pb_mp_section_data', searchCondition, attributesNamesMpSectionData)

                if len(attributesValuesMpSectionData) > 0:
                    listIdParcel = []
                    for everyMpSectionData in attributesValuesMpSectionData:
                        idParcel = int(everyMpSectionData['id_parcel'])
                        
                        if idParcel > 0:
                            listIdParcel.append(idParcel)
                
                    if len(listIdParcel) > 0:
                        attributesValuesParcel = attributesByKeys('ln_uchastok', 'id', listIdParcel, ['id_msk'])
                            
                        listIdMsk = []
                        if len(attributesValuesParcel) > 0:
                            for everyParcel in attributesValuesParcel:
                                listIdMsk.append(everyParcel['id_msk'])

                            if len(listIdMsk) > 0:
                                attributesValuesMsk = attributesByKeys('cl_sistema_koordinat', 'id', listIdMsk, ['id', 'znachenie'])

                                if len(attributesValuesMsk) > 0:
                                    self.treeWidgetCoordSystems.clear()
                                    for everyMsk in attributesValuesMsk:
                                        itemForInsert = QTreeWidgetItem([everyMsk['znachenie'], everyMsk['id']])
                                        itemForInsert.setData(2, 0, everyMsk['id'])
                                        self.treeWidgetCoordSystems.addTopLevelItem(itemForInsert)
                    
                                    self.tabWidget.setCurrentIndex(indexTabData)
                                    self.pushButtonRefreshData.setEnabled(True)

            else:
                self.treeWidgetCoordSystems.clear()

        # Исходные данные
        elif indexTabData == 4:
            if self.guidCurrentMP > ' ':
                self.tabWidget.setCurrentIndex(indexTabData)
                currentTreeItemData = self.treeWidget.currentItem().data(2, 0)

                try: 
                    self.dicXmlToolBoxItem[currentTreeItemData]
                except:
                    toolBoxPage = None
                else:
                    toolBoxPage = self.dicXmlToolBoxItem[currentTreeItemData]

                if toolBoxPage != None:
                    if self.toolBox.currentWidget() == toolBoxPage:
                        self.toolBoxCurrentChanged(self.toolBox.currentIndex())
                    else:
                        self.toolBox.setCurrentWidget(toolBoxPage) 

            else:
                self.pushButtonAddSectionMp.setEnabled(False)
                self.pushButtonSaveData.setEnabled(False)
                self.pushButtonEditData.setEnabled(False)
                self.pushButtonDeleteSectionMp.setEnabled(False)
                self.pushButtonRefreshData.setEnabled(False)
                self.showMessage(u'Нет атрибутов для отображения')

        # Измерения и расчёты
        elif indexTabData == 5:
            self.fillTreeWidgetAppliedFile(self.treeWidgetSurvey, indexTabData)

        # Схема геопостроений
        elif indexTabData == 7:
            self.fillTreeWidgetAppliedFile(self.treeWidgetSchemeGeodesicPlotting, indexTabData)

        # Схема расположения ЗУ
        elif indexTabData == 8:
            self.fillTreeWidgetAppliedFile(self.treeWidgetSchemeDispositionParcels, indexTabData)

        # Чертёж ЗУ и их частей
        elif indexTabData == 9:
            self.fillTreeWidgetAppliedFile(self.treeWidgetDiagramParcels, indexTabData)

        # Акт согласования
        elif indexTabData == 10:
            self.fillTreeWidgetAppliedFile(self.treeWidgetAgreementDocument, indexTabData)

        # Абрисы
        elif indexTabData == 11:
            self.fillTreeWidgetAppliedFile(self.treeWidgetNodalPointSchemes, indexTabData)

        # Приложения
        elif indexTabData == 12:
            self.treeWidgetAppendix.clear()
            if self.guidCurrentMP > ' ':
                self.tabWidget.setCurrentIndex(indexTabData)
                self.pushButtonAddSectionMp.setEnabled(True)
                self.pushButtonDeleteSectionMp.setEnabled(True)
                self.pushButtonRefreshData.setEnabled(True)
                currentTreeItemData = self.treeWidget.currentItem().data(2, 0)
                idCurrentSection = int(self.dictXmlIdSection[currentTreeItemData])

                searchCondition = '\"guid_mp\" = \'' + str(self.guidCurrentMP) + '\' AND \"guid_document\" IS NOT NULL' + ' AND \"id_section_mp\" = ' + str(idCurrentSection)
                attributesValuesMpSectionData = attributesBySearchCondition('pb_mp_section_data', searchCondition, attributesNamesMpSectionData)

                if len(attributesValuesMpSectionData) > 0:
                    listIdDocument = []
                    for everyMpSectionData in attributesValuesMpSectionData:
                        guidDocument = everyMpSectionData['guid_document']
                        
                        if guidDocument > ' ':
                            listIdDocument.append(guidDocument)
                
                    if len(listIdDocument) > 0:
                        attributesValuesDocument = attributesByKeys('pb_document', 'guid', listIdDocument, ['guid', 'number_doc', 'name'])
                            
                        if len(attributesValuesDocument) > 0:
                            for everyDocument in attributesValuesDocument:
                                itemForInsert = QTreeWidgetItem([everyDocument['number_doc'], everyDocument['name']])
                                itemForInsert.setData(2, 0, everyDocument['guid'])
                                self.treeWidgetAppendix.addTopLevelItem(itemForInsert)
                    
                            self.tabWidget.setCurrentIndex(indexTabData)
                            self.pushButtonRefreshData.setEnabled(True)

            else:
                self.treeWidgetAppendix.clear()    

                self.pushButtonAddSectionMp.setEnabled(False)
                self.pushButtonDeleteSectionMp.setEnabled(False)
                self.pushButtonRefreshData.setEnabled(False)
                self.showMessage(u'Нет атрибутов для отображения')
                            
        else:
            self.tabWidget.setCurrentIndex(1)
            
    '''
    Заполнение данными элемента Tree приложенными файлами
    '''
    def fillTreeWidgetAppliedFile(self, treeWidget, indexTabData):
        if len(self.attributesValuesMP) > 1:
            self.tabWidget.setCurrentIndex(indexTabData)
            self.pushButtonAddSectionMp.setEnabled(True)
            self.pushButtonDeleteSectionMp.setEnabled(True)
            self.pushButtonRefreshData.setEnabled(True)
            currentTreeItem = self.treeWidget.currentItem()
            currentTreeItemData = currentTreeItem.data(2, 0)

            treeWidget.clear()
            listAttributesSection = []
            listGuidFile = []
            listAttributesFile = []

            idCurrentSection = self.dictXmlIdSection[currentTreeItemData]
            searchCondition = '\"guid_mp\" = \'' + str(self.guidCurrentMP) + '\' AND \"id_section_mp\" = ' + str(idCurrentSection)
            listAttributesSection = attributesBySearchCondition('pb_mp_section_data', searchCondition, attributesNamesMpSectionData)
            if len(listAttributesSection) > 0:
                for everySection in listAttributesSection:
                    listGuidFile.append(everySection['guid_applied_file']) 

            if len(listGuidFile) > 0:
                listAttributesFile = attributesByKeys('pb_applied_file', 'guid', listGuidFile, attributesNamesAppliedFile)
            if len(listAttributesFile) > 0: 
                for everyFile in listAttributesFile:
                    itemForInsert = QTreeWidgetItem([everyFile['kind'], everyFile['path']])
                    itemForInsert.setData(2, 0, everyFile['guid'])
                    treeWidget.addTopLevelItem(itemForInsert)
            
        else:
            treeWidget.clear()

            self.pushButtonAddSectionMp.setEnabled(False)
            self.pushButtonDeleteSectionMp.setEnabled(False)
            self.pushButtonRefreshData.setEnabled(False)
            self.showMessage(u'Нет атрибутов для отображения')
    
    '''
    Обработка события изменения текущего элемента дерева разделов межевого плана
    '''
    def treeItemChanged(self):
        currentTreeItem = self.treeWidget.currentItem()
        if currentTreeItem == None:
            self.treeWidget.setCurrentItem(self.treeWidget.topLevelItem(1))
            currentTreeItem = self.treeWidget.currentItem()

        currentTreeItemData = currentTreeItem.data(2, 0)
        currentTreeItemIndex = self.treeWidget.indexOfTopLevelItem(currentTreeItem)
        while (currentTreeItemIndex < 0): 
            currentTreeItem = currentTreeItem.parent()
            currentTreeItemIndex = self.treeWidget.indexOfTopLevelItem(currentTreeItem)

        self.fillTabData(currentTreeItemIndex)

    '''
    Обработка события изменения текущего элемента дерева приложений к МП
    '''
    def treeItemAppendixChanged(self):
        currentTreeItem = self.treeWidgetAppendix.currentItem()
        if currentTreeItem == None:
            self.pushButtonEditData.setEnabled(False)
            return

        guidDocument = currentTreeItem.data(2, 0)
        if guidDocument > ' ': 
            self.pushButtonEditData.setEnabled(True)

    '''
    Обработка события изменения текущей закладки данных раздела межевого плана
    '''
    def tabCurrentChanged(self, indexCurrentTab):
        self.treeWidget.setCurrentItem(self.treeWidget.topLevelItem(indexCurrentTab))

    '''
    Обработка события смены текущего межевого плана, из элементов self.comboBoxMp
    '''
    def comboBoxMpIndexChanged(self, i):
        currentTreeItemIndex = self.treeWidget.indexOfTopLevelItem(self.treeWidget.currentItem())
        self.fillTabData(currentTreeItemIndex)

    '''
    Создание нового межевого плана
    '''
    def createNewMp(self):
        guid = str(uuid.uuid4())
        # ['guid', 'codetype', 'version', 'date_work', 'purpose', 'reason', 'guid_contractor', 'date_accept', 'conclusion', 'guid_client']

        listValues = []
        listValues.append(guid)
        listValues.append('014')
        listValues.append('04')
        listValues.append(str(datetime.now()))
        listValues.append('')
        listValues.append(u'Не указан вид кадастровых работ')
        listValues.append('')
        listValues.append(str(datetime.now()))
        listValues.append('')
        listValues.append('')

        if insertFeatures('pb_mp', attributesNamesMP, [listValues]):
            self.comboBoxMp.clear()
            self.showMessage(u'Создан новый межевой план')
            self.guidMP.append(guid)

        else:
            self.showMessage(u'Произошла ошибка создания нового межевого плана')
            return

        self.fillComboBoxMp()
    
    '''
    Удаление межевого плана
    '''
    def deleteMp(self):
        self.guidCurrentMP = self.comboBoxMp.itemData(self.comboBoxMp.currentIndex())
        if self.guidCurrentMP > None:
            reply = QMessageBox.question(self, u'Потверждение', 
                                         u'Удалить межевой план с идентификатором ' +self.guidCurrentMP+ '?', 
                                         okay|cancel, defaultButton=cancel)
            if reply == cancel:
                return

            if deleteById('pb_mp', self.guidCurrentMP):
                self.guidMP.remove(self.guidCurrentMP)
                self.showMessage(u'Удалён межевой план с идентификатором ' + self.guidCurrentMP)
                self.comboBoxMp.removeItem(self.comboBoxMp.currentIndex())

            else:
                self.showMessage(u'Ошибка удаления межевого плана с идентификатором ' + self.guidCurrentMP)

    '''
    Вызов диалога создания XML файла
    '''
    def createXmlMp(self):
        self.guidCurrentMP = self.comboBoxMp.itemData(self.comboBoxMp.currentIndex())
        if self.guidCurrentMP > None:
            if self.dlgCreateXmlMp == None:
                self.dlgCreateXmlMp = XmlMpCreate(self.iface)

            self.dlgCreateXmlMp.guidMp = self.guidCurrentMP
            self.dlgCreateXmlMp.dictXmlIdSection = self.dictXmlIdSection
            self.dlgCreateXmlMp.listWidgetEvents.addItem(u'')
            self.dlgCreateXmlMp.listWidgetEvents.addItem(u'Текущий уникальный идентификатор МП ' + str(self.guidCurrentMP))
            self.dlgCreateXmlMp.progressBar.setRange(0, 100)
            self.dlgCreateXmlMp.progressBar.setValue(0)

            self.dlgCreateXmlMp.show()

        else:
            self.showMessage(u'Ошибка определения идентификатора МП для создания XML')
    
    '''
    Поиск межевого плана по атрибуту
    '''
    def findMp(self):
        if self.lineEditFind.text() > ' ':
            findText = self.lineEditFind.text()
            listGuidMP = []
            if self.comboBoxFindField.currentText() == u'Дата кадастровых работ':
                searchCondition = '\"date_work\"=' +"\'"+ findText +"\'"
                listGuidMP = attributesBySearchCondition('pb_mp', searchCondition, ['guid'])

            elif self.comboBoxFindField.currentText() == u'Вид кадастровых работ':
                searchCondition = '\"reason\" LIKE ' +"\'"+ findText +"%\'"
                listGuidMP = attributesBySearchCondition('pb_mp', searchCondition, ['guid'])

            elif self.comboBoxFindField.currentText() == u'Кадастровый инженер':
                searchCondition = '\"surname\" LIKE ' +"\'"+ findText +"%\'"
                listGuidContractor = attributesBySearchCondition('pb_contractor', searchCondition, ['guid'])
                if len(listGuidContractor) > 0:
                    listStrGuidContractor = [every['guid'] for every in listGuidContractor]
                    listGuidMP = attributesByKeys('pb_mp', 'guid_contractor', listStrGuidContractor, ['guid'])

            elif self.comboBoxFindField.currentText() == u'КН участка':
                searchCondition = '\"kn\" LIKE ' +"\'"+ findText +"%\'"
                listIdParcel = attributesBySearchCondition('ln_uchastok', searchCondition, ['id'])
                if len(listIdParcel) > 0:
                    listIntIdParcel = [int(every['id']) for every in listIdParcel]
                    listGuidMP = attributesByKeys('pb_mp_section_data', 'id_parcel', listIntIdParcel, ['guid_mp'])

            elif self.comboBoxFindField.currentText() == u'КН входящего участка':
                searchCondition = '\"kn\" LIKE ' +"\'"+ findText +"%\'"
                listIdChildParcel = attributesBySearchCondition('ln_uchastok', searchCondition, ['id'])
                if len(listIdChildParcel) > 0:
                    listIntIdChildParcel = [int(every['id']) for every in listIdChildParcel]

                    listIntIdParentParcel = []
                    for everyId in listIntIdChildParcel:
                        idIntIdParentParcel = idParentByIdChild(everyId)
                        if idIntIdParentParcel > 0:
                            listIntIdParentParcel.append(idIntIdParentParcel)

                    if len(listIntIdParentParcel) > 0:
                        listIdParcel = attributesByKeys('ln_uchastok', 'id', listIntIdParentParcel, ['id'])
                        if len(listIdParcel) > 0:
                            listIntIdParcel = [int(every['id']) for every in listIdParcel]
                            listGuidMP = attributesByKeys('pb_mp_section_data', 'id_parcel', listIntIdParcel, ['guid_mp'])

            elif self.comboBoxFindField.currentText() == u'КН квартала':
                searchCondition = '\"kn\" LIKE ' +"\'"+ findText +"%\'"
                listIdBlock = attributesBySearchCondition('ln_kvartal', searchCondition, ['id'])
                if len(listIdBlock) > 0:
                    listIntIdBlock = [int(every['id']) for every in listIdBlock]
                    listIdParcel = attributesByKeys('ln_uchastok', 'id_kvartal', listIntIdBlock, ['id'])
                    if len(listIdParcel) > 0:
                        listIntIdParcel = [int(every['id']) for every in listIdParcel]
                        listGuidMP = attributesByKeys('pb_mp_section_data', 'id_parcel', listIntIdParcel, ['guid_mp'])

            else:
                self.showMessage(u'Не указано поле для поиска')

            if len(listGuidMP) > 0:
                self.comboBoxMp.clear()
                self.guidMP = []
                for everyGuid in listGuidMP:
                    try:    self.guidMP.append(everyGuid['guid'])
                    except: self.guidMP.append(everyGuid['guid_mp'])

                self.showMessage(u'Найдено межевых планов в количестве ' + str(len(self.guidMP)))
                self.fillComboBoxMp()

            else:
                self.showMessage(u'Межевые планы не найдены')

        else:
            self.showMessage(u'Не указан параметр для поиска')
            reply = QMessageBox.question(self, u'Потверждение', u'Очистить список выбранных и найденных межевых планов?', okay|cancel, defaultButton=cancel)
            if reply == okay:
                self.guidMP = []
                self.guidCurrentMP = None
                self.fillComboBoxMp()        
#                self.treeItemChanged()

    '''
    Включение режима редактирования атрибутов
    '''
    def editData(self):
        currentTabIndex = self.tabWidget.currentIndex()
        self.pushButtonEditData.setEnabled(False)   
        self.pushButtonSaveData.setEnabled(True)   

        # Приложения
        if self.tabWidget.currentWidget() == self.tabAppendix:
            currentTreeItem = self.treeWidgetAppendix.currentItem()
            if currentTreeItem == None:
                self.pushButtonEditData.setEnabled(False)
                return

            if self.dlgDocument == None:
                self.dlgDocument = Document(self.iface)
#                self.dlgDocument.fillTree()
            
            self.dlgDocument.guidDocument = currentTreeItem.data(2, 0)
            self.dlgDocument.fillTree()
            self.dlgDocument.exec_()
            self.fillTabData(currentTabIndex)

        # Исходные данные
        elif self.tabWidget.currentWidget() == self.tabInputData:
            self.pushButtonEditData.setEnabled(True)   
            self.pushButtonSaveData.setEnabled(False)   
            # Перечень документов, на основании которых подготовлен межевой план
            if self.toolBox.currentWidget() == self.pageDocument:
                currentTreeItem = self.treeWidgetDocument.currentItem()
                if currentTreeItem == None:
                    self.pushButtonEditData.setEnabled(False)
                    return

                if self.dlgDocument == None:
                    self.dlgDocument = Document(self.iface)
            
                self.dlgDocument.guidDocument = currentTreeItem.data(2, 0)
                self.dlgDocument.fillTree()
                self.dlgDocument.exec_()
                self.toolBoxCurrentChanged(0)

            # Сведения о геодезической основе, использованной при подготовке межевого плана
            if self.toolBox.currentWidget() == self.pageGeodesicBase:
                currentTreeItem = self.treeWidgetGeodesicBase.currentItem()
                if currentTreeItem == None:
                    self.pushButtonEditData.setEnabled(False)
                    return

                if self.dlgGeodesicBase == None:
                    self.dlgGeodesicBase = GeodesicBase(self.iface)
            
                self.dlgGeodesicBase.guidGeodesicBase = currentTreeItem.data(2, 0)
                self.dlgGeodesicBase.fillTree()
                self.dlgGeodesicBase.exec_()
                self.toolBoxCurrentChanged(1)
        
            # Сведения о средствах измерения
            if self.toolBox.currentWidget() == self.pageMeansSurvey:
                currentTreeItem = self.treeWidgetMeansSurvey.currentItem()
                if currentTreeItem == None:
                    self.pushButtonEditData.setEnabled(False)
                    return

                if self.dlgMeansSurvey == None:
                    self.dlgMeansSurvey = MeansSurvey(self.iface)
            
                self.dlgMeansSurvey.guidMeansSurvey = currentTreeItem.data(2, 0)
                self.dlgMeansSurvey.fillTree()
                self.dlgMeansSurvey.exec_()
                self.toolBoxCurrentChanged(2)

            # Сведения о наличии зданий, сооружений
            if self.toolBox.currentWidget() == self.pageRealty:
                currentTreeItem = self.treeWidgetRealty.currentItem()
                if currentTreeItem == None:
                    self.pushButtonEditData.setEnabled(False)
                    return

                if self.dlgRealty == None:
                    self.dlgRealty = Realty(self.iface)
            
                self.dlgRealty.guidRealty = currentTreeItem.data(2, 0)
                self.dlgRealty.fillTree()
                self.dlgRealty.exec_()
                self.toolBoxCurrentChanged(3)
        
            # Сведения о частях исходных, измененных или уточняемых земельных 
            if self.toolBox.currentWidget() == self.pageSubParcel:
                currentTreeItem = self.treeWidgetSubParcel.currentItem()
                if currentTreeItem == None:
                    self.pushButtonEditData.setEnabled(False)
                    return

                if self.dlgSubParcel == None:
                    self.dlgSubParcel = SubParcel(self.iface)
            
                self.dlgSubParcel.guidSubParcel = currentTreeItem.data(2, 0)
                self.dlgSubParcel.fillTree()
                self.dlgSubParcel.exec_()
                self.toolBoxCurrentChanged(4)
            
    '''
    Добавление данных в раздел межевого плана                                  #
    '''
    def addSection(self):
        # Пакет информации
        if self.tabWidget.currentWidget() == self.tabPackage:
            listParcelId = attributesFromSelection('ln_uchastok', ['id', 
                                                                   'id_vid_uchastka', 
                                                                   'tip_obekta_kadastrovyh_rabot'])
            if len(listParcelId) > 0:
                self.guidCurrentMP = self.comboBoxMp.itemData(self.comboBoxMp.currentIndex())
                currentTreeItemData = self.treeWidget.currentItem().data(2, 0)

                if self.treeWidget.currentItem().childCount() > 0:
                    self.showMessage(u'Ошибка! Добавление невозможно для данного элемента раздела МП')
                    return
                    
                idCurrentSection = int(self.dictXmlIdSection[currentTreeItemData])

                # Сведения об образуемых земельных участках и их частях        
                # 1 FormParcels-NewParcel                                      #
                if currentTreeItemData == 'NewParcel':
                    if not self.attributesValuesMP['codetype'] == '014':
                        self.showMessage(u'Ошибка! Заполняемый раздел не соответствует типу заявления.')
                        return
                        
                    listValues = []
                    for everyParcelId in listParcelId:
                        idParcel = 0
                        idTypeParcel = everyParcelId['id_vid_uchastka']
                        if idTypeParcel == gv['casualParcelCode']:
                            idParcel = int(everyParcelId['id'])

                        elif idTypeParcel == gv['oneContourCode']:
                            idParcel = idParentByIdChild(int(everyParcelId['id']))

                        if idParcel > 0:
                            listValues.append([self.guidCurrentMP, idCurrentSection, idParcel])
            
                    if insertFeatures('pb_mp_section_data', ['guid_mp', 'id_section_mp', 'id_parcel'], listValues):
                        self.showMessage(u'Выполнено добавление атрибутов образуемого ЗУ')
                        self.fillTabData(2)

                    else:
                        self.showMessage(u'Ошибка добавления атрибутов образуемого ЗУ')
            
                # Сведения об измененных земельных участках и их частях 
                # 2 FormParcels-ChangeParcel                                   #
                elif currentTreeItemData == 'ChangeParcel':
                    self.showMessage(u'Невозможно выполнить операцию. Функция в разработке.')

                # Уточнение границ смежных участков 
                # 3 FormParcels-SpecifyRelatedParcel                           #
                elif currentTreeItemData == 'SpecifyRelatedParcel-Form':
                    if not self.attributesValuesMP['codetype'] == '014':
                        self.showMessage(u'Ошибка! Заполняемый раздел не соответствует типу заявления.')
                        return

                    listValues = []
                    for everyParcelId in listParcelId:
                        idTypeParcel = everyParcelId['id_vid_uchastka']
                        if idTypeParcel in (gv['casualParcelCode'], 
                                            gv['oneContourCode']):
                            idParcel = int(everyParcelId['id'])
                        else:
                            self.showMessage(u'Ошибка! \
                            Уточняемый смежный ЗУ не является землепользованием \
                            или контуром МЗУ.')
                            return

                        if idParcel > 0:
                            listValues.append([self.guidCurrentMP, idCurrentSection, idParcel])
            
                    if insertFeatures('pb_mp_section_data', ['guid_mp', 'id_section_mp', 'id_parcel'], listValues):
                        self.showMessage(u'Выполнено добавление атрибутов смежного ЗУ')
                        self.fillTabData(2)

                    else:
                        self.showMessage(u'Ошибка добавления атрибутов смежного ЗУ')

                # Сведения об уточняемом участке, не являющемся единым землепользованием, 
                # 4 и его частях SpecifyParcel-ExistParcel                     #
                elif currentTreeItemData == 'ExistParcel':
                    if not self.attributesValuesMP['codetype'] == '015':
                        self.showMessage(u'Ошибка! Заполняемый раздел не соответствует типу заявления.')
                        return

                    listValues = []
                    for everyParcelId in listParcelId:
                        idTypeParcel = everyParcelId['id_vid_uchastka']
                        if idTypeParcel == gv['casualParcelCode']:
                            idParcel = int(everyParcelId['id'])

                        elif idTypeParcel == gv['oneContourCode']:
                            idParcel = idParentByIdChild(int(everyParcelId['id']))

                        if idParcel > 0:
                            listValues.append([self.guidCurrentMP, idCurrentSection, idParcel])
            
                    if insertFeatures('pb_mp_section_data', ['guid_mp', 'id_section_mp', 'id_parcel'], listValues):
                        self.showMessage(u'Выполнено добавление атрибутов уточняемого ЗУ')
                        self.fillTabData(2)

                    else:
                        self.showMessage(u'Ошибка добавления атрибутов уточняемого ЗУ')

                # Сведения об уточняемом едином землепользовании и его частях
                # 5 SpecifyParcel-ExistEZ                                      #
                elif currentTreeItemData == 'ExistEZ':
                    if not self.attributesValuesMP['codetype'] == '015':
                        self.showMessage(u'Ошибка! Заполняемый раздел не соответствует типу заявления.')
                        return

                    listValues = []
                    for everyParcelId in listParcelId:
                        idTypeParcel = everyParcelId['id_vid_uchastka']
                        if idTypeParcel in (gv['isolatedParcelCode'], gv['nominalParcelCode']):
                            idParcel = idParentByIdChild(int(everyParcelId['id']))

                        else:
                            idParcel = 0

                        if idParcel > 0:
                            listValues.append([self.guidCurrentMP, idCurrentSection, idParcel])
            
                    if insertFeatures('pb_mp_section_data', ['guid_mp', 'id_section_mp', 'id_parcel'], listValues):
                        self.showMessage(u'Выполнено добавление атрибутов уточняемого ЗУ')
                        self.fillTabData(2)

                    else:
                        self.showMessage(u'Ошибка добавления атрибутов единого землепользования')
            
                # Уточнение границ смежных участков
                # 6 SpecifyParcel-SpecifyRelatedParcel                         #
                elif currentTreeItemData == 'SpecifyRelatedParcel-Specify':
                    if not self.attributesValuesMP['codetype'] == '015':
                        self.showMessage(u'Ошибка! Заполняемый раздел не соответствует типу заявления.')
                        return

                    listValues = []
                    for everyParcelId in listParcelId:
                        idTypeParcel = everyParcelId['id_vid_uchastka']
                        if idTypeParcel in (gv['casualParcelCode'], 
                                            gv['oneContourCode']):
                            idParcel = int(everyParcelId['id'])
                        else:
                            self.showMessage(u'Ошибка! \
                            Уточняемый смежный ЗУ не является землепользованием \
                            или контуром МЗУ.')
                            return

                        if idParcel > 0:
                            listValues.append([self.guidCurrentMP, idCurrentSection, idParcel])
            
                    if insertFeatures('pb_mp_section_data', ['guid_mp', 'id_section_mp', 'id_parcel'], listValues):
                        self.showMessage(u'Выполнено добавление атрибутов смежного ЗУ')
                        self.fillTabData(2)

                    else:
                        self.showMessage(u'Ошибка добавления атрибутов смежного ЗУ')

                # Сведения об образуемых частях
                # 7 NewSubParcel                                               #
                elif currentTreeItemData == 'NewSubParcel':
                    if not self.attributesValuesMP['codetype'] == '015':
                        self.showMessage(u'Ошибка! Заполняемый раздел не соответствует типу заявления.')
                        return

                    listValues = []
                    for everyParcelId in listParcelId:
                        idTypeParcel = everyParcelId['id_vid_uchastka']
                        if idTypeParcel == gv['onePartCode']:
                            idParcel = int(everyParcelId['id'])
                            if idParcel > 0:
                                listValues.append([self.guidCurrentMP, idCurrentSection, idParcel])
            
                        else:
                            self.showMessage(u'Ошибка! Для добавления в раздел МП, необходимо выбрать ЧЗУ')

                    if len(listValues) > 0:
                        if insertFeatures('pb_mp_section_data', ['guid_mp', 'id_section_mp', 'id_parcel'], listValues):
                            self.showMessage(u'Выполнено добавление атрибутов ЧЗУ')
                            self.fillTabData(2)

                        else:
                            self.showMessage(u'Ошибка добавления атрибутов ЧЗУ')
                    else:
                        self.showMessage(u'Ошибка! Нет выбранных ЧЗУ для добавления в раздел МП')
            
                # Сведения об уточняемом участке, не являющемся единым землепользованием,
                # 8 и его частях SpecifyParcelsApproximal-ExistParcel          #
                elif currentTreeItemData == 'ExistParcel-Approximal':
                    if not self.attributesValuesMP['codetype'] == '015':
                        self.showMessage(u'Ошибка! Заполняемый раздел не соответствует типу заявления.')
                        return

                    listValues = []
                    for everyParcelId in listParcelId:
                        idTypeParcel = everyParcelId['id_vid_uchastka']
                        if idTypeParcel == gv['casualParcelCode']:
                            idParcel = int(everyParcelId['id'])

                        elif idTypeParcel == gv['oneContourCode']:
                            idParcel = idParentByIdChild(int(everyParcelId['id']))

                        if idParcel > 0:
                            listValues.append([self.guidCurrentMP, idCurrentSection, idParcel])
            
                    if insertFeatures('pb_mp_section_data', ['guid_mp', 'id_section_mp', 'id_parcel'], listValues):
                        self.showMessage(u'Выполнено добавление атрибутов уточняемого смежного ЗУ')
                        self.fillTabData(2)

                    else:
                        self.showMessage(u'Ошибка добавления атрибутов уточняемого смежного ЗУ')
            
                # Сведения об уточняемом едином землепользовании и его частях
                # 9 и его частях SpecifyParcelsApproximal-ExistEZ              #
                elif currentTreeItemData == 'ExistEZ-Approximal':
                    self.showMessage(u'Невозможно выполнить операцию. Функция в разработке.')

            else:
                self.showMessage(u'Ошибка! Необходимо выбрать не менее одного полигона слоя <Участок>')

        # Схема расположения ЗУ
        elif self.tabWidget.currentWidget() in (self.tabSurvey,
                                                self.tabSchemeGeodesicPlotting,
                                                self.tabDispositionParcels,
                                                self.tabDiagramParcels,
                                                self.tabAgreementDocument,
                                                self.tabNodalPointSchemes):
            self.addAppliedFile()
        
        # Исходные данные
        elif self.tabWidget.currentWidget() == self.tabInputData:
            # Перечень документов, на основании которых подготовлен межевой план
            if self.toolBox.currentWidget() == self.pageDocument:
                if self.dlgDocument == None:
                    self.dlgDocument = Document(self.iface)
                    self.dlgDocument.fillTree()

                self.dlgDocument.selectedGuid = None

                self.dlgDocument.exec_()
                if self.dlgDocument.selectedGuid != None:
                    self.guidCurrentMP = self.comboBoxMp.itemData(self.comboBoxMp.currentIndex())
                    guidDocument = self.dlgDocument.guidDocument
                    idCurrentSection = int(self.dictXmlIdSection['Documents'])
                
                    listValues = []
                    listValues.append([self.guidCurrentMP, idCurrentSection, guidDocument])
            
                    if insertFeatures('pb_mp_section_data', ['guid_mp', 'id_section_mp', 'guid_document'], listValues):
                        self.showMessage(u'Выполнено добавление документа')
                        self.toolBoxCurrentChanged(0)

                    else:
                        self.showMessage(u'Ошибка добавления документа')

            # Сведения о геодезической основе, использованной при подготовке межевого плана
            if self.toolBox.currentWidget() == self.pageGeodesicBase:
                if self.dlgGeodesicBase == None:
                    self.dlgGeodesicBase = GeodesicBase(self.iface)

                self.dlgGeodesicBase.selectedGuid = None

                self.dlgGeodesicBase.fillTree()
                self.dlgGeodesicBase.exec_()
                if self.dlgGeodesicBase.selectedGuid != None:
                    self.guidCurrentMP = self.comboBoxMp.itemData(self.comboBoxMp.currentIndex())
                    guidGeodesicBase = self.dlgGeodesicBase.guidGeodesicBase
                    idCurrentSection = int(self.dictXmlIdSection['Geodesic_Bases'])
                
                    listValues = []
                    listValues.append([self.guidCurrentMP, idCurrentSection, guidGeodesicBase])
            
                    if insertFeatures('pb_mp_section_data', ['guid_mp', 'id_section_mp', 'guid_geodesic_base'], listValues):
                        self.showMessage(u'Выполнено добавление пункта геосети')
                        self.toolBoxCurrentChanged(1)

                    else:
                        self.showMessage(u'Ошибка добавления пункта геосети')
        
            # Сведения о средствах измерения
            if self.toolBox.currentWidget() == self.pageMeansSurvey:
                if self.dlgMeansSurvey == None:
                    self.dlgMeansSurvey = MeansSurvey(self.iface)
                    self.dlgMeansSurvey.fillTree()

                self.dlgMeansSurvey.selectedGuid = None

                self.dlgMeansSurvey.exec_()
                if self.dlgMeansSurvey.selectedGuid != None:
                    self.guidCurrentMP = self.comboBoxMp.itemData(self.comboBoxMp.currentIndex())
                    guidMeansSurvey = self.dlgMeansSurvey.guidMeansSurvey
                    idCurrentSection = int(self.dictXmlIdSection['Means_Survey'])
                
                    listValues = []
                    listValues.append([self.guidCurrentMP, idCurrentSection, guidMeansSurvey])
            
                    if insertFeatures('pb_mp_section_data', ['guid_mp', 'id_section_mp', 'guid_means_survey'], listValues):
                        self.showMessage(u'Выполнено добавление прибора')
                        self.toolBoxCurrentChanged(2)

                    else:
                        self.showMessage(u'Ошибка добавления прибора')

            # Сведения о наличии зданий, сооружений
            if self.toolBox.currentWidget() == self.pageRealty:
                if self.dlgRealty == None:
                    self.dlgRealty = Realty(self.iface)
                    self.dlgRealty.fillTree()

                self.dlgRealty.selectedGuid = None

                self.dlgRealty.exec_()
                if self.dlgRealty.selectedGuid != None:
                    self.guidCurrentMP = self.comboBoxMp.itemData(self.comboBoxMp.currentIndex())
                    guidRealty = self.dlgRealty.guidRealty
                    idCurrentSection = int(self.dictXmlIdSection['Realty'])
                
                    listValues = []
                    listValues.append([self.guidCurrentMP, idCurrentSection, guidRealty])
            
                    if insertFeatures('pb_mp_section_data', ['guid_mp', 'id_section_mp', 'guid_oks'], listValues):
                        self.showMessage(u'Выполнено добавление ОКС')
                        self.toolBoxCurrentChanged(3)

                    else:
                        self.showMessage(u'Ошибка добавления ОКС')
        
            # Сведения о частях исходных, измененных или уточняемых земельных 
            if self.toolBox.currentWidget() == self.pageSubParcel:
                if self.dlgSubParcel == None:
                    self.dlgSubParcel = SubParcel(self.iface)
                    self.dlgSubParcel.fillTree()

                self.dlgSubParcel.selectedGuid = None

                self.dlgSubParcel.exec_()
                if self.dlgSubParcel.selectedGuid != None:
                    self.guidCurrentMP = self.comboBoxMp.itemData(self.comboBoxMp.currentIndex())
                    guidSubParcel = self.dlgSubParcel.guidSubParcel
                    idCurrentSection = int(self.dictXmlIdSection['SubParcels'])
                
                    listValues = []
                    listValues.append([self.guidCurrentMP, idCurrentSection, guidSubParcel])
            
                    if insertFeatures('pb_mp_section_data', ['guid_mp', 'id_section_mp', 'guid_subparcel'], listValues):
                        self.showMessage(u'Выполнено добавление ЧЗУ')
                        self.toolBoxCurrentChanged(4)

                    else:
                        self.showMessage(u'Ошибка добавления ЧЗУ')
        
        # Приложения
        elif self.tabWidget.currentWidget() == self.tabAppendix:
            if self.dlgDocument == None:
                self.dlgDocument = Document(self.iface)
                self.dlgDocument.fillTree()

            self.dlgDocument.selectedGuid = None

            self.dlgDocument.exec_()
            if self.dlgDocument.selectedGuid != None:

                if self.treeWidget.currentItem().childCount() > 0:
                    self.showMessage(u'Ошибка! Добавление невозможно для данного элемента раздела МП')
                    return
                    
                self.guidCurrentMP = self.comboBoxMp.itemData(self.comboBoxMp.currentIndex())
                guidDocument = self.dlgDocument.guidDocument
                currentTreeItemData = self.treeWidget.currentItem().data(2, 0)
                idCurrentSection = int(self.dictXmlIdSection[currentTreeItemData])
                
                listValues = []
                listValues.append([self.guidCurrentMP, idCurrentSection, guidDocument])
            
                if insertFeatures('pb_mp_section_data', ['guid_mp', 'id_section_mp', 'guid_document'], listValues):
                    self.showMessage(u'Выполнено добавление документа')
                    currentTreeItemIndex = self.treeWidget.indexOfTopLevelItem(self.treeWidget.currentItem())
                    self.fillTabData(currentTreeItemIndex)

                else:
                    self.showMessage(u'Ошибка добавления документа')

    '''
    Добавление приложенного файла в раздел МП
    '''
    def addAppliedFile(self):
        if self.dlgAppliedFile == None:
            self.dlgAppliedFile = AppliedFile(self.iface)

        self.dlgAppliedFile.typeAppliedFile = None
        self.dlgAppliedFile.nameAppliedFile = None
        self.dlgAppliedFile.pathAppliedFile = None
        self.dlgAppliedFile.fillLinesEdit()

        self.dlgAppliedFile.exec_()

        if self.dlgAppliedFile.pathAppliedFile != None:
            self.guidCurrentMP = self.comboBoxMp.itemData(self.comboBoxMp.currentIndex())
            currentTreeItemData = self.treeWidget.currentItem().data(2, 0)

            if self.treeWidget.currentItem().childCount() > 0:
                self.showMessage(u'Ошибка! Добавление невозможно для данного элемента раздела МП')
                return
                    
            idCurrentSection = int(self.dictXmlIdSection[currentTreeItemData])
            guidAppliedFile  = str(uuid.uuid4())
                
            listValues = []
            listValues.append(guidAppliedFile)
            listValues.append(self.dlgAppliedFile.typeAppliedFile)
            listValues.append(self.dlgAppliedFile.nameAppliedFile)
            listValues.append(self.dlgAppliedFile.pathAppliedFile)
        
            if insertFeatures('pb_applied_file', attributesNamesAppliedFile, [listValues]):
                listValues = []
                listValues.append([self.guidCurrentMP, idCurrentSection, guidAppliedFile])
            
                if insertFeatures('pb_mp_section_data', ['guid_mp', 'id_section_mp', 'guid_applied_file'], listValues):
                    self.showMessage(u'Выполнено добавление приложенного файла')
                    currentTreeItemIndex = self.treeWidget.indexOfTopLevelItem(self.treeWidget.currentItem())
                    self.fillTabData(currentTreeItemIndex)

                else:
                    self.showMessage(u'Ошибка добавления приложенного файла')

            else:
                self.showMessage(u'Ошибка добавления приложенного файла')
    
    '''
    Удаление данных из раздела межевого плана
    '''
    def delSection(self):
        reply = QMessageBox.question(self, u'Потверждение', u'Удалить выбранный элемент из списка?', okay|cancel, defaultButton=cancel)
        if reply == cancel:
            return

        # Пакет информации
        if self.tabWidget.currentWidget() == self.tabPackage:
            currentItem = self.treeWidgetParcel.currentItem()
            if currentItem != None:
                idParcel = int(currentItem.data(2, 0))
                if idParcel > 0:
                    self.guidCurrentMP = self.comboBoxMp.itemData(self.comboBoxMp.currentIndex())
                    currentTreeItemData = self.treeWidget.currentItem().data(2, 0)
                    idCurrentSection = int(self.dictXmlIdSection[currentTreeItemData])

                    searchCondition = '\"guid_mp\" = \'' + str(self.guidCurrentMP) + '\' AND \"id_section_mp\" = ' + str(idCurrentSection) + ' AND \"id_parcel\" = ' + str(idParcel)
                    listAttributesSection = attributesBySearchCondition('pb_mp_section_data', searchCondition, ['guid'])
                    if len(listAttributesSection) == 1:
                        guidForDelete = listAttributesSection[0]['guid']
                        if deleteById('pb_mp_section_data', guidForDelete):
                            self.fillTabData(self.tabWidget.currentIndex())
                            self.showMessage(u'Удалён ЗУ из списка')

                        else:
                            self.showMessage(u'Ошибка удаления ЗУ из списка')
                            
        # Исходные данные        
        elif self.tabWidget.currentWidget() == self.tabInputData:
            # Перечень документов, на основании которых подготовлен межевой план
            if self.toolBox.currentWidget() == self.pageDocument:
                currentItem = self.treeWidgetDocument.currentItem()
                if currentItem != None:
                    guidDocument = currentItem.data(2, 0)
                    if guidDocument > ' ':
                        self.guidCurrentMP = self.comboBoxMp.itemData(self.comboBoxMp.currentIndex())
                        idCurrentSection = int(self.dictXmlIdSection['Documents'])

                        searchCondition = '\"guid_mp\" = \'' + str(self.guidCurrentMP) + '\' AND \"id_section_mp\" = ' + str(idCurrentSection) + ' AND \"guid_document\" = \'' + str(guidDocument) +'\''
                        listAttributesSection = attributesBySearchCondition('pb_mp_section_data', searchCondition, ['guid'])
                        if len(listAttributesSection) == 1:
                            guidForDelete = listAttributesSection[0]['guid']
                            if deleteById('pb_mp_section_data', guidForDelete):
                                self.toolBoxCurrentChanged(0)
                                self.showMessage(u'Удалён документ из списка')

                            else:
                                self.showMessage(u'Ошибка удаления документа из списка')

            # Сведения о геодезической основе, использованной при подготовке межевого плана
            if self.toolBox.currentWidget() == self.pageGeodesicBase:
                currentItem = self.treeWidgetGeodesicBase.currentItem()
                if currentItem != None:
                    guidGeodesicBase = currentItem.data(2, 0)
                    if guidGeodesicBase > ' ':
                        self.guidCurrentMP = self.comboBoxMp.itemData(self.comboBoxMp.currentIndex())
                        idCurrentSection = int(self.dictXmlIdSection['Geodesic_Bases'])

                        searchCondition = '\"guid_mp\" = \'' + str(self.guidCurrentMP) + '\' AND \"id_section_mp\" = ' + str(idCurrentSection) + ' AND \"guid_geodesic_base\" = \'' + str(guidGeodesicBase) +'\''
                        listAttributesSection = attributesBySearchCondition('pb_mp_section_data', searchCondition, ['guid'])
                        if len(listAttributesSection) == 1:
                            guidForDelete = listAttributesSection[0]['guid']
                            if deleteById('pb_mp_section_data', guidForDelete):
                                self.toolBoxCurrentChanged(1)
                                self.showMessage(u'Удалён пункт геодезической сети из списка')

                            else:
                                self.showMessage(u'Ошибка удаления пункт геодезической сети из списка')
        
            # Сведения о средствах измерения
            if self.toolBox.currentWidget() == self.pageMeansSurvey:
                currentItem = self.treeWidgetMeansSurvey.currentItem()
                if currentItem != None:
                    guidMeansSurvey = currentItem.data(2, 0)
                    if guidMeansSurvey > ' ':
                        self.guidCurrentMP = self.comboBoxMp.itemData(self.comboBoxMp.currentIndex())
                        idCurrentSection = int(self.dictXmlIdSection['Means_Survey'])

                        searchCondition = '\"guid_mp\" = \'' + str(self.guidCurrentMP) + '\' AND \"id_section_mp\" = ' + str(idCurrentSection) + ' AND \"guid_means_survey\" = \'' + str(guidMeansSurvey) +'\''
                        listAttributesSection = attributesBySearchCondition('pb_mp_section_data', searchCondition, ['guid'])
                        if len(listAttributesSection) == 1:
                            guidForDelete = listAttributesSection[0]['guid']
                            if deleteById('pb_mp_section_data', guidForDelete):
                                self.toolBoxCurrentChanged(2)
                                self.showMessage(u'Удалён прибор из списка')

                            else:
                                self.showMessage(u'Ошибка удаления прибора из списка')
        
            # Сведения о наличии зданий, сооружений
            if self.toolBox.currentWidget() == self.pageRealty:
                currentItem = self.treeWidgetRealty.currentItem()
                if currentItem != None:
                    guidRealty = currentItem.data(2, 0)
                    if guidRealty > ' ':
                        self.guidCurrentMP = self.comboBoxMp.itemData(self.comboBoxMp.currentIndex())
                        idCurrentSection = int(self.dictXmlIdSection['Realty'])

                        searchCondition = '\"guid_mp\" = \'' + str(self.guidCurrentMP) + '\' AND \"id_section_mp\" = ' + str(idCurrentSection) + ' AND \"guid_oks\" = \'' + str(guidRealty) +'\''
                        listAttributesSection = attributesBySearchCondition('pb_mp_section_data', searchCondition, ['guid'])
                        if len(listAttributesSection) == 1:
                            guidForDelete = listAttributesSection[0]['guid']
                            if deleteById('pb_mp_section_data', guidForDelete):
                                self.toolBoxCurrentChanged(3)
                                self.showMessage(u'Удалён ОКС из списка')

                            else:
                                self.showMessage(u'Ошибка удаления ОКС из списка')
        
            # Сведения о частях исходных, измененных или уточняемых земельных 
            if self.toolBox.currentWidget() == self.pageSubParcel:
                currentItem = self.treeWidgetSubParcel.currentItem()
                if currentItem != None:
                    guidSubParcel = currentItem.data(2, 0)
                    if guidSubParcel > ' ':
                        self.guidCurrentMP = self.comboBoxMp.itemData(self.comboBoxMp.currentIndex())
                        idCurrentSection = int(self.dictXmlIdSection['SubParcels'])

                        searchCondition = '\"guid_mp\" = \'' + str(self.guidCurrentMP) + '\' AND \"id_section_mp\" = ' + str(idCurrentSection) + ' AND \"guid_subparcel\" = \'' + str(guidSubParcel) +'\''
                        listAttributesSection = attributesBySearchCondition('pb_mp_section_data', searchCondition, ['guid'])
                        if len(listAttributesSection) == 1:
                            guidForDelete = listAttributesSection[0]['guid']
                            if deleteById('pb_mp_section_data', guidForDelete):
                                self.toolBoxCurrentChanged(4)
                                self.showMessage(u'Удалён ЧЗУ из списка')

                            else:
                                self.showMessage(u'Ошибка удаления ЧЗУ из списка')
        
        # Сведения о выполненных измерениях и расчетах
        elif self.tabWidget.currentWidget() == self.tabSurvey:
            currentItem = self.treeWidgetSurvey.currentItem()
            self.delAppliedFile(currentItem)

        # Схема геодезических построений
        elif self.tabWidget.currentWidget() == self.tabSchemeGeodesicPlotting:
            currentItem = self.treeWidgetSchemeGeodesicPlotting.currentItem()
            self.delAppliedFile(currentItem)

        # Схема расположения ЗУ
        elif self.tabWidget.currentWidget() == self.tabDispositionParcels:
            currentItem = self.treeWidgetSchemeDispositionParcels.currentItem()
            self.delAppliedFile(currentItem)

        # Чертеж земельных участков и их частей
        elif self.tabWidget.currentWidget() == self.tabDiagramParcels:
            currentItem = self.treeWidgetDiagramParcels.currentItem()
            self.delAppliedFile(currentItem)

        # Акт согласования местоположения границы земельного участка
        elif self.tabWidget.currentWidget() == self.tabAgreementDocument:
            currentItem = self.treeWidgetAgreementDocument.currentItem()
            self.delAppliedFile(currentItem)

        # Абрисы узловых точек границ земельных участков
        elif self.tabWidget.currentWidget() == self.tabNodalPointSchemes:
            currentItem = self.treeWidgetNodalPointSchemes.currentItem()
            self.delAppliedFile(currentItem)

        # Приложения
        elif self.tabWidget.currentWidget() == self.tabAppendix:
            currentItem = self.treeWidgetAppendix.currentItem()
            if currentItem != None:
                guidDocument = currentItem.data(2, 0)
                if guidDocument > ' ':
                    self.guidCurrentMP = self.comboBoxMp.itemData(self.comboBoxMp.currentIndex())
                    currentTreeItemData = self.treeWidget.currentItem().data(2, 0)
                    idCurrentSection = int(self.dictXmlIdSection[currentTreeItemData])

                    searchCondition = '\"guid_mp\" = \'' + str(self.guidCurrentMP) + '\' AND \"id_section_mp\" = ' + str(idCurrentSection) + ' AND \"guid_document\" = \'' + str(guidDocument) +'\''
                    listAttributesSection = attributesBySearchCondition('pb_mp_section_data', searchCondition, ['guid'])
                    if len(listAttributesSection) == 1:
                        guidForDelete = listAttributesSection[0]['guid']
                        if deleteById('pb_mp_section_data', guidForDelete):
                            self.fillTabData(self.tabWidget.currentIndex())
                            self.showMessage(u'Удалён документ из списка')

                        else:
                            self.showMessage(u'Ошибка удаления документа из списка')

    '''
    Удаление из списка приложенного файла
    '''
    def delAppliedFile(self, currentItem):
        if currentItem != None:
            guidFile = currentItem.data(2, 0)
            if guidFile > ' ':
                self.guidCurrentMP = self.comboBoxMp.itemData(self.comboBoxMp.currentIndex())
                currentTreeItemData = self.treeWidget.currentItem().data(2, 0)
                idCurrentSection = int(self.dictXmlIdSection[currentTreeItemData])

                searchCondition = '\"guid_mp\" = \'' + str(self.guidCurrentMP) + '\' AND \"id_section_mp\" = ' + str(idCurrentSection) + ' AND \"guid_applied_file\" = \'' + str(guidFile) +'\''
                listAttributesSection = attributesBySearchCondition('pb_mp_section_data', searchCondition, ['guid'])
                if len(listAttributesSection) == 1:
                    guidForDelete = listAttributesSection[0]['guid']
                    if deleteById('pb_mp_section_data', guidForDelete):
                        deleteById('pb_applied_file', guidFile)
                        self.fillTabData(self.tabWidget.currentIndex())
                        self.showMessage(u'Удалён файл из списка')

                    else:
                        self.showMessage(u'Ошибка удаления файла из списка')
    
    '''
    Сохранение отредактированных атрибутов в базу данных
    '''
    def saveData(self):
        self.guidCurrentMP = self.comboBoxMp.itemData(self.comboBoxMp.currentIndex())
        if self.guidCurrentMP == None:
            self.showMessage(u'Ошибка! Не определён идентификатор для обновления МП ' + self.guidCurrentMP)
            return

        currentTabIndex = self.tabWidget.currentIndex()
        # Электронный документ, Титульный лист, Заключение кадастрового инженера
        if currentTabIndex in (0, 1, 6):
            listValues = []
            listValues.append(self.guidCurrentMP)
            listValues.append(self.comboBoxEDocCodeType.itemData(self.comboBoxEDocCodeType.currentIndex()))
            listValues.append('0' + str(self.spinBoxShemaVersion.value()))
            listValues.append(self.dateEditDateWork.date())
            listValues.append(self.textEditPurpose.toPlainText())
            listValues.append(self.textEditReason.toPlainText())
            listValues.append(self.comboBoxContractor.itemData(self.comboBoxContractor.currentIndex()))
            listValues.append(self.dateEditAcceptWork.date())
            listValues.append(self.textEditConclusion.toPlainText())
            listValues.append(self.comboBoxClient.itemData(self.comboBoxClient.currentIndex()))
                                                                                                                                        
            if updateFeature('pb_mp', self.guidCurrentMP, attributesNamesMP, listValues):
                self.showMessage(u'Изменения сохранены для МП ' + self.guidCurrentMP)
                self.updateTitleComboBoxMp()
                currentTabIndex = self.tabWidget.currentIndex()
                self.fillTabData(currentTabIndex)
            else:
                self.showMessage(u'Ошибка сохранения атрибутов для МП ' + self.guidCurrentMP)

        else:
            pass

        self.pushButtonEditData.setEnabled(True)   
        self.pushButtonSaveData.setEnabled(False)   

    '''
    Обновление атрибутов на значения из дазы данных. Сброс результатов редактирования
    '''
    def refreshData(self):
        currentTabIndex = self.tabWidget.currentIndex()
        self.fillTabData(currentTabIndex)
#        self.pushButtonEditData.setEnabled(True)   
        self.pushButtonSaveData.setEnabled(False)   

    '''
    Активизация диалога редактирования атрибутов кадастрового инженера
    '''
    def contractorDialog(self):
        if self.dlgContractor == None:
            self.dlgContractor = Contractor(self.iface)
            self.dlgContractor.fillTree()

        self.dlgContractor.selectedGuid = None
        self.dlgContractor.exec_()
        if self.dlgContractor.selectedGuid != None:
            fillComboBox(self.comboBoxContractor, 'pb_contractor', 'guid', ['surname', 'first', 'patronymic'], self.dlgContractor.guidContractor)

    '''
    Активизация диалога редактирования часто используемых текстовых формулировок
    '''
    def commonTextDialogForPurpose(self):
        if self.dlgCommonText == None:
            self.dlgCommonText = CommonText(self.iface)

        self.dlgCommonText.guidCommonText = None
        self.dlgCommonText.typeCommonText = 1
        self.dlgCommonText.textEdit.setText('')
        self.dlgCommonText.fillTree()

        self.dlgCommonText.exec_()
        if self.dlgCommonText.valueCommonText != None:
            self.textEditPurpose.setText(self.dlgCommonText.valueCommonText)

    def commonTextDialogForReason(self):
        if self.dlgCommonText == None:
            self.dlgCommonText = CommonText(self.iface)

        self.dlgCommonText.guidCommonText = None
        self.dlgCommonText.typeCommonText = 2
        self.dlgCommonText.textEdit.setText('')
        self.dlgCommonText.fillTree()

        self.dlgCommonText.exec_()
        if self.dlgCommonText.valueCommonText != None:
            self.textEditReason.setText(self.dlgCommonText.valueCommonText)

    def commonTextDialogForConclusion(self):
        if self.dlgCommonText == None:
            self.dlgCommonText = CommonText(self.iface)

        self.dlgCommonText.guidCommonText = None
        self.dlgCommonText.typeCommonText = 3
        self.dlgCommonText.textEdit.setText('')
        self.dlgCommonText.fillTree()

        self.dlgCommonText.exec_()
        if self.dlgCommonText.valueCommonText != None:
            self.textEditConclusion.setText(self.dlgCommonText.valueCommonText)

    '''
    Активизация диалога редактирования атрибутов клиента
    '''
    def clientDialog(self):
        if self.dlgClient == None:
            self.dlgClient = Client(self.iface)
            self.dlgClient.fillTree(0)

        self.dlgClient.guidClient = None
        self.dlgClient.guidPerson = None
        self.dlgClient.guidOrganization = None
        self.dlgClient.guidForeignOrganization = None
        self.dlgClient.guidGovernance = None
        self.dlgClient.selectedGuid = None
        
        self.dlgClient.exec_()
        if self.dlgClient.selectedGuid != None:
            self.comboBoxClient.clear()
            listTitle = []
            title = ''

            if self.dlgClient.guidPerson != None:
                listTitle = attributesByKeys('pb_fiz_liczo', 'guid', [self.dlgClient.guidPerson], ['familiya', 'imya', 'otchestvo'])
                title = listTitle[0]['familiya'] + ' ' + listTitle[0]['imya'] + ' ' + reNull(listTitle[0]['otchestvo'], '')

            elif self.dlgClient.guidOrganization != None:
                listTitle = attributesByKeys('pb_yur_liczo', 'guid', [self.dlgClient.guidOrganization], ['nazvanie'])
                title = listTitle[0]['nazvanie']

            elif self.dlgClient.guidForeignOrganization != None:
                listTitle = attributesByKeys('pb_foreign_organization', 'guid', [self.dlgClient.guidForeignOrganization], ['name', 'country'])
                title = listTitle[0]['name'] + ' ' + listTitle[0]['country']

            elif self.dlgClient.guidGovernance != None:
                listTitle = attributesByKeys('pb_governance', 'guid', [self.dlgClient.guidGovernance], ['name'])
                title = listTitle[0]['name']

            self.comboBoxClient.addItem(title, self.dlgClient.guidClient)
            self.comboBoxClient.setCurrentIndex(0)
            
    '''
    Выбор ЗУ на карте
    '''
    def showParcelOnMap(self):
        currentItem = self.treeWidgetParcel.currentItem()
        if currentItem != None:
            idParcel = int(currentItem.data(2, 0))
            if idParcel > 0:
                listIdParcel = listIdChildByIdParent(idParcel)

                if len(listIdParcel) > 0:
                    if selectVectorObjectsById('ln_uchastok', listIdParcel):
                        self.canvas.panToSelected()

                else:
                    if selectVectorObjectsById('ln_uchastok', [idParcel]):
                        self.canvas.panToSelected()
    
    '''
    Открытие приложенного файла
    '''
    def showAppliedFile(self):
        if self.tabWidget.currentWidget() == self.tabSurvey:
            currentItem = self.treeWidgetSurvey.currentItem()

        elif self.tabWidget.currentWidget() == self.tabSchemeGeodesicPlotting:
            currentItem = self.treeWidgetSchemeGeodesicPlotting.currentItem()

        elif self.tabWidget.currentWidget() == self.tabDispositionParcels:
            currentItem = self.treeWidgetSchemeDispositionParcels.currentItem()

        elif self.tabWidget.currentWidget() == self.tabDiagramParcels:
            currentItem = self.treeWidgetDiagramParcels.currentItem()

        elif self.tabWidget.currentWidget() == self.tabAgreementDocument:
            currentItem = self.treeWidgetAgreementDocument.currentItem()

        elif self.tabWidget.currentWidget() == self.tabNodalPointSchemes:
            currentItem = self.treeWidgetNodalPointSchemes.currentItem()

        elif self.tabWidget.currentWidget() == None:
            currentItem == None

        if currentItem != None:
            if not systemShowFile(currentItem):
                self.showMessage(u'Ошибка! Файл не найден')

    '''
    Изменение активного элемента toolBox в разделе исходных данных
    '''
    def toolBoxCurrentChanged(self, indexCurrentItem):
        # Перечень документов
        if indexCurrentItem == 0:
            self.fillElementInputData('Documents', 'guid_document', 'pb_document', ['guid', 'number_doc', 'name'], self.treeWidgetDocument)

        # Сведения о геодезической основе
        elif indexCurrentItem == 1:
            self.fillElementInputData('Geodesic_Bases', 'guid_geodesic_base', 'pb_geo_osnova', ['guid', 'nazvanie_punkta'], self.treeWidgetGeodesicBase)

        # Сведения о средствах измерения
        elif indexCurrentItem == 2:
            self.fillElementInputData('Means_Survey', 'guid_means_survey', 'pb_sredstva_izmereniya', ['guid', 'naimenovanie'], self.treeWidgetMeansSurvey)

        # Сведения о наличии зданий, сооружений
        elif indexCurrentItem == 3:
            self.fillElementInputData('Realty', 'guid_oks', 'pb_oks', ['guid', 'cadastral_number'], self.treeWidgetRealty)

        # Сведения о частях исходных, измененных или уточняемых земельных участков
        elif indexCurrentItem == 4:
            self.fillElementInputData('SubParcels', 'guid_subparcel', 'pb_subparcel', ['guid', 'cadastral_number'], self.treeWidgetSubParcel)

        else:
            pass

    '''
    Заполнение элемента treeWidget данными подраздела в разделе исходные данные 
    '''
    def fillElementInputData(self, nameSection, nameGuid, nameTable, listElementTitle, treeWidget):
        if self.guidCurrentMP > ' ':
            treeWidget.clear()
            self.pushButtonAddSectionMp.setEnabled(True)
            idCurrentSection = int(self.dictXmlIdSection[nameSection])

            searchCondition = '\"guid_mp\" = \'' + str(self.guidCurrentMP) + '\' AND \"' +nameGuid+ '\" IS NOT NULL' + ' AND \"id_section_mp\" = ' + str(idCurrentSection)
            attributesValuesMpSectionData = attributesBySearchCondition('pb_mp_section_data', searchCondition, attributesNamesMpSectionData)

            if len(attributesValuesMpSectionData) > 0:
                listIdElement = []
                for everyMpSectionData in attributesValuesMpSectionData:
                    guidElement = everyMpSectionData[nameGuid]
                        
                    if guidElement > ' ':
                        listIdElement.append(guidElement)
                
                if len(listIdElement) > 0:
                    attributesValuesElement = attributesByKeys(nameTable, 'guid', listIdElement, listElementTitle)
                    if len(attributesValuesElement) > 0:
                        for everyElement in attributesValuesElement:
                            listTitle = []
                            for every in listElementTitle:
                                if every != 'guid':
                                    listTitle.append(everyElement[every])

                            itemForInsert = QTreeWidgetItem(listTitle)
                            itemForInsert.setData(2, 0, everyElement['guid'])
                            treeWidget.addTopLevelItem(itemForInsert)

                        self.pushButtonEditData.setEnabled(True)
                        self.pushButtonDeleteSectionMp.setEnabled(True)
                        self.pushButtonRefreshData.setEnabled(True)
                    
        else:
            treeWidget.clear()    

            self.pushButtonAddSectionMp.setEnabled(False)
            self.pushButtonSaveData.setEnabled(False)
            self.pushButtonEditData.setEnabled(False)
            self.pushButtonDeleteSectionMp.setEnabled(False)
            self.pushButtonRefreshData.setEnabled(False)
            self.showMessage(u'Нет атрибутов для отображения')
    
    '''
    Отображение сообщения пользователю
    '''
    def showMessage(self, textMessage):
        if textMessage > ' ':
            textTime = datetime.now().strftime('%H:%M:%S')
            self.labelMessage.setText(textTime + ' ' + textMessage)

    '''
    Закрытие диалогового окна
    '''
    def closeDialog(self):
        self.close()

#        QMessageBox.information(self.iface.mainWindow(), 'test', str())
