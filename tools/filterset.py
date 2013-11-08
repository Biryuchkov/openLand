# -*- coding: utf-8 -*-
'''
/***************************************************************************
 filterSet for openland (cadastral engineer tools)
 copyright            : (C) 2012 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from common import *
from filterset_ui import Ui_FilterSet

class filterSet(QDialog, Ui_FilterSet):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)
        self.selection = None
        self.idk = [] # список идентификаторов выбранных КК или КК содержащие выбранные ЗУ
        self.idu = [] # список идентификаторов выбранных ЗУ или ЗУ входящих в выбранные КК
        self.prevFilter = []  # список предыдущих условий выборки(фильтры из проекта)
#       слои 
        self.layers = ['ln_kvartal', 'ln_uchastok', 'ln_granica', 'ln_tochka', 
                       'pb_parcel_parcel']
        self.layerK = get_vector_layer_by_name(gln[self.layers[0]])
        self.layerU = get_vector_layer_by_name(gln[self.layers[1]])
        self.layerG = get_vector_layer_by_name(gln[self.layers[2]])
        self.layerT = get_vector_layer_by_name(gln[self.layers[3]])
        self.layerPP = get_vector_layer_by_name(gln[self.layers[4]])
#       провайдеры данных
        self.providerK = self.layerK.dataProvider()
        self.providerU = self.layerU.dataProvider()
        self.providerG = self.layerG.dataProvider()
        self.providerT = self.layerT.dataProvider()
        self.providerPP = self.layerPP.dataProvider()
        for i in range(len(self.layers)):
            self.prevFilter.append(get_vector_layer_by_name(gln[self.layers[i]]).subsetString())

        self.settings = QSettings("openLand", "openLand")
        self.isUseDefaultConnection = False
        self.connectionUserName = ''

    def accept(self):
        if self.radioButtonNone.isChecked(): # убрать фильтры устанавливаемые из модуля, оставить фильтры из проекта
            for i in range(len(self.layers)):
                get_vector_layer_by_name(gln[self.layers[i]]).setSubsetString(self.prevFilter[i][:49])
            self.idk = []
            self.idu = []

        if self.radioButtonKvr.isChecked(): # создать списки идентификаторов по выбранным КК
            self.selection = self.layerK.selectedFeatures()
            self.idk = []
            for i in self.selection:
                self.idk.append(int(i.attributes()[0]))

            self.idu = []
            for i in self.idk:
                self.layerU.setSubsetString(self.prevFilter[0] +' AND \"id_kvartal\" = ' + str(i))
                feat = QgsFeature()
                for feat in self.providerU.getFeatures(QgsFeatureRequest().setFlags(QgsFeatureRequest.NoGeometry)):
                    self.idu.append(int(feat.attributes()[0]))

                del feat

        if self.radioButtonUch.isChecked(): # создать списки идентификаторов по выбранным ЗУ
            self.selection = self.layerU.selectedFeatures()
            self.idu = []
            for i in self.selection:
                idOne = int(i.attributes()[0])
                self.idu.append(idOne)
                
                if paramByName([['interface/isEditMultiContour', 'bool']])[0]:
                    listParentId = attributesBySearchCondition('pb_parcel_parcel', 
                                                               '\"id_children\"=' + str(idOne), 
                                                               ['id_parent'])
                    if len(listParentId) > 0:
                        for everyParentId in listParentId:
                            self.idu.append(int(everyParentId['id_parent']))
                            listChildrenId = attributesBySearchCondition('pb_parcel_parcel', 
                                                                         '\"id_parent\"=' + str(everyParentId['id_parent']), 
                                                                         ['id_children'])
                            if len(listChildrenId) > 0:
                                for everyChildrenId in listChildrenId:
                                    if self.idu.count(everyChildrenId['id_children']) == 0:
                                        self.idu.append(int(everyChildrenId['id_children']))
                else:
                    listChildrenId = attributesBySearchCondition('pb_parcel_parcel', 
                                                                 '\"id_parent\"=' + str(idOne), 
                                                                 ['id_children'])
                    if len(listChildrenId) > 0:
                        for everyChildrenId in listChildrenId:
                            if self.idu.count(everyChildrenId['id_children']) == 0:
                                self.idu.append(int(everyChildrenId['id_children']))

            self.idk = []
            for i in self.idu:
                self.layerU.setSubsetString(self.prevFilter[1] + ' AND \"id\" = ' + str(i))
                feat = QgsFeature()
                for feat in self.providerU.getFeatures(QgsFeatureRequest().setFlags(QgsFeatureRequest.NoGeometry)):
                    self.idk.append(int(reNull(feat.attributes()[1], 0)))

                del feat

        self.idk = list(set(self.idk))
        self.idu = list(set(self.idu))

        if len(self.idk) > 0: # установить фильтры по КК
            t = str(self.idk)
            t = '(' + t[1:len(t)-1] + ')'
            self.layerK.setSubsetString(self.prevFilter[0] + ' AND \"id\" IN ' + t)

            if len(self.idu) > 0:  # установить фильтры по ЗУ и далее...
                t = str(self.idu)
                t = '(' + t[1:len(t)-1] + ')'
                self.layerU.setSubsetString(self.prevFilter[1] + ' AND \"id\" IN ' + t)
                self.layerG.setSubsetString(self.prevFilter[2] + ' AND \"id_uchastok\" IN ' + t)
                self.layerT.setSubsetString(self.prevFilter[3] + ' AND \"id_uchastok\" IN ' + t)
            else:
                for i in range(1, 3):
                    get_vector_layer_by_name(gln[self.layers[i]]).setSubsetString(self.prevFilter[i])
        else:  # установить только фильтры заданные в проекте
            for i in range(4):
                get_vector_layer_by_name(gln[self.layers[i]]).setSubsetString(self.prevFilter[i])

        # фильтр по полю update_user по предварительно настроеннному имени пользователя БД
        if self.checkBoxOnlyCurrentUser.isChecked():
            userFilter = " AND update_user=\'" + unicode(self.connectionUserName) + "\'"
            
            for i in range(1, 4):
                currentFilter = str(get_vector_layer_by_name(gln[self.layers[i]]).subsetString())
                p = currentFilter.find(userFilter)
                if (p == -1):
                    get_vector_layer_by_name(gln[self.layers[i]]).setSubsetString(currentFilter + userFilter)                    

        else:
            userFilter = " AND update_user=\'" + unicode(self.connectionUserName) + "\'"
            
            for i in range(1, 4):
                currentFilter = str(get_vector_layer_by_name(gln[self.layers[i]]).subsetString())
                p = currentFilter.find(userFilter)
                if not (p == -1):
                    get_vector_layer_by_name(gln[self.layers[i]]).setSubsetString(currentFilter[:p])                    
        
        self.iface.mapCanvas().refresh()
        self.canvas.freeze(False)  

        QDialog.accept(self)

#    def reject(self):
#        QDialog.reject(self)
