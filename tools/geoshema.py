# -*- coding: utf-8 -*-
'''
/***************************************************************************
 geoShema for openland (cadastral engineer tools)
 copyright            : (C) 2012 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from common import *
from geoshema_ui import Ui_geoShema

class createGeoShema(QDialog,  Ui_geoShema):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        self.comboBoxTypeLine.addItem(u'Направления геодезических построений при определении координат точек границ ЗУ', '21')        
        self.comboBoxTypeLine.addItem(u'Направление координирования', '12')        
        self.comboBoxTypeLine.addItem(u'Черная линия толщиной 0.1 мм', 'NULL')        
        self.comboBoxTypeLine.setCurrentIndex(0)

        self.comboBoxTypePoint.addItem(u'Квадрат красного цвета с длиной стороны 3 мм', '2')        
        self.comboBoxTypePoint.addItem(u'Квадрат черного цвета с длиной стороны 3 мм', '0')        
        self.comboBoxTypePoint.addItem(u'Квадрат с длиной стороны 3 мм, очерченный линией черного цвета толщиной 0.2 мм', '1')        
        self.comboBoxTypePoint.addItem(u'Квадрат с длиной стороны 3 мм, очерченный линией красного цвета толщиной 0.2 мм', '3')        
        self.comboBoxTypePoint.setCurrentIndex(0)

        QObject.connect(self.pushButtonOk, SIGNAL("clicked()"), self.doGeoShema)
        QObject.connect(self.pushButtonCancel, SIGNAL("clicked()"), self.doCancel)

        self.layerUc = get_vector_layer_by_name(gln['ln_uchastok'])
        self.layerDPoint = get_vector_layer_by_name(gln['ds_point'])
        self.layerDLine = get_vector_layer_by_name(gln['ds_line'])

        self.selectionUc = []
        self.selectionPoint = []

    def toPrepare(self):
        self.layerUc = self.iface.mainWindow().activeLayer()
        self.selectionUc = self.layerUc.selectedFeatures()
        uCount = len(self.selectionUc)

        self.selectionPoint = self.layerDPoint.selectedFeatures()
        pCount = len(self.selectionPoint)

        if uCount >= 1:
            if pCount == 1:
                self.lineEditSelectedCountAreas.setText(str(uCount))
                self.lineEditSelectedCountPoints.setText(str(pCount))
                return True
            else:
                QMessageBox.warning(self.iface.mainWindow(), u"Ошибка выбора данных", 
                                                             u'Необходимо выбрать только одну точку оформления.')
                return False
        else:
            QMessageBox.warning(self.iface.mainWindow(), u"Ошибка выбора данных", 
                                                         u'Необходимо выбрать не менее одного полигона.')
            return False
    
    def doGeoShema(self):
        self.progressBar.setRange(0,0)
        typeLine = self.comboBoxTypeLine.itemData(self.comboBoxTypeLine.currentIndex())
        typePoint = self.comboBoxTypePoint.itemData(self.comboBoxTypePoint.currentIndex())
#        mapCRS = self.iface.mapCanvas().mapRenderer().destinationCrs()
        mapCRS = self.layerUc.crs()
        layCRS = self.layerDPoint.crs()
        coordTransform = QgsCoordinateTransform(mapCRS, layCRS)

        pn = self.selectionPoint[0] 
        geop = QgsGeometry(pn.geometry()).asPoint()

        listNewLineFeat = []
        listNewPointFeat = []
        for uc in self.selectionUc:
            attu = uc.attributes()
#            idu = attu[self.layerUc.fieldNameIndex('id')]
            geou = uc.geometry()
            geou.transform(coordTransform)
            centr = QgsGeometry(geou.centroid()).asPoint()
            geoNewPoint = QgsGeometry.fromPoint(centr)

            if geoNewPoint != None:               
                featPoint = QgsFeature()
                featPoint.initAttributes(len(self.layerDPoint.dataProvider().attributeIndexes()))
                featPoint.setGeometry(geoNewPoint)
                featPoint.setAttribute(self.layerDPoint.fieldNameIndex('uslovnyy_z'), typePoint)
                listNewPointFeat.append(featPoint) 
            
            if self.radioButtonAreas.isChecked():
                tmpLine = [geop, centr] 
                geoNewLine = QgsGeometry.fromPolyline(tmpLine)
                if geoNewLine != None:               
                    featLine = QgsFeature()
                    featLine.initAttributes(len(self.layerDLine.dataProvider().attributeIndexes()))
                    featLine.setGeometry(geoNewLine)
                    featLine.setAttribute(self.layerDLine.fieldNameIndex('uslovnyy_z'), typeLine)
                    listNewLineFeat.append(featLine) 
            else:
                if geou.isMultipart():
                    polygons = geou.asMultiPolygon()
                    for poly in polygons:
                        for ring in poly:
                            for i in ring:
                                tmpLine = [geop, i] 
                                geoNewLine = QgsGeometry.fromPolyline(tmpLine)
                                if geoNewLine != None:               
                                    featLine = QgsFeature()
                                    featLine.initAttributes(len(self.layerDLine.dataProvider().attributeIndexes()))
                                    featLine.setGeometry(geoNewLine)
                                    featLine.serAttribute(self.layerDLine.fieldNameIndex('uslovnyy_z'), typeLine)
                                    listNewLineFeat.append(featLine) 
                            listNewLineFeat.pop()
                else:
                    rings = geou.asPolygon()
                    for ring in rings:
                        for i in ring:
                            tmpLine = [geop, i] 
                            geoNewLine = QgsGeometry.fromPolyline(tmpLine)
                            if geoNewLine != None:               
                                featLine = QgsFeature()
                                featLine.initAttributes(len(self.layerDLine.dataProvider().attributeIndexes()))
                                featLine.setGeometry(geoNewLine)
                                featLine.setAttribute(self.layerDLine.fieldNameIndex('uslovnyy_z'), typeLine)
                                listNewLineFeat.append(featLine) 
                        listNewLineFeat.pop()
            
        if self.checkBoxCreateNoScalePoint.isChecked():
            self.layerDPoint.dataProvider().addFeatures(listNewPointFeat)

        self.layerDLine.dataProvider().addFeatures(listNewLineFeat)

        del featPoint
        del featLine
        del geoNewPoint
        del geoNewLine

        self.canvas.refresh()
        self.progressBar.setRange(0, 100)
        self.progressBar.setValue(100)
            
    def doCancel(self):
        self.close()
