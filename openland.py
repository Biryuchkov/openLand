# -*- coding: utf-8 -*-
"""
/***************************************************************************
 openland
                                 A QGIS plugin
 tools for cadastral engineer
                              -------------------
        begin                : 2012-10-08
        copyright            : (C) 2012 by Dmitriy Biryuchkov
        email                : biryuchkov@gmail.com
 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/
"""
import os.path
import sys

from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
#from tools.landplaning.coordcatalog import CatalogData
from tools.landplaning.createCoordCatalog import CreateCoordCatalog

sys.path.append(os.path.abspath(os.path.dirname(__file__) + '/tools'))

from math import sqrt
from common import *
from mp import mpDialog
from importxml import ImportXML
from importobject import importObject
from importgeometry import importGeometry
from xml2print import xml2Print
from roundcoords import RoundCoords
from scale2area import olScale2Area
from createpoints import createPoints
from geoshema import createGeoShema
from renumber import reNumberPoints
from objects2pre import objects2pre
from createmulticontour import createMultiContour
from fillareaupdate import fillAreaUpdate
from kvrattributes import kvrAttributes
from uchattributes import uchAttributes
from addpartorcontour import addPartOrAddContour
from unionparcels import unionParcels
from splitparcel import splitParcel
from point import point
from border import border
from filterset import filterSet
from openlandsettings import OpenLandSettings
from openlandabout import OpenLandAbout


