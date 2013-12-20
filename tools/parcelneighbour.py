# -*- coding: utf-8 -*-
'''
/***************************************************************************
 kn for openland (cadastral engineer tools)
 copyright            : (C) 2013 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from common import *
from ownerneighbour import OwnerNeighbour
from parcelneighbour_ui import Ui_DialogParcelNeighbour

import uuid 

class ParcelNeighbour(QDialog,  Ui_DialogParcelNeighbour):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        self.connect(self.pushButtonSave, SIGNAL("clicked()"), self.savePN)        
        self.connect(self.pushButtonClose, SIGNAL("clicked()"), self.closeDlg)        
        self.connect(self.pushButtonAddOwner, SIGNAL("clicked()"), self.doAddOwner)        
        self.connect(self.pushButtonEditOwner, SIGNAL("clicked()"), self.doEditOwner)        
        self.connect(self.pushButtonDelOwner, SIGNAL("clicked()"), self.doDelOwner)        

        self.guidPN     = ''
        self.idParcel   = 0
        self.action     = ''

################################################################################
    def dlgFill(self):
        if self.guidPN == '':
            return

        listAttributesPN = attributesByKeys('pb_parcel_neighbour', 
                                            'guid', [self.guidPN], 
                                            attributesNamesParcelNeighbour)
        if len(listAttributesPN) == 1:
            dictAttributesPN = listAttributesPN[0]

            self.lineEditDefinition.setText(reNull(dictAttributesPN['definition'], ''))
            self.lineEditCadastralNumber.setText(reNull(dictAttributesPN['cadastral_number'], ''))
            
            self.treeWidget.clear()
            listAttributesOwner = attributesByKeys('pb_owner_neighbour', 
                                                   'guid_parcel_neighbour', [self.guidPN], 
                                                   attributesNamesOwnerNeighbour)
            if len(listAttributesOwner) > 0:
                for dictAttributesOwner in listAttributesOwner:
                    nameOwner = reNull(dictAttributesOwner['name_owner'], '')
                    guidOwner = reNull(dictAttributesOwner['guid'], '')

                    itemForInsert = QTreeWidgetItem([nameOwner])
                    itemForInsert.setData(2, 0, guidOwner)
                    self.treeWidget.addTopLevelItem(itemForInsert)

        
################################################################################
    def savePN(self):
        listNames   = ['id_parcel', 'definition', 'cadastral_number']
        listValues  = []

        if self.action == 'add':
            listValues.append(self.idParcel)
            listValues.append(self.lineEditDefinition.text())
            listValues.append(self.lineEditCadastralNumber.text())

            if len(listNames) == len(listValues):
                if not insertFeatures('pb_parcel_neighbour', 
                                      listNames, [listValues]):
                    QMessageBox.warning(self.iface.mainWindow(), u'Ошибка редактирования данных', 
                                                                 u'Произошла ошибка при создании смежного ЗУ')

        elif self.action == 'edit':
            listValues.append(self.idParcel)
            listValues.append(self.lineEditDefinition.text())
            listValues.append(self.lineEditCadastralNumber.text())

            if len(listNames) == len(listValues):
                if not updateFeature('pb_parcel_neighbour', self.guidPN, 
                                     listNames, listValues):
                    QMessageBox.warning(self.iface.mainWindow(), u'Ошибка редактирования данных', 
                                                                 u'Произошла ошибка при редактировании смежного ЗУ')
        else:
            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка вызова диалога редактирования', 
                                                         u'Не определена цель вызова диалога.')
        self.done(1)

################################################################################
    def doAddOwner(self):
        if self.guidPN == '':
            self.guidPN = str(uuid.uuid4())
    
            listNames   = attributesNamesParcelNeighbour
            listValues  = []

            listValues.append(self.guidPN)
            listValues.append(self.idParcel)
            listValues.append(self.lineEditDefinition.text())
            listValues.append(self.lineEditCadastralNumber.text())

            if not insertFeatures('pb_parcel_neighbour', 
                                  listNames, [listValues]):
                QMessageBox.warning(self.iface.mainWindow(), u'Ошибка редактирования данных', 
                                                             u'Произошла ошибка при создании смежного ЗУ')
                return
            else:
                self.action = 'edit'

        d = OwnerNeighbour(self.iface)
        d.guidPN = self.guidPN
        d.action = 'add'
        d.dlgFill()
        
        result =  d.exec_()
        if result == 1:
            self.dlgFill()
        
        del d
    
################################################################################
    def doEditOwner(self):
        currentTreeItem = self.treeWidget.currentItem()
        if currentTreeItem == None:
            return

        d = OwnerNeighbour(self.iface)
        d.guidPN = self.guidPN
        d.guidON = currentTreeItem.data(2, 0)
        d.action = 'edit'
        d.dlgFill()

        result =  d.exec_()
        if result == 1:
            self.dlgFill()
        
        del d

################################################################################
    def doDelOwner(self):
        currentItem = self.treeWidget.currentItem()
        if currentItem != None:
            guidON = str(currentItem.data(2, 0))
            if guidON > ' ':
                if deleteById('pb_owner_neighbour', guidON):
                    self.dlgFill()

                else:
                    QMessageBox.warning(self.iface.mainWindow(), u'Ошибка', 
                                                                 u'Произошла ошибка удаления правообладателя смежного ЗУ')
                            
################################################################################
    def closeDlg(self):
        self.done(0)

#        QMessageBox.information(self.iface.mainWindow(), 'test', str())
