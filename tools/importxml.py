# -*- coding: utf-8 -*-
'''
/***************************************************************************
 importXML for openland (cadastral engineer tools)
 copyright            : (C) 2012 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from qgis.gui import *
from importxml_ui import Ui_ImportXMLDialog
from datetime import *
from common import *

import xml.etree.ElementTree as ET
import uuid
import os.path, sys
import platform

class ImportXML(QDialog, Ui_ImportXMLDialog):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        self.currentPath = ''
        self.fileName = ''
        self.layerKv = get_vector_layer_by_name(gln['ln_kvartal'])
        self.layerUc = get_vector_layer_by_name(gln['ln_uchastok'])
        self.layerBr = get_vector_layer_by_name(gln['ln_granica'])
        self.layerPn = get_vector_layer_by_name(gln['ln_tochka'])
        self.layerPlo = get_vector_layer_by_name(gln['pb_ploshad'])
        self.layerAdr = get_vector_layer_by_name(gln['pb_adres'])
        self.layerPP = get_vector_layer_by_name(gln['pb_parcel_parcel'])

        self.codeTypeXml = ''
        self.versionXml = ''
        self.isErrorManyContours = False

        QObject.connect(self.pushButtonFileXML, SIGNAL("clicked()"), self.openXML)
        QObject.connect(self.pushButtonShowXML, SIGNAL("clicked()"), self.showXML)
        QObject.connect(self.pushButtonStartImport, SIGNAL("clicked()"), self.startImport)
        QObject.connect(self.pushButtonCloseDialog, SIGNAL("clicked()"), self.closeDialog)

################################################################################
    def toPrepare(self):
        self.idMSK = idCurrentMSK()

    def openXML(self):
        fileName = QFileDialog.getOpenFileName(self, u'Укажите XML файл для импорта', self.currentPath, u'XML файлы(*.xml *.XML)')
        
        if not fileName == None:
            self.currentPath = os.path.dirname(unicode(fileName))
            self.fileName = fileName
            self.lineEditFileXML.setText(self.fileName)
            self.listWidgetEvents.addItem(u'Открыт файл ' + self.fileName)                 
            self.treeWidget.clear()

    def showXML(self):
        if len(self.fileName) < 1:
            self.highLightLine(u'Ошибка импорта. Файл XML не указан!')                 
            return

        # self.iface.setCursor(QtGui.QCursor(QtCore.Qt.BusyCursor))
        # self.iface.setCursor(QtGui.QCursor(QtCore.Qt.ArrowCursor))
        
        self.listWidgetEvents.addItem(u'Начало обработки данных для просмотра из XML файла ' + self.fileName)                 
        if 'Windows' in platform.system():
            xmlTree = ET.parse(unicode(self.fileName).encode('cp1251'))
        else:
            xmlTree = ET.parse(self.fileName)

        root = xmlTree.getroot()
        tree = self.treeWidget
        tree.clear()

        eDocument = root.find('eDocument')
        if eDocument == None:
            self.codeTypeXml = root.get('CodeType')
            self.versionXml = root.get('Version')
        else:
            self.codeTypeXml = eDocument.get('CodeType')
            self.versionXml = eDocument.get('Version')
        
        Cadastral_Block = None
        Parcels = None
        
        # КПТ
        if self.codeTypeXml == '101': 
            if self.versionXml == '08':
                Cadastral_Block = root.find('Package/Cadastral_Blocks/Cadastral_Block')
            else:
                Cadastral_Block = root.find('Package/Federal/Cadastral_Regions/Cadastral_Region/Cadastral_Districts/Cadastral_District/Cadastral_Blocks/Cadastral_Block')
        
        #КВЗУ
        elif self.codeTypeXml == '114': 
            if self.versionXml == '05':
                Cadastral_Block = root.find('Package/Parcels/Parcel/CadastralBlock')
            else:
                Cadastral_Block = root.find('Package/Federal/Cadastral_Regions/Cadastral_Region/Cadastral_Districts/Cadastral_District/Cadastral_Blocks/Cadastral_Block')
        
        else:
            return

        if (Cadastral_Block != None):
            if (self.codeTypeXml == '114') and (self.versionXml == '05'):
                tree.addTopLevelItem(QTreeWidgetItem([u'Квартал', Cadastral_Block.text]))
            else:
                tree.addTopLevelItem(QTreeWidgetItem([u'Квартал', Cadastral_Block.get('CadastralNumber')]))
        else:
            return

        font = tree.topLevelItem(0).font(0)
        font.setBold(True)
        tree.topLevelItem(0).setFont(0, font)     
        tree.topLevelItem(0).setFont(1, font)     

        if (self.codeTypeXml == '114') and (self.versionXml == '05'):
            Parcels = root.find('Package/Parcels')
        else:
            Parcels = Cadastral_Block.find('Parcels')

        if (Parcels == None):
            return
        parcelCount = len(Parcels.findall('Parcel'))
        
        self.progressBar.setRange(0, parcelCount)
        self.progressBar.setValue(0)                  

        for Parcel in Parcels.iter('Parcel'):
            tree.addTopLevelItem(QTreeWidgetItem([u'Земельный участок']))
            curItemParcel = tree.topLevelItem((tree.topLevelItemCount() - 1))
            curItemParcel.addChild(QTreeWidgetItem([u'Кадастровый номер', Parcel.get('CadastralNumber')]))

            Note = Parcel.find('Location/Address/Note')
            if (Note != None):
                curItemParcel.addChild(QTreeWidgetItem([u'Адрес', Note.text]))

            Rights = Parcel.find('Rights')
            if (Rights != None):
                curItemParcel.addChild(QTreeWidgetItem([u'Права']))
                curItemRights = curItemParcel.child((curItemParcel.childCount() - 1))
                for Right in Rights.iter('Right'):
                    Name = Right.find('Name')
                    if (Name != None):
                        curItemRights.addChild(QTreeWidgetItem([u'Право', Name.text]))

                    FIO = Right.find('Owner/Person/FIO')
                    if (FIO != None):
                        tList = []
                        tList.append(u'Правообладатель')
                        Patronymic = FIO.find('Patronymic')
                        if (Patronymic != None):
                            tList.append(FIO.find('Surname').text +' '+ FIO.find('First').text +' '+ Patronymic.text)
                        else:
                            tList.append(FIO.find('Surname').text +' '+ FIO.find('First').text)
                        curItemRights.child(curItemRights.childCount() - 1).addChild(QTreeWidgetItem(tList))
            self.doAreaShow(Parcel, curItemParcel)

            if (Parcel.find('SubParcels') != None):
                curItemParcel.addChild(QTreeWidgetItem([u'Части']))
                curItemSubs = curItemParcel.child((curItemParcel.childCount() - 1))
                SubParcels = Parcel.find('SubParcels')
                for SubParcel in SubParcels.iter('SubParcel'):

                    # Объект, входящий в состав единого землепользования
                    Object_Entry = SubParcel.find('Object_Entry')
                    if Object_Entry != None:
                        CadastralNumber = Object_Entry.get('CadastralNumber') 
                        if CadastralNumber > '0':
                            curItemSubs.addChild(QTreeWidgetItem([u'Объект ЕЗ', CadastralNumber]))
                        else:
                            curItemSubs.addChild(QTreeWidgetItem([u'Объект ЕЗ']))

                    # Сведения о частях, сформированных в связи с наложением обременений
                    Encumbrance = SubParcel.find('Encumbrance')
                    if (Encumbrance != None):
                        Name = Encumbrance.find('Name')
                        if Name != None:
                            curItemSubs.addChild(QTreeWidgetItem([u'ЧЗУ обременение', Name.text]))
                        else:
                            Type = Encumbrance.find('Type')
                            if (Type != None):
                                listAttributes = attributesByKeys('cl_obremeneniya', 'id', [Type.text], ['znachenie'])
                                typeValue = listAttributes[0]['znachenie']
                                curItemSubs.addChild(QTreeWidgetItem([u'ЧЗУ обременение', typeValue]))
                            else:
                                curItemSubs.addChild(QTreeWidgetItem([u'ЧЗУ обременение']))

                    curItemSub = curItemSubs.child((curItemSubs.childCount() - 1))

                    if curItemSub != None:
                        self.doAreaShow(SubParcel, curItemSub)
                        self.doPointsShow(SubParcel, curItemSub)

            if (Parcel.find('Contours') != None):
                curItemParcel.addChild(QTreeWidgetItem([u'Контуры']))
                curItemContours = curItemParcel.child((curItemParcel.childCount() - 1))
                Contours = Parcel.find('Contours')
                for Contour in Contours.iter('Contour'):
                    if ((self.codeTypeXml == '114') and (self.versionXml == '05')) or ((self.codeTypeXml == '101') and (self.versionXml == '08')):
                        Number = Contour.get('Number_Record')
                    else:
                        Number = Contour.get('Number_PP')

                    curItemContours.addChild(QTreeWidgetItem([u'Контур', Number]))
                    curItemContour = curItemContours.child((curItemContours.childCount() - 1))

                    self.doAreaShow(Contour, curItemContour)
                    self.doPointsShow(Contour, curItemContour)
            
            else:
                self.doPointsShow(Parcel, curItemParcel)

            msk = root.find('.//Coord_System')
            curItemParcel.addChild(QTreeWidgetItem([u'Система координат', msk.get('Name')]))
            self.progressBar.setValue(tree.topLevelItemCount() - 1)

        self.listWidgetEvents.addItem(u'Окончание обработки данных для просмотра из XML файла ' + self.fileName)                 
        del root
        del xmlTree

################################################################################
    
    def startImport(self):
        if len(self.fileName) < 1:
            self.highLightLine(u'Ошибка импорта. Файл XML не указан!')                 
            return
            
        self.progressBar.setRange(0, 0)

        self.listWidgetEvents.addItem('')                 
        self.listWidgetEvents.addItem(datetime.now().strftime('%Y-%m-%d %H:%M:%S'))                 
        self.listWidgetEvents.addItem(u'Начало импорта данных из XML файла ' + self.fileName)                 

        if 'Windows' in platform.system():
            xmlTree = ET.parse(unicode(self.fileName).encode('cp1251'))
        else:
            xmlTree = ET.parse(self.fileName)

        root = xmlTree.getroot()

        eDocument = root.find('eDocument')
        if eDocument == None:
            self.codeTypeXml = root.get('CodeType')
            self.versionXml = root.get('Version')
        else:
            self.codeTypeXml = eDocument.get('CodeType')
            self.versionXml = eDocument.get('Version')
        
        Cadastral_Block = None
        Parcels = None
        
        # КПТ
        if self.codeTypeXml == '101': 
            if self.versionXml == '08':
                Cadastral_Block = root.find('Package/Cadastral_Blocks/Cadastral_Block')
            else:
                Cadastral_Block = root.find('Package/Federal/Cadastral_Regions/Cadastral_Region/Cadastral_Districts/Cadastral_District/Cadastral_Blocks/Cadastral_Block')
        
        #КВЗУ
        elif self.codeTypeXml == '114': 
            if self.versionXml == '05':
                Cadastral_Block = root.find('Package/Parcels/Parcel/CadastralBlock')
            else:
                Cadastral_Block = root.find('Package/Federal/Cadastral_Regions/Cadastral_Region/Cadastral_Districts/Cadastral_District/Cadastral_Blocks/Cadastral_Block')
        
        else:
            return

        cadastralBlock = ''
        if (Cadastral_Block != None):
            if (self.codeTypeXml == '114') and (self.versionXml == '05'):
                cadastralBlock = Cadastral_Block.text
            else:
                cadastralBlock = Cadastral_Block.get('CadastralNumber')
        else:
            return

        if cadastralBlock > ' ':
            searchCondition = '\"kn\" = \'' + cadastralBlock + '\''
            listIdBlock = attributesBySearchCondition('ln_kvartal', searchCondition, ['id'])
            if len(listIdBlock) == 1:
                id_kvartal = int(listIdBlock[0]['id'])
            else:
                id_kvartal = -1

        if (self.codeTypeXml == '114') and (self.versionXml == '05'):
            Parcels = root.find('Package/Parcels')
        else:
            Parcels = Cadastral_Block.find('Parcels')
        
        if (Parcels == None):
            return

        allFeatIds = []
        for Parcel in Parcels.iter('Parcel'):
            kn = Parcel.get('CadastralNumber')
            ucGuid = str(uuid.uuid4())
            p = kn.find(':', 6)
            if (p > 0):
                oboznachenie_na_plane =  kn[p:]
            else:
                oboznachenie_na_plane = ''

            vid_uchastka = Parcel.get('Name')
            status_uchastka = Parcel.get('State')
            
            id_vid_ploshadi = ''
            ploshad = 0
            id_edinicy_izmereniya = ''
            pogreshnost_izmereniya = 0

            if ((self.codeTypeXml == '114') and (self.versionXml == '05')) or ((self.codeTypeXml == '101') and (self.versionXml == '08')):
                Area = Parcel.find('Area')
            else:
                Area = Parcel.find('Areas/Area')

            if (Area != None):  
                AreaCode = Area.find('AreaCode')
                if (AreaCode != None): id_vid_ploshadi = AreaCode.text

                AreaValue = Area.find('Area')
                if (AreaValue != None): ploshad = AreaValue.text

                Unit = Area.find('Unit')
                if (Unit != None): id_edinicy_izmereniya = Unit.text

                Innccuracy = Area.find('Innccuracy')
                if (Innccuracy != None): pogreshnost_izmereniya = Innccuracy.text
                    
            id_region = ''
            opisanie = ''
            codeOkato = ''
            codeKladr = ''
            Address = Parcel.find('Location/Address')
            if (Address != None):  

                Code_OKATO = Address.find('Code_OKATO')
                if (Code_OKATO != None): codeOkato = Code_OKATO.text

                Code_KLADR = Address.find('Code_KLADR')
                if (Code_KLADR != None): codeKladr = Code_KLADR.text
                
                Region = Address.find('Region')
                if (Region != None): id_region = Region.text

                Note = Address.find('Note')
                if (Note != None): opisanie = Note.text
            
            Category = Parcel.find('Category')
            if (Category != None): kategoriya = Category.get('Category')

            Utilization = Parcel.find('Utilization')
            if (Utilization != None):
                ispolzovanie = Utilization.get('Kind')
                ispolzovanie_dok = Utilization.get('ByDoc')

            Contours = Parcel.find('Contours')
            SubParcels = Parcel.find('SubParcels')

            # Многоконтурный ЗУ
            if (Contours != None):                                              
                feat = QgsFeature()
                feat.initAttributes(len(self.layerUc.dataProvider().attributeIndexes()))
                feat.setGeometry(QgsGeometry())
                feat.setAttribute(self.layerUc.fieldNameIndex('kn'), kn)
                if (id_kvartal > 0):
                    feat.setAttribute(self.layerUc.fieldNameIndex('id_kvartal'), id_kvartal)
                feat.setAttribute(self.layerUc.fieldNameIndex('id_vid_uchastka'), vid_uchastka)
                feat.setAttribute(self.layerUc.fieldNameIndex('id_status_uchastka'), status_uchastka)
                feat.setAttribute(self.layerUc.fieldNameIndex('id_kategoriya'), kategoriya)
                feat.setAttribute(self.layerUc.fieldNameIndex('id_ispolzovanie'), ispolzovanie)
                feat.setAttribute(self.layerUc.fieldNameIndex('oboznachenie_na_plane'), oboznachenie_na_plane)
                feat.setAttribute(self.layerUc.fieldNameIndex('ispolzovanie_dokument'), ispolzovanie_dok)
                feat.setAttribute(self.layerUc.fieldNameIndex('guid'), ucGuid)
                feat.setAttribute(self.layerUc.fieldNameIndex('id_msk'), self.idMSK)
                feat.setAttribute(self.layerUc.fieldNameIndex('area_in_gkn'), ploshad)

                self.layerUc.dataProvider().addFeatures([feat])
                idu = valueByFieldValue('ln_uchastok', 'id', 'i', 'guid', ucGuid, 's')
                if idu > 0:
                    # Площадь
                    featPlo = QgsFeature()
                    featPlo.initAttributes(len(self.layerPlo.dataProvider().attributeIndexes()))
                    featPlo.setAttribute(self.layerPlo.fieldNameIndex('id_uchastok'), idu)
                    featPlo.setAttribute(self.layerPlo.fieldNameIndex('id_vid_ploshadi'), id_vid_ploshadi)
                    featPlo.setAttribute(self.layerPlo.fieldNameIndex('ploshad'), ploshad)
                    featPlo.setAttribute(self.layerPlo.fieldNameIndex('id_edinicy_izmereniya'), id_edinicy_izmereniya)
                    featPlo.setAttribute(self.layerPlo.fieldNameIndex('pogreshnost_izmereniya'), pogreshnost_izmereniya)

                    self.layerPlo.dataProvider().addFeatures([featPlo])
                    self.listWidgetEvents.addItem(u'Импортировано значение площади участка с кадастровым номером ' + kn)                 
                    del featPlo

                    # Адрес
                    featAdr = QgsFeature()
                    featAdr.initAttributes(len(self.layerAdr.dataProvider().attributeIndexes()))
                    featAdr.setAttribute(self.layerAdr.fieldNameIndex('komanda_serveru'), 'id_uch=' + str(idu))
                    featAdr.setAttribute(self.layerAdr.fieldNameIndex('okato'), codeOkato)
                    featAdr.setAttribute(self.layerAdr.fieldNameIndex('kladr'), codeKladr)
                    featAdr.setAttribute(self.layerAdr.fieldNameIndex('id_region'), id_region)
                    featAdr.setAttribute(self.layerAdr.fieldNameIndex('opisanie'), opisanie)
                                    
                    self.layerAdr.dataProvider().addFeatures([featAdr])
                    self.listWidgetEvents.addItem(u'Импортировано местоположение участка с кадастровым номером ' + kn)                 
                    del featAdr
                    # Для каждого контура    
                    for Contour in Contours.iter('Contour'):               
                        ctGuid = str(uuid.uuid4())

                        if ((self.codeTypeXml == '114') and (self.versionXml == '05')) or ((self.codeTypeXml == '101') and (self.versionXml == '08')):
                            nomer_kontura = Contour.get('Number_Record')
                        else:
                            nomer_kontura = Contour.get('Number_PP')
                        if (nomer_kontura > '0'):
                            p = kn.find(':', 6)
                            if (p > 0):
                                oboznachenie_na_plane =  kn[p:] + '(' + nomer_kontura + ')'
                            else:
                                oboznachenie_na_plane = ''
                             
                        else:
                            oboznachenie_na_plane = ''

                        if ((self.codeTypeXml == '114') and (self.versionXml == '05')) or ((self.codeTypeXml == '101') and (self.versionXml == '08')):
                            Area = Contour.find('Area')
                        else:
                            Area = Contour.find('Areas/Area')

                        if (Area != None):  
                            AreaCode = Area.find('AreaCode')
                            if (AreaCode != None): id_vid_ploshadi = AreaCode.text
                            else: id_vid_ploshadi = ''

                            AreaValue = Area.find('Area')
                            if (AreaValue != None): ploshad = AreaValue.text
                            else: ploshad = ''

                            Unit = Area.find('Unit')
                            if (Unit != None): id_edinicy_izmereniya = Unit.text
                            else: id_edinicy_izmereniya = ''

                            Innccuracy = Area.find('Innccuracy')
                            if (Innccuracy != None): pogreshnost_izmereniya = Innccuracy.text
                            else: pogreshnost_izmereniya = ''

                        geomNew = None
                        pointsAll = []

                        Entity_Spatial = Contour.find('Entity_Spatial')

                        if (Entity_Spatial != None):
                            [pointsAll, geomNew] = self.doFillPointsAllPlusNewGeometry(Entity_Spatial)

                        feat = QgsFeature()
                        feat.initAttributes(len(self.layerUc.dataProvider().attributeIndexes()))
                        if (geomNew != None) and geomNew.isGeosValid():
                            feat.setGeometry(geomNew)
                            feat.setAttribute(self.layerUc.fieldNameIndex('kn'), kn + '(' + nomer_kontura +')')
                            feat.setAttribute(self.layerUc.fieldNameIndex('id_kategoriya'), kategoriya)
                            feat.setAttribute(self.layerUc.fieldNameIndex('id_vid_uchastka'), gv['oneContourCode'])
                            feat.setAttribute(self.layerUc.fieldNameIndex('nomer_kontura'), nomer_kontura)
                            feat.setAttribute(self.layerUc.fieldNameIndex('oboznachenie_na_plane'), oboznachenie_na_plane)
                            feat.setAttribute(self.layerUc.fieldNameIndex('guid'), ctGuid)
                            feat.setAttribute(self.layerUc.fieldNameIndex('id_msk'), self.idMSK)
                            feat.setAttribute(self.layerUc.fieldNameIndex('area_in_gkn'), ploshad)
                            
                            self.layerUc.dataProvider().addFeatures([feat])

                        idct = valueByFieldValue('ln_uchastok', 'id', 'i', 'guid', ctGuid, 's')
                        if idct > 0:
                            feat = QgsFeature()
                            feat.initAttributes(len(self.layerPP.dataProvider().attributeIndexes()))
                            feat.setAttribute(self.layerPP.fieldNameIndex('id_parent'), idu)
                            feat.setAttribute(self.layerPP.fieldNameIndex('id_children'), idct)
                            self.layerPP.dataProvider().addFeatures([feat])

                            self.doAddPointsAndBorders(pointsAll, idct)                            
                            self.listWidgetEvents.addItem(u'Импортированы границы и точки контура ' + nomer_kontura)                 
                            if self.isErrorManyContours:
                                self.highLightLine(u'Внимание! Более одного контура для номера' + nomer_kontura)                 
                                self.isErrorManyContours = False

                            # Площадь
                            featPlo = QgsFeature()
                            featPlo.initAttributes(len(self.layerPlo.dataProvider().attributeIndexes()))
                            featPlo.setAttribute(self.layerPlo.fieldNameIndex('id_uchastok'), idct)
                            featPlo.setAttribute(self.layerPlo.fieldNameIndex('id_vid_ploshadi'), id_vid_ploshadi)
                            featPlo.setAttribute(self.layerPlo.fieldNameIndex('ploshad'), ploshad)
                            featPlo.setAttribute(self.layerPlo.fieldNameIndex('id_edinicy_izmereniya'), id_edinicy_izmereniya)
                            featPlo.setAttribute(self.layerPlo.fieldNameIndex('pogreshnost_izmereniya'), pogreshnost_izmereniya)

                            self.layerPlo.dataProvider().addFeatures([featPlo])
                            self.listWidgetEvents.addItem(u'Импортирована площадь контура ' + nomer_kontura + u' ЗУ с кадастровым номером ' + kn)                 
                            del featPlo

                            if (geomNew != None) and geomNew.isGeosValid():
                                allFeatIds.append(idct)

                        else:
                            self.highLightLine(u'Ошибка контура ' + nomer_kontura + u' ЗУ с кадастровым номером ' + kn)                 

            # ЕЗУ и ЧЗУ
            elif (SubParcels != None):                                          
                isOnlyUpdateEZ = False
                geomNew   = None
                pointsAll = []

                Entity_Spatial = Parcel.find('Entity_Spatial')

                if (Entity_Spatial != None):
                    [pointsAll, geomNew] = self.doFillPointsAllPlusNewGeometry(Entity_Spatial)
            
                if vid_uchastka == gv['unitedParcelCode']:
                    searchCondition = '\"kn\" = \'' + kn + '\''
                    attributesEZ = attributesBySearchCondition('ln_uchastok', 
                                                                searchCondition, 
                                                                ['id', 'kn'])
                    listNames = []
                    listValues = []
                    if len(attributesEZ) == 1:
                        idu = int(attributesEZ[0]['id'])
                        self.listWidgetEvents.addItem(u'Найдено ЕЗ с КН ' + kn)

                        listNames = ['id_status_uchastka', 'id_kategoriya', 
                                     'id_ispolzovanie', 'ispolzovanie_dokument', 
                                     'oboznachenie_na_plane', 'area_in_gkn']
                        listValues.append(status_uchastka)
                        listValues.append(kategoriya)
                        listValues.append(ispolzovanie)
                        listValues.append(ispolzovanie_dok)
                        listValues.append(oboznachenie_na_plane)
                        listValues.append(ploshad)

                        if updateFeature('ln_uchastok', idu, listNames, listValues):
                            isOnlyUpdateEZ = True
                            self.listWidgetEvents.addItem(u'Обновлены атрибуты ЕЗ с КН ' + kn)
                        else:
                            self.listWidgetEvents.addItem(u'Ошибка обновления атрибутов ЕЗ с КН ' + kn)

                    else:

                        if (id_kvartal > 0):
                            listNames.append('id_kvartal')
                            listValues.append(id_kvartal)

                        listNames.append('kn')
                        listNames.append('id_vid_uchastka')
                        listNames.append('id_status_uchastka')
                        listNames.append('id_kategoriya')
                        listNames.append('id_ispolzovanie')
                        listNames.append('ispolzovanie_dokument')
                        listNames.append('oboznachenie_na_plane')
                        listNames.append('guid')
                        listNames.append('id_msk')
                        listNames.append('area_in_gkn')
                        listNames.append('geom')

                        listValues.append(kn)
                        listValues.append(vid_uchastka)
                        listValues.append(status_uchastka)
                        listValues.append(kategoriya)
                        listValues.append(ispolzovanie)
                        listValues.append(ispolzovanie_dok)
                        listValues.append(oboznachenie_na_plane)
                        listValues.append(ucGuid)
                        listValues.append(self.idMSK)
                        listValues.append(ploshad)
                        
                        if (geomNew == None) or not geomNew.isGeosValid():
                            listValues.append(QgsGeometry())
                        else:
                            listValues.append(geomNew)

                        if insertFeatures('ln_uchastok', listNames, [listValues]):
                            idu = valueByFieldValue('ln_uchastok', 'id', 'i', 'guid', ucGuid, 's')
                            if idu > 0:
                                self.listWidgetEvents.addItem(u'Импортирован участок с кадастровым номером ' + kn)                 
                                if self.isErrorManyContours:
                                    self.highLightLine(u'Внимание! Более одного контура для ' + kn)                 
                                    self.isErrorManyContours = False

                else:
                    listNames = []
                    listValues = []

                    if (id_kvartal > 0):
                        listNames.append('id_kvartal')
                        listValues.append(id_kvartal)

                    listNames.append('kn')
                    listNames.append('id_vid_uchastka')
                    listNames.append('id_status_uchastka')
                    listNames.append('id_kategoriya')
                    listNames.append('id_ispolzovanie')
                    listNames.append('ispolzovanie_dokument')
                    listNames.append('oboznachenie_na_plane')
                    listNames.append('guid')
                    listNames.append('id_msk')
                    listNames.append('area_in_gkn')
                    listNames.append('geom')

                    listValues.append(kn)
                    listValues.append(vid_uchastka)
                    listValues.append(status_uchastka)
                    listValues.append(kategoriya)
                    listValues.append(ispolzovanie)
                    listValues.append(ispolzovanie_dok)
                    listValues.append(oboznachenie_na_plane)
                    listValues.append(ucGuid)
                    listValues.append(self.idMSK)
                    listValues.append(ploshad)

                    if (geomNew == None) or not geomNew.isGeosValid():
                        listValues.append(QgsGeometry())
                    else:
                        listValues.append(geomNew)
                        
                    if insertFeatures('ln_uchastok', listNames, [listValues]):
                        idu = valueByFieldValue('ln_uchastok', 'id', 'i', 'guid', ucGuid, 's')
                        if idu > 0:
                            self.listWidgetEvents.addItem(u'Импортирован участок с кадастровым номером ' + kn)                 
                
                if idu > 0:
                    if (geomNew != None) and geomNew.isGeosValid():
                        allFeatIds.append(idu)

                    if len(pointsAll) > 0:
                        self.doAddPointsAndBorders(pointsAll, idu)                            
                        self.listWidgetEvents.addItem(u'Импортированы границы и точки участка с кадастровым номером ' + kn)                 
                        
                    # Площадь
                    listNames = []
                    listValues = []
                    listNames = ['id_uchastok', 'id_vid_ploshadi', 'ploshad', 
                                 'id_edinicy_izmereniya', 'pogreshnost_izmereniya']
                    listValues.append(idu)
                    listValues.append(id_vid_ploshadi)
                    listValues.append(ploshad)
                    listValues.append(id_edinicy_izmereniya)
                    listValues.append(pogreshnost_izmereniya)
                    
                    if isOnlyUpdateEZ:
                        idArea = valueByFieldValue('pb_ploshad', 'id', 'i', 'id_uchastok', idu, 'i')
                        if updateFeature('pb_ploshad', idArea, listNames, listValues):
                            self.listWidgetEvents.addItem(u'Обновлена площадь ЕЗ с КН ' + kn)                 
                        else:
                            self.listWidgetEvents.addItem(u'Ошибка обновления площади ЕЗ с КН ' + kn)                 

                    else:
                        if insertFeatures('pb_ploshad', listNames, [listValues]):
                            self.listWidgetEvents.addItem(u'Добавлена площадь ЕЗ с КН ' + kn)                 
                        else:
                            self.listWidgetEvents.addItem(u'Ошибка добавления площади ЕЗ с КН ' + kn)                 

                    # Адрес
                    listNames = []
                    listValues = []
                    listNames = ['komanda_serveru', 'okato', 'kladr', 
                                 'id_region', 'opisanie']
                    listValues.append('id_uch=' + str(idu))
                    listValues.append(codeOkato)
                    listValues.append(codeKladr)
                    listValues.append(id_region)
                    listValues.append(opisanie)
                    
                    if isOnlyUpdateEZ:
                        idAddress = valueByFieldValue('pb_uchastok_adres', 'id_adres', 'i', 'id_uchastok', idu, 'i')
                        if updateFeature('pb_adres', idAddress, listNames, listValues):
                            self.listWidgetEvents.addItem(u'Обновлено местоположение ЕЗ с КН ' + kn)                 
                        else:
                            self.listWidgetEvents.addItem(u'Ошибка обновления местоположения ЕЗ с КН ' + kn)                 

                    else:
                        if insertFeatures('pb_adres', listNames, [listValues]):
                            self.listWidgetEvents.addItem(u'Добавлено местоположение ЕЗ с КН ' + kn)                 
                        else:
                            self.listWidgetEvents.addItem(u'Ошибка добавления местоположения ЕЗ с КН ' + kn)                 

                    # Для каждой входящего, обособленного или ЧЗУ
                    for SubParcel in SubParcels.iter('SubParcel'):
                        chGuid = str(uuid.uuid4())

                        nomer_kontura = SubParcel.get('Number_PP')

                        if ((self.codeTypeXml == '114') and (self.versionXml == '05')) or ((self.codeTypeXml == '101') and (self.versionXml == '08')):
                            Area = SubParcel.find('Area')
                        else:
                            Area = SubParcel.find('Areas/Area')

                        if (Area != None):  
                            AreaCode = Area.find('AreaCode')
                            if (AreaCode != None): id_vid_ploshadi = AreaCode.text
                            else: id_vid_ploshadi = ''

                            AreaValue = Area.find('Area')
                            if (AreaValue != None): ploshad = AreaValue.text
                            else: ploshad = ''

                            Unit = Area.find('Unit')
                            if (Unit != None): id_edinicy_izmereniya = Unit.text
                            else: id_edinicy_izmereniya = ''

                            Innccuracy = Area.find('Innccuracy')
                            if (Innccuracy != None): pogreshnost_izmereniya = Innccuracy.text
                            else: pogreshnost_izmereniya = ''

                        vid_uchastka = ''
                        Object_Entry = SubParcel.find('Object_Entry')
                        if (Object_Entry != None): 
                            vid_uchastka = gv['isolatedParcelCode']
                            kn = Object_Entry.get('CadastralNumber')
                            id_tip_chasti = Object_Entry.get('Type')
                        else: 
                            kn = ''
                            id_tip_chasti = ''
                        
                        p = kn.find(':', 6)
                        if (p > 0):
                            oboznachenie_na_plane =  kn[p:]
                        else:
                            oboznachenie_na_plane = ''
                        
                        if ((self.codeTypeXml == '114') and (self.versionXml == '05')) or ((self.codeTypeXml == '101') and (self.versionXml == '08')):
                            Name = SubParcel.find('Encumbrance/Name')
                        else:
                            Name = SubParcel.find('Encumbrances/Encumbrance/Name')

                        if (Name != None): 
                            vid_uchastka = gv['onePartCode']
                            vid_obremeneniya = Name.text
                        else: 
                            vid_obremeneniya = ''
                                    
                        if ((self.codeTypeXml == '114') and (self.versionXml == '05')) or ((self.codeTypeXml == '101') and (self.versionXml == '08')):
                            Type = SubParcel.find('Encumbrance/Type')
                        else:
                            Type = SubParcel.find('Encumbrances/Encumbrance/Type')

                        if (Type != None): id_obremeneniya = Type.text
                        else: id_obremeneniya = ''

                        geomNew = None
                        pointsAll = []

                        Entity_Spatial = SubParcel.find('Entity_Spatial')

                        if (Entity_Spatial != None):
                            [pointsAll, geomNew] = self.doFillPointsAllPlusNewGeometry(Entity_Spatial)

                        feat = QgsFeature()
                        feat.initAttributes(len(self.layerUc.dataProvider().attributeIndexes()))
                        if (geomNew == None) or not geomNew.isGeosValid():
                            feat.setGeometry(QgsGeometry())
                            idch = 0
                        else:
                            feat.setGeometry(geomNew)
                            
                            feat.setAttribute(self.layerUc.fieldNameIndex('kn'), kn)
                            feat.setAttribute(self.layerUc.fieldNameIndex('id_kategoriya'), kategoriya)
                            feat.setAttribute(self.layerUc.fieldNameIndex('id_vid_uchastka'), vid_uchastka)
                            feat.setAttribute(self.layerUc.fieldNameIndex('nomer_kontura'), nomer_kontura)
                            feat.setAttribute(self.layerUc.fieldNameIndex('oboznachenie_na_plane'), oboznachenie_na_plane)
                            feat.setAttribute(self.layerUc.fieldNameIndex('id_tip_chasti'), id_tip_chasti)
                            feat.setAttribute(self.layerUc.fieldNameIndex('vid_obremeneniya'), vid_obremeneniya)
                            feat.setAttribute(self.layerUc.fieldNameIndex('id_obremeneniya'), id_obremeneniya)
                            feat.setAttribute(self.layerUc.fieldNameIndex('guid'), chGuid)
                            feat.setAttribute(self.layerUc.fieldNameIndex('id_msk'), self.idMSK)
                            feat.setAttribute(self.layerUc.fieldNameIndex('area_in_gkn'), ploshad)
                                
                            self.layerUc.dataProvider().addFeatures([feat])

                            idch = valueByFieldValue('ln_uchastok', 'id', 'i', 'guid', chGuid, 's')

                        if idch > 0:
                            feat = QgsFeature()
                            feat.initAttributes(len(self.layerPP.dataProvider().attributeIndexes()))
                            feat.setAttribute(self.layerPP.fieldNameIndex('id_parent'), idu)
                            feat.setAttribute(self.layerPP.fieldNameIndex('id_children'), idch)
                            self.layerPP.dataProvider().addFeatures([feat])

                            self.doAddPointsAndBorders(pointsAll, idch)                            
                            self.listWidgetEvents.addItem(u'Импортированы границы и точки объекта с кадастровым номером ' + kn)                 
                            if self.isErrorManyContours:
                                self.highLightLine(u'Внимание! Более одного контура для ' + kn)                 
                                self.isErrorManyContours = False
                                
                            # Площадь
                            featPlo = QgsFeature()
                            featPlo.initAttributes(len(self.layerPlo.dataProvider().attributeIndexes()))
                            featPlo.setAttribute(self.layerPlo.fieldNameIndex('id_uchastok'), idch)
                            featPlo.setAttribute(self.layerPlo.fieldNameIndex('id_vid_ploshadi'), id_vid_ploshadi)
                            featPlo.setAttribute(self.layerPlo.fieldNameIndex('ploshad'), ploshad)
                            featPlo.setAttribute(self.layerPlo.fieldNameIndex('id_edinicy_izmereniya'), id_edinicy_izmereniya)
                            featPlo.setAttribute(self.layerPlo.fieldNameIndex('pogreshnost_izmereniya'), pogreshnost_izmereniya)

                            self.layerPlo.dataProvider().addFeatures([featPlo])
                            self.listWidgetEvents.addItem(u'Импортировано значение площади объекта с кадастровым номером ' + kn)                 
                            del featPlo

                            if (geomNew != None) and geomNew.isGeosValid():
                                allFeatIds.append(idch)

                        else:
                            self.listWidgetEvents.addItem(u'Не импортирован объект с кадастровым номером ' + kn)                 

            # Одноконтурный ЗУ без частей, возможно с кольцами
            else:                                           
                geomNew = None
                pointsAll = []

                Entity_Spatial = Parcel.find('Entity_Spatial')

                if (Entity_Spatial != None):
                    [pointsAll, geomNew] = self.doFillPointsAllPlusNewGeometry(Entity_Spatial)
            
                if (geomNew != None) and geomNew.isGeosValid():
                    feat = QgsFeature()
                    feat.initAttributes(len(self.layerUc.dataProvider().attributeIndexes()))
                    feat.setGeometry(geomNew)
                    feat.setAttribute(self.layerUc.fieldNameIndex('kn'), kn)
                    if (id_kvartal > 0):
                        feat.setAttribute(self.layerUc.fieldNameIndex('id_kvartal'), id_kvartal)
                    feat.setAttribute(self.layerUc.fieldNameIndex('id_vid_uchastka'), vid_uchastka)
                    feat.setAttribute(self.layerUc.fieldNameIndex('id_status_uchastka'), status_uchastka)
                    feat.setAttribute(self.layerUc.fieldNameIndex('id_kategoriya'), kategoriya)
                    feat.setAttribute(self.layerUc.fieldNameIndex('id_ispolzovanie'), ispolzovanie)
                    feat.setAttribute(self.layerUc.fieldNameIndex('ispolzovanie_dokument'), ispolzovanie_dok)
                    feat.setAttribute(self.layerUc.fieldNameIndex('guid'), ucGuid)
                    feat.setAttribute(self.layerUc.fieldNameIndex('id_msk'), self.idMSK)
                    feat.setAttribute(self.layerUc.fieldNameIndex('dop_naimenovanie'), '')
                    feat.setAttribute(self.layerUc.fieldNameIndex('id_sposob_obrazovaniya'), '')
                    feat.setAttribute(self.layerUc.fieldNameIndex('oboznachenie_na_plane'), oboznachenie_na_plane)
                    feat.setAttribute(self.layerUc.fieldNameIndex('nomer_kontura'), 0)
#                    feat.setAttribute(self.layerUc.fieldNameIndex('tip_obekta_kadastrovyh_rabot'), None)
                    feat.setAttribute(self.layerUc.fieldNameIndex('area_in_gkn'), ploshad)
                    
                    if self.layerUc.dataProvider().addFeatures([feat])[0]:
                        self.listWidgetEvents.addItem(u'Импортирован ЗУ с кадастровым номером ' + kn)
                    else:
                        self.highLightLine(u'Ошибка импорта ЗУ с кадастровым номером ' + kn)                 

                    if self.isErrorManyContours:
                        self.highLightLine(u'Внимание! Более одного контура для' + kn)                 
                        self.isErrorManyContours = False

                    idu = valueByFieldValue('ln_uchastok', 'id', 'i', 'guid', ucGuid, 's')
                    if idu > 0:
                        self.doAddPointsAndBorders(pointsAll, idu)                            
                        self.listWidgetEvents.addItem(u'Импортированы границы и точки участка с кадастровым номером ' + kn)                 
                                
                        # Площадь
                        featPlo = QgsFeature()
                        featPlo.initAttributes(len(self.layerPlo.dataProvider().attributeIndexes()))
                        featPlo.setAttribute(self.layerPlo.fieldNameIndex('id_uchastok'), idu)
                        featPlo.setAttribute(self.layerPlo.fieldNameIndex('id_vid_ploshadi'), id_vid_ploshadi)
                        featPlo.setAttribute(self.layerPlo.fieldNameIndex('ploshad'), ploshad)
                        featPlo.setAttribute(self.layerPlo.fieldNameIndex('id_edinicy_izmereniya'), id_edinicy_izmereniya)
                        featPlo.setAttribute(self.layerPlo.fieldNameIndex('pogreshnost_izmereniya'), pogreshnost_izmereniya)

                        self.layerPlo.dataProvider().addFeatures([featPlo])
                        self.listWidgetEvents.addItem(u'Импортировано значение площади участка с кадастровым номером ' + kn)                 
                        del featPlo

                        # Адрес
                        featAdr = QgsFeature()
                        featAdr.initAttributes(len(self.layerAdr.dataProvider().attributeIndexes()))
                        featAdr.setAttribute(self.layerAdr.fieldNameIndex('komanda_serveru'), 'id_uch=' + str(idu))
                        featAdr.setAttribute(self.layerAdr.fieldNameIndex('okato'), codeOkato)
                        featAdr.setAttribute(self.layerAdr.fieldNameIndex('kladr'), codeKladr)
                        featAdr.setAttribute(self.layerAdr.fieldNameIndex('id_region'), id_region)
                        featAdr.setAttribute(self.layerAdr.fieldNameIndex('opisanie'), opisanie)
                                    
                        self.layerAdr.dataProvider().addFeatures([featAdr])
                        self.listWidgetEvents.addItem(u'Импортировано местоположение участка с кадастровым номером ' + kn)                 
                        del featAdr
                                
                    if (geomNew != None) and geomNew.isGeosValid():
                        allFeatIds.append(idu)

                    del feat
                    del geomNew
                else:
                    self.highLightLine(u'Отсутствует геометрия для участка с кадастровым номером ' + kn)                 

        self.listWidgetEvents.addItem(u'Окончание импорта данных из XML файла ' + self.fileName)                 
        self.listWidgetEvents.addItem(datetime.now().strftime('%Y-%m-%d %H:%M:%S'))                 
        self.progressBar.setRange(0, 100)
        self.progressBar.setValue(100)

        del root
        del xmlTree

        self.layerUc.removeSelection()
        for ever in allFeatIds:
            if not (ever == None):
                self.layerUc.select(int(ever))      
        self.canvas.zoomToSelected()
    
################################################################################

    def doAreaShow(self, xmlItem, treeItem):
        if (xmlItem != None) and (treeItem != None):
            if ((self.codeTypeXml == '114') and (self.versionXml == '05')) or ((self.codeTypeXml == '101') and (self.versionXml == '08')):
                Area = xmlItem.find('Area/Area')
            else:
                Area = xmlItem.find('Areas/Area/Area')

            if (Area != None): 
                treeItem.addChild(QTreeWidgetItem([u'Площадь', Area.text]))

################################################################################
                    
    def doPointsShow(self, xmlItem, treeItem):
        treeItem.addChild(QTreeWidgetItem([u'Точки']))
        curItemPoint = treeItem.child((treeItem.childCount() - 1))
        for Spelement_Unit in xmlItem.iter('Spelement_Unit'):
            Ordinate = Spelement_Unit.find('Ordinate')

            if ((self.codeTypeXml == '114') and (self.versionXml == '05')) or ((self.codeTypeXml == '101') and (self.versionXml == '08')):
                if (Ordinate != None):
                    if (Ordinate.find('[@Num_Geopoint]') != None):
                        curItemPoint.addChild(QTreeWidgetItem([u'Номер', Ordinate.get('Num_Geopoint')]))
                    else:
                        if (Spelement_Unit.find('[@Su_Nmb]') != None):
                            curItemPoint.addChild(QTreeWidgetItem([u'Номер п/п', Spelement_Unit.get('Su_Nmb')]))
                        else:
                            curItemPoint.addChild(QTreeWidgetItem([u'Номер', '']))

                    curItemPoint.child((curItemPoint.childCount() - 1)).addChild(QTreeWidgetItem(['X', Ordinate.get('X')]))
                    curItemPoint.child((curItemPoint.childCount() - 1)).addChild(QTreeWidgetItem(['Y', Ordinate.get('Y')]))

            else:
                if (Ordinate != None):
                    if self.checkBoxNumGeopoint.isChecked():
                        if (Ordinate.find('[@Num_Geopoint]') != None):
                            curItemPoint.addChild(QTreeWidgetItem([u'Номер', Ordinate.get('Num_Geopoint')]))
                        else:
                            if (Ordinate.find('[@Ord_Nmb]') != None):
                                curItemPoint.addChild(QTreeWidgetItem([u'Номер', Ordinate.get('Ord_Nmb')]))
                            else:
                                if (Spelement_Unit.get('Su_Nmb') != None):
                                    curItemPoint.addChild(QTreeWidgetItem([u'Номер п/п', Spelement_Unit.get('Su_Nmb')]))
                                else:
                                    curItemPoint.addChild(QTreeWidgetItem([u'Номер', '']))
                    else:
                        if (Ordinate.find('[@Ord_Nmb]') != None):
                            curItemPoint.addChild(QTreeWidgetItem([u'Номер', Ordinate.get('Ord_Nmb')]))
                        else:
                            if (Spelement_Unit.get('Su_Nmb') != None):
                                curItemPoint.addChild(QTreeWidgetItem([u'Номер п/п', Spelement_Unit.get('Su_Nmb')]))
                            else:
                                curItemPoint.addChild(QTreeWidgetItem([u'Номер', '']))

                    curItemPoint.child((curItemPoint.childCount() - 1)).addChild(QTreeWidgetItem(['X', Ordinate.get('X')]))
                    curItemPoint.child((curItemPoint.childCount() - 1)).addChild(QTreeWidgetItem(['Y', Ordinate.get('Y')]))
            
    
################################################################################

    def doAddPointsAndBorders(self, pointsAll, idu):
        for points in pointsAll:

            if len(points) > 2:
                points.append(points[0])                    # добавление первой точки ЗУ в конец списка точек для создания замыкающего отрезка границы
                allFeats = []
                for i in range(len(points) - 1):
                    l = [QgsPoint(points[i][0], points[i][1]), QgsPoint(points[i+1][0], points[i+1][1])] 
                    geoBr = QgsGeometry.fromPolyline(l)
                    if geoBr != None:               
                        featBr = QgsFeature()
                        featBr.initAttributes(len(self.layerBr.dataProvider().attributeIndexes()))
                        featBr.setGeometry(geoBr)
                        featBr.setAttribute(self.layerBr.fieldNameIndex('id_uchastok'), idu)
                        featBr.setAttribute(self.layerBr.fieldNameIndex('uslovnyy_znak'), 0)
                        featBr.setAttribute(self.layerBr.fieldNameIndex('id_msk'), self.idMSK)
                                    
                        allFeats.append(featBr)
                        del featBr
                    del geoBr
                self.layerBr.dataProvider().addFeatures(allFeats)
                points.pop()                                # удаление первой точки ЗУ из конца списка точек, так как границы уже создали
    
                allFeats = []
                for i in points:
                    geoPn = QgsGeometry.fromPoint(QgsPoint(i[0], i[1]))
                    if geoPn != None:
                        featPn = QgsFeature()
                        featPn.initAttributes(len(self.layerPn.dataProvider().attributeIndexes()))
                        featPn.setGeometry(geoPn)
                        featPn.setAttribute(self.layerPn.fieldNameIndex('id_uchastok'), idu)
                        featPn.setAttribute(self.layerPn.fieldNameIndex('x'), i[1])
                        featPn.setAttribute(self.layerPn.fieldNameIndex('y'), i[0])
                        featPn.setAttribute(self.layerPn.fieldNameIndex('poryadok_obhoda'), i[2])
                        featPn.setAttribute(self.layerPn.fieldNameIndex('nomer'), i[3])
                        featPn.setAttribute(self.layerPn.fieldNameIndex('prefiks_nomera'), '')
                        featPn.setAttribute(self.layerPn.fieldNameIndex('pogreshnost'), i[4])
                        featPn.setAttribute(self.layerPn.fieldNameIndex('nomer_chasti'), i[6])
                        if i[5] > '': 
                            featPn.setAttribute(self.layerPn.fieldNameIndex('id_sposob_zakrepleniya'), i[5])
                        featPn.setAttribute(self.layerPn.fieldNameIndex('id_msk'), self.idMSK)
                    
                        allFeats.append(featPn)
                        del featPn
                    del geoPn
                self.layerPn.dataProvider().addFeatures(allFeats)
    
                self.canvas.refresh()

################################################################################

    def doFillPointsAllPlusNewGeometry(self, Entity_Spatial):
        self.isErrorManyContours = False
        pointsAll = []
        geomNew = None
        SpatialElementNumber = 1
        for Spatial_Element in Entity_Spatial.iter('Spatial_Element'):
            SpatialElementPoints = []
            polygon = []

            for Spelement_Unit in Spatial_Element.iter('Spelement_Unit'):
                poryadokObhoda = Spelement_Unit.get('Su_Nmb')
                Ordinate = Spelement_Unit.find('Ordinate')
                if (Ordinate != None):
                    if self.checkBoxReverseXY.isChecked():
                        x = float(Ordinate.get('Y'))
                        y = float(Ordinate.get('X'))
                    else:
                        x = float(Ordinate.get('X'))
                        y = float(Ordinate.get('Y'))

                    if ((self.codeTypeXml == '114') and (self.versionXml == '05')) or ((self.codeTypeXml == '101') and (self.versionXml == '08')):
                        if (Ordinate.find('[@Num_Geopoint]') != None):
                            nomer = Ordinate.get('Num_Geopoint')
                        else:
                            nomer = poryadokObhoda
                    else:
                        if self.checkBoxNumGeopoint.isChecked():
                            if (Ordinate.find('[@Num_Geopoint]') != None):
                                nomer = Ordinate.get('Num_Geopoint')
                            else:
                                if (Ordinate.find('[@Ord_Nmb]') != None):
                                    nomer = Ordinate.get('Ord_Nmb')
                                else:
                                    nomer = poryadokObhoda
                        else:
                            if (Ordinate.find('[@Ord_Nmb]') != None):
                                nomer = Ordinate.get('Ord_Nmb')
                            else:
                                nomer = poryadokObhoda

                    idSposobZakrepleniya = Ordinate.get('Geopoint_Zacrep')
                    pogreshnost = Ordinate.get('Delta_Geopoint')
                    SpatialElementPoints.append([x, y, poryadokObhoda, nomer, 
                        pogreshnost, idSposobZakrepleniya, SpatialElementNumber])
                    point = QgsGeometry.fromPoint(QgsPoint(x, y))
                    polygon.append(point.asPoint())
                    
            pointsAll.append(SpatialElementPoints)

            if SpatialElementNumber == 1:
                geomNew = QgsGeometry().fromPolygon([polygon])
            else:
                if polygon[0] != polygon[len(polygon) - 1]: 
                    polygon.append(polygon[0])
                
                geomForTest = QgsGeometry().fromPolygon([polygon])

                if geomNew.intersects(geomForTest):
                    geomNew.addRing(polygon)
                else:
                    geomNew.addPart(polygon)
                    self.isErrorManyContours = True

                del geomForTest

            SpatialElementNumber += 1

        return [pointsAll, geomNew]

################################################################################
    
    def highLightLine(self, t):
        self.listWidgetEvents.addItem(t)                 
        c = self.listWidgetEvents.count()
        font = self.listWidgetEvents.item(c - 1).font()
        font.setBold(True)
        self.listWidgetEvents.item(c - 1).setFont(font)     
        self.progressBar.setRange(0, 100)
        self.progressBar.setValue(0)

################################################################################

    def closeDialog(self):
        self.close()
       
#        QMessageBox.information(self.iface.mainWindow(), 'test', str(curItemPar))        