class openLand:
    def __init__(self, iface):
        self.iface = iface
        self.canvas = self.iface.mapCanvas()

        self.dlgFillAreaUpdate = None
        self.dlgRoundCoords = None
        self.dlgXml2Print = None
        self.dlgFilterSet = None
        self.dlgSettings = None
        self.dlgAbout = None
        self.dlgImportXML = None
        self.dlgMP = None
        self.dlg_coordcatalog = None

    def initGui(self):
        QObject.connect(self.iface, SIGNAL('currentLayerChanged(QgsMapLayer*)'), self.toggle)

        self.menu = QMenu()
        self.menu.setTitle(u"Кадастр")

        self.importMenu = QMenu()
        self.importMenu.setTitle(u"Импорт")
        self.openland_importobject = QAction(u"Импорт кадастровых объектов", self.iface.mainWindow())
        self.openland_importobject.setEnabled(False)
        self.openland_importobject.setIcon(QIcon(":/plugins/openland/icons/importkk.png"))
        self.openland_importgeometry = QAction(u"Импорт геометрии", self.iface.mainWindow())
        self.openland_importgeometry.setEnabled(False)
        self.openland_importgeometry.setIcon(QIcon(":/plugins/openland/icons/importgeomzu.png"))
        self.openland_importxml = QAction(u"Импорт XML", self.iface.mainWindow())
        self.openland_importxml.setEnabled(False)
        self.openland_importxml.setIcon(QIcon(":/plugins/openland/icons/import_xml.png"))
        self.importMenu.addActions([self.openland_importxml, self.openland_importgeometry, self.openland_importobject])
        self.menu.addMenu(self.importMenu)

        geometryMenu = QMenu()
        geometryMenu.setTitle(u"Геометрия")
        self.openland_roundcoords = QAction(u"Округлить координаты", self.iface.mainWindow())
        self.openland_roundcoords.setEnabled(False)
        self.openland_roundcoords.setIcon(QIcon(":/plugins/openland/icons/coord_round.png"))
        self.openland_scale2area = QAction(u"Масштабировать полигон", self.iface.mainWindow())
        self.openland_scale2area.setEnabled(False)
        self.openland_scale2area.setIcon(QIcon(":/plugins/openland/icons/scalearea.png"))
        geometryMenu.addActions([self.openland_roundcoords, self.openland_scale2area])
        self.menu.addMenu(geometryMenu)

        self.functionMenu = QMenu()
        self.functionMenu.setTitle(u"Функции")
        self.openland_createpoints = QAction(u"Создать точки и границы", self.iface.mainWindow())
        self.openland_createpoints.setEnabled(False)
        self.openland_createpoints.setIcon(QIcon(":/plugins/openland/icons/border.png"))
        self.openland_renumber = QAction(u"Изменить точки", self.iface.mainWindow())
        self.openland_renumber.setEnabled(False)
        self.openland_renumber.setIcon(QIcon(":/plugins/openland/icons/reorder.png"))
        self.openland_objects2pre = QAction(u"Прекратить существование выбранных объектов", self.iface.mainWindow())
        self.openland_objects2pre.setEnabled(False)
        self.openland_objects2pre.setIcon(QIcon(":/plugins/openland/icons/objects2pre.png"))
        self.openland_linkpoint2area = QAction(u"Указать принадлежность точек выбранному участку", self.iface.mainWindow())
        self.openland_linkpoint2area.setEnabled(False)
        self.openland_linkpoint2area.setIcon(QIcon(":/plugins/openland/icons/linkpoint2area.png"))
        self.openland_createborder = QAction(u"Создать границу по двум точкам", self.iface.mainWindow())
        self.openland_createborder.setEnabled(False)
        self.openland_createborder.setIcon(QIcon(":/plugins/openland/icons/create_border.png"))
        self.openland_createmulticontour = QAction(u"Создать многоконтурный", self.iface.mainWindow())
        self.openland_createmulticontour.setEnabled(False)
        self.openland_createmulticontour.setIcon(QIcon(":/plugins/openland/icons/combcontours.png"))
        self.openland_selectallcontours = QAction(u"Выбрать все контуры, входящие или ЧЗУ", self.iface.mainWindow())
        self.openland_selectallcontours.setEnabled(False)
        self.openland_selectallcontours.setIcon(QIcon(":/plugins/openland/icons/selectallcontours.png"))
        self.openland_fillareaupdate = QAction(u"Расчёт уточненных площадей контуров", self.iface.mainWindow())
        self.openland_fillareaupdate.setEnabled(False)
        self.openland_fillareaupdate.setIcon(QIcon(":/plugins/openland/icons/fillareaupdate.png"))
        self.functionMenu.addActions([self.openland_createpoints, self.openland_renumber, self.openland_objects2pre, self.openland_linkpoint2area, self.openland_createborder])
        self.functionMenu.addActions([self.openland_createmulticontour, self.openland_selectallcontours, self.openland_fillareaupdate])
        self.menu.addMenu(self.functionMenu)
        
        self.attributeMenu = QMenu()
        self.attributeMenu.setTitle(u"Атрибуты")
        self.openland_attribute = QAction(u"Атрибуты объекта", self.iface.mainWindow())
        self.openland_attribute.setEnabled(False)
        self.openland_attribute.setIcon(QIcon(":/plugins/openland/icons/attributes.png"))
        self.openland_mp = QAction(u"Межевой план", self.iface.mainWindow())
        self.openland_mp.setEnabled(False)
        self.openland_mp.setIcon(QIcon(":/plugins/openland/icons/mp.png"))
        self.attributeMenu.addActions([self.openland_attribute, self.openland_mp])
        self.menu.addMenu(self.attributeMenu)

        self.cadastreWorkMenu = QMenu()
        self.cadastreWorkMenu.setTitle(u"Кадастровые работы")
        self.openland_addpartorcontour = QAction(u"Добавить контур, входящий или ЧЗУ", self.iface.mainWindow())
        self.openland_addpartorcontour.setEnabled(False)
        self.openland_addpartorcontour.setIcon(QIcon(":/plugins/openland/icons/addcontour.png"))
        self.openland_unionparcels = QAction(u"Объединить участки", self.iface.mainWindow())
        self.openland_unionparcels.setEnabled(False)
        self.openland_unionparcels.setIcon(QIcon(":/plugins/openland/icons/unionparcels.png"))
        self.openland_splitparcel = QAction(u"Разделить участок", self.iface.mainWindow())
        self.openland_splitparcel.setEnabled(False)
        self.openland_splitparcel.setIcon(QIcon(":/plugins/openland/icons/splitparcel.png"))
        self.cadastreWorkMenu.addActions([self.openland_unionparcels, self.openland_addpartorcontour, self.openland_splitparcel])
        self.menu.addMenu(self.cadastreWorkMenu)

        self.beforeprintMenu = QMenu()
        self.beforeprintMenu.setTitle(u"Построения для печати")
        self.openland_geoshema = QAction(u"Схема геопостроений", self.iface.mainWindow())
        self.openland_geoshema.setEnabled(False)
        self.openland_geoshema.setIcon(QIcon(":/plugins/openland/icons/geoshema.png"))
        self.beforeprintMenu.addActions([self.openland_geoshema])
        self.menu.addMenu(self.beforeprintMenu)

        self.openland_xml2print = QAction(u"Документ для печати", self.iface.mainWindow() )
        self.openland_xml2print.setIcon(QIcon(":/plugins/openland/icons/print.png"))
        self.openland_xml2print.setEnabled(False)
        self.openland_filterset = QAction(u"Фильтр данных", self.iface.mainWindow() )
        self.openland_filterset.setIcon(QIcon(":/plugins/openland/icons/filter.png"))
        self.openland_filterset.setEnabled(False)
        self.openland_settings = QAction(u"Настройки", self.iface.mainWindow() )
        self.openland_settings.setIcon(QIcon(":/plugins/openland/icons/settings.png"))
        self.openland_settings.setEnabled(True)
        self.openland_about = QAction(u"О программе", self.iface.mainWindow() )
        self.openland_about.setIcon(QIcon(":/plugins/openland/icons/about.png"))
        self.menu.addActions([self.openland_xml2print, self.openland_filterset, self.openland_settings, self.openland_about])

        # Землеустройство
        self.menu_landplaning = QMenu()
        self.menu_landplaning.setTitle(u'Землеустройство')

        self.openland_createcoordcatalog = QAction(u'Ведомость координат', self.iface.mainWindow())
        self.openland_createcoordcatalog.setEnabled(True)
        self.openland_createcoordcatalog.setIcon(QIcon(":/plugins/openland/icons/create_coordcatalog.png"))
        self.menu_landplaning.addActions([self.openland_createcoordcatalog])


        menu_bar = self.iface.mainWindow().menuBar()
        actions = menu_bar.actions()
        lastAction = actions[len(actions) - 1]
        menu_bar.insertMenu(lastAction, self.menu)
        menu_bar.insertMenu(lastAction+1, self.menu_landplaning)

        QObject.connect(self.openland_importxml, SIGNAL("triggered()"), self.doImportXML)
        QObject.connect(self.openland_importgeometry, SIGNAL("triggered()"), self.doImportGeometry)
        QObject.connect(self.openland_importobject, SIGNAL("triggered()"), self.doImportObject)
        QObject.connect(self.openland_roundcoords, SIGNAL("triggered()"), self.doRoundCoords)
        QObject.connect(self.openland_scale2area, SIGNAL("triggered()"), self.doScaleArea)
        QObject.connect(self.openland_createpoints, SIGNAL("triggered()"), self.doCreatePoints)
        QObject.connect(self.openland_renumber, SIGNAL("triggered()"), self.doReNumberPoints)
        QObject.connect(self.openland_objects2pre, SIGNAL("triggered()"), self.doObjects2Pre)
        QObject.connect(self.openland_linkpoint2area, SIGNAL("triggered()"), self.doLinkPoint)
        QObject.connect(self.openland_createborder, SIGNAL("triggered()"), self.doCreateBorder)
        QObject.connect(self.openland_geoshema, SIGNAL("triggered()"), self.doCreateGeoShema)
        QObject.connect(self.openland_createmulticontour, SIGNAL("triggered()"), self.doCreateMultiContour)
        QObject.connect(self.openland_selectallcontours, SIGNAL("triggered()"), self.doSelectAllContours)
        QObject.connect(self.openland_fillareaupdate, SIGNAL("triggered()"), self.doFillAreaUpdate)
        QObject.connect(self.openland_attribute, SIGNAL("triggered()"), self.doAttribute)
        QObject.connect(self.openland_mp, SIGNAL("triggered()"), self.doMp)
        QObject.connect(self.openland_addpartorcontour, SIGNAL("triggered()"), self.doAddPartOrContour)
        QObject.connect(self.openland_unionparcels, SIGNAL("triggered()"), self.doUnionParcels)
        QObject.connect(self.openland_splitparcel, SIGNAL("triggered()"), self.doSplitParcel)
        QObject.connect(self.openland_xml2print, SIGNAL("triggered()"), self.doXml2print)
        QObject.connect(self.openland_filterset, SIGNAL("triggered()"), self.doFilterSet)
        QObject.connect(self.openland_settings, SIGNAL("triggered()"), self.doSettings)
        QObject.connect(self.openland_about, SIGNAL("triggered()"), self.doAbout)
        QObject.connect(self.openland_createcoordcatalog, SIGNAL("triggered()"), self.doCreateCoordcatalog)

        self.toolBar = self.iface.addToolBar("openLand")
        self.toolBar.setObjectName("openLand")
        self.toolBar.addAction(self.openland_roundcoords)
        self.toolBar.addAction(self.openland_scale2area)
        self.toolBar.addSeparator()
        self.toolBar.addAction(self.openland_createpoints)
        self.toolBar.addAction(self.openland_renumber)
        self.toolBar.addAction(self.openland_objects2pre)
        self.toolBar.addAction(self.openland_linkpoint2area)
        self.toolBar.addAction(self.openland_createborder)
        self.toolBar.addAction(self.openland_createmulticontour)
        self.toolBar.addAction(self.openland_selectallcontours)
        self.toolBar.addAction(self.openland_fillareaupdate)
        self.toolBar.addSeparator()
        self.toolBar.addAction(self.openland_unionparcels)
        self.toolBar.addAction(self.openland_addpartorcontour)
        self.toolBar.addAction(self.openland_splitparcel)
        self.toolBar.addSeparator()
        self.toolBar.addAction(self.openland_attribute)
        self.toolBar.addAction(self.openland_mp)
        self.toolBar.addSeparator()
        self.toolBar.addAction(self.openland_geoshema)
        self.toolBar.addSeparator()
        self.toolBar.addAction(self.openland_filterset)

        self.updateProjectFromDefault()

    def doImportGeometry(self):
        d = importGeometry(self.iface)
        if d.toPrepare():
            d.exec_()
        del d

    def doImportObject(self):
        d = importObject(self.iface)
        if d.toPrepare():
            d.exec_()
        del d

    def doImportXML(self):
        if self.dlgImportXML == None:
            self.dlgImportXML = ImportXML(self.iface)
        self.dlgImportXML.toPrepare()
        self.dlgImportXML.show()

    def doXml2print(self):
        if self.dlgXml2Print == None: 
            self.dlgXml2Print = xml2Print(self.iface)
        self.dlgXml2Print.toPrepare(os.path.abspath(os.path.dirname(__file__)))
        self.dlgXml2Print.show()

    def doRoundCoords(self):
        if self.dlgRoundCoords == None:
            self.dlgRoundCoords = RoundCoords(self.iface)
        if self.dlgRoundCoords.toPrepare():
            self.dlgRoundCoords.show()

    def doScaleArea(self):
        d = olScale2Area(self.iface)
        if d.toPrepare():
            d.exec_()
        del d
            
    def doCreatePoints(self):
        d = createPoints(self.iface)
        if d.toPrepare():
            d.exec_()
        del d

    def doCreateGeoShema(self):
        d = createGeoShema(self.iface)
        if d.toPrepare():
            d.exec_()
        del d
        
    def doReNumberPoints(self):
        layer = get_vector_layer_by_name(gln['ln_uchastok'])
        selection = layer.selectedFeatures()
        ls = len(selection)
        if ls >= 1:
            d = reNumberPoints(self.iface)
            d.lineEditSelectedCount.setText(str(ls))
            d.lineEditDelta.setText(str(accuracyById(selection[0].id())))
            d.selectionUc = selection
            d.exec_()
            del d
        else:
            QMessageBox.warning(self.iface.mainWindow(), u"Ошибка выбора данных", 
                                                         u'Необходимо выбрать не менее одного ЗУ(ЧЗУ, контура) для изменения порядка точек.')

    def doObjects2Pre(self):
        d = objects2pre(self.iface)
        d.exec_()
        del d

    def doLinkPoint(self):
        layerUc = get_vector_layer_by_name(gln['ln_uchastok'])
        layerPn = get_vector_layer_by_name(gln['ln_tochka'])
        selectionUc = layerUc.selectedFeatures()
        if len(selectionUc) == 1:
            selectionPn = layerPn.selectedFeatures()
            if len(selectionPn) >= 1:
                geoma = QgsGeometry(selectionUc[0].geometry())
                idu = selectionUc[0].id()
                geomaPoints = allPointsPolygon(geoma)

                attributesAllPoint = {}
                for p in selectionPn:
                    idp = p.id()
                    geomp = QgsGeometry(p.geometry()).asPoint()
                    x = geomp.x()
                    y = geomp.y()
                    l4sort = []

                    for i in geomaPoints:
                        dl = sqrt((i[0] - x)**2 + (i[1] - y)**2);
                        l4sort.append([dl, i[0], i[1]])
    
                    l4sort.sort()
                    xNew = l4sort[0][1]
                    yNew = l4sort[0][2]
                    
                    attributesOnePoint = {}
                    attributesOnePoint[layerPn.fieldNameIndex('id_uchastok')] = idu
                    attributesOnePoint[layerPn.fieldNameIndex('x')] = xNew
                    attributesOnePoint[layerPn.fieldNameIndex('y')] = yNew
                    attributesOnePoint[layerPn.fieldNameIndex('pre')] = 0
                    attributesAllPoint[idp] = attributesOnePoint
                    del geomp

                layerPn.dataProvider().changeAttributeValues(attributesAllPoint)
                self.canvas.refresh()
                del geoma

            else:
                QMessageBox.warning(self.iface.mainWindow(), u"Ошибка выбора данных", 
                                                             u'Необходимо выбрать не менее одной точки.')
        else:
            QMessageBox.warning(self.iface.mainWindow(), u"Ошибка выбора данных", 
                                                         u'Необходимо предварительно выбрать только один участок.')
    
    def doCreateBorder(self):
        layerPn = get_vector_layer_by_name(gln['ln_tochka'])
        selection = layerPn.selectedFeatures()
        ls = len(selection)
        if ls == 2:
            feat = QgsFeature()
            layerBrd = get_vector_layer_by_name(gln['ln_granica'])

            row1 = selection[0].attributes()
            id1 = row1[layerPn.fieldNameIndex('id')]
            id_uchastok1 = row1[layerPn.fieldNameIndex('id_uchastok')]
            geom1 = QgsGeometry(selection[0].geometry())

            row2 = selection[1].attributes()
            id2 = row2[layerPn.fieldNameIndex('id')]
            id_uchastok2 = row2[layerPn.fieldNameIndex('id_uchastok')]
            geom2 = QgsGeometry(selection[1].geometry())

            if id_uchastok1 != id_uchastok2:
                QMessageBox.warning(self.iface.mainWindow(), u"Ошибка выбора данных", 
                                                             u'Выбранные точки не принадлежат одному участку.')
                return

            geomline = QgsGeometry.fromPolyline([geom1.asPoint(), geom2.asPoint()])
            if (geomline != None) and geomline.isGeosValid():               
                feat.setGeometry(geomline)
                feat.initAttributes(len(layerBrd.dataProvider().attributeIndexes()))
                feat.setAttribute(layerBrd.fieldNameIndex('id_uchastok'), id_uchastok1)
                feat.setAttribute(layerBrd.fieldNameIndex('id_msk'), idCurrentMSK())
                
                if layerBrd.dataProvider().addFeatures([feat])[0]:
                    self.canvas.refresh()
                else: 
                    QMessageBox.warning(self.iface.mainWindow(), u"Ошибка обработки данных", 
                                                                 u'Не удалось создать границу по выбранным точкам.')
            else:
                QMessageBox.warning(self.iface.mainWindow(), u"Ошибка обработки данных", 
                                                             u'Не удалось создать линейный объект по выбранным точкам.')
                return

            del geom1
            del geom2
            del feat
        else:
            QMessageBox.warning(self.iface.mainWindow(), u"Ошибка выбора данных", 
                                                         u'Необходимо выбрать только две точки для создания границы между ними.')

    def doCreateMultiContour(self):
        layerParcel = get_vector_layer_by_name(gln['ln_uchastok'])
        selection = layerParcel.selectedFeatures()
        ls = len(selection)
        if ls > 1:
            d = createMultiContour(self.iface)
            d.lineEditSelectedCount.setText(str(ls))
            d.selectionCount = ls
            d.exec_()
            del d
        else:
            QMessageBox.warning(self.iface.mainWindow(), u"Ошибка выбора данных", 
                                                         u'Необходимо выбрать не менее двух участков для объединения в многоконтурный участок.')

    def doUnionParcels(self):
        d = unionParcels(self.iface)
        if d.toPrepare():
            d.exec_()
        del d

    def doAddPartOrContour(self):
        d = addPartOrAddContour(self.iface)
        if d.toPrepare():
            d.exec_()
        del d

    def doSplitParcel(self):
        d = splitParcel(self.iface)
        if d.toPrepare():
            d.exec_()
        del d

    def doSelectAllContours(self):
        listSelectedParcelId = attributesFromSelection('ln_uchastok', ['id'])
        if len(listSelectedParcelId) == 1:
            idChild = int(listSelectedParcelId[0]['id'])
            idParent = idParentByIdChild(idChild)

            if idParent > 0:
                listIdParcel = listIdChildByIdParent(idParent)
                
                if len(listIdParcel) > 0:
                    if selectVectorObjectsById('ln_uchastok', listIdParcel):
                        self.canvas.zoomToSelected()

        else:
            QMessageBox.warning(self.iface.mainWindow(), u"Ошибка выбора данных", 
                                                         u'Необходимо выбрать только один участок(контур, часть) для автоматического выбора остальных контуров(частей).')

    def doFillAreaUpdate(self):
        layer = get_vector_layer_by_name(gln['ln_uchastok'])
        selection = layer.selectedFeatures()
        ls = len(selection)
        if ls >= 1:
            if self.dlgFillAreaUpdate == None:
                self.dlgFillAreaUpdate = fillAreaUpdate(self.iface)
            self.dlgFillAreaUpdate.lineEditSelectedCount.setText(str(ls))
            self.dlgFillAreaUpdate.selection = selection
            self.dlgFillAreaUpdate.selectionCount = ls
            self.dlgFillAreaUpdate.show()
        else:
            QMessageBox.warning(self.iface.mainWindow(), u"Ошибка выбора данных", 
                                                         u'Необходимо выбрать не менее одного контура для расчёта уточнённой площади.')
    
    def doAttribute(self):
        layer = self.iface.mainWindow().activeLayer()
        selection = layer.selectedFeatures()
        if len(selection) == 1:
            row = selection[0].attributes()
            
            # Атрибуты земельного участка
            if layer.name() == gln['ln_uchastok']: 
                d = uchAttributes(self.iface)
                d.idParcel = int(selection[0].id())
                d.geom = QgsGeometry(selection[0].geometry())
