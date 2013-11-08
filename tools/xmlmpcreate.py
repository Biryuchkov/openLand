# -*- coding: utf-8 -*-
'''
/***************************************************************************
 XmlMpCreate for openland (cadastral engineer tools)
 copyright            : (C) 2013 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from qgis.gui import *
from datetime import *
from xml.etree.ElementTree import *
from common import *
from xmlmpcreate_ui import Ui_XmlMpCreate
import os.path, sys, platform, shutil, zipfile, uuid 

class XmlMpCreate(QDialog, Ui_XmlMpCreate):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        QObject.connect(self.pushButtonExport, SIGNAL("clicked()"), self.startExport)
        QObject.connect(self.pushButtonClose, SIGNAL("clicked()"), self.closeDialog)

        self.guidMp = None                                  # GUID межевого плана
        self.guidNew = None                                 # Новый GUID для нового XML МП
        self.attributesMp = []                              # атрибуты межевого плана
        self.isError = False                                # признак ошибки, если True - файл XML не будет сформирован
        self.nameXmlFile = None                             # название XML файла
        self.nameZipFile = None                             # название ZIP файла
        self.pathXmlFile = None                             # путь к XML файлу
        self.tmpDirectoryXml = None                         # временный каталог для сбора всех файлов в составе МП
        self.settings = QSettings("openLand", "openLand")   # парамеры пользователя из реестра
        self.attributesMpSectionData = []                   # атрибуты разделов межевого плана
        self.attributesParcel = []                          # атрибуты земельных участков
        self.dictXmlIdSection = {}                          # Словарь соответствия [имя XML] => [ID] для разделов(подразделов) межевового плана

        self.rootXml = None                                 # корневой элемент XML
        self.eDocument = None                               # элемент XML для раздела межевого плана
        self.Title = None                                   # элемент XML для раздела межевого плана
        self.Package = None                                 # элемент XML для раздела межевого плана
        self.CoordSystems = None                            # элемент XML для раздела межевого плана
        self.InputData = None                               # элемент XML для раздела межевого плана
        self.Survey = None                                  # элемент XML для раздела межевого плана
        self.Conclusion = None                              # элемент XML для раздела межевого плана
        self.SchemeGeodesicPlotting = None                  # элемент XML для раздела межевого плана
        self.SchemeDispositionParcels = None                # элемент XML для раздела межевого плана
        self.DiagramParcelsSubParcels = None                # элемент XML для раздела межевого плана
        self.AgreementDocument = None                       # элемент XML для раздела межевого плана
        self.NodalPointSchemes = None                       # элемент XML для раздела межевого плана
        self.Appendix = None                                # элемент XML для раздела межевого плана

    def startExport(self):
        self.isError = False
        
        if self.guidMp == None:
            self.highLightLine(u'Ошибка! Не определён идентификатор межевого плана для создания XML')
            return
        
        self.guidNew = str(uuid.uuid4())                                                                         

        self.progressBar.setRange(0, 0)
        self.listWidgetEvents.addItem('')                 
        self.listWidgetEvents.addItem(datetime.now().strftime('%Y-%m-%d %H:%M:%S'))                 
        self.listWidgetEvents.addItem(u'Глобальный уникальный идентификатор пакета ' + str(self.guidNew))
        self.listWidgetEvents.addItem(u'Начало подготовки данных')                 

        self.rootXml = None
        self.eDocument = None
        self.Title = None
        self.Package = None
        self.CoordSystems = None
        self.InputData = None
        self.Survey = None
        self.Conclusion = None
        self.SchemeGeodesicPlotting = None
        self.SchemeDispositionParcels = None
        self.DiagramParcelsSubParcels = None
        self.AgreementDocument = None
        self.NodalPointSchemes = None
        self.Appendix = None

        self.pathXmlFile = self.settings.value('database/pathCreateXmlMp', '')
        self.tmpDirectoryXml = self.pathXmlFile + '/GKUZU_' + self.guidNew
        
        if 'Windows' in platform.system():
            if not os.path.exists(self.tmpDirectoryXml.encode('cp1251')):
                os.mkdir(self.tmpDirectoryXml.encode('cp1251'))
        else:
            if not os.path.exists(self.tmpDirectoryXml):
                os.mkdir(self.tmpDirectoryXml)

        self.attributesMp = attributesByKeys('pb_mp', 'guid', [self.guidMp], attributesNamesMP)
        if len(self.attributesMp) != 1:
            self.highLightLine(u'Ошибка! Не однозначно определены атрибуты межевого плана')
            return
        self.attributesMp = self.attributesMp[0]

        self.attributesMpSectionData = attributesByKeys('pb_mp_section_data', 'guid_mp', [self.guidMp], attributesNamesMpSectionData)
        if len(self.attributesMpSectionData) == 0:
            self.highLightLine(u'Ошибка! Не определены атрибуты разделов межевого плана')
            return

        self.listWidgetEvents.addItem(u'Начало формирования данных в формате XML')                 

        self.createRootXml()
        self.createEDocumet()
        self.createTitle()
        self.createPackage()
        self.createCoordSystems()
        self.createInputData()
        self.createSurvey()
        self.createConclusion()
        self.createSchemeGeodesicPlotting()
        self.createSchemeDispositionParcels()
        self.createDiagramParcelsSubParcels()
        self.createAgreementDocument()
        self.createNodalPointSchemes()
        self.createAppendix()
        
        listRequiredSection = []     
        listRequiredSection.append(self.Title) 
        listRequiredSection.append(self.Package) 
        listRequiredSection.append(self.InputData) 
        listRequiredSection.append(self.DiagramParcelsSubParcels) 

        if not self.checkRequiredSection(listRequiredSection):
            self.isError = True    
        
        if self.isError:
            self.listWidgetEvents.addItem(u'Файл XML не создан из-за ошибки обработки данных.')                 

        else:
            self.nameXmlFile = self.tmpDirectoryXml + '/GKUZU_' + self.guidNew + '.xml'
            self.listWidgetEvents.addItem(u'Начало записи данных XML в файл ' + self.nameXmlFile)                 
            ElementTree(self.rootXml).write(self.nameXmlFile, 'utf-8', True)
            self.listWidgetEvents.addItem(u'Окончание записи в файл ' + self.nameXmlFile)                 
            '''
            self.nameZipFile = self.pathXmlFile + '/GKUZU_' + self.guidNew + '.zip'
            z = zipfile.ZipFile(self.nameZipFile, 'w', zipfile.ZIP_DEFLATED)

            namesFiles = os.listdir(self.tmpDirectoryXml)
            for nameFile in namesFiles:
                pathNameFile = self.tmpDirectoryXml + '/' + nameFile
                nameFile866 = nameFile.encode('cp866')

                z.write(pathNameFile, nameFile866)

            z.close()
            '''
#            shutil.rmtree(self.tmpDirectoryXml)

#            self.listWidgetEvents.addItem(u'Создан ZIP файл ' + self.nameZipFile)                 
            
            self.listWidgetEvents.addItem(datetime.now().strftime('%Y-%m-%d %H:%M:%S'))                 

        self.progressBar.setRange(0, 100)
        self.progressBar.setValue(100)

    def createRootXml(self):
        self.rootXml = Element('STD_MP', 
                               {'xsi:noNamespaceSchemaLocation':'http://openlandgis.ru/xml/v04-std-mp/STD_MP.xsd', 
                                'xmlns:xsi':'http://www.w3.org/2001/XMLSchema-instance'})

    # Формирование раздела «Электронный документ»
    def createEDocumet(self):
        if self.rootXml == None:
            self.isError = True    
            return

        CodeType = self.attributesMp['codetype']
        if not self.checkStringEmpty(CodeType, u'Ошибка! Не определено значение типа электронного документа'): 
            return

        Version = self.attributesMp['version']
        if not self.checkStringEmpty(Version, u'Ошибка! Не определено значение номера версии схемы XML'): 
            return

        self.eDocument = SubElement(self.rootXml, u'eDocument', {'CodeType':CodeType, 
                                    'Version':Version, 'GUID':self.guidNew})

        self.listWidgetEvents.addItem(u'Сформирован раздел «Электронный документ»')                 
    
    '''
    Формирование раздела «Титульный лист»
    '''
    def createTitle(self):
        if self.rootXml == None:
            self.isError = True    
            return

        guidContractor = str(self.attributesMp['guid_contractor'])
        attributesContractor = attributesByKeys('pb_contractor', 'guid', [guidContractor], attributesNamesContractor)
        if len(attributesContractor) != 1:
            self.highLightLine(u'Ошибка! Не однозначно определены атрибуты кадастрового инженера')
            return
        attributesContractor = attributesContractor[0]

        Date = self.attributesMp['date_work'].toString('yyyy-MM-dd')
        if not self.checkStringEmpty(Date, u'Ошибка! Не определена дата проведения кадастровых работ'): 
            return

        self.Title = SubElement(self.rootXml, u'Title')
        xmlContractor = SubElement(self.Title, u'Contractor', {'Date':Date})

        Surname = attributesContractor['surname']
        if not self.checkStringEmpty(Surname, u'Ошибка! Не определена фамилия кадастрового инженера'): 
            return
        First = attributesContractor['first']
        if not self.checkStringEmpty(First, u'Ошибка! Не определено имя кадастрового инженера'): 
            return
        Patronymic = attributesContractor['patronymic']

        xmlFIO = SubElement(xmlContractor, u'FIO')
        xmlSurname = SubElement(xmlFIO, u'Surname')
        xmlSurname.text = Surname
        xmlFirst = SubElement(xmlFIO, u'First')
        xmlFirst.text = First
        xmlPatronymic = SubElement(xmlFIO, u'Patronymic')
        xmlPatronymic.text = Patronymic

        N_Certificate = attributesContractor['n_certificate']
        if not self.checkStringEmpty(N_Certificate, u'Ошибка! Не определен номер квалификационного аттестата кадастрового инженера'): 
            return
        xmlN_Certificate = SubElement(xmlContractor, u'N_Certificate')
        xmlN_Certificate.text = N_Certificate

        Telephone = attributesContractor['telephone']
        if not self.checkStringEmpty(Telephone, u'Ошибка! Не определен контактный телефон кадастрового инженера'): 
            return
        xmlTelephone = SubElement(xmlContractor, u'Telephone')
        xmlTelephone.text = Telephone

        Address = attributesContractor['address']
        if not self.checkStringEmpty(Address, u'Ошибка! Не определен почтовый адрес для связи с кадастровым инженером'): 
            return
        xmlAddress = SubElement(xmlContractor, u'Address')
        xmlAddress.text = Address

        E_mail = attributesContractor['email']
        xmlE_mail = SubElement(xmlContractor, u'E_mail')
        xmlE_mail.text = E_mail

        Organization = attributesContractor['organization']
        xmlOrganization = SubElement(xmlContractor, u'Organization')
        xmlOrganization.text = Organization

        Purpose = self.attributesMp['purpose']
        xmlPurpose = SubElement(self.Title, u'Purpose')
        xmlPurpose.text = Purpose

        Reason = self.attributesMp['reason']
        if not self.checkStringEmpty(Reason, u'Ошибка! Не определен вид кадастровых работ'): 
            return
        xmlReason = SubElement(self.Title, u'Reason')
        xmlReason.text = Reason

        Date = self.attributesMp['date_accept'].toString('yyyy-MM-dd')
        if not self.checkStringEmpty(Date, u'Ошибка! Не определена дата приёмки кадастровых работ'): 
            return
        xmlClient = SubElement(self.Title, u'Client', {'Date':Date})
        
        guidClient = str(self.attributesMp['guid_client'])
        if not self.checkStringEmpty(guidClient, u'Ошибка! Не определен заказчик кадастровых работ'): 
            return
        attributesClient = attributesByKeys('pb_client', 'guid', [guidClient], attributesNamesClient)
        if len(attributesClient) != 1:
            self.highLightLine(u'Ошибка! Не однозначно определены атрибуты заказчика')
            return
        attributesClient = attributesClient[0]

        # Заказчик - физическое лицо
        if attributesClient['guid_fiz_liczo'] > ' ':
            guidPerson = str(attributesClient['guid_fiz_liczo'])
            attributesPerson = attributesByKeys('pb_fiz_liczo', 'guid', [guidPerson], attributesNamesPerson)
            if len(attributesPerson) != 1:
                self.highLightLine(u'Ошибка! Не однозначно определены атрибуты физического лица')
                return
            attributesPerson = attributesPerson[0]
            
            xmlPerson = SubElement(xmlClient, u'Person')
            xmlFIO = SubElement(xmlPerson, u'FIO')
            self.createFIO(attributesPerson, u'заказчика', xmlFIO)

        # Заказчик - российское юридическое лицо
        elif attributesClient['guid_yur_liczo'] > ' ':
            guidOrganization = str(attributesClient['guid_yur_liczo'])
            attributesOrganization = attributesByKeys('pb_yur_liczo', 'guid', [guidOrganization], attributesNamesOrganization)
            if len(attributesOrganization) != 1:
                self.highLightLine(u'Ошибка! Не однозначно определены атрибуты российского юридического лица')
                return
            attributesOrganization = attributesOrganization[0]

            Name = attributesOrganization['nazvanie']
            if not self.checkStringEmpty(Name, u'Ошибка! Не определено полное наименование российского юридического лица'): 
                return
            xmlOrganization = SubElement(xmlClient, u'Organization')
            xmlName = SubElement(xmlOrganization, u'Name')
            xmlName.text = Name

            self.createAgent(attributesClient, xmlOrganization)
        
        # Заказчик - орган государственной власти, орган местного самоуправления
        elif attributesClient['guid_governance'] > ' ':
            guidGovernance = str(attributesClient['guid_governance'])
            attributesGovernance = attributesByKeys('pb_governance', 'guid', [guidGovernance], attributesNamesGovernance)
            if len(attributesGovernance) != 1:
                self.highLightLine(u'Ошибка! Не однозначно определены атрибуты органа государственной власти или органа местного самоуправления')
                return
            attributesGovernance = attributesGovernance[0]

            Name = attributesGovernance['name']
            if not self.checkStringEmpty(Name, u'Ошибка! Не определено полное наименование органа государственной власти или органа местного самоуправления'): 
                return
            xmlGovernance = SubElement(xmlClient, u'Governance')
            xmlName = SubElement(xmlGovernance, u'Name')
            xmlName.text = Name

            self.createAgent(attributesClient, xmlGovernance)

        # Заказчик - иностранное юридическое лицо
        elif attributesClient['guid_foreign_organization'] > ' ':
            guidForeignOrganization = str(attributesClient['guid_foreign_organization'])
            attributesForeignOrganization = attributesByKeys('pb_foreign_organization', 'guid', [guidForeignOrganization], attributesNamesForeignOrganization)
            if len(attributesForeignOrganization) != 1:
                self.highLightLine(u'Ошибка! Не однозначно определены атрибуты иностранного юридического лица')
                return
            attributesForeignOrganization = attributesForeignOrganization[0]

            xmlForeignOrganization = SubElement(xmlClient, u'Foreign_Organization')

            Name = attributesForeignOrganization['name']
            if not self.checkStringEmpty(Name, u'Ошибка! Не определено полное наименование иностранного юридического лица'): 
                return
            xmlName = SubElement(xmlForeignOrganization, u'Name')
            xmlName.text = Name

            Country = attributesForeignOrganization['country']
            if not self.checkStringEmpty(Country, u'Ошибка! Не определено наименование страны регистрации'): 
                return
            xmlCountry = SubElement(xmlForeignOrganization, u'Country')
            xmlCountry.text = Country

            self.createAgent(attributesClient, xmlForeignOrganization)

        else:
            self.highLightLine(u'Ошибка! Не определён тип заказчика кадастровых работ')
            return
        
        self.listWidgetEvents.addItem(u'Сформирован раздел «Титульный лист»')                 

    #
    def createFIO(self, attributes, rolePerson, xmlParentSection):
        Surname = attributes['familiya']
        if not self.checkStringEmpty(Surname, u'Ошибка! Не определена фамилия ' + rolePerson): 
            return
        First = attributes['imya']
        if not self.checkStringEmpty(First, u'Ошибка! Не определено имя ' + rolePerson): 
            return
        Patronymic = attributes['otchestvo']

        xmlSurname = SubElement(xmlParentSection, u'Surname')
        xmlSurname.text = Surname
        xmlFirst = SubElement(xmlParentSection, u'First')
        xmlFirst.text = First
        xmlPatronymic = SubElement(xmlParentSection, u'Patronymic')
        xmlPatronymic.text = Patronymic
    
    #
    def createAgent(self, attributes, xmlParentSection):
        guidAgent = str(attributes['guid_agent'])
        attributesAgent = attributesByKeys('pb_fiz_liczo', 'guid', [guidAgent], attributesNamesPerson)
        if len(attributesAgent) != 1:
            self.highLightLine(u'Ошибка! Не однозначно определены атрибуты представителя')
            return
        attributesAgent = attributesAgent[0]

        xmlAgent = SubElement(xmlParentSection, u'Agent')
        self.createFIO(attributesAgent, u'представителя', xmlAgent)
        Appointment = attributes['appointment']
        xmlAppointment = SubElement(xmlAgent, u'Appointment')
        xmlAppointment.text = Appointment

    '''
    Формирование раздела «Пакет информации»
    '''
    def createPackage(self):
        if self.rootXml == None:
            self.isError = True    
            return

        self.Package = SubElement(self.rootXml, u'Package')

        listIdFormNewParcel = []
        listIdFormChangeParcel = []
        listIdFormRelatedParcel = []
        listIdSpecifyExistParcel = []
        listIdSpecifyExistEZ = []
        listIdSpecifyRelatedParcel = []
        listIdNewSubParcel = []
        listIdApproximalExistParcel = []
        listIdApproximalExistEZ = []

        for every in self.attributesMpSectionData:
            if every['id_section_mp'] == self.dictXmlIdSection['NewParcel']:
                listIdFormNewParcel.append(every['id_parcel'])
            
            elif every['id_section_mp'] == self.dictXmlIdSection['ChangeParcel']:
                listIdFormChangeParcel.append(every['id_parcel'])

            elif every['id_section_mp'] == self.dictXmlIdSection['SpecifyRelatedParcel-Form']:
                listIdFormRelatedParcel.append(every['id_parcel'])

            elif every['id_section_mp'] == self.dictXmlIdSection['ExistParcel']:
                listIdSpecifyExistParcel.append(every['id_parcel'])

            elif every['id_section_mp'] == self.dictXmlIdSection['ExistEZ']:
                listIdSpecifyExistEZ.append(every['id_parcel'])
            
            elif every['id_section_mp'] == self.dictXmlIdSection['SpecifyRelatedParcel-Specify']:
                listIdSpecifyRelatedParcel.append(every['id_parcel'])
            
            elif every['id_section_mp'] == self.dictXmlIdSection['NewSubParcel']:
                listIdNewSubParcel.append(every['id_parcel'])
            
            elif every['id_section_mp'] == self.dictXmlIdSection['ExistParcel-Approximal']:
                listIdApproximalExistParcel.append(every['id_parcel'])
            
            elif every['id_section_mp'] == self.dictXmlIdSection['ExistEZ-Approximal']:
                listIdApproximalExistEZ.append(every['id_parcel'])

        #
        if len(listIdFormNewParcel) > 0:        
            self.createFormNewParcel(listIdFormNewParcel)

        elif len(listIdFormChangeParcel) > 0:
            self.highLightLine(u'Ошибка! Извините, формирование раздела МП пока не поддерживается в openLand')
            return

        elif len(listIdFormRelatedParcel) > 0:
            self.highLightLine(u'Ошибка! Извините, формирование раздела МП пока не поддерживается в openLand')
            return

        elif len(listIdSpecifyExistParcel) > 0:
            self.createSpecifyExistParcel(listIdSpecifyExistParcel)

        elif len(listIdSpecifyExistEZ) > 0:
            self.createSpecifyExistEZ(listIdSpecifyExistEZ)

        elif len(listIdSpecifyRelatedParcel) > 0:
            self.highLightLine(u'Ошибка! Извините, формирование раздела МП пока не поддерживается в openLand')
            return

        elif len(listIdNewSubParcel) > 0:
            self.createNewSubParcel(listIdNewSubParcel)

        elif len(listIdApproximalExistParcel) > 0:
            self.createApproximalExistParcel(listIdApproximalExistParcel)

        elif len(listIdApproximalExistEZ) > 0:
            self.highLightLine(u'Ошибка! Извините, формирование раздела МП пока не поддерживается в openLand')
            return

        else:
            self.highLightLine(u'Ошибка! Не определены ЗУ/контуры/ЧЗУ для раздела «Пакет информации»')
            return
        
        if len(self.Package.getchildren()) == 0:
            self.rootXml.remove(self.Package)
        else:
            self.listWidgetEvents.addItem(u'Сформирован раздел «Пакет информации»')                 

    # Сведения об образуемых земельных участках и их частях
    def createFormNewParcel(self, listIdParcel):
        self.attributesParcel = attributesByKeys('ln_uchastok', 'id', listIdParcel, attributesNamesParcel)
        if len(self.attributesParcel) > 0:
            xmlFormParcels = SubElement(self.Package, u'FormParcels', {'Method':self.attributesParcel[0]['id_sposob_obrazovaniya']})
            for everyParcel in self.attributesParcel:
                idParcel = int(everyParcel['id'])

                Definition = everyParcel['oboznachenie_na_plane']
                if not Definition > ' ' :
                    self.highLightLine(u'Ошибка! Не определено обозначение ЗУ в межевом плане')
                    return

                xmlNewParcel = SubElement(xmlFormParcels, u'NewParcel', {'Definition':Definition})

                # Номер кадастрового квартала
                attributesCadastralBlock = attributesByKeys('ln_kvartal', 'id', [everyParcel['id_kvartal']], attributesNamesCadastralBlock)
                if len(attributesCadastralBlock) == 1:
                    CadastralBlock = attributesCadastralBlock[0]['kn']
                else:
                    CadastralBlock = ''

                if not self.checkStringEmpty(CadastralBlock, u'Ошибка! Не определен номер кадастрового квартала'): 
                    return
                xmlCadastralBlock = SubElement(xmlNewParcel, u'CadastralBlock')
                xmlCadastralBlock.text = CadastralBlock

                self.createCadastralNumbers(xmlNewParcel, idParcel)
                self.createArea(xmlNewParcel, idParcel)

                # Адрес (местоположение) участка
                attributesParcelAddress = attributesByKeys('pb_uchastok_adres', 'id_uchastok', [idParcel], attributesNamesParcelAddress)
                if len(attributesParcelAddress) != 1:
                    self.highLightLine(u'Ошибка! Не определен адрес(местоположение) участка')
                    return
                
                idLocation = attributesParcelAddress[0]['id_adres']
                self.createLocation(xmlNewParcel, idLocation)


                # Категория земель
                xmlCategory = SubElement(xmlNewParcel, u'Category', {'Category':everyParcel['id_kategoriya']})
                
                uidDocument = str(everyParcel['guid_doc_category'])
                if guidDocument > ' ':
                    self.createDocumentByListGuid(xmlCategory, [guidDocument], u'DocCategory')

                # NaturalObject Характеристика лесного участка - доделать позже :( приходите завтра! что вы всё время сегодня приходите?

                # Разрешенное использование участка
                dictUtilization = {}
                if everyParcel['id_ispolzovanie'] > ' ':
                    dictUtilization['Utilization'] = everyParcel['id_ispolzovanie']
                    
                if everyParcel['ispolzovanie_dokument'] > ' ':
                    dictUtilization['ByDoc']  = everyParcel['ispolzovanie_dokument']

                if len(dictUtilization) > 0:
                    if everyParcel['dop_naimenovanie'] > ' ':
                        dictUtilization['AdditionalName'] = everyParcel['dop_naimenovanie']
                else:
                    self.highLightLine(u'Ошибка! Не определено разрешенное использование ЗУ')
                    return

                xmlUtilization = SubElement(xmlNewParcel, u'Utilization', dictUtilization)

                guidDocument = str(everyParcel['guid_doc_utilization'])
                if guidDocument > ' ':
                    self.createDocumentByListGuid(xmlUtilization, [guidDocument], u'DocUtilization')

                # SubParcels Части участка  - доделать позже

                # Описание местоположения границ и контуры многоконтурного участка
                if str(everyParcel['id_vid_uchastka']) == gv['multiContourCode']:
                    # Contours 
                    xmlContours = SubElement(xmlNewParcel, u'Contours')
                    listIdContour = listIdChildByIdParent(idParcel)
                    if len(listIdContour) == 0:
                        self.highLightLine(u'Ошибка! Не определены идентификаторы контуров многоконтурного ЗУ')
                        return

                    # NewContour
                    self.createContour(xmlContours, listIdContour)

                elif str(everyParcel['id_vid_uchastka']) == gv['casualParcelCode']:
                    # Entity_Spatial 
                    self.createEntitySpatial(xmlNewParcel, idParcel, everyParcel['id_msk'])

                # Предельный минимальный размер земельного участка
                MinArea = int(reNull(everyParcel['min_area'], 0))
                MinAreaUnit = reNull(everyParcel['type_unit_min_area'], '')
                if (MinArea > 0) and (MinAreaUnit > ' '):
                    MinArea = str(MinArea)
                    xmlMinAreaParent = SubElement(xmlNewParcel, u'Min_Area')
                    xmlMinArea = SubElement(xmlMinAreaParent, u'Area')
                    xmlMinArea.text = MinArea
                    xmlMinAreaUnit = SubElement(xmlMinAreaParent, u'Unit')
                    xmlMinAreaUnit.text = MinAreaUnit

                # Предельный максимальный размер земельного участка
                MaxArea = int(reNull(everyParcel['max_area'], 0))
                MaxAreaUnit = reNull(everyParcel['type_unit_max_area'], '')
                if (MaxArea > 0) and (MaxAreaUnit > ' '):
                    MaxArea = str(MaxArea)
                    xmlMaxAreaParent = SubElement(xmlNewParcel, u'Max_Area')
                    xmlMaxArea = SubElement(xmlMaxAreaParent, u'Area')
                    xmlMaxArea.text = MaxArea
                    xmlMaxAreaUnit = SubElement(xmlMaxAreaParent, u'Unit')
                    xmlMaxAreaUnit.text = MaxAreaUnit

                Note = everyParcel['note']
                if Note > '-':
                    xmlNote = SubElement(xmlNewParcel, u'Note')
                    xmlNote.text = Note
    
    
    # Сведения об уточняемом участке, не являющемся единым землепользованием, и его частях
    def createSpecifyExistParcel(self, listIdParcel):
        self.attributesParcel = attributesByKeys('ln_uchastok', 'id', listIdParcel, attributesNamesParcel)
        if len(self.attributesParcel) == 1:
            xmlSpecifyParcel = SubElement(self.Package, u'SpecifyParcel')
            everyParcel = self.attributesParcel[0]
            self.createExistParcel(xmlSpecifyParcel, everyParcel)            

        else:
            self.highLightLine(u'Ошибка! В обработке более одного уточняемого ЗУ.')

            
    # Уточнение границ нескольких смежных земельных участков
    def createApproximalExistParcel(self, listIdParcel):
        self.attributesParcel = attributesByKeys('ln_uchastok', 'id', listIdParcel, attributesNamesParcel)
        if len(self.attributesParcel) > 0:
            for everyParcel in self.attributesParcel:
                xmlSpecifyParcelsApproximal = SubElement(self.Package, u'SpecifyParcelsApproximal')
                self.createExistParcel(xmlSpecifyParcelsApproximal, everyParcel)            

        else:
            self.highLightLine(u'Ошибка! Не найдено нескольких смежных земельных участков.')

            
    # Сведения об уточняемом едином землепользовании и его частях
    def createSpecifyExistEZ(self, listIdParcel):
        self.attributesParcel = attributesByKeys('ln_uchastok', 'id', listIdParcel, attributesNamesParcel)
        if len(self.attributesParcel) == 1:
            xmlSpecifyParcel = SubElement(self.Package, u'SpecifyParcel')
            everyParcel = self.attributesParcel[0]
            idParcel = int(everyParcel['id'])

            Kn = everyParcel['kn']
            if not Kn > ' ' :
                self.highLightLine(u'Ошибка! Не определен кадастровый номер ЕЗ')
                return

            xmlExistEZ = SubElement(xmlSpecifyParcel, u'ExistEZ')
            xmlExistEZParcels = SubElement(xmlExistEZ, u'ExistEZParcels', {'CadastralNumber':Kn})

            # Номер кадастрового квартала
            attributesCadastralBlock = attributesByKeys('ln_kvartal', 'id', [everyParcel['id_kvartal']], attributesNamesCadastralBlock)
            if len(attributesCadastralBlock) == 1:
                CadastralBlock = attributesCadastralBlock[0]['kn']
            else:
                CadastralBlock = ''

            if not self.checkStringEmpty(CadastralBlock, u'Ошибка! Не определен номер кадастрового квартала ЕЗ'): 
                return
            xmlCadastralBlock = SubElement(xmlExistEZParcels, u'CadastralBlock')
            xmlCadastralBlock.text = CadastralBlock

            self.createCadastralNumbers(xmlExistEZParcels, idParcel, False, False, True)
            self.createArea(xmlExistEZParcels, idParcel)

            # SubParcels Части участка  - доделать позже

            # Состав единого землепользования (ЕЗ)
            if str(everyParcel['id_vid_uchastka']) == gv['unitedParcelCode']:
                listIdEntryParcel = listIdChildByIdParent(idParcel)
                if len(listIdEntryParcel) == 0:
                    self.highLightLine(u'Ошибка! Не определены идентификаторы входящих участков ЕЗ')
                    return

                attributesEntryParcel = attributesByKeys('ln_uchastok', 'id', listIdEntryParcel, attributesNamesParcel)
                if len(attributesEntryParcel) == 0:
                    self.highLightLine(u'Ошибка! Не определены атрибуты входящих участков ЕЗ')
                    return
                
                xmlCompositionEZ = SubElement(xmlExistEZParcels, u'Composition_EZ')
                xmlInsertEntryParcels = SubElement(xmlCompositionEZ, u'InsertEntryParcels')
                xmlDeleteEntryParcels = SubElement(xmlCompositionEZ, u'DeleteEntryParcels')
                xmlExistEZEntryParcels = SubElement(xmlExistEZ, u'ExistEZEntryParcels')
                for everyEntryParcel in attributesEntryParcel:
                    # код типа для включаемого в ЕЗ участка
                    if str(everyEntryParcel['tip_obekta_kadastrovyh_rabot']) == gv['insertEntryParcels']:
                        KnEntryParcel = everyEntryParcel['kn']
                        if KnEntryParcel > ' ' :
                            xmlInsertEntryParcel = SubElement(xmlInsertEntryParcels, u'InsertEntryParcel')
                            xmlExistEntryParcel = SubElement(xmlInsertEntryParcel, u'ExistEntryParcel', 
                                                             {'CadastralNumber':KnEntryParcel})
                        else:
                            xmlInsertEntryParcel = SubElement(xmlInsertEntryParcels, u'InsertEntryParcel')
                            self.createNewEntryParcel(xmlInsertEntryParcel, everyEntryParcel)

                    # код типа для уточняемого ЗУ, входящего в ЕЗ
                    elif str(everyEntryParcel['tip_obekta_kadastrovyh_rabot']) == gv['existEntryParcels']:
                        self.createExistEZEntryParcel(xmlExistEZEntryParcels, everyEntryParcel)

                    # код типа для исключаемого из ЕЗ участка
                    elif str(everyEntryParcel['tip_obekta_kadastrovyh_rabot']) == gv['deleteEntryParcels']:
                        KnEntryParcel = everyEntryParcel['kn']
                        if not KnEntryParcel > ' ' :
                            self.highLightLine(u'Ошибка! Не определен кадастровый номер входящего, исключаемого из ЕЗ ')
                            return
                        
                        xmlDeleteEntryParcel = SubElement(xmlDeleteEntryParcels, u'DeleteEntryParcel', 
                                                          {'CadastralNumber':KnEntryParcel})

                if len(xmlInsertEntryParcels.getchildren()) == 0:
                    xmlCompositionEZ.remove(xmlInsertEntryParcels)

                if len(xmlDeleteEntryParcels.getchildren()) == 0:
                    xmlCompositionEZ.remove(xmlDeleteEntryParcels)

                if len(xmlCompositionEZ.getchildren()) == 0:
                    xmlExistEZParcels.remove(xmlCompositionEZ)

                if len(xmlExistEZEntryParcels.getchildren()) == 0:
                    xmlExistEZ.remove(xmlExistEZEntryParcels)

            else:
                self.highLightLine(u'Ошибка! Обрабатываемый ЗУ не является ЕЗ.')

            self.createAreaGkn(xmlExistEZParcels, everyParcel)            
            self.createDeltaArea(xmlExistEZParcels, everyParcel)            
            self.createMinMaxArea(xmlExistEZParcels, everyParcel)            

            Note = everyParcel['note']
            if Note > '-':
                xmlNote = SubElement(xmlExistEZParcels, u'Note')
                xmlNote.text = Note
        
        else:
            self.highLightLine(u'Ошибка! В обработке более одного уточняемого ЕЗ!?')

    
    # Сведения о новых обособленных и условных участках, включаемых в состав ЕЗ
    def createNewEntryParcel(self, xmlParentElement, entryParcel):
        Name = entryParcel['id_vid_uchastka']
        if not Name in ('03', '04'):
            self.highLightLine(u'Ошибка! Название входящего участка не соответсвует схеме: обособленный(03) или условный(04)')
            return
        
        Definition = entryParcel['oboznachenie_na_plane']
        if not Definition > ' ':
            self.highLightLine(u'Ошибка! Отсутствует обозначение на плане для нового ЗУ, входящего в ЕЗ')
            return
        
        xmlNewEntryParcel = SubElement(xmlParentElement, 
                                       u'NewEntryParcel', 
                                       {'Name':Name, 
                                        'Definition':Definition})
        
        idParcel = int(entryParcel['id'])
        self.createArea(xmlNewEntryParcel, idParcel)
        self.createEntitySpatial(xmlNewEntryParcel, idParcel, entryParcel['id_msk'])

        # Encumbrance доделать позже 
    

    # Сведения об уточняемом участке
    def createExistParcel(self, xmlParentElement, everyParcel):
        idParcel = int(everyParcel['id'])
        Kn = everyParcel['kn']
        if not Kn > ' ' :
            self.highLightLine(u'Ошибка! Не определен кадастровый номер ЗУ')
            return

        xmlExistParcel = SubElement(xmlParentElement, u'ExistParcel', {'CadastralNumber':Kn})

        # Номер кадастрового квартала
        attributesCadastralBlock = attributesByKeys('ln_kvartal', 'id', [everyParcel['id_kvartal']], attributesNamesCadastralBlock)
        if len(attributesCadastralBlock) == 1:
            CadastralBlock = attributesCadastralBlock[0]['kn']
        else:
            CadastralBlock = ''

        if not self.checkStringEmpty(CadastralBlock, u'Ошибка! Не определен номер кадастрового квартала'): 
            return
        xmlCadastralBlock = SubElement(xmlExistParcel, u'CadastralBlock')
        xmlCadastralBlock.text = CadastralBlock

        self.createCadastralNumbers(xmlExistParcel, idParcel, False, False, True)
        self.createArea(xmlExistParcel, idParcel)

        # SubParcels Части участка  - доделать позже

        # Описание местоположения границ и контуры многоконтурного участка
        if str(everyParcel['id_vid_uchastka']) == gv['multiContourCode']:
            # Contours 
            xmlContours = SubElement(xmlExistParcel, u'Contours')
            listIdContour = listIdChildByIdParent(idParcel)
            if len(listIdContour) == 0:
                self.highLightLine(u'Ошибка! Не определены идентификаторы контуров многоконтурного ЗУ')
                return

            # NewContour
            self.createContour(xmlContours, listIdContour, True)

        elif str(everyParcel['id_vid_uchastka']) == gv['casualParcelCode']:
            # Entity_Spatial 
            self.createEntitySpatial(xmlExistParcel, idParcel, everyParcel['id_msk'])
            
        self.createAreaGkn(xmlExistParcel, everyParcel)            
        self.createDeltaArea(xmlExistParcel, everyParcel)            
        self.createMinMaxArea(xmlExistParcel, everyParcel)            

        Note = everyParcel['note']
        if Note > '-':
            xmlNote = SubElement(xmlExistParcel, u'Note')
            xmlNote.text = Note
    

    # Сведения об уточняемом, входящем в ЕЗ участке
    def createExistEZEntryParcel(self, xmlParentElement, entryParcel):
        CadastralNumber = entryParcel['kn']
        if not CadastralNumber > ' ':
            self.highLightLine(u'Ошибка! Не определён КН уточняемого ЗУ, входящего в ЕЗ')
            return
        
        xmlExistEZEntryParcel = SubElement(xmlParentElement, 
                                           u'ExistEZEntryParcel', 
                                           {'CadastralNumber':CadastralNumber})
        
        idParcel = int(entryParcel['id'])

        self.createArea(xmlExistEZEntryParcel, idParcel)
        self.createAreaGkn(xmlExistEZEntryParcel, entryParcel)            

        # Encumbrance доделать позже 

        self.createEntitySpatial(xmlExistEZEntryParcel, idParcel, entryParcel['id_msk'])

        Note = str(entryParcel['note'])
        if Note > '-':
            xmlNote = SubElement(xmlExistEZEntryParcel, u'Note')
            xmlNote.text = Note

    # Сведения об образуемых частях
    def createNewSubParcel(self, listIdParcel):
        self.attributesParcel = attributesByKeys('ln_uchastok', 'id', listIdParcel, attributesNamesParcel)
        if len(self.attributesParcel) > 0:
            for everyParcel in self.attributesParcel:
                idParcel = int(everyParcel['id'])

                Definition = everyParcel['oboznachenie_na_plane']
                if not Definition > ' ' :
                    self.highLightLine(u'Ошибка! Не определено обозначение ЗУ в межевом плане')
                    return

                SubParcelRealty = everyParcel['subparcel_realty']
                if not SubParcelRealty in ('0', '1'):
                    self.highLightLine(u'Ошибка! Не определен признак формирования ЧЗУ под ОН')
                    return

                xmlNewSubParcel = SubElement(self.Package, u'NewSubParcel', {'Definition':Definition, 
                                                                             'SubParcel_Realty':SubParcelRealty})

                idParent = idParentByIdChild(idParcel)
                if idParent > 0:
                    attributesParent = attributesByKeys('ln_uchastok', 'id', [idParent], ['kn'])
                    if not len(attributesParent) == 1:
                        self.highLightLine(u'Ошибка! Не однозначно определены атрибуты ЗУ для ЧЗУ')
                        return
                    
                else:
                    self.highLightLine(u'Ошибка! Не определен ЗУ для ЧЗУ')
                    return

                Kn = attributesParent[0]['kn']
                if not self.checkStringEmpty(Kn, u'Ошибка! Не определен кадастровый номер ЗУ'): 
                    return
                xmlCadastralNumberParcel = SubElement(xmlNewSubParcel, u'CadastralNumber_Parcel')
                xmlCadastralNumberParcel.text = Kn

                self.createArea(xmlNewSubParcel, idParcel)

                Type = everyParcel['id_obremeneniya']
                if not self.checkStringEmpty(Type, u'Ошибка! Не определен вид обременения ЧЗУ'): 
                    return
                xmlEncumbrance = SubElement(xmlNewSubParcel, u'Encumbrance')

                Name = everyParcel['vid_obremeneniya']
                if not self.checkStringEmpty(Name, u'Ошибка! Не определено содержание обременения ЧЗУ'): 
                    return
                
                xmlName = SubElement(xmlEncumbrance, u'Name')
                xmlName.text = Name

                xmlType = SubElement(xmlEncumbrance, u'Type')
                xmlType.text = Type

                searchCondition = '\"id_uchastok\" = ' + str(idParcel) + ' AND \"tip_kn\" = \'' + gv['restrictionKn'] + '\''
                attributesCadastralNumber = attributesBySearchCondition('pb_kn', searchCondition, attributesNamesKn)
                if len(attributesCadastralNumber) == 1:
                    CadastralNumberRestriction = attributesCadastralNumber[0]['kn']
                    xmlCadastralNumberRestriction = SubElement(xmlEncumbrance, u'CadastralNumber_Restriction')
                    xmlCadastralNumberRestriction.text = CadastralNumberRestriction

                guidDocEncumbrance = str(everyParcel['guid_doc_encumbrance'])
                if guidDocEncumbrance > ' ':
                    xmlDocuments = SubElement(xmlEncumbrance, u'Documents')
                    self.createDocumentByListGuid(xmlDocuments, [guidDocEncumbrance], u'Document')

                if str(everyParcel['id_vid_uchastka']) == gv['onePartCode']:
                    # Entity_Spatial 
                    self.createEntitySpatial(xmlNewSubParcel, idParcel, everyParcel['id_msk'], False)

                else:
                    self.highLightLine(u'Ошибка! Обрабатывемый объект не является ЧЗУ. Внезапно!')
                    return
    
    # Контур многоконтурного
    def createContour(self, xmlContours, listIdContour, isSpecify=False):
        attributesContour = attributesByKeys('ln_uchastok', 'id', listIdContour, attributesNamesParcel)
        if len(attributesContour) == 0:
            self.highLightLine(u'Ошибка! Не определены атрибуты контуров многоконтурного ЗУ')
            return

        listForSortByContourNumber = [[every['nomer_kontura'], every] for every in attributesContour]
        listForSortByContourNumber.sort()
        attributesContourSorted = [every[1] for every in listForSortByContourNumber]
        
        for everyContour in attributesContourSorted:
            if isSpecify:
                if str(everyContour['tip_obekta_kadastrovyh_rabot']) == gv['specifyContour']:
                    idContour = int(everyContour['id'])
                    xmlExistContour = SubElement(xmlContours, u'ExistContour', {'Number_Record':str(everyContour['nomer_kontura'])})
                    self.createArea(xmlExistContour, idContour)
                    self.createEntitySpatial(xmlExistContour, idContour, everyContour['id_msk'])

                elif str(everyContour['tip_obekta_kadastrovyh_rabot']) == gv['newContour']:
                    idContour = int(everyContour['id'])
                    xmlNewContour = SubElement(xmlContours, u'NewContour', {'Definition':everyContour['oboznachenie_na_plane']})
                    self.createArea(xmlNewContour, idContour)
                    self.createEntitySpatial(xmlNewContour, idContour, everyContour['id_msk'])
                    self.createCadastralNumbers(xmlNewContour, idContour, False, True, False)
                    
            else:
                idContour = int(everyContour['id'])
                xmlNewContour = SubElement(xmlContours, u'NewContour', {'Definition':everyContour['oboznachenie_na_plane']})
                self.createArea(xmlNewContour, idContour)
                self.createEntitySpatial(xmlNewContour, idContour, everyContour['id_msk'])
                self.createCadastralNumbers(xmlNewContour, idContour, False, True, False)

    # Уточненная площадь ЗУ или контура
    def createArea(self, xmlParentElement, idParcel):
        searchCondition = '\"id_uchastok\" = ' + str(idParcel) + ' AND \"id_vid_ploshadi\" = \'' + gv['accurateArea'] + '\''
        attributesArea = attributesBySearchCondition('pb_ploshad', searchCondition, attributesNamesArea)
        if len(attributesArea) != 1:
            self.highLightLine(u'Ошибка! Не определена однозначно уточнённая площадь ЗУ или контура')
            return

        xmlArea = SubElement(xmlParentElement, u'Area')

        attributesArea = attributesArea[0]

        valueArea = int(reNull(attributesArea['ploshad'], 0))
        if not valueArea > 0: 
            self.highLightLine(u'Ошибка! Не определено значение площади ЗУ')
            return
        valueArea = str(valueArea)
        xmlValueArea = SubElement(xmlArea, u'Area')
        xmlValueArea.text = valueArea

        Unit = attributesArea['id_edinicy_izmereniya']
        if not self.checkStringEmpty(Unit, u'Ошибка! Не определена единица измерения площади ЗУ'): 
            return
        xmlUnit = SubElement(xmlArea, u'Unit')
        xmlUnit.text = Unit

        Inaccuracy = int(reNull(attributesArea['pogreshnost_izmereniya'], 0))
        if not Inaccuracy > 0: 
            self.highLightLine(u'Ошибка! Не определена погрешность вычисления площади ЗУ')
            return
        Inaccuracy = str(Inaccuracy)
        xmlInaccuracy = SubElement(xmlArea, u'Innccuracy')
        xmlInaccuracy.text = Inaccuracy

    # 
    def createAreaGkn(self, xmlParent, Parcel):
        # Площадь земельного участка по сведениям государственного кадастра недвижимости
        AreaInGkn = int(reNull(Parcel['area_in_gkn'], 0))
        if AreaInGkn > 0:
            AreaInGkn = str(AreaInGkn)
            xmlAreaInGkn = SubElement(xmlParent, u'Area_In_GKN')
            xmlAreaInGkn.text = AreaInGkn
                
    # 
    def createDeltaArea(self, xmlParent, Parcel):
        # Оценка расхождения площадей
        DeltaArea = int(reNull(Parcel['delta_area'], 0))
        if DeltaArea > 0:
            DeltaArea = str(DeltaArea)
            xmlDeltaArea = SubElement(xmlParent, u'Delta_Area')
            xmlDeltaArea.text = DeltaArea
                    
    # 
    def createMinMaxArea(self, xmlParent, Parcel):
        # Предельный минимальный размер земельного участка
        MinArea = int(reNull(Parcel['min_area'], 0))
        MinAreaUnit = reNull(Parcel['type_unit_min_area'], '')
        if (MinArea > 0) and (MinAreaUnit > ' '):
            MinArea = str(MinArea)
            xmlMinAreaParent = SubElement(xmlParent, u'Min_Area')
            xmlMinArea = SubElement(xmlMinAreaParent, u'Area')
            xmlMinArea.text = MinArea
            xmlMinAreaUnit = SubElement(xmlMinAreaParent, u'Unit')
            xmlMinAreaUnit.text = MinAreaUnit

        # Предельный максимальный размер земельного участка
        MaxArea = int(reNull(Parcel['max_area'], 0))
        MaxAreaUnit = reNull(Parcel['type_unit_max_area'], '')
        if (MaxArea > 0) and (MaxAreaUnit > ' '):
            MaxArea = str(MaxArea)
            xmlMaxAreaParent = SubElement(xmlParent, u'Max_Area')
            xmlMaxArea = SubElement(xmlMaxAreaParent, u'Area')
            xmlMaxArea.text = MaxArea
            xmlMaxAreaUnit = SubElement(xmlMaxAreaParent, u'Unit')
            xmlMaxAreaUnit.text = MaxAreaUnit


    # Кадастровые номера ЗУ или контура
    def createCadastralNumbers(self, xmlParentElement, idParcel, isPrev = True, isProv = True, isInner = True):
        searchCondition = '\"id_uchastok\" = ' + str(idParcel)
        attributesCadastralNumber = attributesBySearchCondition('pb_kn', 
                                                                searchCondition, 
                                                                attributesNamesKn)
        attributesPrevCadastralNumber = []
        attributesProvidingCadastralNumber = []
        attributesInnerCadastralNumber = []
        for everyCn in attributesCadastralNumber:
            if everyCn['tip_kn'] == gv['prevKn']:
                attributesPrevCadastralNumber.append(everyCn)

            elif everyCn['tip_kn'] == gv['providingKn']:
                attributesProvidingCadastralNumber.append(everyCn)

            elif everyCn['tip_kn'] == gv['innerKn']:
                attributesInnerCadastralNumber.append(everyCn)

        # Кадастровые номера земельных участков, из которых образован данный участок
        if isPrev and len(attributesPrevCadastralNumber) > 0:
            xmlPrevCadastralNumbers = SubElement(xmlParentElement, u'Prev_CadastralNumbers')

            for everyPrevCn in attributesPrevCadastralNumber:
                CadastralNumber = everyPrevCn['kn']
                if not self.checkStringEmpty(CadastralNumber, 
                                             u'Ошибка! Не определен КН ЗУ, из которых образован данный участок'): 
                    return
                xmlCadastralNumber = SubElement(xmlPrevCadastralNumbers, u'CadastralNumber')
                xmlCadastralNumber.text = CadastralNumber

        # Сведения о земельных участках, посредством которых обеспечивается доступ
        if isProv and len(attributesProvidingCadastralNumber) > 0:
            xmlProvidingCadastralNumbers = SubElement(xmlParentElement, 
                                                      u'Providing_Pass_CadastralNumbers')
            for everyProvCn in attributesProvidingCadastralNumber:
                CadastralNumber = everyProvCn['kn']
                if CadastralNumber > ' ':
                    xmlCadastralNumber = SubElement(xmlProvidingCadastralNumbers, u'CadastralNumber')
                    xmlCadastralNumber.text = CadastralNumber
                    
                Definition = everyProvCn['definition']
                if Definition > ' ':
                    xmlDefinition = SubElement(xmlProvidingCadastralNumbers, u'Definition')
                    xmlDefinition.text = Definition

                Other = everyProvCn['other']
                if Other > ' ':
                    xmlOther = SubElement(xmlProvidingCadastralNumbers, u'Other')
                    xmlOther.text = Other

                idProvCn = int(everyProvCn['id'])
                attributesCnDocument = attributesByKeys('pb_kn_document', 'id_kn', [idProvCn], attributesNamesKnDocument)
                if len(attributesCnDocument) > 0:
                    listGuidDocument = [str(everyCnDoc['guid_document']) for everyCnDoc in attributesCnDocument]
                    if len(listGuidDocument) > 0:
                        xmlDocuments = SubElement(xmlProvidingCadastralNumbers, u'Documents')
                        self.createDocumentByListGuid(xmlDocuments, listGuidDocument, u'Document')

        # Кадастровые или иные номера зданий, сооружений, объектов незавершенного строительства, расположенных на земельном участке                
        if isInner and len(attributesInnerCadastralNumber) > 0:
            xmlInnerCadastralNumbers = SubElement(xmlParentElement, u'Inner_CadastralNumbers')

            for everyInnerCn in attributesInnerCadastralNumber:
                CadastralNumber = everyInnerCn['kn']
                if CadastralNumber > ' ':
                    xmlCadastralNumber = SubElement(xmlInnerCadastralNumbers, u'CadastralNumber')
                    xmlCadastralNumber.text = CadastralNumber
                                 
                Number = everyInnerCn['number']
                if Number > ' ':
                    xmlNumber = SubElement(xmlInnerCadastralNumbers, u'Number')
                    xmlNumber.text = Number

    # 
    def createEntitySpatial(self, xmlParentSection, idParcel, guidMsk, isCreateBorders=True):
        xmlEntitySpatial = SubElement(xmlParentSection, u'Entity_Spatial', {'Ent_Sys':('ID_' + guidMsk)})

        searchCondition = '\"id_uchastok\" = ' + str(idParcel) + ' AND \"pre\" = 1'
        attributesOldPoint = attributesBySearchCondition('ln_tochka', searchCondition, attributesNamesPoint)
        dictOldPoint = {}
        if len(attributesOldPoint) > 0:
            i = 0
            for every in attributesOldPoint:
                if str(every['id_child']) > '0':
                    dictOldPoint = {str(every['id_child']):i}
                i += 1

        searchCondition = '\"id_uchastok\" = ' + str(idParcel) + ' AND \"pre\" = 0'
        attributesPoint = attributesBySearchCondition('ln_tochka', searchCondition, attributesNamesPoint)
        if len(attributesPoint) < 3:
            self.highLightLine(u'Ошибка! Менее трёх точек у пространственного элемента ЗУ с id=' + str(idParcel))
            return

        listRing = []
        for everyPoint in attributesPoint:
            listRing.append([everyPoint['nomer_chasti'], [everyPoint['poryadok_obhoda'], everyPoint]])
        
        listRing.sort()

        listPoint = []
        firstRing = []
        nextRing = []
        otherRings = []
        startRing = 2

        # танцы с бубном по часовой и против и замыканием контура
        for everyRing in listRing:
            currentRing = everyRing[0]
            
            if currentRing == 1:
                firstRing.append(everyRing[1])

            else:
                if currentRing > startRing:
                    nextRing.sort()
                    addToNext = nextRing[0]
                    nextRing.append(addToNext)

                    otherRings = otherRings + nextRing
                    nextRing = []
                    
                    nextRing.append(everyRing[1])
                    startRing += 1

                else:
                    nextRing.append(everyRing[1])

        firstRing.sort()
        addToFirst = firstRing[0]
        firstRing.append(addToFirst)
        listPointsForCheck = [[every[1]['y'], every[1]['x']] for every in firstRing]
        
        if self.inClockwiseDirection(listPointsForCheck):
            firstRing.reverse()
    
        if len(nextRing) > 0:
            nextRing.sort()
            addToNext = nextRing[0]
            nextRing.append(addToNext)

            otherRings = otherRings + nextRing
        
        listPoint = firstRing + otherRings
        listSortedPoint = [every[1] for every in listPoint]

        listIntIdPoint = []
        listIdPointOld2New = []
        numberSpatialElement = 1
        xmlSpatialElement = SubElement(xmlEntitySpatial, u'Spatial_Element')
        for everyPoint in listSortedPoint:
            if not everyPoint['nomer_chasti'] == numberSpatialElement:
                numberSpatialElement += 1
                xmlSpatialElement = SubElement(xmlEntitySpatial, u'Spatial_Element')

            listIntIdPoint.append(int(everyPoint['id'])) 
            xmlSpelementUnit = SubElement(xmlSpatialElement, u'Spelement_Unit', {'Type_Unit':u'Точка'})
            # Если новая точка
            if everyPoint['prefiks_nomera'] == u'н':
                self.createNewOrdinate(xmlSpelementUnit, everyPoint)
                
                # Есть ли точка прекратившае существование, соответствующая текущей точке
                if dictOldPoint.keys().count(str(everyPoint['id'])) == 1:
                    # Получаем атрибуты старой точки
                    oldPoint = attributesOldPoint[dictOldPoint[str(everyPoint['id'])]]
                    listIdPointOld2New.append(str(oldPoint['id'])) 

                    # Пишем в <Spelement_Unit>
                    self.createOldOrdinate(xmlSpelementUnit, oldPoint)

            # Значит существующая точка
            else:
                self.createNewOrdinate(xmlSpelementUnit, everyPoint)
                self.createOldOrdinate(xmlSpelementUnit, everyPoint)

        # Если есть оставшиеся точки прекратившие существование. Совсем прекратившие.
        if len(attributesOldPoint) > 0:
            for everyOldPoint in attributesOldPoint:
                if listIdPointOld2New.count(str(everyOldPoint['id'])) == 0:
                    xmlSpelementUnit = SubElement(xmlSpatialElement, u'Spelement_Unit', {'Type_Unit':u'Точка'})
                    self.createOldOrdinate(xmlSpelementUnit, everyOldPoint)

        if not isCreateBorders:
            return
        # Формирование элементов <Borders>
        xmlBorders = SubElement(xmlEntitySpatial, u'Borders')
        
        attributesBorder = attributesByKeys('ln_granica', 'id_uchastok', [idParcel], ['id', 'opisanie', 'po_opisaniyu', 'dlina'])
        listBorder = {every['id']:every for every in attributesBorder}

        attributesBorderPoints = attributesByKeys('pb_granica_tochka', 'id_tochka', listIntIdPoint, ['id_tochka', 'id_granica'])

        numberSpatialElement = 1
        numberPoint = 1
        for i in range(1, len(listSortedPoint)):
            if listSortedPoint[i-1]['nomer_chasti'] == listSortedPoint[i]['nomer_chasti'] == numberSpatialElement:
                idPoinFrom = int(listSortedPoint[i-1]['id'])
                idPointTo = int(listSortedPoint[i]['id'])
                idBorder = self.idBorderByIdPoints(idPoinFrom, idPointTo, attributesBorderPoints)

                if idBorder > 0:
                    Point1 = numberPoint
                    if numberPoint == 1:
                        idFirstPoint = idPoinFrom
                        Point2 = Point1 + 1

                    else: 
                        if idPointTo == idFirstPoint:
                            Point2 = 1
                        else:
                            Point2 = Point1 + 1
                
                    if listBorder[idBorder]['po_opisaniyu']:
                        ByDef = '1'
                    else:
                        ByDef = '0'

                    Length = str(listBorder[idBorder]['dlina'])
                    Definition = listBorder[idBorder]['opisanie']

                    xmlBorder = SubElement(xmlBorders, u'Border', {'Spatial':str(numberSpatialElement), 
                                                                   'Point1':str(Point1), 
                                                                   'Point2':str(Point2), 
                                                                   'ByDef':ByDef})
                    xmlEdge = SubElement(xmlBorder, u'Edge')
                    xmlLength = SubElement(xmlEdge, u'Length')
                    xmlLength.text = Length
                    if Definition > '-':
                        xmlDefinition = SubElement(xmlEdge, u'Definition')
                        xmlDefinition.text = Definition

                    numberPoint += 1

            else:
                numberSpatialElement += 1
                numberPoint = 1

    #
    def idBorderByIdPoints(self, id1, id2, listBorderPoints):
        listFirst = []
        listSecond = []
        for every in listBorderPoints:
            if id1 == every['id_tochka']:
                listFirst.append(every['id_granica'])
            
            if id2 == every['id_tochka']:
                listSecond.append(every['id_granica'])

        idBorder = 0
        for everyFirst in listFirst:
            for everySecond in listSecond:
                if everyFirst == everySecond:
                    idBorder = everyFirst = everySecond
                    return  idBorder
        
        self.highLightLine(u'Ошибка! Не определён идентификатор границы для пары идентификаторов точек ' + str(id1) + ' ' + str(id2))

    # 
    def createOldOrdinate(self, xmlSpelementUnit, listPoint):
        xmlOldOrdinate = SubElement(xmlSpelementUnit, u'OldOrdinate', 
                                    {'X':str(listPoint['x']), 
                                     'Y':str(listPoint['y']), 
                                     'Num_Geopoint':str(listPoint['nomer']), 
                                     'Geopoint_Zacrep':listPoint['id_sposob_zakrepleniya'], 
                                     'Point_Pref':listPoint['prefiks_nomera']})
    
    # 
    def createNewOrdinate(self, xmlSpelementUnit, listPoint):
        try:
            deltaGeopoint = '%4.2f' % listPoint['pogreshnost']
        except ValueError:
            self.highLightLine(u'Ошибка! Не определена погрешность точки № ' + str(listPoint['nomer']))
            deltaGeopoint = u'0'
            
        xmlNewOrdinate = SubElement(xmlSpelementUnit, u'NewOrdinate', 
                                    {'X':str(listPoint['x']), 
                                     'Y':str(listPoint['y']), 
                                     'Num_Geopoint':str(listPoint['nomer']), 
                                     'Geopoint_Zacrep':listPoint['id_sposob_zakrepleniya'], 
                                     'Delta_Geopoint':deltaGeopoint, 
                                     'Point_Pref':listPoint['prefiks_nomera']})
                                     
    # Адрес (местоположение) участка
    def createLocation(self, xmlParentSection, idLocation):
        attributesLocation = attributesByKeys('pb_adres', 'id', [idLocation], attributesNamesLocation)
        if len(attributesLocation) != 1:
            self.highLightLine(u'Ошибка! Не определен адрес(местоположение) участка')
            return

        attributesLocation = attributesLocation[0]
        xmlLocation = SubElement(xmlParentSection, u'Location')

        CodeOKATO = attributesLocation['okato']
        if not self.checkStringEmpty(CodeOKATO, u'Ошибка! Не определено значение ОКАТО'): 
            return
        xmlCodeOKATO = SubElement(xmlLocation, u'Code_OKATO')
        xmlCodeOKATO.text = CodeOKATO

        CodeKLADR = attributesLocation['kladr']
        if not self.checkStringEmpty(CodeKLADR, u'Ошибка! Не определено значение КЛАДР'): 
            return
        xmlCodeKLADR = SubElement(xmlLocation, u'Code_KLADR')
        xmlCodeKLADR.text = CodeKLADR

        PostalCode = attributesLocation['indeks']
        if PostalCode > ' ':
            xmlPostalCode = SubElement(xmlLocation, u'Postal_Code')
            xmlPostalCode.text = PostalCode
                
        Region = attributesLocation['id_region']
        if not self.checkStringEmpty(Region, u'Ошибка! Не определено значение кода региона'): 
            return
        xmlRegion = SubElement(xmlLocation, u'Region')
        xmlRegion.text = Region

        Other = attributesLocation['inoe']
        if Other > ' ':
            xmlOther = SubElement(xmlLocation, u'Other')
            xmlOther.text = Other
                
        Note = attributesLocation['opisanie']
        if Note > ' ':
            xmlNote = SubElement(xmlLocation, u'Note')
            xmlNote.text = Note

        guidDocument = str(attributesLocation['guid_document'])
        if guidDocument > ' ':
            # xmlDocument = SubElement(xmlLocation, u'Document')
            # self.createDocumentByListGuid(xmlDocument, [guidDocument])
            self.createDocumentByListGuid(xmlLocation, [guidDocument], u'Document')

    '''
    Формирование раздела «Система координат»
    '''
    def createCoordSystems(self):
        if self.rootXml == None:
            self.isError = True    
            return

        if len(self.attributesParcel) > 0:
            self.CoordSystems = SubElement(self.rootXml, u'Coord_Systems')

            CsId = str(self.attributesParcel[0]['id_msk'])
            if not self.checkStringEmpty(CsId, u'Ошибка! Не определен код системы координат, на который ссылаются пространственные объекты'): 
                return
            attributesMsk = attributesByKeys('cl_sistema_koordinat', 'id', [CsId], ['znachenie'])
            if len(attributesMsk) > 0:
                Name = attributesMsk[0]['znachenie']
            else:
                Name = ''

            xmlCoordSystem = SubElement(self.CoordSystems, u'Coord_System', {'Name':Name, 'Cs_Id':('ID_' + CsId)})

            self.listWidgetEvents.addItem(u'Сформирован раздел «Система координат»')                 
        
    '''
    Формирование раздела «Исходные данные»
    '''
    def createInputData(self):
        if self.rootXml == None:
            self.isError = True    
            return

        # Перечень документов, на основании которых подготовлен межевой план
        self.InputData = SubElement(self.rootXml, u'Input_Data')

        xmlDocuments = SubElement(self.InputData, u'Documents')
        self.createDocumentBySection(xmlDocuments, u'Documents')
        if len(xmlDocuments.getchildren()) == 0:
            self.InputData.remove(xmlDocuments)

        # Сведения о геодезической основе, использованной при подготовке межевого плана
        idSection = self.dictXmlIdSection['Geodesic_Bases']
        listGuidGeodesicBase = []
        for every in self.attributesMpSectionData:
            if every['id_section_mp'] == idSection:
                listGuidGeodesicBase.append(str(every['guid_geodesic_base'])) 
            
        attributesGeodesicBase = attributesByKeys('pb_geo_osnova', 'guid', listGuidGeodesicBase, attributesNamesGeodesicBase)
        if len(attributesGeodesicBase) > 0:
            xmlGeodesicBases = SubElement(self.InputData, u'Geodesic_Bases')
            for every in attributesGeodesicBase:
                xmlGeodesicBase = SubElement(xmlGeodesicBases, u'Geodesic_Base')

                PName = every['nazvanie_punkta']
                if not self.checkStringEmpty(PName, u'Ошибка! Не определено название пункта геодезической сети'): 
                    return
                xmlPName = SubElement(xmlGeodesicBase, u'PName')
                xmlPName.text = PName

                PKind = every['tip_znaka']
                if not self.checkStringEmpty(PKind, u'Ошибка! Не определен тип пункта геодезической сети'): 
                    return
                xmlPKind = SubElement(xmlGeodesicBase, u'PKind')
                xmlPKind.text = PKind

                PKlass = every['klass_geo_seti']
                if not self.checkStringEmpty(PKlass, u'Ошибка! Не определен класс геодезической сети'): 
                    return
                xmlPKlass = SubElement(xmlGeodesicBase, u'PKlass')
                xmlPKlass.text = PKlass

                OrdX = every['x']
                if not OrdX > 0: 
                    self.highLightLine(u'Ошибка! Не определена координата Х пункта геодезической сети')
                    return
                OrdX = str(OrdX)
                xmlOrdX = SubElement(xmlGeodesicBase, u'OrdX')
                xmlOrdX.text = OrdX

                OrdY = every['y']
                if not OrdY > 0: 
                    self.highLightLine(u'Ошибка! Не определена координата Y пункта геодезической сети')
                    return
                OrdY = str(OrdY)
                xmlOrdY = SubElement(xmlGeodesicBase, u'OrdY')
                xmlOrdY.text = OrdY

        # Сведения о средствах измерения
        idSection = self.dictXmlIdSection['Means_Survey']
        listGuidMeansSurvey = []
        for every in self.attributesMpSectionData:
            if every['id_section_mp'] == idSection:
                listGuidMeansSurvey.append(str(every['guid_means_survey'])) 
            
        attributesMeansSurvey = attributesByKeys('pb_sredstva_izmereniya', 'guid', listGuidMeansSurvey, attributesNamesMeansSurvey)
        if len(attributesMeansSurvey) > 0:
            xmlMeansSurvey = SubElement(self.InputData, u'Means_Survey')
            for every in attributesMeansSurvey:
                xmlMeanSurvey = SubElement(xmlMeansSurvey, u'Means_Survey')

                Name = every['naimenovanie']
                if not self.checkStringEmpty(Name, u'Ошибка! Не определено название прибора (инструмента, аппаратуры)'): 
                    return
                xmlName = SubElement(xmlMeanSurvey, u'Name')
                xmlName.text = Name

                Certificate = every['sertifikat']
                if Certificate > ' ':
                    xmlCertificate = SubElement(xmlMeanSurvey, u'Certificate')
                    xmlCertificate.text = Certificate

                CertificateVerification = every['svidetelstvo']
                if not self.checkStringEmpty(CertificateVerification, u'Ошибка! Не определены реквизиты свидетельства о поверке прибора (инструмента, аппаратуры)'): 
                    return
                xmlCertificateVerification = SubElement(xmlMeanSurvey, u'Certificate_Verification')
                xmlCertificateVerification.text = CertificateVerification

        # Сведения о наличии зданий, сооружений, объектов незавершенного строительства на исходных или измененных земельных участках
        idSection = self.dictXmlIdSection['Realty']
        listGuidRealty = []
        for every in self.attributesMpSectionData:
            if every['id_section_mp'] == idSection:
                listGuidRealty.append(str(every['guid_oks'])) 
            
        attributesRealty = attributesByKeys('pb_oks', 'guid', listGuidRealty, attributesNamesRealty)
        if len(attributesRealty) > 0:
            xmlRealty = SubElement(self.InputData, u'Realty')
            for every in attributesRealty:
                xmlOKS = SubElement(xmlRealty, u'OKS')

                CadastralNumber = every['cadastral_number']
                if not self.checkStringEmpty(CadastralNumber, u'Ошибка! Не определен кадастровый номер земельного участка с ОКС'): 
                    return
                xmlCadastralNumber = SubElement(xmlOKS, u'CadastralNumber')
                xmlCadastralNumber.text = CadastralNumber

                OtherNumber = every['cadastral_number_other_number']
                if not self.checkStringEmpty(OtherNumber, u'Ошибка! Не определен кадастровый или иной номер ОКС, расположенного на земельном участке'): 
                    return
                xmlOtherNumber = SubElement(xmlOKS, u'CadastralNumber_OtherNumber')
                xmlOtherNumber.text = OtherNumber

                NameOKS = every['name_oks']
                if NameOKS > ' ':
                    xmlNameOKS = SubElement(xmlOKS, u'Name_OKS')
                    xmlNameOKS.text = NameOKS

        # Сведения о частях исходных, измененных или уточняемых земельных участков
        idSection = self.dictXmlIdSection['SubParcels']
        listGuidSubParcels = []
        for every in self.attributesMpSectionData:
            if every['id_section_mp'] == idSection:
                listGuidSubParcels.append(str(every['guid_subparcel'])) 
            
        attributesSubParcels = attributesByKeys('pb_subparcel', 'guid', listGuidSubParcels, attributesNamesSubParcel)
        if len(attributesSubParcels) > 0:
            xmlSubParcels = SubElement(self.InputData, u'SubParcels')
            for every in attributesSubParcels:
                xmlSubParcel = SubElement(xmlSubParcels, u'SubParcel')

                CadastralNumber = every['cadastral_number']
                if not self.checkStringEmpty(CadastralNumber, u'Ошибка! Не определен кадастровый номер ЧЗУ'): 
                    return
                xmlCadastralNumber = SubElement(xmlSubParcel, u'CadastralNumber')
                xmlCadastralNumber.text = CadastralNumber

                NumberRecord = every['number_record']
                if not self.checkStringEmpty(NumberRecord, u'Ошибка! Не определен учётныё номер ЧЗУ'): 
                    return
                xmlNumberRecord = SubElement(xmlSubParcel, u'Number_Record')
                xmlNumberRecord.text = NumberRecord

        self.listWidgetEvents.addItem(u'Сформирован раздел «Исходные данные»')                 
    
    '''    
    Формирование раздела «Сведения о выполненных измерениях и расчетах»
    '''
    def createSurvey(self):
        if self.rootXml == None:
            self.isError = True    
            return

        self.Survey = SubElement(self.rootXml, u'Survey')
        self.createAppliedFile(self.Survey, u'Survey')

        if len(self.Survey.getchildren()) == 0:
            self.rootXml.remove(self.Survey)
        else:
            self.listWidgetEvents.addItem(u'Сформирован раздел «Сведения о выполненных измерениях и расчетах»')                 
        
    '''
    Формирование раздела «Заключение кадастрового инженера»
    '''
    def createConclusion(self):
        if self.rootXml == None:
            self.isError = True    
            return

        Conclusion = self.attributesMp['conclusion']
        if Conclusion > '':
            self.Conclusion = SubElement(self.rootXml, u'Conclusion')
            self.Conclusion.text = Conclusion
        
            self.listWidgetEvents.addItem(u'Сформирован раздел «Заключение кадастрового инженера»')                 
        
    '''
    Формирование раздела «Схема геодезических построений»
    '''
    def createSchemeGeodesicPlotting(self):
        if self.rootXml == None:
            self.isError = True    
            return

        self.SchemeGeodesicPlotting = SubElement(self.rootXml, u'Scheme_Geodesic_Plotting')
        self.createAppliedFile(self.SchemeGeodesicPlotting, u'Scheme_Geodesic_Plotting')

        if len(self.SchemeGeodesicPlotting.getchildren()) == 0:
            self.rootXml.remove(self.SchemeGeodesicPlotting)
        else:
            self.listWidgetEvents.addItem(u'Сформирован раздел «Схема геодезических построений»')                 
        
    '''
    Формирование раздела «Схема расположения земельных участков»
    '''
    def createSchemeDispositionParcels(self):
        if self.rootXml == None:
            self.isError = True    
            return

        self.SchemeDispositionParcels = SubElement(self.rootXml, u'Scheme_Disposition_Parcels')
        self.createAppliedFile(self.SchemeDispositionParcels, u'Scheme_Disposition_Parcels')

        if len(self.SchemeDispositionParcels.getchildren()) == 0:
            self.rootXml.remove(self.SchemeDispositionParcels)
        else:
            self.listWidgetEvents.addItem(u'Сформирован раздел «Схема расположения земельных участков»')                 
        
    '''
    Формирование раздела «Чертеж земельных участков и их частей»
    '''
    def createDiagramParcelsSubParcels(self):
        if self.rootXml == None:
            self.isError = True    
            return

        self.DiagramParcelsSubParcels = SubElement(self.rootXml, u'Diagram_Parcels_SubParcels')
        
        idSection = self.dictXmlIdSection['Diagram_Parcels_SubParcels']
        listGuidFile = []
        for every in self.attributesMpSectionData:
            if every['id_section_mp'] == idSection:
                listGuidFile.append(str(every['guid_applied_file'])) 
            
        attributesFile = attributesByKeys('pb_applied_file', 'guid', listGuidFile, attributesNamesAppliedFile)
        if len(attributesFile) == 0:
            self.highLightLine(u'Ошибка! Не определены файлы раздела «Чертеж земельных участков и их частей»')
            return

        else:
            for every in attributesFile:
                Kind = every['kind']
                if not self.checkStringEmpty(Kind, u'Ошибка! Не определен вид файла по справочнику видов приложенных файлов'): 
                    return

                Name = every['name']
                if not self.checkStringEmpty(Kind, u'Ошибка! Не определено имя приложенного файла'): 
                    return

                xmlAppliedFile = SubElement(self.DiagramParcelsSubParcels, u'AppliedFile', {'Kind':Kind, 'Name':Name})

                absPath = every['path']
                if not self.copyAppliedFile(Name, absPath):
                    self.highLightLine(u'Ошибка! Не выполнено копирование файла ' + absPath)
                    return
        
        self.listWidgetEvents.addItem(u'Сформирован раздел «Чертеж земельных участков и их частей»')                 
        
    '''
    Формирование раздела «Акт согласования местоположения границы земельного участка»
    '''
    def createAgreementDocument(self):
        if self.rootXml == None:
            self.isError = True    
            return

        self.AgreementDocument = SubElement(self.rootXml, u'Agreement_Document')
        self.createAppliedFile(self.AgreementDocument, u'Agreement_Document')

        if len(self.AgreementDocument.getchildren()) == 0:
            self.rootXml.remove(self.AgreementDocument)
        else:
            self.listWidgetEvents.addItem(u'Сформирован раздел «Акт согласования местоположения границы земельного участка»')                 
        
    '''
    Формирование раздела «Абрисы узловых точек границ земельных участков»
    '''
    def createNodalPointSchemes(self):
        if self.rootXml == None:
            self.isError = True    
            return
        
        self.NodalPointSchemes = SubElement(self.rootXml, u'NodalPointSchemes')
        xmlNodalPointScheme = SubElement(self.NodalPointSchemes, u'NodalPointScheme')
        self.createAppliedFile(xmlNodalPointScheme, u'NodalPointSchemes')

        if len(xmlNodalPointScheme.getchildren()) == 0:
            self.NodalPointSchemes.remove(xmlNodalPointScheme)
            self.rootXml.remove(self.NodalPointSchemes)
        else:
            self.listWidgetEvents.addItem(u'Сформирован раздел «Абрисы узловых точек границ земельных участков»')                 
        
    '''
    Формирование раздела «Приложения»
    '''
    def createAppendix(self):
        if self.rootXml == None:
            self.isError = True    
            return

        self.Appendix = SubElement(self.rootXml, u'Appendix')
        self.createDocumentBySection(self.Appendix, u'Appendix')

        if len(self.Appendix.getchildren()) == 0:
            self.rootXml.remove(self.Appendix)
        else:
            self.listWidgetEvents.addItem(u'Сформирован раздел «Приложения»')                 
        
    #
    def createDocumentBySection(self, xmlParentSection, nameSection):
        idSection = self.dictXmlIdSection[nameSection]
        listGuidDocument = []
        for every in self.attributesMpSectionData:
            if every['id_section_mp'] == idSection:
                listGuidDocument.append(str(every['guid_document'])) 
            
        self.createDocumentByListGuid(xmlParentSection, listGuidDocument, u'Document')

    #
    def createDocumentByListGuid(self, xmlParentSection, listGuidDocument, nameXml):
        attributesDocument = attributesByKeys('pb_document', 'guid', listGuidDocument, attributesNamesDocument)
        if len(attributesDocument) > 0:
            for every in attributesDocument:
                xmlDocument = SubElement(xmlParentSection, nameXml)
                CodeDocument = every['code_document']
                if not self.checkStringEmpty(CodeDocument, u'Ошибка! Не определен код документа'): 
                    return
                xmlCodeDocument = SubElement(xmlDocument, u'Code_Document')
                xmlCodeDocument.text = CodeDocument

                Name = every['name']
                if Name > ' ':
                    xmlName = SubElement(xmlDocument, u'Name')
                    xmlName.text = Name
                Series = every['series']
                if Series > ' ':
                    xmlSeries = SubElement(xmlDocument, u'Series')
                    xmlSeries.text = Series
                
                Number = every['number_doc']
                if not self.checkStringEmpty(Number, u'Ошибка! Не определен номер документа'): 
                    return
                xmlNumber = SubElement(xmlDocument, u'Number')
                xmlNumber.text = Number
                Date = every['date'].toString('yyyy-MM-dd')
                if Date != '2000-01-01':
                    xmlDate = SubElement(xmlDocument, u'Date')
                    xmlDate.text = Date
                
                IssueOrgan = every['issue_organ']
                if IssueOrgan > ' ':
                    xmlIssueOrgan = SubElement(xmlDocument, u'IssueOrgan')
                    xmlIssueOrgan.text = IssueOrgan
                
                NumberReg = every['number_reg']
                if NumberReg > ' ':
                    xmlNumberReg = SubElement(xmlDocument, u'NumberReg')
                    xmlNumberReg.text = NumberReg
                
                DateReg = every['date_reg'].toString('yyyy-MM-dd')
                if DateReg != '2000-01-01':
                    xmlDateReg = SubElement(xmlDocument, u'DateReg')
                    xmlDateReg.text = DateReg
                
                DurationStarted = every['duration_started'].toString('yyyy-MM-dd')
                DurationStopped = every['duration_stopped'].toString('yyyy-MM-dd')
                if DurationStarted != '2000-01-01':
                    xmlDuration = SubElement(xmlDocument, u'Duration')
                    xmlStarted = SubElement(xmlDuration, u'Started')
                    xmlStarted.text = DurationStarted
                    if DurationStopped != '2000-01-01':
                        xmlStopped = SubElement(xmlDuration, u'Stopped')
                        xmlStopped.text = DurationStopped
                
                else:
                    if DurationStopped != '2000-01-01':
                        xmlDuration = SubElement(xmlDocument, u'Duration')
                        xmlStopped = SubElement(xmlDuration, u'Stopped')
                        xmlStopped.text = DurationStopped

                Register = every['register']
                if Register > ' ':
                    xmlRegister = SubElement(xmlDocument, u'Register')
                    xmlRegister.text = Register
                
                Desc = every['desc_doc']
                if Desc > ' ':
                    xmlDesc = SubElement(xmlDocument, u'Desc')
                    xmlDesc.text = Desc
                
                IssueOrganCode = every['issue_organ_code']
                if IssueOrganCode > ' ':
                    xmlIssueOrganCode = SubElement(xmlDocument, u'IssueOrgan_Code')
                    xmlIssueOrganCode.text = IssueOrganCode
    
                guidDocument = str(every['guid'])
                attributesDocumentAppliedFile = attributesByKeys('pb_document_applied_file', 'guid_document', [guidDocument], attributesNamesDocumentAppliedFile)
                if len(attributesDocumentAppliedFile) > 0:
                    xmlAppliedFiles = SubElement(xmlDocument, u'AppliedFiles')
                    for every2 in attributesDocumentAppliedFile:
                        guidFile = str(every2['guid_file'])
                        attributesFile = attributesByKeys('pb_applied_file', 'guid', [guidFile], attributesNamesAppliedFile)
                        if len(attributesFile) > 0:
                            self.createDocumentAppliedFile(xmlAppliedFiles, attributesFile)
                        else:
                            self.highLightLine(u'Ошибка! Не определён идентификатор приложенного файла документа')
                            return

    #
    def createDocumentAppliedFile(self, xmlParentSection, attributesFile):
        for every in attributesFile:
            Kind = every['kind']
            if not self.checkStringEmpty(Kind, u'Ошибка! Не определен вид файла документа по справочнику видов приложенных файлов'): 
                return

            Name = every['name']
            if not self.checkStringEmpty(Kind, u'Ошибка! Не определено имя приложенного файла документа'): 
                return
                                
            xmlAppliedFile = SubElement(xmlParentSection, u'AppliedFile', {'Kind':Kind, 'Name':Name})

            absPath = every['path']
            if not self.copyAppliedFile(Name, absPath):
                self.highLightLine(u'Ошибка! Не выполнено копирование файла ' + absPath)
                return

    def createAppliedFile(self, xmlParentSection, nameSection):
        idSection = self.dictXmlIdSection[nameSection]
        listGuidFile = []
        for every in self.attributesMpSectionData:
            if every['id_section_mp'] == idSection:
                listGuidFile.append(str(every['guid_applied_file'])) 
            
        attributesFile = attributesByKeys('pb_applied_file', 'guid', listGuidFile, attributesNamesAppliedFile)
        if len(attributesFile) > 0:
            for every in attributesFile:
                Kind = every['kind']
                if not self.checkStringEmpty(Kind, u'Ошибка! Не определен вид файла по справочнику видов приложенных файлов'): 
                    return

                Name = every['name']
                if not self.checkStringEmpty(Kind, u'Ошибка! Не определено имя приложенного файла'): 
                    return

                xmlAppliedFile = SubElement(xmlParentSection, u'AppliedFile', {'Kind':Kind, 'Name':Name})

                absPath = every['path']
                if not self.copyAppliedFile(Name, absPath):
                    self.highLightLine(u'Ошибка! Не выполнено копирование файла ' + absPath)
                    return

    def copyAppliedFile(self, fileName, absPath):
        fileName = unicode(fileName)
        absPath  = unicode(absPath)
        if 'Windows' in platform.system():
            if not os.path.exists(absPath.encode('cp1251')):
                self.highLightLine(u'Ошибка! Не найден файл ' + unicode(absPath))
                return False
            
            else:
                srcName = absPath.encode('cp1251')
                dstName = self.tmpDirectoryXml.encode('cp1251') + '/' + fileName.encode('cp1251')
                try:
                    shutil.copy2(srcName, dstName)
                    return True
                
                except (IOError, os.error):
                    self.highLightLine(u'Ошибка! Системная ошибка копирования файла ' + unicode(absPath))
                    return False

        else:
            if not os.path.exists(absPath):
                self.highLightLine(u'Ошибка! Не найден файл ' + unicode(absPath))
                return False

            else:
                srcName = absPath
                dstName = self.tmpDirectoryXml + '/' + fileName
                try:
                    shutil.copy2(srcName, dstName)
                    return True
                
                except (IOError, os.error):
                    self.highLightLine(u'Ошибка! Системная ошибка копирования файла ' + unicode(absPath))
                    return False

    '''
    Выделение жирным шрифтом сообщения об ошибке
    '''
    def highLightLine(self, t):
        if t[:6] == u'Ошибка':
            self.isError = True

        itemInsert = QListWidgetItem(t)
        fontItem = itemInsert.font()
        fontItem.setBold(True)
        itemInsert.setFont(fontItem)     
        self.listWidgetEvents.addItem(itemInsert)

        self.progressBar.setRange(0, 100)
        self.progressBar.setValue(0)

    '''
    Проверка символьной переменной на пустоту
    '''
    def checkStringEmpty(self, s, errorMessage):
        if not s > ' ': 
            self.highLightLine(errorMessage)
            return False

        else:
            return True

    #
    def checkRequiredSection(self, listRequiredSection):
        for every in listRequiredSection:
            if every == None:
                return False
    
            else:
                listChildren = every.getchildren()
                if len(listChildren) == 0:
                    self.highLightLine(u'Ошибка! Отсутствуют элементы раздела ' + every.tag)
                    return False
                
        return True
    
    '''
    Проверка списка точек на условие обхода по часовой стрелке. 
    inClockwiseDirection():bool
    a:list
    '''
    def inClockwiseDirection(self, a):
        l = len(a)
        area = 0
        for i in range(l-1): 
            area += a[i][0]*a[i+1][1] - a[i+1][0]*a[i][1]
        area = area / 2
        if area > 0: 
            return False
        else:
            return True

    #
    def closeDialog(self):
        self.close()

#        QMessageBox.information(self.iface.mainWindow(), 'test', str())
