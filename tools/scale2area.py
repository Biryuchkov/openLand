# -*- coding: utf-8 -*-
'''
/***************************************************************************
 scale2area for openland (cadastral engineer tools)
 copyright            : (C) 2012 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from scale2area_ui import Ui_olScaleArea
from common import *
from math import sqrt

class olScale2Area(QDialog, Ui_olScaleArea):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        self.connect(self.pushButtonOk, SIGNAL("clicked()"), self.runScale)        
        self.connect(self.pushButtonClose, SIGNAL("clicked()"), self.closeDlg)        

#        mapCRS = self.iface.mapCanvas().mapRenderer().destinationCrs()
#        layCRS = layer.crs()
#        if (mapCRS != layCRS):
#           coordTransform = QgsCoordinateTransform(layCRS, mapCRS)
#           coordTransformBack = QgsCoordinateTransform(mapCRS, layCRS)
#           geom.transform( coordTransform )
        
        self.layer = None
        self.caps = None
        self.geom = None
        self.fid = None
        self.area = None

    def toPrepare(self):
        self.layer = self.iface.mainWindow().activeLayer()
        selection = self.layer.selectedFeatures()
        if len(selection) == 1:
            self.geom = QgsGeometry(selection[0].geometry())
            self.caps = self.layer.dataProvider().capabilities()
            self.fid = selection[0].id()
            self.area = self.geom.area()
            tarea = str(self.area)
            self.lineEdit.setText(tarea)
            self.lineEdit_2.setText(tarea)
            return True
        else:
            QMessageBox.warning(self.iface.mainWindow(), u"Ошибка выбора данных", 
                                                         u'Необходимо выбрать только один площадной объект для масштабирования под необходимую площадь.')
            return False

    def runScale(self):
        tareanew = str(self.lineEdit_2.text()) 
        self.areanew = float(tareanew)
                      
        if self.areanew <= 0:
            QMessageBox.warning(self.iface.mainWindow(), u"Ошибка ввода данных", u"Требуемая площадь должна быть больше нуля.")

        else:

            # коэфициент отношения площадей необходимая/текущая
            ksqr = self.areanew / self.area 
            # коэфициент соотношения линейных размеров 
            kline = sqrt(ksqr)

            # рассчёт координат центральной точки выбранного полигона           
            centr = QgsGeometry(self.geom.centroid())
            centr = centr.asPoint()
            centrx = centr.x()
            centry = centr.y()

            if self.geom.isMultipart():
                polygons = self.geom.asMultiPolygon()
                # признак обработки самого первого полигона выбранного объекта
                polygon1 = True
                for poly in polygons:
                    # признак обработки самого первого кольца выбранного объекта
                    ring1 = True
                    for ring in poly:

                        polygon = []
                        for i in ring:
                            # расчёт координат нового полигона через коэфициент соотношения линейных размеров
                            xnew = (i.x() - centrx) * kline + centrx
                            ynew = (i.y() - centry) * kline + centry
                            point = QgsGeometry.fromPoint(QgsPoint(xnew, ynew))
                            polygon.append(point.asPoint())

                        if (ring1):                                                        
                        # если первый полигон и первое кольцо - создаём геометрию, в других случаях используем .addPart и .addRing
                            geompart = QgsGeometry().fromPolygon([polygon])
                            ring1 = False

                            if (polygon1):
                                geomnew = geompart
                                polygon1 = False
                            else:
                                geomnew.addPart(polygon)
                                       
                        else:
                            geomnew.addRing(polygon)

            else:
                rings = self.geom.asPolygon()
                ring1 = True
                for ring in rings:
                    polygon = []
                    for i in ring:
                        xnew = (i.x() - centrx) * kline + centrx
                        ynew = (i.y() - centry) * kline + centry
                        point = QgsGeometry.fromPoint(QgsPoint(xnew, ynew))
                        polygon.append(point.asPoint())

                    if (ring1):                                                        
                        geomnew = QgsGeometry().fromPolygon([polygon])
                        ring1 = False                                             
                    else:
                        geomnew.addRing(polygon)

#            if (mapCRS != layCRS):
#                geomnew.transform(coordTransformBack)
            if self.caps & QgsVectorDataProvider.ChangeGeometries:
                # обновление выбранного объекта
                if self.radioButton.isChecked(): 
                    self.layer.dataProvider().changeGeometryValues({self.fid : geomnew})
                # создание нового объекта
                else:
                    index_id_msk = self.layer.fieldNameIndex('id_msk')
                    if index_id_msk == -1:
                        QMessageBox.warning(self.iface.mainWindow(), u"Внимание!", 
                                                                     u"Для слоя нового объекта не определено поле идентификатора МСК")
                    else:
                        feat = QgsFeature()
                        feat.setGeometry(geomnew)
                        feat.initAttributes(len(self.layer.dataProvider().attributeIndexes()))
                        idMsk = idCurrentMSK()    
                        feat.setAttribute(index_id_msk, idMsk)
                    
                        self.layer.dataProvider().addFeatures([feat])

            else:
                QMessageBox.warning(self.iface.mainWindow(), u"Ошибка редактирования векторного слоя", 
                                                             u"Невозможно редактирование/добавление объекта для выбранного слоя")
            self.canvas.refresh()
            self.close()

    def closeDlg(self):
        self.close()

#        QMessageBox.information(self.iface.mainWindow(), 'test', str())
                    