#                d.row = row
                d.sumArea = 0

                if paramByName([['interface/isEditMultiContour', 'bool']])[0]:
                    listParentId = attributesBySearchCondition('pb_parcel_parcel', 
                                   '\"id_children\"=' + str(d.idParcel), ['id_parent'])
                    if len(listParentId) == 1:
                        d.idParent = int(listParentId[0]['id_parent'])

                        if (d.idParent > 0):
                            d.layerUc.removeSelection() 
                            d.layerUc.select(d.idParent)
                            selection = d.layerUc.selectedFeatures()
                            d.idParcel = d.idParent
                            d.geom = QgsGeometry()
                            d.sumArea = calculatedArea(d.idParent)
#                            d.row = selection[0].attributes()

                d.dlgFill()
                d.layerUc.removeSelection() 

            elif layer.name() == gln['ln_kvartal']: 
                d = kvrAttributes(self.iface)

            elif layer.name() == gln['ln_tochka']: 
                d = point(self.iface)
                d.idPoint = int(row[layer.fieldNameIndex('id')])
                d.idParcel = row[layer.fieldNameIndex('id_uchastok')]
                d.action = 'edit'
                d.dlgFill()

            elif layer.name() == gln['ln_granica']: 
                d = border(self.iface)
                d.idBorder = int(row[layer.fieldNameIndex('id')])
                d.dlgFill()

            else:
                QMessageBox.warning(self.iface.mainWindow(), u"Ошибка выбора данных", 
                                                             u'Необходимо выбрать объект на одном из перечисленных слоёв: \"Точка\", \"Граница\", \"Участок\", \"Квартал\"')
                return
            
            d.exec_()
            del d
            self.canvas.refresh()
        else:
            QMessageBox.warning(self.iface.mainWindow(), u"Ошибка выбора данных", 
                                                         u'Необходимо выбрать только один объект для работы с атрибутами.')
                    
    def doMp(self):
        if self.dlgMP == None:
            self.dlgMP = mpDialog(self.iface)
            self.dlgMP.fillTree()

        self.dlgMP.mpSelectionParcel()
        self.dlgMP.show()
    
    def doFilterSet(self):
        if self.dlgFilterSet == None:
            self.dlgFilterSet = filterSet(self.iface)

        self.dlgFilterSet.isUseDefaultConnection = self.dlgFilterSet.settings.value('database/isusedefault', False)
        self.dlgFilterSet.connectionUserName = self.dlgFilterSet.settings.value('database/user', u'openlanduser1')

        if (self.dlgFilterSet.isUseDefaultConnection) and (self.dlgFilterSet.connectionUserName > ' ') and (self.dlgFilterSet.connectionUserName != 'openlanduser1'):
            self.dlgFilterSet.checkBoxOnlyCurrentUser.setEnabled(True)

        else:
            self.dlgFilterSet.checkBoxOnlyCurrentUser.setEnabled(False)

        self.dlgFilterSet.show()

    def doSettings(self):
        if self.dlgSettings == None:
            self.dlgSettings = OpenLandSettings(self.iface)
        self.dlgSettings.paramsRead()
        self.dlgSettings.exec_()

        if self.dlgSettings.isChangeMSK:
            if not (self.dlgFilterSet == None):
                self.dlgFilterSet = None

    def doAbout(self):
        if self.dlgAbout == None:
            self.dlgAbout = OpenLandAbout(self.iface)

        dbInformation = []
        dbInformation = attributesBySearchCondition('cl_database_version', 'True', ['number_version', 'date_version'])

        if len(dbInformation) == 1:
            dbVersion = str(dbInformation[0]['number_version'])
            dbDate = dbInformation[0]['date_version'].toString(('yyyy-MM-dd'))
            self.dlgAbout.labelDbVersion.setText(u'Версия базы данных ' + dbVersion + u' от ' + dbDate)

        self.dlgAbout.lblVersion.setText(u'<html><head/><body><p>Версия ' +gv['versionPlugin']+ u' <span style=\" color:#ff0000; vertical-align:sub;\">альфа</span> от ' +gv['datePlugin']+ u'</p></body></html>')
        self.dlgAbout.show()

    def doCreateCoordcatalog(self):
        if self.dlg_coordcatalog is None:
            self.dlg_coordcatalog = CreateCoordCatalog(self.iface)
        self.dlg_coordcatalog.show()

    def updateProjectFromDefault(self):
        '''
        Обновление проекта QGIS, указанного в настройках
        на состав данных из проекта по умолчанию в составе модуля
        '''
        settings = QSettings("openLand", "openLand")

        isUseDefaultConnection = settings.value('database/isusedefault', False)
        pathIn = os.path.abspath(os.path.dirname(__file__) + '/projects')
        fileProject = pathIn + '/openLand.qgs'
        file4Update = settings.value('database/file4update', u'Не указан')

        if (isUseDefaultConnection) and (len(file4Update) > 5) and (file4Update != u'Не указан'):
            connectionServer = settings.value('database/server', u'localhost')
            connectionPort = settings.value('database/port', u'5432')
            connectionDataBase = settings.value('database/database', u'openland')
            connectionUserName = settings.value('database/user', u'openlanduser1')
            connectionUserPassword = settings.value('database/password', u'user1pass')

            isCreateNewProject = False
            newConnectionString = ''
            newLine = ''
            
            if (connectionServer > ' ') and (connectionPort > ' ') and (connectionDataBase > ' '):
                newConnectionString = "dbname=\'" +connectionDataBase+ "\' host=" +connectionServer+ " port=" +connectionPort
                
                if (connectionUserName > ' '):
                    newConnectionString = newConnectionString + " user=\'" +connectionUserName+ "\'"

                if (connectionUserPassword > ' '):
                    newConnectionString = newConnectionString + " password=\'" +connectionUserPassword+ "\'"
                 
                # newConnectionString = newConnectionString + " key="
                newConnectionString = newConnectionString + " sslmode=disable"
                # newConnectionString = unicode(newConnectionString)

                if (os.path.exists(file4Update)) and (os.path.getmtime(fileProject) <= os.path.getmtime(file4Update)):
                    fileTest = codecs.open(file4Update, 'r', 'utf-8')
                    testLine = fileTest.read()
                    testPosition = testLine.find(newConnectionString)

                    if (testPosition == -1):
                        isCreateNewProject = True
                    else:
                        isCreateNewProject = False

                    fileTest.close()

                else:
                    isCreateNewProject = True
                        
            if (isCreateNewProject) and (newConnectionString > 'dbname'):
                fileIn = codecs.open(fileProject, 'r', 'utf-8')

                for line in fileIn:
                    dbname = line.find('dbname')

                    if (dbname > 0):
                        newString = line.find(newConnectionString)

                        if (newString == -1):
                            #key = line.find('key=')
                            #if (key > 0):
                            #    newLine = newLine + line[:dbname] +newConnectionString+ line[key:]

                            sslmode = line.find('sslmode=disable')
                            if (sslmode > 0):
                                sslmode = sslmode + len('sslmode=disable')
                                newLine = newLine + line[:dbname] + newConnectionString + line[sslmode:]

                                isCreateNewProject = True

                            else:
                                isCreateNewProject = False

                        else:
                            isCreateNewProject = False

                    else:
                        newLine = newLine + line

                if isCreateNewProject:
                    try:
                        fileOut = codecs.open(file4Update, 'w', 'utf-8')
                    except:
                        QMessageBox.warning(self.iface.mainWindow(), u'Ошибка создания файла', 
                                                                     u'Невозможно создать обновляемый файл проекта ' + unicode(file4Update) + u'. Проверьте настройки модуля openLand.')
                    else:
                        fileOut.write(newLine)
                        fileOut.close()

                        shpFromDir = os.path.abspath(os.path.dirname(__file__) + '/projects/data')
                        shpToDir = os.path.dirname(os.path.abspath(fileOut.name))  + '/data'
                        if not os.path.isdir(shpToDir):
                            copyTree(shpFromDir, shpToDir)

                fileIn.close()
    
    def toggle(self):
        mc = self.canvas
        layer = mc.currentLayer()

        if layer != None:
            self.openland_xml2print.setEnabled(True)
            if (layer.type() == QgsMapLayer.VectorLayer) and (layer.geometryType() in [0, 1, 2]):
