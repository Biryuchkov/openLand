# -*- coding: utf-8 -*-
'''
/***************************************************************************
 kladr for openland (cadastral engineer tools)
 copyright            : (C) 2012 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from common import *
from kladr_ui import Ui_DialogKladr

class Kladr(QDialog, Ui_DialogKladr):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        self.idRegion   = ''
        self.kladr      = ''
        self.okato      = ''
        self.index      = ''
        self.forSpeed   = ''
        '''
        self.npSocr     = ''
        self.npName     = ''
        self.ulSocr     = ''
        self.ulName     = ''
        '''
        self.connect(self.comboBox1, SIGNAL("currentIndexChanged(int)"), self.selectItem)        
        self.connect(self.comboBox2, SIGNAL("currentIndexChanged(int)"), self.selectItem)        
        self.connect(self.comboBox3, SIGNAL("currentIndexChanged(int)"), self.selectItem)        
        self.connect(self.comboBox4, SIGNAL("currentIndexChanged(int)"), self.selectItem)        
        
    def fillFirstComboBox(self):
        if self.idRegion > '':                         
            listNames = ['name', 'socr', 'code', 'index', 'ocatd']
            self.forSpeed = '\"code\" > \'' + self.idRegion + '00000000000\' and \"code\" < \'' + self.idRegion + '99999999999\' and '
            searchCondition = 'substr(\"code\", 9) = \'00000\''
            listAttributesKladr = attributesBySearchCondition('cl_kladr', self.forSpeed + searchCondition, listNames)
            listEmpty = attributesBySearchCondition('cl_kladr', '\"code\" = \'0\'', ['code'])
            
            self.comboBox1.clear()
            if len(listAttributesKladr) > 0:
                listItems = []
                for every in listAttributesKladr:
                    title = unicode(every['name']) +' '+ unicode(every['socr'])
                    data = {'code':every['code'], 'index':every['index'], 'ocatd':every['ocatd']}
                    listItems.append([title, data])
                
                listItems.sort()
                for every in listItems:
                    self.comboBox1.addItem(every[0], every[1])

                self.comboBox1.setEnabled(True)
            else:
                self.comboBox1.setEnabled(False)

            self.comboBox2.clear()
            self.comboBox2.setEnabled(False)
            self.comboBox3.clear()
            self.comboBox3.setEnabled(False)
            self.comboBox4.clear()
            self.comboBox4.setEnabled(False)

    def selectItem(self, itemIndex):
        if itemIndex >= 0:
            data = self.sender().itemData(itemIndex)
            self.kladr = data['code']
            self.okato = data['ocatd']
            self.index = data['index']

            dataEmpty = {'code':'', 'index':'', 'ocatd':''}

            # Выбран район или город
            if self.sender() == self.comboBox1:
                partSubRayGor = self.kladr[:8]
                listNames = ['name', 'socr', 'code', 'index', 'ocatd']
                searchCondition = 'substr(\"code\", 1, 8) = \'' +partSubRayGor+ '\' and substr(\"code\", 12) = \'00\''
                listAttributesKladr = attributesBySearchCondition('cl_kladr', self.forSpeed + searchCondition, listNames)
                listEmpty = attributesBySearchCondition('cl_kladr', '\"code\" = \'0\'', ['code'])
            
                self.comboBox2.clear()
                if len(listAttributesKladr) > 0:

                    listItems = []
                    for every in listAttributesKladr:
                        title = unicode(every['name']) +' '+ unicode(every['socr'])
                        data = {'code':every['code'], 'index':every['index'], 
                                'ocatd':every['ocatd']}
                        listItems.append([title, data])
                
                    listItems.sort()
                    self.comboBox2.addItem('', dataEmpty)
                    for every in listItems:
                        self.comboBox2.addItem(every[0], every[1])

                    self.comboBox2.setEnabled(True)

                else:
                    self.comboBox2.setEnabled(False)

                self.comboBox3.clear()
                self.comboBox3.setEnabled(False)
                self.comboBox4.clear()
                self.comboBox4.setEnabled(False)
                
            # Выбран населенный пункт
            elif self.sender() == self.comboBox2:
                partSubRayGorNas = self.kladr[:11]
                listNames = ['name', 'socr', 'code', 'index', 'ocatd']
                searchCondition = 'substr(\"code\", 1, 11) = \'' +partSubRayGorNas+ '\' and substr(\"code\", 16) = \'00\''
                listAttributesStreet = attributesBySearchCondition('cl_street', self.forSpeed + searchCondition, listNames)
                listEmpty = attributesBySearchCondition('cl_street', '\"code\" = \'0\'', ['code'])

                self.comboBox3.clear()
                if len(listAttributesStreet) > 0:

                    listItems = []
                    for every in listAttributesStreet:
                        title = unicode(every['name']) +' '+ unicode(every['socr'])
                        data = {'code':every['code'], 'index':every['index'], 
                                'ocatd':every['ocatd']}
                        listItems.append([title, data])
                
                    listItems.sort()
                    self.comboBox3.addItem('', dataEmpty)
                    for every in listItems:
                        self.comboBox3.addItem(every[0], every[1])

                    self.comboBox3.setEnabled(True)

                else:
                    self.comboBox3.setEnabled(False)
                
                self.comboBox4.clear()
                self.comboBox4.setEnabled(False)
                
            # Выбрана улица
            elif self.sender() == self.comboBox3:
                partSubRayGorNasUl = self.kladr[:15]
                listNames = ['name', 'socr', 'code', 'index', 'ocatd']
                searchCondition = 'substr(\"code\", 1, 15) = \'' +partSubRayGorNasUl+ '\''
                listAttributesDoma = attributesBySearchCondition('cl_doma', self.forSpeed + searchCondition, listNames)
                listEmpty = attributesBySearchCondition('cl_doma', '\"code\" = \'0\'', ['code'])

                self.comboBox4.clear()
                if len(listAttributesDoma) > 0:

                    listItems = []
                    for every in listAttributesDoma:
                        title = unicode(every['name']) +' '+ unicode(every['socr'])
                        data = {'code':every['code'], 'index':every['index'], 
                                'ocatd':every['ocatd']}
                        listItems.append([title, data])
                
                    listItems.sort()
                    self.comboBox4.addItem('', dataEmpty)
                    for every in listItems:
                        self.comboBox4.addItem(every[0], every[1])

                    self.comboBox4.setEnabled(True)

                else:
                    self.comboBox4.setEnabled(False)
        
    def accept(self):
        if self.comboBox4.currentIndex() > 0:
            itemIndex = self.comboBox4.currentIndex()
            data = self.comboBox4.itemData(itemIndex)
            self.kladr = data['code']
            self.okato = data['ocatd']
            self.index = data['index']
        
        elif self.comboBox3.currentIndex() > 0:
            itemIndex = self.comboBox3.currentIndex()
            data = self.comboBox3.itemData(itemIndex)
            self.kladr = data['code']
            self.okato = data['ocatd']
            self.index = data['index']
        
        elif self.comboBox2.currentIndex() > 0:
            itemIndex = self.comboBox2.currentIndex()
            data = self.comboBox2.itemData(itemIndex)
            self.kladr = data['code']
            self.okato = data['ocatd']
            self.index = data['index']
        
        elif self.comboBox1.currentIndex() > -1:
            itemIndex = self.comboBox1.currentIndex()
            data = self.comboBox1.itemData(itemIndex)
            self.kladr = data['code']
            self.okato = data['ocatd']
            self.index = data['index']

        QDialog.accept(self)

    def reject(self):
        self.kladr = ''
        self.okato = ''
        self.index = ''

        QDialog.reject(self)

#        QMessageBox.information(self.iface.mainWindow(), 'test', str())
