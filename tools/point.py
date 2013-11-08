# -*- coding: utf-8 -*-
'''
/***************************************************************************
 point for openland (cadastral engineer tools)
 copyright            : (C) 2012 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 last data edit 2013-09-04
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from common import *
from point_ui import Ui_Point

class point(QDialog,  Ui_Point):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        self.connect(self.pushButtonSave, SIGNAL("clicked()"), self.savePoint)        
        self.connect(self.pushButtonClose, SIGNAL("clicked()"), self.closeDlg)        
        self.connect(self.lineEditX, SIGNAL("textChanged(QString)"), self.setDelta)        
        self.connect(self.lineEditY, SIGNAL("textChanged(QString)"), self.setDelta)        

        self.action = None
        self.idPoint = 0
        self.idParcel = None

    def dlgFill(self):
        if self.idPoint == 0:
            listPoint = []
        else:
            listPoint = attributesByKeys('ln_tochka', 'id', [self.idPoint], 
                                         attributesNamesPoint)
        if len(listPoint) == 1:
            listPoint = listPoint[0]    

            self.lineEditPrefix.setText(listPoint['prefiks_nomera'])

            try:
                x = str(float(listPoint['x']))
            except:
                x = ''
            self.lineEditX.setText(x)

            try:
                y = str(float(listPoint['y']))
            except:
                y = ''
            self.lineEditY.setText(y)

            checkDataNull(listPoint['pogreshnost'], self.lineEditMeasureError)
            checkDataNull(listPoint['nomer'], self.spinBoxNumber)
            checkDataNull(listPoint['poryadok_obhoda'], self.spinBoxOrder)

            fillComboBox(self.comboBoxWay2Fix, 'cl_sposob_zakrepleniya_tochki', 
                         'id', 'znachenie', listPoint['id_sposob_zakrepleniya'])
            fillComboBox(self.comboBoxMethod, 'cl_metod_opredeleniya_tochki', 
                         'id', 'znachenie', listPoint['id_metod_opredeleniya'])

            if listPoint['id_child'] > 0:
                idChild = listPoint['id_child']
            else:
                idChild = 0
            self.fillComboBoxChild(idChild)

            if listPoint['pre'] == 1:
                self.checkBoxIsPre.setChecked(True)
                self.comboBoxCorrectPoint.setEnabled(True)
        
            else:
                self.checkBoxIsPre.setChecked(False)
                self.comboBoxCorrectPoint.setEnabled(False)
        
        else:
            self.lineEditPrefix.setText('')
            self.lineEditX.setText('')
            self.lineEditY.setText('')
            self.lineEditMeasureError.setText('')
            self.spinBoxNumber.setValue(0)
            self.spinBoxOrder.setValue(0)
            fillComboBox(self.comboBoxWay2Fix, 'cl_sposob_zakrepleniya_tochki', 
                         'id', 'znachenie', '')
            fillComboBox(self.comboBoxMethod, 'cl_metod_opredeleniya_tochki', 
                         'id', 'znachenie', '')
            self.fillComboBoxChild(0)

    #
    def fillComboBoxChild(self, idChild):
        searchCondition = '\"id_uchastok\" = ' + str(self.idParcel) + ' AND \"pre\" = 0'
        attributesPoint = attributesBySearchCondition('ln_tochka', searchCondition, 
                                                      ['poryadok_obhoda', 'nomer', 'prefiks_nomera', 'id'])
        self.comboBoxCorrectPoint.clear()
        self.comboBoxCorrectPoint.addItem(u' ', None)

        if len(attributesPoint) > 0:
            attributesPoint.sort()
            for everyPoint in attributesPoint:
                title = everyPoint['prefiks_nomera'] + str(everyPoint['nomer'])
                dataId = int(everyPoint['id'])
                self.comboBoxCorrectPoint.addItem(title, dataId)
                
            currentIndex = self.comboBoxCorrectPoint.findData(idChild)           
            self.comboBoxCorrectPoint.setCurrentIndex(currentIndex)

    #
    def savePoint(self):
        listNames = []
        listNames.append('id_uchastok')
        listNames.append('x')
        listNames.append('y')
        listNames.append('poryadok_obhoda')
        listNames.append('nomer')
        listNames.append('pogreshnost')
        listNames.append('prefiks_nomera')
        listNames.append('id_sposob_zakrepleniya')
        listNames.append('id_metod_opredeleniya')
        listNames.append('id_msk')
        listNames.append('id_child')

        try:
            x = float(self.lineEditX.text())
        except:
            x = None 

        try:
            y = float(self.lineEditY.text())
        except:
            y = None

        try:
            measureError = float(self.lineEditMeasureError.text())
        except:
            measureError = None

        listValues = []
        listValues.append(self.idParcel)
        listValues.append(x)
        listValues.append(y)
        listValues.append(self.spinBoxOrder.value())
        listValues.append(self.spinBoxNumber.value())
        listValues.append(measureError)
        listValues.append(self.lineEditPrefix.text())
        listValues.append(self.comboBoxWay2Fix.itemData(self.comboBoxWay2Fix.currentIndex()))
        listValues.append(self.comboBoxMethod.itemData(self.comboBoxMethod.currentIndex()))
        listValues.append(idCurrentMSK())
        listValues.append(self.comboBoxCorrectPoint.itemData(self.comboBoxCorrectPoint.currentIndex()))
        
        if self.checkBoxUpdateGeom.isChecked():
            if (x != None) and (y != None):
                try:
                    geomNew = QgsGeometry.fromPoint(QgsPoint(y, x))
                except:
                    geomNew = None

                if (geomNew != None) and geomNew.isGeosValid():
                    listNames.append('geom')
                    listValues.append(geomNew)

        if self.action == 'add':
            if not insertFeatures('ln_tochka', listNames, [listValues]):
                QMessageBox.warning(self.iface.mainWindow(), u'Ошибка', 
                                                             u'Произошла ошибка при добавления точки')
        elif self.action == 'edit':
            if not updateFeature('ln_tochka', self.idPoint, listNames, listValues):
                QMessageBox.warning(self.iface.mainWindow(), u'Ошибка', 
                                                             u'Произошла ошибка при редактировании точки')
        else:
            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка', 
                                                         u'Не определена цель вызова диалога редактирования точки')
        self.iface.mapCanvas().refresh()
        self.done(1)
        
    def setDelta(self):
        if self.idParcel != None: 
            self.lineEditMeasureError.setText(str(accuracyById(self.idParcel)))
    
    def closeDlg(self):
        self.done(0)

#        QMessageBox.information(self.iface.mainWindow(), 'test', str())