#               Выбран векторный слой
                selection = layer.selectedFeatures()
                if (layer.geometryType() == QGis.Polygon):
#                   Слой - полигон любой
                    self.openland_importobject.setEnabled(True)
                    self.openland_importgeometry.setEnabled(True)
                    self.openland_roundcoords.setEnabled(True)
                    self.openland_scale2area.setEnabled(True)
                    self.openland_geoshema.setEnabled(True)

                if (unicode(layer.name()) == gln['ln_uchastok']):
                    self.openland_attribute.setEnabled(True)
                    self.openland_mp.setEnabled(True)
                    self.openland_objects2pre.setEnabled(True)
                    self.openland_filterset.setEnabled(True)
                    self.openland_createpoints.setEnabled(True)
                    self.openland_renumber.setEnabled(True)
                    self.openland_createmulticontour.setEnabled(True)
                    self.openland_addpartorcontour.setEnabled(True)
                    self.openland_selectallcontours.setEnabled(True)
                    self.openland_fillareaupdate.setEnabled(True)
                    self.openland_importxml.setEnabled(True)
                    self.openland_linkpoint2area.setEnabled(True)
                    self.openland_createborder.setEnabled(False)
                    self.openland_unionparcels.setEnabled(True)
                    self.openland_splitparcel.setEnabled(True)

                elif (unicode(layer.name()) == gln['ln_tochka']):
                    self.openland_attribute.setEnabled(True)
                    self.openland_mp.setEnabled(False)
                    self.openland_objects2pre.setEnabled(True)
                    self.openland_linkpoint2area.setEnabled(True)
                    self.openland_createborder.setEnabled(True)
                    self.openland_filterset.setEnabled(False)
                    self.openland_createpoints.setEnabled(False)
                    self.openland_renumber.setEnabled(False)
                    self.openland_createmulticontour.setEnabled(False)
                    self.openland_addpartorcontour.setEnabled(False)
                    self.openland_selectallcontours.setEnabled(False)
                    self.openland_fillareaupdate.setEnabled(False)
                    self.openland_importxml.setEnabled(False)
                    self.openland_unionparcels.setEnabled(False)
                    self.openland_splitparcel.setEnabled(False)
                    
                elif (unicode(layer.name()) == gln['ln_granica']):
                    self.openland_attribute.setEnabled(True)
                    self.openland_mp.setEnabled(False)
                    self.openland_objects2pre.setEnabled(True)
                    self.openland_filterset.setEnabled(False)
                    self.openland_createpoints.setEnabled(False)
                    self.openland_renumber.setEnabled(False)
                    self.openland_linkpoint2area.setEnabled(False)
                    self.openland_createborder.setEnabled(False)
                    self.openland_createmulticontour.setEnabled(False)
                    self.openland_addpartorcontour.setEnabled(False)
                    self.openland_selectallcontours.setEnabled(False)
                    self.openland_fillareaupdate.setEnabled(False)
                    self.openland_importxml.setEnabled(False)
                    self.openland_unionparcels.setEnabled(False)
                    self.openland_splitparcel.setEnabled(True)

                elif (unicode(layer.name()) == gln['ln_kvartal']):
                    self.openland_attribute.setEnabled(True)
                    self.openland_mp.setEnabled(False)
                    self.openland_filterset.setEnabled(True)
                    self.openland_objects2pre.setEnabled(False)
                    self.openland_createpoints.setEnabled(False)
                    self.openland_renumber.setEnabled(False)
                    self.openland_linkpoint2area.setEnabled(False)
                    self.openland_createborder.setEnabled(False)
                    self.openland_createmulticontour.setEnabled(False)
                    self.openland_addpartorcontour.setEnabled(False)
                    self.openland_selectallcontours.setEnabled(False)
                    self.openland_fillareaupdate.setEnabled(False)
                    self.openland_importxml.setEnabled(False)
                    self.openland_unionparcels.setEnabled(False)
                    self.openland_splitparcel.setEnabled(False)

                else:
