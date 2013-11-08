# -*- coding: utf-8 -*-
'''
/***************************************************************************
 border for openland (cadastral engineer tools)
 copyright            : (C) 2012 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from common import *
from border_ui import Ui_Border

class border(QDialog,  Ui_Border):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        self.connect(self.pushButtonSave, SIGNAL("clicked()"), self.saveBorder)        
        self.connect(self.pushButtonClose, SIGNAL("clicked()"), self.closeDlg)        

        self.action = None
        self.idBorder = 0
        self.style = [[u'Сплошная, черная, 0,2', 0], 
                      [u'Сплошная, красная, 0,2', 1], 
                      [u'Пунктирная, черная, 0.2, 2-1', 2], 
                      [u'Пунктирная, красная, 0.2, 2-1', 3]]

    def dlgFill(self):
        attributesBorder = attributesByKeys('ln_granica', 'id', [self.idBorder], 
                                            attributesNamesBorder)
        if len(attributesBorder) == 1:
            attributesBorder = attributesBorder[0]
        else:
            self.done(0)
            
        checkDataNull(attributesBorder['opisanie'], self.lineEditOpisanie)
        checkDataNull(attributesBorder['po_opisaniyu'], self.checkBoxPoOpisaniyu)
        checkDataNull(attributesBorder['dlina'], self.lineEditDlina)

        self.comboBoxColor.clear()
        for i in self.style:
            self.comboBoxColor.addItem(i[0], i[1])        
        currentIndex = self.comboBoxColor.findData(attributesBorder['uslovnyy_znak'])           
        self.comboBoxColor.setCurrentIndex(currentIndex)

        checkDataNull(attributesBorder['gradusy'], self.lineEditGradusy)
        checkDataNull(attributesBorder['minuty'], self.lineEditMinuty)

        if attributesBorder['pre'] == 1:
            self.checkBoxIsPre.setEnabled(True)
            self.checkBoxIsPre.setChecked(True)
            self.pushButtonSave.setEnabled(False)
        else:
            self.checkBoxIsPre.setEnabled(False)
            self.checkBoxIsPre.setChecked(False)
            self.pushButtonSave.setEnabled(True)
        
    def saveBorder(self):
        listNames = ['opisanie', 'po_opisaniyu', 'dlina', 'uslovnyy_znak',
                     'gradusy', 'minuty']

        listValues = []
        listValues.append(self.lineEditOpisanie.text())
        listValues.append(self.checkBoxPoOpisaniyu.isChecked())
        try:
            dlina = float(self.lineEditDlina.text())
        except:
            dlina = 0.0
            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка', 
                                                         u'Не удалось определить числовое значение длины')
        listValues.append(dlina)
        listValues.append(self.comboBoxColor.itemData(self.comboBoxColor.currentIndex()))
        try:
            gradusy = int(self.lineEditGradusy.text())
        except:
            gradusy = 0
            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка', 
                                                         u'Не удалось определить целое значение градусов')
        listValues.append(gradusy)
        try:
            minuty = int(self.lineEditMinuty.text())
        except:
            minuty = 0
            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка', 
                                                         u'Не удалось определить целое значение минут')
        listValues.append(minuty)

        if updateFeature('ln_granica', self.idBorder, listNames, listValues):
            self.done(1)
        else:
            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка', 
                                                         u'Произошла ошибка редактировании атрибутов границы')
            self.done(0)
                
    def closeDlg(self):
        self.done(0)
#        QMessageBox.information(self.iface.mainWindow(), u'test', str())
