# -*- coding: utf-8 -*-
'''
/***************************************************************************
 uchAttributes for openland (cadastral engineer tools)
 copyright            : (C) 2012 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from common import *
from uchattributes_ui import Ui_uchAttributes
from area import area
from address import address
from point import point
from border import border
from kn import kn
from document import Document
from commontexts import CommonText
from parcelneighbour import ParcelNeighbour

class uchAttributes(QDialog,  Ui_uchAttributes):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        self.dlgDocument = None
        self.dlgCommonText = None        

        self.connect(self.pushButtonDocumentCategory, SIGNAL("clicked()"), self.doDocument)        
        self.connect(self.pushButtonDocumentUtilization, SIGNAL("clicked()"), self.doDocument)        
        self.connect(self.pushButtonDocumentEncumbrance, SIGNAL("clicked()"), self.doDocument)        
        self.connect(self.pushButtonRefr, SIGNAL("clicked()"), self.dlgFill)
        self.connect(self.pushButtonAdd, SIGNAL("clicked()"), self.treeAdd)
        self.connect(self.pushButtonEdit, SIGNAL("clicked()"), self.treeEdit)
        self.connect(self.pushButtonDel, SIGNAL("clicked()"), self.treeDel)
        self.connect(self.pushButtonSave, SIGNAL("clicked()"), self.uchSave)        
        self.connect(self.pushButtonClose, SIGNAL("clicked()"), self.dlgClose)        
        self.connect(self.pushButtonUtilization, SIGNAL("clicked()"), self.doCommonText)        
        self.connect(self.pushButtonEncumbrance, SIGNAL("clicked()"), self.doCommonText)        

        self.connect(self.comboBoxKvr, SIGNAL("currentIndexChanged(int)"), self.editMode)
        self.connect(self.comboBoxStatus, SIGNAL("currentIndexChanged(int)"), self.editMode)
        self.connect(self.comboBoxTypeObject, SIGNAL("currentIndexChanged(int)"), self.editMode)
        self.connect(self.comboBoxKatZem, SIGNAL("currentIndexChanged(int)"), self.editMode)
        self.connect(self.comboBoxVid, SIGNAL("currentIndexChanged(int)"), self.editMode)
        self.connect(self.comboBoxSposobObraz, SIGNAL("currentIndexChanged(int)"), self.editMode)
        self.connect(self.comboBoxIspolzSprav, SIGNAL("currentIndexChanged(int)"), self.editMode)
        self.connect(self.comboBoxTipObrem, SIGNAL("currentIndexChanged(int)"), self.editMode)
        self.connect(self.comboBoxTipChast, SIGNAL("currentIndexChanged(int)"), self.editMode)
        self.connect(self.lineEditKn, SIGNAL("textChanged(QString)"), self.editMode)
        self.connect(self.lineEditObozNaPlane, SIGNAL("textChanged(QString)"), self.editMode)
        self.connect(self.lineEditAdditionalName, SIGNAL("textChanged(QString)"), self.editMode)
        self.connect(self.spinBoxNomerKontura, SIGNAL("valueChanged(int)"), self.editMode)
        self.connect(self.textEditIspolzDok, SIGNAL("textChanged()"), self.editMode4text)
        self.connect(self.textEditVidObremeneniya, SIGNAL("textChanged()"), self.editMode4text)
        self.connect(self.textEditNote, SIGNAL("textChanged()"), self.editMode4text)
        self.connect(self.comboBoxDocumentCategory, SIGNAL("currentIndexChanged(int)"), self.editMode)
        self.connect(self.comboBoxDocumentUtilization, SIGNAL("currentIndexChanged(int)"), self.editMode)
        self.connect(self.comboBoxDocumentEncumbrance, SIGNAL("currentIndexChanged(int)"), self.editMode)
        self.connect(self.comboBoxMinAreaUnit, SIGNAL("currentIndexChanged(int)"), self.editMode)
        self.connect(self.comboBoxMaxAreaUnit, SIGNAL("currentIndexChanged(int)"), self.editMode)
        self.connect(self.checkBoxSubparcel4Realty, SIGNAL("stateChanged(int)"), self.editMode)

        self.connect(self.lineEditMinArea, SIGNAL("textChanged(QString)"), self.editMode)
        self.connect(self.lineEditMaxArea, SIGNAL("textChanged(QString)"), self.editMode)
        self.connect(self.lineEditGknArea, SIGNAL("textChanged(QString)"), self.editMode)
        self.connect(self.lineEditDeltaArea, SIGNAL("textChanged(QString)"), self.editMode)

        self.connect(self.lineEditMinArea, SIGNAL("textChanged(QString)"), self.checkAreaValue)        
        self.connect(self.lineEditMaxArea, SIGNAL("textChanged(QString)"), self.checkAreaValue)        
        self.connect(self.lineEditGknArea, SIGNAL("textChanged(QString)"), self.checkAreaValue)        
        self.connect(self.lineEditDeltaArea, SIGNAL("textChanged(QString)"), self.checkAreaValue)        
        
        self.layerUc = get_vector_layer_by_name(gln['ln_uchastok'])
        self.idParcel = 0 
        self.idParent = 0
        self.contourId = []
        self.contours = {}
        self.partId = []
        self.parts = {}
        self.isolatedId = []
        self.isolated = {} 
        self.nominalId = []
        self.nominal = {} 
        self.sumArea = 0
#        self.row = None
        self.geom = None
        self.areaByGeometry = 0

################################################################################
    def dlgFill(self):
        fea = QgsFeature()
        feat = QgsFeature()

        attributesParcel = attributesByKeys('ln_uchastok', 'id', 
                                            [self.idParcel], attributesNamesParcel)
        if len(attributesParcel) == 1:
            attributesParcel = attributesParcel[0]
        else:
            return

        checkDataNull(attributesParcel['kn'], self.lineEditKn)
        checkDataNull(attributesParcel['dop_naimenovanie'], self.lineEditAdditionalName)
        checkDataNull(attributesParcel['ispolzovanie_dokument'], self.textEditIspolzDok)
        checkDataNull(attributesParcel['note'], self.textEditNote)

        checkDataNull(attributesParcel['nomer_kontura'], self.spinBoxNomerKontura)
        checkDataNull(attributesParcel['oboznachenie_na_plane'], self.lineEditObozNaPlane)
        checkDataNull(attributesParcel['min_area'], self.lineEditMinArea)
        checkDataNull(attributesParcel['max_area'], self.lineEditMaxArea)
        checkDataNull(attributesParcel['area_in_gkn'], self.lineEditGknArea)
        checkDataNull(attributesParcel['delta_area'], self.lineEditDeltaArea)
        checkDataNull(attributesParcel['create_user'], self.lineEditCreateUser)
        checkDataNull(attributesParcel['create_date'], self.lineEditCreateDate)
        checkDataNull(attributesParcel['update_user'], self.lineEditUpdateUser)
        checkDataNull(attributesParcel['update_date'], self.lineEditUpdateDate)

        fillComboBox(self.comboBoxKvr, 'ln_kvartal', 'id', 'kn', 
                     attributesParcel['id_kvartal'])
        fillComboBox(self.comboBoxVid, 'cl_vid_zemelnogo_uchastka', 'id', 'znachenie', 
                     attributesParcel['id_vid_uchastka'])
        fillComboBox(self.comboBoxStatus, 'cl_status_zemelnogo_uchastka', 'id', 'znachenie', 
                     attributesParcel['id_status_uchastka'])
        fillComboBox(self.comboBoxTypeObject, 'cl_obekt_kadastrovyh_rabot', 'id', 'znachenie', 
                     attributesParcel['tip_obekta_kadastrovyh_rabot'])
        fillComboBox(self.comboBoxKatZem, 'cl_kategoriya_zemli', 'id', 'znachenie', 
                     attributesParcel['id_kategoriya'])
        fillComboBox(self.comboBoxIspolzSprav, 'cl_ispolzovanie_zemli', 'id', 'znachenie', 
                     attributesParcel['id_ispolzovanie'])
        fillComboBox(self.comboBoxSposobObraz, 'cl_sposob_obrazovaniya_uchastka', 'id', 'znachenie', 
                     attributesParcel['id_sposob_obrazovaniya'])
        fillComboBox(self.comboBoxMinAreaUnit, 'cl_edinicy_izmereniya', 'id', 'znachenie', 
                     attributesParcel['type_unit_min_area'])
        fillComboBox(self.comboBoxMaxAreaUnit, 'cl_edinicy_izmereniya', 'id', 'znachenie', 
                     attributesParcel['type_unit_max_area'])

        self.fillComboBoxDocument(self.comboBoxDocumentCategory, 
                                  attributesParcel['guid_doc_category'])
        self.fillComboBoxDocument(self.comboBoxDocumentUtilization, 
                                  attributesParcel['guid_doc_utilization'])
        self.fillComboBoxDocument(self.comboBoxDocumentEncumbrance, 
                                  attributesParcel['guid_doc_encumbrance'])

        if attributesParcel['subparcel_realty'] == 1:
            self.checkBoxSubparcel4Realty.setChecked(True)
        else:
            self.checkBoxSubparcel4Realty.setChecked(False)

        self.fillChildren()

        tree = self.treeWidgetUch
        tree.clear()
        topLevel = {}
        tree.setSortingEnabled(False)

        self.comboBoxVid.setEnabled(True)

        if attributesParcel['id_vid_uchastka'] == gv['oneContourCode']:
            self.spinBoxNomerKontura.setEnabled(True)
        else:
            self.spinBoxNomerKontura.setEnabled(False)

        self.comboBoxTipChast.setEnabled(False)
        self.checkBoxSubparcel4Realty.setEnabled(False)
        self.textEditVidObremeneniya.setEnabled(False)
        self.pushButtonEncumbrance.setEnabled(False)
        self.comboBoxTipObrem.setEnabled(False)
        self.comboBoxDocumentEncumbrance.setEnabled(False)
        self.pushButtonDocumentEncumbrance.setEnabled(False)

        # Части
        if len(self.partId) > 0:
            tree.addTopLevelItem(QTreeWidgetItem([u'Части', u'']))
            topLevel['parts'] = tree.topLevelItemCount() - 1
            tree.topLevelItem(topLevel['parts']).setData(2, 0, -10)
            for i in self.partId:
                itemTree = QTreeWidgetItem([u'ЧЗУ', self.parts[i][0] +' '+ self.parts[i][1]])
                itemTree.setData(2, 0, i)
                tree.topLevelItem(topLevel['parts']).addChild(itemTree)
        else:
            listPartId = attributesBySearchCondition('pb_parcel_parcel', 
                                                     '\"id_children\"=' + str(self.idParcel), 
                                                     ['id_children'])
            idParcelCode = attributesParcel['id_vid_uchastka']
            if (idParcelCode == gv['onePartCode']) and (len(listPartId) == 1):
                self.comboBoxVid.setEnabled(False)

                self.comboBoxTipChast.setEnabled(True)
                self.checkBoxSubparcel4Realty.setEnabled(True)
                self.textEditVidObremeneniya.setEnabled(True)
                self.pushButtonEncumbrance.setEnabled(True)
                self.comboBoxTipObrem.setEnabled(True)
                self.comboBoxDocumentEncumbrance.setEnabled(True)
                self.pushButtonDocumentEncumbrance.setEnabled(True)

                fillComboBox(self.comboBoxTipObrem, 'cl_obremeneniya', 'id', 'znachenie', 
                             attributesParcel['id_obremeneniya'])
                fillComboBox(self.comboBoxTipChast, 'cl_obekt_gkn', 'id', 'znachenie', 
                             attributesParcel['id_tip_chasti'])
                self.textEditVidObremeneniya.setText(unicode(attributesParcel['vid_obremeneniya']))

        # Контуры
        if len(self.contourId) > 0:
            itemTree = QTreeWidgetItem([u'Контуры', u''])
            itemTree.setData(2, 0, -10)
            tree.addTopLevelItem(itemTree)
            topLevel['contours'] = tree.topLevelItemCount() - 1
            for i in self.contourId:
                itemTree = QTreeWidgetItem([u'Контур ' + self.contours[i][0], self.contours[i][1]])
                itemTree.setData(2, 0, i)
                tree.topLevelItem(topLevel['contours']).addChild(itemTree)

        # Обособленные участки
        if len(self.isolatedId) > 0:
            itemTree = QTreeWidgetItem([u'Обособленные ЗУ', u''])
            itemTree.setData(2, 0, -10)
            tree.addTopLevelItem(itemTree)
            topLevel['isolated'] = tree.topLevelItemCount() - 1
            for i in self.isolatedId:
                itemTree = QTreeWidgetItem([u'Обособленный ' + self.isolated[i][0], self.isolated[i][1]])
                itemTree.setData(2, 0, i)
                tree.topLevelItem(topLevel['isolated']).addChild(itemTree)

        # Условые участки
        if len(self.nominalId) > 0:
            itemTree = QTreeWidgetItem([u'Условные ЗУ', u''])
            itemTree.setData(2, 0, -10)
            tree.addTopLevelItem(itemTree)
            topLevel['nominal'] = tree.topLevelItemCount() - 1
            for i in self.nominalId:
                itemTree = QTreeWidgetItem([u'Условный ' + self.nominal[i][0], self.nominal[i][1]])
                itemTree.setData(2, 0, i)
                tree.topLevelItem(topLevel['nominal']).addChild(itemTree)

        # Площадь начало
        tree.addTopLevelItem(QTreeWidgetItem([u'Площадь', u'']))
        topLevel['ploshad'] = tree.topLevelItemCount() - 1
        tree.topLevelItem(topLevel['ploshad']).setData(2, 0, -10)
        self.areaByGeometry = 0
        if self.idParent > 0:
            if not self.geom.isGeosValid():
                tree.topLevelItem(topLevel['ploshad']).addChild(QTreeWidgetItem([u'Рассчитанная по геометрии', str(round(self.sumArea, 2)) + u' кв.м.']))
                self.areaByGeometry = round(self.sumArea, 0)
            else:
                tree.topLevelItem(topLevel['ploshad']).addChild(QTreeWidgetItem([u'Рассчитанная по геометрии', str(round(self.geom.area(), 2)) + u' кв.м.']))
                self.areaByGeometry = round(self.geom.area(), 2)
        else: 
            if not self.geom.isGeosValid():
                tree.topLevelItem(topLevel['ploshad']).addChild(QTreeWidgetItem([u'Рассчитанная по геометрии', str(0) + u' кв.м.']))
                self.areaByGeometry = 0
            else:
                tree.topLevelItem(topLevel['ploshad']).addChild(QTreeWidgetItem([u'Рассчитанная по геометрии', str(round(self.geom.area(), 2)) + u' кв.м.']))
                if attributesParcel['id_vid_uchastka'] == gv['oneContourCode']:
                    self.areaByGeometry = round(self.geom.area(), 2)
                else:
                    self.areaByGeometry = round(self.geom.area(), 0)

        tree.topLevelItem(topLevel['ploshad']).child(0).setData(2, 0, -1)

        self.layerPlo = get_vector_layer_by_name(gln['pb_ploshad'])
        if self.layerPlo != None:
            pre = self.layerPlo.subsetString()
            self.layerPlo.setSubsetString('\"id_uchastok\"=' + str(self.idParcel))

            if (int(self.layerPlo.featureCount()) > 0):
                self.provPlo = self.layerPlo.dataProvider()
                for feat in self.provPlo.getFeatures(QgsFeatureRequest().setFlags(QgsFeatureRequest.NoGeometry)):
                    attPlo = feat.attributes()
                    vidPlosh = self.sid_znachenie_from_class('cl_vid_ploshadi', attPlo[self.layerPlo.fieldNameIndex('id_vid_ploshadi')])
                    strPlor = str(attPlo[self.layerPlo.fieldNameIndex('ploshad')])
                    ednIzmer = self.sid_znachenie_from_class('cl_edinicy_izmereniya', attPlo[self.layerPlo.fieldNameIndex('id_edinicy_izmereniya')])
                        
                    tree.topLevelItem(topLevel['ploshad']).addChild(QTreeWidgetItem([vidPlosh, strPlor +' '+ ednIzmer]))
                    tree.topLevelItem(topLevel['ploshad']).child(tree.topLevelItem(topLevel['ploshad']).childCount() - 1).setData(2, 0, attPlo[self.layerPlo.fieldNameIndex('id')])

            self.layerPlo.setSubsetString(pre)
        
        # Местоположение начало
        tree.addTopLevelItem(QTreeWidgetItem([u'Местоположение', u'']))
        topLevel['mestopolozhenie'] = tree.topLevelItemCount() - 1
        tree.topLevelItem(topLevel['mestopolozhenie']).setData(2, 0, -10)

        self.layerAdr = get_vector_layer_by_name(gln['pb_adres'])
        self.layerUchAdr = get_vector_layer_by_name(gln['pb_uchastok_adres'])
        
        if self.layerUchAdr != None:
            preUchAdr = self.layerUchAdr.subsetString()
            self.layerUchAdr.setSubsetString('\"id_uchastok\"=' + str(self.idParcel))

            if (int(self.layerUchAdr.featureCount()) > 0):
                self.provUchAdr = self.layerUchAdr.dataProvider()
                for fea in self.provUchAdr.getFeatures(QgsFeatureRequest().setFlags(QgsFeatureRequest.NoGeometry)):
                    attUchAdr = fea.attributes()
                    idAdr = attUchAdr[self.layerUchAdr.fieldNameIndex('id_adres')]
              
                    if self.layerAdr != None:
                        preAdr = self.layerAdr.subsetString()
                        self.layerAdr.setSubsetString('\"id\"=' + str(idAdr))

                        if (int(self.layerAdr.featureCount()) > 0):
                            self.provAdr = self.layerAdr.dataProvider()
                            for feat in self.provAdr.getFeatures(QgsFeatureRequest().setFlags(QgsFeatureRequest.NoGeometry)):
                                attAdr = feat.attributes()
                                opisanie = reNull(attAdr[self.layerAdr.fieldNameIndex('opisanie')], '')
                                tree.topLevelItem(topLevel['mestopolozhenie']).addChild(QTreeWidgetItem([u'Описание', opisanie]))
                                tree.topLevelItem(topLevel['mestopolozhenie']).child(tree.topLevelItem(topLevel['mestopolozhenie']).childCount() - 1).setData(2, 0, idAdr)

                        self.layerAdr.setSubsetString(preAdr)
            self.layerUchAdr.setSubsetString(preUchAdr)
        
        # Точки начало
        if paramByName([['interface/isPointsShow', 'bool']])[0]:
            listPoints = attributesByKeys('ln_tochka', 'id_uchastok', 
                                          [self.idParcel], attributesNamesPoint)
            if len(listPoints) > 0:
                tree.addTopLevelItem(QTreeWidgetItem([u'Точки', u'']))
                topLevel['tochka'] = tree.topLevelItemCount() - 1
                tree.topLevelItem(topLevel['tochka']).setData(2, 0, -10)

                dictPoints     = {}
                listSortPoints = []
                for everyPoint in listPoints:
                    poryadokObhoda = everyPoint['poryadok_obhoda']
                    prefiksNomera  = everyPoint['prefiks_nomera']
                    nomer          = everyPoint['nomer']
                    x              = everyPoint['x']
                    y              = everyPoint['y']
                    idPoint        = everyPoint['id']
                    pre            = everyPoint['pre']

                    dictPoints[everyPoint['id']] = [poryadokObhoda, prefiksNomera, nomer]
                    listSortPoints.append([poryadokObhoda, prefiksNomera, nomer, x, y, idPoint, pre])

                listSortPoints.sort()
            
                for onePoint in listSortPoints:
                    poryadokObhoda = onePoint[0]
                    prefiksNomera  = onePoint[1]
                    nomer          = str(onePoint[2])
                    x              = str(onePoint[3])
                    y              = str(onePoint[4])
                    idPoint        = onePoint[5]
                    pre            = onePoint[6] 

                    treeItemPoint = QTreeWidgetItem([u'Точка ' + str(poryadokObhoda), 
                                                     u'Номер ' + prefiksNomera + nomer + '   X=' + x + '  Y=' + y])
                    treeItemPoint.setData(2, 0, idPoint)

                    if pre == 1:
                        font = treeItemPoint.font(0)
                        font.setUnderline(True)
                        font.setItalic(True)
                        treeItemPoint.setFont(1, font)

                    tree.topLevelItem(topLevel['tochka']).addChild(treeItemPoint)

            # Границы начало
            listBorders = attributesByKeys('ln_granica', 'id_uchastok', 
                                           [self.idParcel], attributesNamesBorder)
            if len(listBorders) > 0:
#                QMessageBox.information(self.iface.mainWindow(), 'len(listBorders)', str(len(listBorders)))
                tree.addTopLevelItem(QTreeWidgetItem([u'Границы', u'']))
                topLevel['granica'] = tree.topLevelItemCount() - 1
                tree.topLevelItem(topLevel['granica']).setData(2, 0, -10)

                listBordersNext = []
                listIdBorders = []
                for everyBorder in listBorders:
                    idBorder = everyBorder['id']
                    opisanie = everyBorder['opisanie']
                    pre      = everyBorder['pre']
                    
                    listBordersNext.append([idBorder, opisanie, pre])
                    listIdBorders.append(int(idBorder))

                listBordersPoints = attributesByKeys('pb_granica_tochka', 'id_granica', 
                                                    listIdBorders, ['id_granica', 'id_tochka'])
                listIdBorderIdPoint = []
                for every in listBordersPoints:
                    listIdBorderIdPoint.append([every['id_granica'], every['id_tochka']])
                    
                for everyBorder in listBordersNext:
                    idBorder = everyBorder[0]
                    opisanie = everyBorder[1]
                    pre      = everyBorder[2]
                
                    listIdPairPoints = []
                    for every in listIdBorderIdPoint:
                        if every[0] == idBorder:
                            listIdPairPoints.append(every[1])

                    if len(listIdPairPoints) == 2:
                        listFromPoint = []
                        listToPoint   = []
                        if dictPoints[listIdPairPoints[0]][0] < dictPoints[listIdPairPoints[1]][0]:
                            listFromPoint = dictPoints[listIdPairPoints[0]]
                            listToPoint   = dictPoints[listIdPairPoints[1]]
                        else:
                            listFromPoint = dictPoints[listIdPairPoints[1]]
                            listToPoint   = dictPoints[listIdPairPoints[0]]
                        
                        title = u'от ' + listFromPoint[1] + str(listFromPoint[2]) + u' до ' + listToPoint[1] + str(listToPoint[2])
                
                        treeItemBorder = QTreeWidgetItem([title, opisanie])
                        treeItemBorder.setData(2, 0, idBorder)
                    
                        if pre == 1:
                            font = treeItemBorder.font(0)
                            font.setUnderline(True)
                            font.setItalic(True)
                            treeItemBorder.setFont(1, font)

                        tree.topLevelItem(topLevel['granica']).addChild(treeItemBorder)
                    
        # КН
        listKn = attributesByKeys('pb_kn', 'id_uchastok', [self.idParcel], attributesNamesKn)
        
        itemTransit = QTreeWidgetItem([u'КН для прохода и проезда', u''])
        itemTransit.setData(2, 0, -10)
        tree.addTopLevelItem(itemTransit)

        itemPrevious = QTreeWidgetItem([u'КН ЗУ из которых образован данный', u''])
        itemPrevious.setData(2, 0, -10)
        tree.addTopLevelItem(itemPrevious)

        itemBuilding = QTreeWidgetItem([u'КН объектов капитального строительства', u''])
        itemBuilding.setData(2, 0, -10)
        tree.addTopLevelItem(itemBuilding)

        itemRestriction = QTreeWidgetItem([u'КН ЗУ, в пользу которого установлен сервитут', u''])
        itemRestriction.setData(2, 0, -10)
        tree.addTopLevelItem(itemRestriction)

        if len(listKn) > 0:
            for every in listKn:
                if every['tip_kn'] == gv['providingKn']:
                    kn = reNull(every['kn'], '')
                    other = reNull(every['other'], '')

                    if kn > ' ':
                        itemInsert = QTreeWidgetItem([u'КН', kn])
                    else:
                        itemInsert = QTreeWidgetItem([u'Иное', other])
                
                    itemInsert.setData(2, 0, int(every['id']))
                    itemTransit.addChild(itemInsert)

                elif every['tip_kn'] == gv['prevKn']:
                    kn = reNull(every['kn'], '')
                    itemInsert = QTreeWidgetItem([u'КН', kn])
                    itemInsert.setData(2, 0, int(every['id']))

                    itemPrevious.addChild(itemInsert)

                elif every['tip_kn'] == gv['innerKn']:
                    kn = reNull(every['kn'], '')
                    itemInsert = QTreeWidgetItem([u'КН', kn])
                    itemInsert.setData(2, 0, int(every['id']))

                    itemBuilding.addChild(itemInsert)

                elif every['tip_kn'] == gv['restrictionKn']:
                    kn = reNull(every['kn'], '')
                    itemInsert = QTreeWidgetItem([u'КН', kn])
                    itemInsert.setData(2, 0, int(every['id']))

                    itemRestriction.addChild(itemInsert)
        
        # Смежные ЗУ
        listNeighbour = attributesByKeys('pb_parcel_neighbour', 
                                         'id_parcel', [self.idParcel], 
                                         attributesNamesParcelNeighbour)

        itemNeighbour = QTreeWidgetItem([u'Смежные ЗУ', u''])
        itemNeighbour.setData(2, 0, -10)
        tree.addTopLevelItem(itemNeighbour)

        if len(listNeighbour) > 0:
            for every in listNeighbour:
                definition  = reNull(every['definition'], '')
                kn          = reNull(every['cadastral_number'], '')

                itemInsert = QTreeWidgetItem([definition, kn])
                
                itemInsert.setData(2, 0, every['guid'])
                itemNeighbour.addChild(itemInsert)

        if paramByName([['interface/isSortAttributes', 'bool']])[0]: 
            tree.setSortingEnabled(True)
        
        tree.expandAll()
        del feat
        del fea
        self.editMode(False)

################################################################################
    def treeAdd(self):
        curItem = self.treeWidgetUch.currentItem()
        if curItem != None:
            itemData = curItem.data(2, 0)
            itemText = curItem.text(0)

            if itemData == -10:
                if itemText == u'Площадь':
                    d = area(self.iface)
                    d.idParcel = self.idParcel
                    d.action = 'add'
                    d.dlgFill(self.areaByGeometry)
                    result = d.exec_()
                    if result == 1: 
                        self.dlgFill()
                    del d
                
                elif itemText == u'Местоположение':
                    d = address(self.iface)
                    d.id_uchastok = self.idParcel
                    d.action = 'add'
                    d.dlgFill()
                    result = d.exec_()
                    if result == 1: 
                        self.dlgFill()
                    del d
                
                elif itemText == u'Точки':
                    d = point(self.iface)
                    d.idPoint = 0
                    d.idParcel = self.idParcel
                    d.action = 'add'
                    d.dlgFill()
                    result = d.exec_()
                    if result == 1: 
                        self.dlgFill()
                    del d
                
                elif itemText == u'КН для прохода и проезда':
                    d = kn(self.iface)
                    d.id_uchastok = self.idParcel
                    d.tip_kn = int(gv['providingKn'])
                    d.action = 'add'
                    d.dlgFill()
                    result = d.exec_()
                    if result == 1: 
                        self.dlgFill()
                    del d
                
                elif itemText == u'КН ЗУ из которых образован данный':
                    d = kn(self.iface)
                    d.id_uchastok = self.idParcel
                    d.tip_kn = int(gv['prevKn'])
                    d.action = 'add'
                    d.dlgFill()
                    result = d.exec_()
                    if result == 1: 
                        self.dlgFill()
                    del d

                elif itemText == u'КН объектов капитального строительства':
                    d = kn(self.iface)
                    d.id_uchastok = self.idParcel
                    d.tip_kn = int(gv['innerKn'])
                    d.action = 'add'
                    d.dlgFill()
                    result = d.exec_()
                    if result == 1: 
                        self.dlgFill()
                    del d
                
                elif itemText == u'КН ЗУ, в пользу которого установлен сервитут':
                    d = kn(self.iface)
                    d.id_uchastok = self.idParcel
                    d.tip_kn = int(gv['restrictionKn'])
                    d.action = 'add'
                    d.dlgFill()
                    result = d.exec_()
                    if result == 1: 
                        self.dlgFill()
                    del d

                elif itemText == u'Смежные ЗУ':
                    d = ParcelNeighbour(self.iface)
                    d.idParcel = self.idParcel
                    d.action = 'add'
                    d.dlgFill()
                    result = d.exec_()
                    if result == 1: 
                        self.dlgFill()
                    del d

                elif itemText == u'Границы':
                    QMessageBox.information(self.iface.mainWindow(), u'Недоступная функция', 
                        u'Добавить границу участка возможно только через функции \"Создать точки и границы\" или \"Создать границу по двум точкам\".')

                else:
                    QMessageBox.warning(self.iface.mainWindow(), u'Ошибка редактирования атрибутов', 
                        u'Не определён тип атрибута, выбранного в списке элемента.')
            else:
                goTopInTreeView(self.treeWidgetUch, curItem, -10, 2)
                self.treeAdd()
        else:
            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка редактирования атрибутов', 
                u'Для выполнения операции необходимо выбрать элемент в списке атрибутов.')
   
################################################################################
    def treeEdit(self):
        feat = QgsFeature()
        curItem = self.treeWidgetUch.currentItem()
        if curItem != None:
            itemData = curItem.data(2, 0)

            if itemData > 0:
                itemText = curItem.parent().text(0)
                if itemText == u'Площадь':
                    d = area(self.iface)
                    d.id = itemData
                    d.action = 'edit'
                    if d.toPrepare():
                        d.dlgFill(self.areaByGeometry)
                        result = d.exec_()
                        if result == 1: 
                            self.dlgFill()
                    del d
                
                elif itemText == u'Местоположение':
                    d = address(self.iface)
                    d.id = itemData

                    preAdr = self.layerAdr.subsetString()
                    self.layerAdr.setSubsetString('\"id\"=' + str(itemData))
                    if (int(self.layerAdr.featureCount()) > 0):
                        for feat in self.provAdr.getFeatures(QgsFeatureRequest().setFlags(QgsFeatureRequest.NoGeometry)):
                            attAdr = feat.attributes()

                        d.okato = reNull(attAdr[self.layerAdr.fieldNameIndex('okato')], '')
                        d.kladr = reNull(attAdr[self.layerAdr.fieldNameIndex('kladr')], '')
                        d.indeks = reNull(attAdr[self.layerAdr.fieldNameIndex('indeks')], '')
                        d.id_region = attAdr[self.layerAdr.fieldNameIndex('id_region')]
                        d.id_rayon = attAdr[self.layerAdr.fieldNameIndex('id_rayon')]
                        d.idt_rayon = self.id_type_from_class('pb_rayon', d.id_rayon)
                        d.id_mo = attAdr[self.layerAdr.fieldNameIndex('id_mo')]
                        d.idt_mo = self.id_type_from_class('pb_mo', d.id_mo)
                        d.id_gorod_rayon = attAdr[self.layerAdr.fieldNameIndex('id_gorod_rayon')]
                        d.idt_gorod_rayon = self.id_type_from_class('pb_gorodskoy_rayon', d.id_gorod_rayon)
                        d.id_selsovet = attAdr[self.layerAdr.fieldNameIndex('id_selsovet')]
                        d.idt_selsovet = self.id_type_from_class('pb_selsovet', d.id_selsovet)
                        d.id_naselen_punkt = attAdr[self.layerAdr.fieldNameIndex('id_naselen_punkt')]
                        d.idt_naselen_punkt = self.id_type_from_class('pb_naselen_punkt', d.id_naselen_punkt)
                        d.id_ulica = attAdr[self.layerAdr.fieldNameIndex('id_ulica')]
                        d.idt_ulica = self.id_type_from_class('pb_ulica', d.id_ulica)
                        d.id_dom = attAdr[self.layerAdr.fieldNameIndex('id_dom')]
                        d.idt_dom = self.id_type_from_class('pb_dom', d.id_dom)
                        d.id_korpus = attAdr[self.layerAdr.fieldNameIndex('id_korpus')]
                        d.idt_korpus = self.id_type_from_class('pb_korpus', d.id_korpus)
                        d.id_stroenie = attAdr[self.layerAdr.fieldNameIndex('id_stroenie')]
                        d.idt_stroenie = self.id_type_from_class('pb_stroenie', d.id_stroenie)
                        d.id_kvartira = attAdr[self.layerAdr.fieldNameIndex('id_kvartira')]
                        d.idt_kvartira = self.id_type_from_class('pb_kvartira', d.id_kvartira)
                        d.inoe = reNull(attAdr[self.layerAdr.fieldNameIndex('inoe')], '')
                        d.opisanie = reNull(attAdr[self.layerAdr.fieldNameIndex('opisanie')], '')
                        d.guid_document = reNull(attAdr[self.layerAdr.fieldNameIndex('guid_document')], '')

                    self.layerAdr.setSubsetString(preAdr)
                    
                    d.action = 'edit'
                    d.dlgFill()
                    result = d.exec_()
                    if result == 1: self.dlgFill()
                    del d

                elif itemText == u'Точки':
                    d = point(self.iface)
                    d.idPoint = itemData
                    d.idParcel = self.idParcel
                    d.action = 'edit'
                    d.dlgFill()
                    result = d.exec_()
                    if result == 1: 
                        self.dlgFill()
                    del d
                
                elif itemText == u'Границы':
                    d = border(self.iface)
                    d.idBorder = itemData
                    '''
                    preBrd = self.layerBrd.subsetString()
                    self.layerBrd.setSubsetString('\"id\"=' + str(itemData))
                    for feat in self.provBrd.getFeatures(QgsFeatureRequest()):
                        attBr = feat.attributes()

                        d.opisanie = attBr[self.layerBrd.fieldNameIndex('opisanie')]
                        if attBr[self.layerBrd.fieldNameIndex('po_opisaniyu')] == 't': 
                            d.po_opisaniyu = True
                        else: 
                            d.po_opisaniyu = False
                        d.dlina = attBr[self.layerBrd.fieldNameIndex('dlina')]
                        d.uslovnyy_znak =  attBr[self.layerBrd.fieldNameIndex('uslovnyy_znak')]
                        d.gradusy = attBr[self.layerBrd.fieldNameIndex('gradusy')]
                        d.minuty = attBr[self.layerBrd.fieldNameIndex('minuty')]
                        d.pre = attBr[self.layerBrd.fieldNameIndex('pre')]
                         
                    self.layerBrd.setSubsetString(preBrd)
                    '''
                    d.dlgFill()
                    result = d.exec_()
                    if result == 1: self.dlgFill()
                    del d

                elif itemText in (u'Контуры', u'Обособленные ЗУ', u'Условные ЗУ', u'Части'):
                    d = uchAttributes(self.iface)
                    d.idParcel = itemData
                    self.layerUc.removeSelection()
                    self.layerUc.select(d.idParcel)
                    selected = self.layerUc.selectedFeatures()
                    if len(selected) == 1:
                        d.geom = QgsGeometry(selected[0].geometry())
                        if (d.geom.isGeosValid()):
                            self.canvas.panToSelected()

                        d.row = selected[0].attributes()

                        d.action = 'edit'
                        d.dlgFill()
                        result = d.exec_()
                        del d
                        self.dlgFill()
                
                elif itemText == u'КН для прохода и проезда':
                    d = kn(self.iface)
                    d.id_kn = itemData
                    d.id_uchastok = self.idParcel
                    d.tip_kn = int(gv['providingKn'])
                    d.action = 'edit'
                    d.dlgFill()
                    result = d.exec_()
                    if result == 1: self.dlgFill()
                    del d
                    
                elif itemText == u'КН ЗУ из которых образован данный':
                    d = kn(self.iface)
                    d.id_kn = itemData
                    d.id_uchastok = self.idParcel
                    d.tip_kn = int(gv['prevKn'])
                    d.action = 'edit'
                    d.dlgFill()
                    result = d.exec_()
                    if result == 1: self.dlgFill()
                    del d
                    
                elif itemText == u'КН объектов капитального строительства':
                    d = kn(self.iface)
                    d.id_kn = itemData
                    d.id_uchastok = self.idParcel
                    d.tip_kn = int(gv['innerKn'])
                    d.action = 'edit'
                    d.dlgFill()
                    result = d.exec_()
                    if result == 1: self.dlgFill()
                    del d

                elif itemText == u'КН ЗУ, в пользу которого установлен сервитут':
                    d = kn(self.iface)
                    d.id_kn = itemData
                    d.id_uchastok = self.idParcel
                    d.tip_kn = int(gv['restrictionKn'])
                    d.action = 'edit'
                    d.dlgFill()
                    result = d.exec_()
                    if result == 1: self.dlgFill()
                    del d
                
                elif itemText == u'Смежные ЗУ':
                    d = ParcelNeighbour(self.iface)
                    d.guidPN    = itemData
                    d.idParcel  = self.idParcel
                    d.action    = 'edit'
                    d.dlgFill()
                    result = d.exec_()
                    if result == 1: 
                        self.dlgFill()
                    del d
                
                else:
                    QMessageBox.warning(self.iface.mainWindow(), u'Ошибка редактирования атрибутов', 
                        u'Не определён тип атрибута, выбранного в списке элемента.')
            else:
                QMessageBox.warning(self.iface.mainWindow(), u'Ошибка редактирования атрибута', 
                    u'Выбранный элемент списка не соответствует редактируемому атрибуту.')
        else:
            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка редактирования атрибутов', 
                u'Для выполнения операции необходимо выбрать элемент в списке атрибутов.')

        del feat

################################################################################
    def treeDel(self):
        curItem = self.treeWidgetUch.currentItem()
        if curItem != None:

            okay = QMessageBox.Ok
            cancel = QMessageBox.Cancel
            reply = QMessageBox.question(self, u'Потверждение удаления атрибутов', 
                    u'Удалить текущую строку атрибутов?', okay|cancel, defaultButton=cancel)
            if reply == okay:
                itemData = curItem.data(2, 0)
                if itemData > 0:
                    itemText = curItem.parent().text(0)

                    if itemText == u'Площадь':
                        if deleteById('pb_ploshad', itemData): 
                            self.dlgFill()
                        else: 
                            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка удаления', 
                                                                         u'Произошла ошибка при удалении атрибутов площади')
                    elif itemText == u'Местоположение':
                        if self.deleteAdr('pb_uchastok_adres', self.idParcel, itemData): 
                            self.dlgFill()
                        else: 
                            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка удаления', 
                                                                         u'Произошла ошибка при удалении атрибутов местоположения')
                    elif itemText == u'Точки':
                        if deleteById('ln_tochka', itemData): 
                            self.dlgFill()
                        else: 
                            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка удаления', 
                                                                         u'Произошла ошибка при удалении точки')
                    elif itemText == u'Границы':
                        if deleteById('ln_granica', itemData): 
                            self.dlgFill()
                        else: 
                            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка удаления', 
                                                                         u'Произошла ошибка при удалении границы')
                    elif itemText == u'Контуры':
                        idLink = valueByFieldValue('pb_parcel_parcel', 'guid', 's', 'id_children', itemData, 'i')
                        if deleteById('pb_parcel_parcel', idLink): 
                            updateFeature('ln_uchastok', itemData, ['id_vid_uchastka'], [None])
                            self.fillChildren()
                            self.dlgFill()
                        else: 
                            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка удаления', 
                                                                         u'Произошла ошибка при удалении контура')
                    elif itemText == u'Обособленные ЗУ':
                        idLink = valueByFieldValue('pb_parcel_parcel', 'guid', 's', 'id_children', itemData, 'i')
                        if deleteById('pb_parcel_parcel', idLink): 
                            updateFeature('ln_uchastok', itemData, ['id_vid_uchastka'], [None])
                            self.fillChildren()
                            self.dlgFill()
                        else: 
                            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка удаления', 
                                                                         u'Произошла ошибка при удалении обособленного ЗУ')
                    elif itemText == u'Части':
                        idLink = valueByFieldValue('pb_parcel_parcel', 'guid', 's', 'id_children', itemData, 'i')
                        if deleteById('pb_parcel_parcel', idLink): 
                            updateFeature('ln_uchastok', itemData, ['id_vid_uchastka'], [None])
                            self.fillChildren()
                            self.dlgFill()
                        else: 
                            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка удаления', 
                                                                         u'Произошла ошибка при удалении части')
                    elif itemText == u'КН для прохода и проезда':
                        if deleteById('pb_kn', itemData): 
                            self.dlgFill()
                        else: 
                            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка удаления', 
                                                                         u'Произошла ошибка при удалении кадастрового номера')
                    elif itemText == u'КН ЗУ из которых образован данный':
                        if deleteById('pb_kn', itemData): 
                            self.dlgFill()
                        else: 
                            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка удаления', 
                                                                         u'Произошла ошибка при удалении кадастрового номера')
                    elif itemText == u'КН объектов капитального строительства':
                        if deleteById('pb_kn', itemData): 
                            self.dlgFill()
                        else: 
                            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка удаления', 
                                                                         u'Произошла ошибка при удалении кадастрового номера')

                    elif itemText == u'КН ЗУ, в пользу которого установлен сервитут':
                        if deleteById('pb_kn', itemData): 
                            self.dlgFill()
                        else: 
                            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка удаления', 
                                                                         u'Произошла ошибка при удалении кадастрового номера')
                    elif itemText == u'Смежные ЗУ':
                        if deleteById('pb_parcel_neighbour', itemData): 
                            self.dlgFill()
                        else: 
                            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка удаления', 
                                                                         u'Произошла ошибка при удалении смежного ЗУ')
                    else:
                        QMessageBox.warning(self.iface.mainWindow(), u'Ошибка редактирования атрибутов', 
                                                                     u'Не определён тип атрибута, выбранного в списке элемента.')
                else:
                    QMessageBox.warning(self.iface.mainWindow(), u'Ошибка удаления атрибута', 
                                                                 u'Выбранный элемент списка не соответствует удаляемому атрибуту.')
        else:
            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка редактирования атрибутов', 
                                                         u'Для выполнения операции необходимо выбрать элемент в списке атрибутов.')

################################################################################
    def uchSave(self):
        listNames = []
        listValues = []

        listNames.append('kn')
        listValues.append(self.lineEditKn.text())
        
        id_kvartal = self.comboBoxKvr.itemData(self.comboBoxKvr.currentIndex())
        if id_kvartal > 0:
            listNames.append('id_kvartal')
            listValues.append(id_kvartal)

        listNames.append('id_vid_uchastka')
        listValues.append(self.comboBoxVid.itemData(self.comboBoxVid.currentIndex()))
        
        listNames.append('dop_naimenovanie')
        listValues.append(self.lineEditAdditionalName.text())

        listNames.append('id_status_uchastka')
        listValues.append(self.comboBoxStatus.itemData(self.comboBoxStatus.currentIndex()))
        
        listNames.append('tip_obekta_kadastrovyh_rabot')
        listValues.append(self.comboBoxTypeObject.itemData(self.comboBoxTypeObject.currentIndex()))
        
        listNames.append('id_kategoriya')
        listValues.append(self.comboBoxKatZem.itemData(self.comboBoxKatZem.currentIndex()))
        
        listNames.append('id_ispolzovanie')
        listValues.append(self.comboBoxIspolzSprav.itemData(self.comboBoxIspolzSprav.currentIndex()))
        
        listNames.append('ispolzovanie_dokument')
        listValues.append(self.textEditIspolzDok.toPlainText())
        
        listNames.append('note')
        listValues.append(self.textEditNote.toPlainText())
        
        listNames.append('id_sposob_obrazovaniya')
        listValues.append(self.comboBoxSposobObraz.itemData(self.comboBoxSposobObraz.currentIndex()))
        
        listNames.append('nomer_kontura')
        listValues.append(self.spinBoxNomerKontura.value())
        
        listNames.append('oboznachenie_na_plane')
        listValues.append(self.lineEditObozNaPlane.text())
        
        listNames.append('id_obremeneniya')
        listValues.append(self.comboBoxTipObrem.itemData(self.comboBoxTipObrem.currentIndex()))
        
        listNames.append('id_tip_chasti')
        listValues.append(self.comboBoxTipChast.itemData(self.comboBoxTipChast.currentIndex()))
        
        listNames.append('vid_obremeneniya')
        listValues.append(self.textEditVidObremeneniya.toPlainText())
        
        listNames.append('guid_doc_category')
        listValues.append(self.comboBoxDocumentCategory.itemData(self.comboBoxDocumentCategory.currentIndex()))
        
        listNames.append('guid_doc_utilization')
        listValues.append(self.comboBoxDocumentUtilization.itemData(self.comboBoxDocumentUtilization.currentIndex()))
        
        listNames.append('guid_doc_encumbrance')
        listValues.append(self.comboBoxDocumentEncumbrance.itemData(self.comboBoxDocumentEncumbrance.currentIndex()))
        
        listNames.append('type_unit_min_area')
        listValues.append(self.comboBoxMinAreaUnit.itemData(self.comboBoxMinAreaUnit.currentIndex()))
        
        listNames.append('type_unit_max_area')
        listValues.append(self.comboBoxMaxAreaUnit.itemData(self.comboBoxMaxAreaUnit.currentIndex()))
        
        try: 
            minArea = float(self.lineEditMinArea.text())
        except ValueError:
            pass
        else:
            listNames.append('min_area')
            listValues.append(minArea)
        
        try:
            maxArea = float(self.lineEditMaxArea.text())
        except ValueError:
            pass
        else:
            listNames.append('max_area')
            listValues.append(maxArea)
        
        try:
            areaInGkn = float(self.lineEditGknArea.text())
        except ValueError:
            pass
        else:
            listNames.append('area_in_gkn')
            listValues.append(areaInGkn)
        
        try:
            deltaArea = float(self.lineEditDeltaArea.text())
        except ValueError:
            pass
        else:
            listNames.append('delta_area')
            listValues.append(deltaArea)
        
        listNames.append('subparcel_realty')
        if self.checkBoxSubparcel4Realty.isChecked():
            listValues.append(1)
        else:
            listValues.append(0)

        if not updateFeature('ln_uchastok', self.idParcel, listNames, listValues):
            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка', 
                                                         u'Ошибка редактирования ЗУ')
        self.editMode(False)

################################################################################
    def fillChildren(self):
        self.contourId = []
        self.contours = {}
        self.partId = []
        self.parts = {}
        self.isolatedId = []
        self.isolated = {} 
        self.nominalId = []
        self.nominal = {} 

        listChildrenId = attributesByKeys('pb_parcel_parcel', 'id_parent', 
                                          [int(self.idParcel)], ['id_children'])
        if len(listChildrenId) > 0:
            listChildrenIntId = []
            for everyChildrenId in listChildrenId:
                listChildrenIntId.append(everyChildrenId['id_children'])

            listNames = ['id', 'kn', 'nomer_kontura', 'oboznachenie_na_plane', 
                         'id_vid_uchastka']
            listChildren = attributesByKeys('ln_uchastok', 'id', listChildrenIntId, 
                                            listNames)
            if len(listChildren) == 0:
                return
        else:
            return

        for everyChild in listChildren:
            if everyChild['id_vid_uchastka'] == gv['oneContourCode']:
                everyData = []
                everyData.append(str(reNull(everyChild['nomer_kontura'], '')))
                everyData.append(reNull(everyChild['oboznachenie_na_plane'], ''))

                self.contourId.append(int(everyChild['id']))
                self.contours[int(everyChild['id'])] = everyData

            elif everyChild['id_vid_uchastka'] == gv['onePartCode']:
                everyData = []
                everyData.append(str(reNull(everyChild['nomer_kontura'], '')))
                everyData.append(reNull(everyChild['oboznachenie_na_plane'], ''))

                self.partId.append(int(everyChild['id']))
                self.parts[int(everyChild['id'])] = everyData

            elif everyChild['id_vid_uchastka'] == gv['isolatedParcelCode']:
                everyData = []
                everyData.append(reNull(everyChild['kn'], ''))
                everyData.append(reNull(everyChild['oboznachenie_na_plane'], ''))

                self.isolatedId.append(int(everyChild['id']))
                self.isolated[int(everyChild['id'])] = everyData

            elif everyChild['id_vid_uchastka'] == gv['nominalParcelCode']:
                everyData = []
                everyData.append(reNull(everyChild['kn'], ''))
                everyData.append(reNull(everyChild['oboznachenie_na_plane'], ''))

                self.nominalId.append(int(everyChild['id']))
                self.nominal[int(everyChild['id'])] = everyData
        
################################################################################
    def editMode(self, isEdit):
        if isEdit:
            self.pushButtonSave.setEnabled(True)
            self.pushButtonAdd.setEnabled(False)
            self.pushButtonEdit.setEnabled(False)
            self.pushButtonDel.setEnabled(False)
            self.pushButtonClose.setEnabled(False)

        else:
            self.pushButtonSave.setEnabled(False)
            self.pushButtonAdd.setEnabled(True)
            self.pushButtonEdit.setEnabled(True)
            self.pushButtonDel.setEnabled(True)
            self.pushButtonClose.setEnabled(True)
        
################################################################################
    def editMode4text(self):
        self.editMode(True)

################################################################################
    def deleteAdr(self, lname, idUch, idAdr):
        searchCondition = '\"id_adres\" = ' + str(idAdr)
        attributesParcelLocation = attributesBySearchCondition('pb_uchastok_adres', searchCondition, ['id'])
        if len(attributesParcelLocation) == 1:
            if deleteById('pb_adres', idAdr):
                return True
            else:
                return False

        elif len(attributesParcelLocation) > 1:
            searchCondition = '\"id_uchastok\" = ' + str(idUch) + ' AND \"id_adres\" = ' + str(idAdr)
            attributesParcelLocation = attributesBySearchCondition('pb_uchastok_adres', searchCondition, ['id'])
            if len(attributesParcelLocation) == 1:
                idForDelete = int(attributesParcelLocation['id'])
                if deleteById('pb_uchastok_adres', idForDelete):
                    return True
                else:
                    return False
            else:
                return False
        else:
            return False

################################################################################
    def fillComboBoxDocument(self, comboBox, guidDocument):
        comboBox.clear()
        comboBox.addItem(u' ', None)

        if guidDocument > ' ':
            attributesDocument = attributesByKeys('pb_document', 'guid', 
                [str(guidDocument)], attributesNamesDocument)

            if len(attributesDocument) == 1:
                attributesDocument = attributesDocument[0]
                title = attributesDocument['number_doc'] + ' '
                title += attributesDocument['date'].toString('yyyy-MM-dd') + ' '
                title += attributesDocument['name'][:33]

                comboBox.addItem(unicode(title), str(guidDocument))
                comboBox.setCurrentIndex(1)


################################################################################
    def doCommonText(self):
        if self.dlgCommonText == None:
            self.dlgCommonText = CommonText(self.iface)

        textEdit = None
        if self.sender() == self.pushButtonUtilization:
            textEdit = self.textEditIspolzDok
            self.dlgCommonText.typeCommonText = 4

        elif self.sender() == self.pushButtonEncumbrance:
            textEdit = self.textEditVidObremeneniya
            self.dlgCommonText.typeCommonText = 5
        
        if textEdit != None:
            self.dlgCommonText.guidCommonText = None
            self.dlgCommonText.textEdit.setText('')
            self.dlgCommonText.fillTree()

            self.dlgCommonText.exec_()
            if self.dlgCommonText.valueCommonText != None:
                textEdit.setText(self.dlgCommonText.valueCommonText)


################################################################################
    def doDocument(self):
        comboBox = None
        if self.sender() == self.pushButtonDocumentCategory:
            comboBox = self.comboBoxDocumentCategory

        elif self.sender() == self.pushButtonDocumentUtilization:
            comboBox = self.comboBoxDocumentUtilization

        elif self.sender() == self.pushButtonDocumentEncumbrance:
            comboBox = self.comboBoxDocumentEncumbrance
        
        if comboBox != None:
            if self.dlgDocument == None:
                self.dlgDocument = Document(self.iface)
                self.dlgDocument.fillTree()

            self.dlgDocument.selectedGuid = None

            self.dlgDocument.exec_()
            if self.dlgDocument.selectedGuid != None:

                comboBox.clear()
                comboBox.addItem(u' ', None)

                if self.dlgDocument.selectedGuid > ' ':
                    attributesDocument = attributesByKeys('pb_document', 'guid', 
                        [str(self.dlgDocument.selectedGuid)], attributesNamesDocument)
                    if len(attributesDocument) == 1:
                        attributesDocument = attributesDocument[0]
                        title = attributesDocument['number_doc'] + ' '
                        title += attributesDocument['date'].toString('yyyy-MM-dd') + ' '
                        title += attributesDocument['name'][:33]

                        comboBox.addItem(unicode(title), str(self.dlgDocument.selectedGuid))
                        comboBox.setCurrentIndex(1)

################################################################################
    def checkAreaValue(self, stringValue):
        if stringValue > '':
            try:
                float(stringValue)

            except ValueError:
                QMessageBox.warning(self.iface.mainWindow(), u"Ошибка ввода", 
                    u'Некорректное число или разделитель целой и дробной части числа')
                textCorrect = stringValue[:len(stringValue) - 1]
                self.sender().setText(textCorrect)


################################################################################
    def id_type_from_class(self, ln, id):
        try: gpre.index(ln)
        except: isLeaveFilter = False
        else: isLeaveFilter = True

        fe = QgsFeature()
        la = get_vector_layer_by_name(gln[ln])
        if la != None:
            if isLeaveFilter: pre = la.subsetString()
            la.setSubsetString('\"id\"=' + str(id))
            if (int(la.featureCount()) == 1):
                pr = la.dataProvider()
                for fe in pr.getFeatures(QgsFeatureRequest().setFlags(QgsFeatureRequest.NoGeometry)):
                    at = fe.attributes()
                    re = at[1]
            else:
                re = u'Значение не определено.'
            if isLeaveFilter: la.setSubsetString(pre)
        del fe
        return re

################################################################################
    def sid_znachenie_from_class(self, ln, sid):
        try: gpre.index(ln)
        except: isLeaveFilter = False
        else: isLeaveFilter = True
    
        re = u'Значение не определено.'
        la = get_vector_layer_by_name(gln[ln])
        if (la != None) and (sid != None):
            if isLeaveFilter: pre = la.subsetString()
            la.setSubsetString('\"id\"=\'' +sid+ '\'')
            if (int(la.featureCount()) == 1):
                pr = la.dataProvider()
                fe = QgsFeature()
                for fe in pr.getFeatures(QgsFeatureRequest().setFlags(QgsFeatureRequest.NoGeometry)):
                    at = fe.attributes()
                del fe
                re = at[la.fieldNameIndex('znachenie')]

            if isLeaveFilter: la.setSubsetString(pre)
        return re


################################################################################
    def dlgClose(self):
        self.close()

#        QMessageBox.information(self.iface.mainWindow(), 'test', str())
