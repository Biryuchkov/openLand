# -*- coding: utf-8 -*-
'''
/***************************************************************************
 createPoints for openland (cadastral engineer tools)
 copyright            : (C) 2012 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from common import *
from createpoints_ui import Ui_createPoints

class createPoints(QDialog,  Ui_createPoints):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        QObject.connect(self.pushButtonOk, SIGNAL("clicked()"), self.doCreate)
        QObject.connect(self.pushButtonCancel, SIGNAL("clicked()"), self.doCancel)

        self.selection = []
        self.numberRing = 0
        self.numberPoint = 1
        self.orderPoint = 1

        self.layerUc = get_vector_layer_by_name(gln['ln_uchastok'])

    def toPrepare(self):
        self.selection = self.layerUc.selectedFeatures()
        ls = len(self.selection)
        if ls >= 1:
            self.lineEditSelectedCount.setText(str(ls))
            return True
        else:
            QMessageBox.warning(self.iface.mainWindow(), u"Ошибка выбора данных", 
                                                         u'Необходимо выбрать не менее одного участка для создания точек и границ.')
            return False
    
    def doCreate(self):
        self.progressBar.setRange(0, 0)
        
        for every in self.selection:
            atParcel = every.attributes()
                
            geom = every.geometry()
            idParcel = atParcel[self.layerUc.fieldNameIndex('id')]

            self.orderPoint = 1
            if geom.isMultipart():
                polygons = geom.asMultiPolygon()
                for polygone in polygons:
                    self.numberRing = 0
                    for ring in polygone:
                        listPonts = []
                        self.numberRing += 1
                        for i in ring:
                            x = round(i.x(), 2)
                            y = round(i.y(), 2)
                            listPonts.append([x, y])

                        self.doAppend(listPonts, idParcel)

            else:
                self.numberRing = 0
                rings = geom.asPolygon()
                for ring in rings:
                    listPonts = []
                    self.numberRing += 1
                    for i in ring:
                        x = round(i.x(), 2)
                        y = round(i.y(), 2)
                        listPonts.append([x, y])

                    self.doAppend(listPonts, idParcel)

        self.progressBar.setRange(0, 100)
        self.progressBar.setValue(100)                  
        self.canvas.refresh()
        self.close()

    def doAppend(self, listPonts, idParcel):
        listPonts = checkClockWise(listPonts)
        previos = len(listPonts)
        listPonts = checkDoublePoint(listPonts)
        if (previos != len(listPonts)):
            QMessageBox.warning(self.iface.mainWindow(), u'Внимание!', 
                                                         u'Выполнена коррекция списка точек ЗУ. Возможно полигон ЗУ имеет дублирующиеся точки.')
        del previos

        idMsk = idCurrentMSK()
        listNames = ['id_uchastok', 'id_msk', 'geom']
        listAllValues = []
        for i in range(len(listPonts) - 1):
            pairPoints = [QgsPoint(listPonts[i][0],   listPonts[i][1]), 
                          QgsPoint(listPonts[i+1][0], listPonts[i+1][1])] 
            geomBorder = QgsGeometry.fromPolyline(pairPoints)
            if (geomBorder != None) and (geomBorder.isGeosValid()):               
                listValues = [idParcel, idMsk, geomBorder]
                listAllValues.append(listValues)

        insertFeatures('ln_granica', listNames, listAllValues)

        listPonts.pop() 

        listNames = ['id_uchastok', 'x', 'y', 'poryadok_obhoda', 'nomer', 
                     'prefiks_nomera', 'pogreshnost', 'nomer_chasti', 'id_msk', 
                     'geom']
        listAllValues = []
        accuracy = accuracyById(idParcel)
        if accuracy == 0.0:
            self.iface.messageBar().pushMessage(u'Ошибка', u'Не определена погрешность определения точек, согласно категории земли выбранного ЗУ', 
                                                level = self.iface.messageBar().CRITICAL) 
        for every in listPonts:
            geomPoint = QgsGeometry.fromPoint(QgsPoint(every[0], every[1]))
            if (geomPoint != None) and geomPoint.isGeosValid():
                listValues = []
                listValues.append(idParcel)
                listValues.append(every[1])
                listValues.append(every[0])
                listValues.append(self.orderPoint)
                listValues.append(self.numberPoint)
                listValues.append(u'н')
                listValues.append(accuracy)
                listValues.append(self.numberRing)
                listValues.append(idMsk)
                listValues.append(geomPoint)

                listAllValues.append(listValues)
                
                self.numberPoint += 1
                self.orderPoint += 1
                                
        insertFeatures('ln_tochka', listNames, listAllValues)
            
    def doCancel(self):
        self.close()

#        QMessageBox.information(self.iface.mainWindow(), 'test', str())
