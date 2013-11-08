# -*- coding: utf-8 -*-
'''
/***************************************************************************
 importGeomZU for openland (cadastral engineer tools)
 copyright            : (C) 2013 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from common import *
from importgeometry_ui import Ui_ImportGeometry

class importGeometry(QDialog,  Ui_ImportGeometry):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        QObject.connect(self.pushButtonOk, SIGNAL("clicked()"), self.doImportGeometry)
        QObject.connect(self.pushButtonCancel, SIGNAL("clicked()"), self.doCancel)

        self.layer4Import = None

    def toPrepare(self):
        self.layer4Import = self.iface.mainWindow().activeLayer()
        importSelectedCount = len(self.layer4Import.selectedFeatures())
        if not (importSelectedCount == 1):
            QMessageBox.warning(self.iface.mainWindow(), u"Ошибка выбора данных", 
                                                         u'Необходимо выбрать на текущем слое карты только один полигон для импорта геометрии.')
            return False

        else:
            parcelSelectedCount = len(get_vector_layer_by_name(gln['ln_uchastok']).selectedFeatures())
            blockSelectedCount = len(get_vector_layer_by_name(gln['ln_kvartal']).selectedFeatures())
            districtSelectedCount = len(get_vector_layer_by_name(gln['ln_rayon']).selectedFeatures())

            if districtSelectedCount == 1:
                self.radioButtonDistrict.setEnabled(True)
                self.radioButtonDistrict.setChecked(True)
            else:
                self.radioButtonDistrict.setEnabled(False)
                self.radioButtonDistrict.setChecked(False)
        
            if blockSelectedCount == 1:
                self.radioButtonBlock.setEnabled(True)
                self.radioButtonBlock.setChecked(True)
            else:
                self.radioButtonBlock.setEnabled(False)
                self.radioButtonBlock.setChecked(False)
        
            if parcelSelectedCount == 1:
                self.radioButtonParcel.setEnabled(True)
                self.radioButtonParcel.setChecked(True)
            else:
                self.radioButtonParcel.setEnabled(False)
                self.radioButtonParcel.setChecked(False)
        
            self.lineEdit4Import.setText(unicode(self.layer4Import.name()))
        
            return True
    
    def doImportGeometry(self):
        self.progressBar.setRange(0,0)

        selected4Import = self.layer4Import.selectedFeatures()
        if not (len(selected4Import) == 1):
            QMessageBox.warning(self.iface.mainWindow(), u"Ошибка выбора данных", 
                                                         u'Необходимо выбрать только один полигон для импорта его геометрии.')
        else:
            layerName = ''
            if self.radioButtonDistrict.isChecked(): 
                layerName = 'ln_rayon'

            elif self.radioButtonBlock.isChecked():
                layerName = 'ln_kvartal'

            elif self.radioButtonParcel.isChecked():
                layerName = 'ln_uchastok'
            
            listId = attributesFromSelection(layerName, ['id'])
            if len(listId) == 1:
                idObject = int(listId[0]['id'])
                geomNew = selected4Import[0].geometry()
                if geomNew.isGeosValid():
                    if not updateFeature(layerName, idObject, ['id', 'geom'], 
                                         [idObject, geomNew]):
                        QMessageBox.warning(self.iface.mainWindow(), u"Ошибка", 
                                                                     u'Произошла ошибка обновления геометрии.')
                else:
                    QMessageBox.warning(self.iface.mainWindow(), u"Ошибка", 
                                                                 u'Не определена импортируемая геометрия. Используйте MIF формат для импорта? Используйте SHP или TAB.')
                self.canvas.refresh()

            else:
                QMessageBox.warning(self.iface.mainWindow(), u"Ошибка выбора данных", 
                                                             u'Необходимо выбрать только один полигон для замены его геометрии.')

        self.progressBar.setRange(0, 100)
        self.progressBar.setValue(100)
            
    def doCancel(self):
        self.close()

#        QMessageBox.information(self.iface.mainWindow(), u'test', str())
