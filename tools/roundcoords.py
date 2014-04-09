# -*- coding: utf-8 -*-
'''
/***************************************************************************
 roundCoords for openland (cadastral engineer tools)
 copyright            : (C) 2012 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from common import *
from roundcoords_ui import Ui_dlRoundCoords

class RoundCoords(QDialog,  Ui_dlRoundCoords):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        self.currentSpEl    = 0
        self.progress       = QProgressBar()

        QObject.connect(self.pushButtonOk, SIGNAL("clicked()"), self.doRound)
        QObject.connect(self.pushButtonCancel, SIGNAL("clicked()"), self.doCancel)

    def toPrepare(self):
        layer = self.iface.mainWindow().activeLayer()
        selection = layer.selectedFeatures()
        l = len(selection)
        if l >= 1:
            self.lineEdit.setText(str(l))
            return True
        else:
            QMessageBox.warning(self.iface.mainWindow(), u"Ошибка выбора данных", 
                                                         u'Необходимо выбрать не менее одного объекта векторного слоя.')
            return False

    def doRound(self):
        layer = self.iface.mainWindow().activeLayer()
        caps = layer.dataProvider().capabilities()
        selection = layer.selectedFeatures()

        iround = int(self.spinBox.value())
        if (iround < 0):
            QMessageBox.warning(self.iface.mainWindow(), u"Ошибка параметра округления", 
                                                         u"Необходимо указать параметр округления не менее 0")
            return

        self.progress       = QProgressBar()
        progressMessageBar  = self.iface.messageBar().createMessage(u'Округление координат точек полигонов ЗУ...')
        self.progress.setMaximum(numberSpatialElements(selection))
        self.progress.setAlignment(Qt.AlignLeft|Qt.AlignVCenter)
        progressMessageBar.layout().addWidget(self.progress)
        self.iface.messageBar().pushWidget(progressMessageBar, 
                                           self.iface.messageBar().INFO)
        for s in selection:
            fid     = s.id()
            geom    = QgsGeometry(s.geometry())
            polygon1 = True
            ring1   = True
            xprev   = 0.0
            yprev   = 0.0
            if geom.isMultipart():
                polygons = geom.asMultiPolygon()
                for poly in polygons:
                    ring1 = True
                    for ring in poly:
                        self.currentSpEl += 1
                        self.progress.setValue(self.currentSpEl)

                        polygon = []
                        for i in ring:
                            xnew = round(i.x(), iround)
                            ynew = round(i.y(), iround)
                            point = QgsGeometry.fromPoint(QgsPoint(xnew, ynew))
                            
                            if self.checkBoxDeleteDouble.isChecked():
                                if xnew != xprev or ynew != yprev:
                                    polygon.append(point.asPoint())
                                    xprev = xnew
                                    yprev = ynew

                            else:
                                polygon.append(point.asPoint())

                        if (ring1):
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
                rings = geom.asPolygon()
                for ring in rings:
                    self.currentSpEl += 1
                    self.progress.setValue(self.currentSpEl)
                    
                    polygon = []
                    for i in ring:
                        xnew = round(i.x(), iround)
                        ynew = round(i.y(), iround)
                        point = QgsGeometry.fromPoint(QgsPoint(xnew, ynew))

                        if self.checkBoxDeleteDouble.isChecked():
                            if xnew != xprev or ynew != yprev:
                                polygon.append(point.asPoint())
                                xprev = xnew
                                yprev = ynew

                        else:
                            polygon.append(point.asPoint())

                    if (ring1):
                        geomnew = QgsGeometry().fromPolygon([polygon])
                        ring1 = False
                    else:
                        geomnew.addRing(polygon)

            if caps & QgsVectorDataProvider.ChangeGeometries:
                layer.startEditing()
                if layer.changeGeometry(fid, geomnew):
                    layer.commitChanges()
                else:
                    layer.rollBack()
                    QMessageBox.warning(self.iface.mainWindow(), u"Ошибка редактирования векторного объекта", 
                                                                 u"Невозможно редактирование векторного объекта")
            else:
                QMessageBox.warning(self.iface.mainWindow(), u"Ошибка редактирования векторного слоя", 
                                                             u"Невозможно редактирование/добавление объекта для выбранного слоя")
        del self.progress
        del progressMessageBar
        self.iface.messageBar().clearWidgets()
        self.canvas.refresh()
        self.close()

    def doCancel(self):
        self.close()

#        QMessageBox.information(self.iface.mainWindow(), u'test', str())
