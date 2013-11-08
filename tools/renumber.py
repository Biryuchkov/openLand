# -*- coding: utf-8 -*-
'''
/***************************************************************************
 reNumber for openland (cadastral engineer tools)
 copyright            : (C) 2012 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from common import *
from renumber_ui import Ui_reNumber

class reNumberPoints(QDialog,  Ui_reNumber):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        QObject.connect(self.pushButtonOk, SIGNAL("clicked()"), self.doRenumber)
        QObject.connect(self.pushButtonCancel, SIGNAL("clicked()"), self.doCancel)

        self.layerUc = get_vector_layer_by_name(gln['ln_uchastok'])
        self.layerPn = get_vector_layer_by_name(gln['ln_tochka'])
        self.dataPn = self.layerPn.dataProvider()
        self.selectionUc = []
        self.prefix = u'н'

    def doRenumber(self):
        self.progressBar.setRange(0, 0)

        idUc = []
        dicUc = {}
        idPn = []
        dicPn = {}
        for uc in self.selectionUc:
            rowUc = uc.attributes()
            idu = int(rowUc[self.layerUc.fieldNameIndex('id')])
            nku = rowUc[self.layerUc.fieldNameIndex('nomer_kontura')]
            if nku == None:
                nku = 0
                
            idUc.append(idu)
            dicUc[idu] = nku

        if len(idUc) > 0:
            t = str(idUc)
            t = '(' + t[1:len(t)-1] + ')'

            pre = self.layerPn.subsetString()

            if self.checkBoxIsReOrder.isChecked():
                idPn = []
                dicPn = {}

                self.layerPn.setSubsetString('\"id_uchastok\" IN ' + t + " AND pre = 0")
                for featPn in self.dataPn.getFeatures(QgsFeatureRequest()):
                    attPn = featPn.attributes()
                    idp = int(attPn[self.dataPn.fieldNameIndex('id')])
                    idu = attPn[self.dataPn.fieldNameIndex('id_uchastok')]
                    nch = attPn[self.dataPn.fieldNameIndex('nomer_chasti')]
                    num = attPn[self.dataPn.fieldNameIndex('poryadok_obhoda')]
                    if num == None:
                        num = 0
                    nkn = dicUc[idu]
                    idPn.append([(nkn*10000 + nch*1000 + num), idp]) 
                
                idPn.sort()
                m = 1
                for p in idPn:
                    dicPn[p[1]] = m
                    m += 1

                delta = float(self.lineEditDelta.text())
                if (delta > 0):
                    pogreshnost = delta
                else:
                    if idu > 0:
                        pogreshnost = accuracyById(idu)
                    
                attributesAllPoints = {}
                for featNew in self.dataPn.getFeatures(QgsFeatureRequest()):
                    idp = featNew.id()
                    attributesOnePoint = {}
                    if pogreshnost > 0:
                        attributesOnePoint[self.layerPn.fieldNameIndex('pogreshnost')] = pogreshnost
                    attributesOnePoint[self.layerPn.fieldNameIndex('poryadok_obhoda')] = dicPn[idp]

                    attributesAllPoints[idp] = attributesOnePoint

                self.dataPn.changeAttributeValues(attributesAllPoints)

            self.layerPn.setSubsetString(pre)
        self.progressBar.setRange(0, 100)
        self.progressBar.setValue(100)
            
    def doCancel(self):
        self.close()

#        QMessageBox.information(self.iface.mainWindow(), u'test', str())
