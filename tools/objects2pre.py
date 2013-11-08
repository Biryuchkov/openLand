# -*- coding: utf-8 -*-
'''
/***************************************************************************
 objects2pre for openland (cadastral engineer tools)
 copyright            : (C) 2013 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from common import *
from objects2pre_ui import Ui_objects2pre

class objects2pre(QDialog,  Ui_objects2pre):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        QObject.connect(self.pushButtonOk, SIGNAL("clicked()"), self.doMove)
        QObject.connect(self.pushButtonCancel, SIGNAL("clicked()"), self.doCancel)

        self.layerPn = get_vector_layer_by_name(gln['ln_tochka'])
        self.layerBr = get_vector_layer_by_name(gln['ln_granica'])
        self.layerUc = get_vector_layer_by_name(gln['ln_uchastok'])

        self.selPn = self.layerPn.selectedFeatures()
        self.selPnCount = len(self.selPn)
        self.selBr = self.layerBr.selectedFeatures()
        self.selBrCount = len(self.selBr)
        self.selUc = self.layerUc.selectedFeatures()
        self.selUcCount = len(self.selUc)

        self.lineEditSelectedPoints.setText(str(self.selPnCount))
        self.lineEditSelectedBorders.setText(str(self.selBrCount))
        self.lineEditSelectedParcels.setText(str(self.selUcCount))
        
    def doMove(self):
        self.progressBar.setRange(0, 100)
        self.progressBar.setValue(0)
        # прекращение существования выделенных точек
        self.doMoveSelected(self.layerPn, self.selPn)
        self.progressBar.setValue(20)
        # прекращение существования выделенных границ
        self.doMoveSelected(self.layerBr, self.selBr)
        self.progressBar.setValue(40)
        # обработка выделенных ЗУ
        for feat in self.selUc:
            idFeat = feat.id()
            # прекращение существования точек участка
            self.selPn = self.SelectByIdUc(self.layerPn, idFeat)
            self.doMoveSelected(self.layerPn, self.selPn)
            # прекращение существования границ участка
            self.selBr = self.SelectByIdUc(self.layerBr, idFeat)
            self.doMoveSelected(self.layerBr, self.selBr)
            # прекращение существования участка
            self.layerUc.startEditing()
            self.layerUc.changeAttributeValue(idFeat, self.layerUc.fieldNameIndex('pre'), 1)
            self.layerUc.commitChanges()
        
        self.progressBar.setValue(100)
        
        self.canvas.refresh()
        self.close()
            
    def doMoveSelected(self, layer, selected):
        for feat in selected:
            idFeat = feat.id()
            layer.startEditing()
            layer.changeAttributeValue(idFeat, layer.fieldNameIndex('pre'), 1)
            if (layer == self.layerPn):
                layer.changeAttributeValue(idFeat, layer.fieldNameIndex('poryadok_obhoda'), 0)
            layer.commitChanges()
    
    def SelectByIdUc(self, layer, idUc):
        listId = []
        feat = QgsFeature()

        pre = layer.subsetString()
        layer.setSubsetString('\"id_uchastok\"=' + str(idUc))
        for feat in layer.dataProvider().getFeatures(QgsFeatureRequest()):
            listId.append(feat.id())
        layer.setSubsetString(pre)

        for i in listId:
            layer.select(i)      
        
        listFeat = layer.selectedFeatures()
        return listFeat

    def doCancel(self):
        self.close()

#        QMessageBox.information(self.iface.mainWindow(), u'test', str())
