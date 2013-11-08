# -*- coding: utf-8 -*-
'''
/***************************************************************************
 kvrAttributes for openland (cadastral engineer tools)
 copyright            : (C) 2012 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from common import *
from kvrattributes_ui import Ui_kvrAttributes

class kvrAttributes(QDialog,  Ui_kvrAttributes):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        self.okButton = self.buttonBox.button(QDialogButtonBox.Ok)
        self.connect(self.okButton, SIGNAL("accepted()"), self.accept)        

        attributes = attributesFromSelection('ln_kvartal', 
                                             attributesNamesCadastralBlock)
        attributes = attributes[0]
        self.idBlock = int(attributes['id'])

        self.lineEditKn.setText(reNull(attributes['kn'], ''))
        fillComboBox(self.comboBoxRn, 'ln_rayon', 'id', 'nazvanie', 
                     attributes['id_rayon'])

        self.lineEditCreateUser.setText(attributes['create_user'])
        self.lineEditCreateDate.setText(attributes['create_date'])
        self.lineEditUpdateUser.setText(attributes['update_user'])
        self.lineEditUpdateDate.setText(attributes['update_date'])
        
    def accept(self):
        listNames  = ['kn', 'id_rayon']
        listValues = [self.lineEditKn.text(),
                      self.comboBoxRn.itemData(self.comboBoxRn.currentIndex())]
        if self.idBlock > 0:
            if not updateFeature('ln_kvartal', self.idBlock, listNames, listValues):
                QMessageBox.warning(self.iface.mainWindow(), u'Ошибка', 
                                                             u'Не удалось отредактировать атрибуты кадастрового квартала')

        self.close()

#        QMessageBox.information(self.iface.mainWindow(), u'test', str())