#                   НЕ [точка, граница, участок, квартал]
                    self.openland_attribute.setEnabled(False)
                    self.openland_mp.setEnabled(False)
                    self.openland_objects2pre.setEnabled(False)
                    self.openland_filterset.setEnabled(False)
                    self.openland_createpoints.setEnabled(False)
                    self.openland_renumber.setEnabled(False)
                    self.openland_linkpoint2area.setEnabled(False)
                    self.openland_createborder.setEnabled(False)
                    self.openland_createmulticontour.setEnabled(False)
                    self.openland_addpartorcontour.setEnabled(False)
                    self.openland_selectallcontours.setEnabled(False)
                    self.openland_fillareaupdate.setEnabled(False)
                    self.openland_importxml.setEnabled(False)
                    self.openland_unionparcels.setEnabled(False)
                    self.openland_splitparcel.setEnabled(False)

            else:
#               Выбран НЕ векторный слой
                self.openland_importobject.setEnabled(False)
                self.openland_importgeometry.setEnabled(False)
                self.openland_filterset.setEnabled(False)
                self.openland_roundcoords.setEnabled(False)
                self.openland_scale2area.setEnabled(False)
                self.openland_createpoints.setEnabled(False)
                self.openland_renumber.setEnabled(False)
                self.openland_objects2pre.setEnabled(False)
                self.openland_linkpoint2area.setEnabled(False)
                self.openland_createborder.setEnabled(False)
                self.openland_createmulticontour.setEnabled(False)
                self.openland_addpartorcontour.setEnabled(False)
                self.openland_selectallcontours.setEnabled(False)
                self.openland_fillareaupdate.setEnabled(False)
                self.openland_attribute.setEnabled(False)
                self.openland_mp.setEnabled(False)
                self.openland_unionparcels.setEnabled(False)
                self.openland_splitparcel.setEnabled(False)

        else:
