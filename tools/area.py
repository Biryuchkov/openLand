# -*- coding: utf-8 -*-
'''
/***************************************************************************
 area for openland (cadastral engineer tools)
 copyright            : (C) 2012 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from math import *
from common import *
from area_ui import Ui_DialogArea

class area(QDialog,  Ui_DialogArea):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        self.connect(self.pushButtonSave, SIGNAL("clicked()"), self.savePlo)        
        self.connect(self.pushButtonClose, SIGNAL("clicked()"), self.closeDlg)        
        self.connect(self.lineEditPlosh, SIGNAL("textChanged(QString)"), self.setDelta)        
        self.connect(self.lineEditDelta, SIGNAL("textChanged(QString)"), self.setDelta)        

        self.id                     = None
        self.idParcel               = 0
        self.id_vid_ploshadi        = ''
        self.ploshad                = 0
        self.id_edinicy_izmereniya  = ''
        self.pogreshnost_izmereniya = 0
        self.action                 = None

    def toPrepare(self):
        if self.id < 1:
            return False

        attributesArea = attributesByKeys('pb_ploshad', 'id', [self.id], 
                                          attributesNamesArea)
        if len(attributesArea) == 1:
            attributesArea = attributesArea[0]
            self.idParcel = attributesArea['id_uchastok']
            self.id_vid_ploshadi = attributesArea['id_vid_ploshadi']
            self.ploshad = attributesArea['ploshad']
            self.id_edinicy_izmereniya = attributesArea['id_edinicy_izmereniya']
            self.pogreshnost_izmereniya = attributesArea['pogreshnost_izmereniya']

            return True
        else:
            return False

                    
    def dlgFill(self, areaByGeometry):
        fillComboBox(self.comboBoxVidPlosh, 'cl_vid_ploshadi', 'id', 'znachenie', self.id_vid_ploshadi)
        if self.id_vid_ploshadi == '':
            self.comboBoxVidPlosh.setCurrentIndex(16)

        fillComboBox(self.comboBoxEdnIzm, 'cl_edinicy_izmereniya', 'id', 'znachenie', self.id_edinicy_izmereniya)
        if self.id_edinicy_izmereniya == '':
            self.comboBoxEdnIzm.setCurrentIndex(10)

        self.lineEditPlosh.setText(str(self.ploshad))
        self.lineEditDelta.setText(str(accuracyById(self.idParcel)))
        self.lineEditPogrIzm.setText(str(self.pogreshnost_izmereniya))

        if (self.lineEditPlosh.text() <= '0') and (areaByGeometry > 0):
            self.lineEditPlosh.setText(str(areaByGeometry))
            QMessageBox.warning(self.iface.mainWindow(), u'Внимание', 
                                                         u'Значение площади указано автоматически по измерениям геометрии ЗУ!')
        if (self.lineEditPlosh.text() > '0') and (self.lineEditPogrIzm.text() <= '0'):
            self.setDelta(self.lineEditPlosh.text())
            QMessageBox.warning(self.iface.mainWindow(), u'Внимание', 
                                                         u'Погрешность измерения площади расчитана автоматически!')

    def setDelta(self, si):
        try:
            float(si)
        except ValueError:
            QMessageBox.warning(self.iface.mainWindow(), u"Ошибка ввода", 
                                                         u'Некорректное число или разделитель целой и дробной части числа.')
            self.lineEditPogrIzm.setText('0')
        else:
            si = float(self.lineEditPlosh.text())
            delta = float(self.lineEditDelta.text())
            so = '0'
            if (delta > 0):
                so = str(round(sqrt(si) * 3.5 * delta, 0))
            else:    
                if (si > 0) and (self.idParcel > 0): 
                    so = str(round(sqrt(si) * 3.5 * accuracyById(self.idParcel), 0))
            self.lineEditPogrIzm.setText(so)
        
    def savePlo(self):
        listNames = ['id_uchastok', 'id_vid_ploshadi', 'ploshad', 
                     'id_edinicy_izmereniya', 'pogreshnost_izmereniya']
        listValues = []
        listValues.append(self.idParcel)
        listValues.append(self.comboBoxVidPlosh.itemData(self.comboBoxVidPlosh.currentIndex()))
        listValues.append(self.lineEditPlosh.text())
        listValues.append(self.comboBoxEdnIzm.itemData(self.comboBoxEdnIzm.currentIndex()))
        listValues.append(self.lineEditPogrIzm.text())
            
        if self.action == 'add':
            if not insertFeatures('pb_ploshad', listNames, [listValues]):
                QMessageBox.warning(self.iface.mainWindow(), u'Ошибка добавления площади', 
                                                             u'Произошла ошибка при добавления площади')
        elif self.action == 'edit':
            if not updateFeature('pb_ploshad', self.id, listNames, listValues):
                QMessageBox.warning(self.iface.mainWindow(), u'Ошибка редактирования площади', 
                                                             u'Произошла ошибка при редактировании площади')
        else:
            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка вызова диалога редактирования площади.', 
                                                         u'Не определена цель вызова диалога.')
        
        self.done(1)

    def closeDlg(self):
        self.done(0)

#        QMessageBox.information(self.iface.mainWindow(), u'test', str())