#           Не выбран слой
            self.openland_filterset.setEnabled(False)
            self.openland_roundcoords.setEnabled(False)
            self.openland_scale2area.setEnabled(False)
            self.openland_createpoints.setEnabled(False)
            self.openland_renumber.setEnabled(False)
            self.openland_objects2pre.setEnabled(False)
            self.openland_linkpoint2area.setEnabled(False)
            self.openland_createborder.setEnabled(False)
            self.openland_geoshema.setEnabled(False)
            self.openland_createmulticontour.setEnabled(False)
            self.openland_addpartorcontour.setEnabled(False)
            self.openland_selectallcontours.setEnabled(False)
            self.openland_fillareaupdate.setEnabled(False)
            self.openland_attribute.setEnabled(False)
            self.openland_mp.setEnabled(False)
            self.openland_xml2print.setEnabled(False)
            self.openland_importxml.setEnabled(False)
            self.openland_importobject.setEnabled(False)
            self.openland_importgeometry.setEnabled(False)
            self.openland_unionparcels.setEnabled(False)
            self.openland_splitparcel.setEnabled(False)

    def unload(self):
#        autoFileName = os.path.abspath(os.path.dirname(__file__)) + '/projects/autosave.qgs'
#        self.iface.actionSaveProjectAs()
        del self.dlgFillAreaUpdate
        del self.dlgRoundCoords
        del self.dlgXml2Print
        del self.dlgFilterSet
        del self.dlgSettings
        del self.dlgAbout
        del self.dlgImportXML
        del self.dlgMP

        del self.toolBar
        del self.menu

#        QObject.connect(layer,SIGNAL("selectionChanged()"),self.toggle)
#        QObject.disconnect(layer,SIGNAL("editingStarted()"),self.toggle)
#        QObject.connect(layer,SIGNAL("editingStarted()"),self.toggle)
#        QObject.disconnect(layer,SIGNAL("editingStopped()"),self.toggle)        

#        QMessageBox.information(self.iface.mainWindow(), 'test', str())