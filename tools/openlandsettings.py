# -*- coding: utf-8 -*-
'''
/***************************************************************************
 openLandSettings for openland (cadastral engineer tools)
 copyright            : (C) 2012 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from openlandsettings_ui import Ui_OpenLandSettings
from common import *
import os.path

class OpenLandSettings(QDialog, Ui_OpenLandSettings):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        self.connect(self.pushButtonDirectoryOpen, SIGNAL("clicked()"), self.selectDirectory)        
        self.connect(self.pushButtonFileSelect, SIGNAL("clicked()"), self.selectFile)        
        self.idMSK = ''
        self.isChangeMSK = False
        self.currentPath = ''
        self.settings = QSettings("openLand", "openLand")
        self.paramsRead()

    def accept(self):
        self.paramsWrite()
        QDialog.accept(self)

    def reject(self):
        self.paramsRead()
        QDialog.reject(self)

    def paramsRead(self):
        isEditMultiContour = self.settings.value('interface/isEditMultiContour', 'true')
        isSortAttributes = self.settings.value('interface/isSortAttributes', 'true')
        isPointsShow = self.settings.value('interface/isPointsShow', 'true')
        isOnlyUserData = self.settings.value('interface/isOnlyUserData', 'true')

        isUseDefaultConnection = self.settings.value('database/isusedefault', 'false')
        file4Update = self.settings.value('database/file4update', u'Не указан')
        connectionServer = self.settings.value('database/server', u'localhost')
        connectionPort = self.settings.value('database/port', u'5432')
        connectionDataBase = self.settings.value('database/database', u'openland')
        connectionUserName = self.settings.value('database/user', u'openlanduser1')
        connectionUserPassword = self.settings.value('database/password', u'user1pass')
        numberVersionXmlMp = int(self.settings.value('database/numberVersionXmlMp', '4'))
        pathToCreateXml = self.settings.value('database/pathCreateXmlMp', u'Не указан')

        self.isChangeMSK = False

        if isEditMultiContour == 'true': 
            self.radioButtonMultiCont.setChecked(True)
        else: 
            self.radioButtonOneCont.setChecked(True)

        layerMSK = get_vector_layer_by_name(gln['cl_sistema_koordinat'])
        if layerMSK != None:
            self.idMSK = idCurrentMSK()

            pre = layerMSK.subsetString()
            layerMSK.setSubsetString('')
            fillComboBox(self.comboBoxMSK, 'cl_sistema_koordinat', 'id', 'zona', self.idMSK)
            layerMSK.setSubsetString(pre)
        else:
            self.comboBoxMSK.clear()

        if isSortAttributes == 'true': 
            self.checkBoxIsSortAttributes.setChecked(True)
        else: 
            self.checkBoxIsSortAttributes.setChecked(False)

        if isPointsShow == 'true': 
            self.checkBoxIsPointsShow.setChecked(True)
        else: 
            self.checkBoxIsPointsShow.setChecked(False)

        if isOnlyUserData == 'true': 
            self.checkBoxIsShowOnlyUserData.setChecked(True)
        else: 
            self.checkBoxIsShowOnlyUserData.setChecked(False)

        if isUseDefaultConnection == 'true': 
            self.checkBoxIsUseDefaultConnection.setChecked(True)
        else: 
            self.checkBoxIsUseDefaultConnection.setChecked(False)

        self.lineEditProjectFile.setText(file4Update)
        self.lineEditServer.setText(connectionServer)
        self.lineEditPort.setText(connectionPort)
        self.lineEditDataBase.setText(connectionDataBase)
        self.lineEditUserName.setText(connectionUserName)
        self.lineEditUserPassword.setText(connectionUserPassword)
        self.spinBoxVersionXmlMp.setValue(numberVersionXmlMp)
        self.lineEditPathToXmlCreate.setText(pathToCreateXml)

    def paramsWrite(self):
        self.settings.setValue('interface/isEditMultiContour', self.radioButtonMultiCont.isChecked())
        self.settings.setValue('interface/isSortAttributes', self.checkBoxIsSortAttributes.isChecked())
        self.settings.setValue('interface/isPointsShow', self.checkBoxIsPointsShow.isChecked())
        self.settings.setValue('interface/isOnlyUserData', self.checkBoxIsShowOnlyUserData.isChecked())

        self.settings.setValue('database/isusedefault', self.checkBoxIsUseDefaultConnection.isChecked())
        self.settings.setValue('database/file4update', self.lineEditProjectFile.text())
        self.settings.setValue('database/server', self.lineEditServer.text())
        self.settings.setValue('database/port', self.lineEditPort.text())
        self.settings.setValue('database/database', self.lineEditDataBase.text())
        self.settings.setValue('database/user', self.lineEditUserName.text())
        self.settings.setValue('database/password', self.lineEditUserPassword.text())
        self.settings.setValue('database/numberVersionXmlMp', self.spinBoxVersionXmlMp.value())
        self.settings.setValue('database/pathCreateXmlMp', self.lineEditPathToXmlCreate.text())

        newMSK = self.comboBoxMSK.itemData(self.comboBoxMSK.currentIndex())
        if (newMSK > ' ') and (self.idMSK != newMSK):
            feat = QgsFeature()
            self.idMSK = newMSK 

            layer = get_vector_layer_by_name(gln['cl_sistema_koordinat'])
            layer.setSubsetString('\"id\" = \'' + self.idMSK + '\'')

            listDefineProj = attributesByKeys('cl_sistema_koordinat', 'id', 
                                              [str(self.idMSK)], ['definition'])
            if len(listDefineProj) == 1:
                defineProj4 = listDefineProj[0]['definition']
            else:
                defineProj4 = None

            crs = QgsCoordinateReferenceSystem()
            crs.createFromProj4(defineProj4)

            if crs.isValid():
                layer = get_vector_layer_by_name(gln['pb_geo_osnova'])
                layer.setSubsetString('\"id_sistema_koordinat\" = \'' + self.idMSK + '\'')

                layers = ['ln_rayon', 'ln_kvartal', 'ln_uchastok', 'ln_granica', 
                          'ln_tochka', 'ds_tochka_uni']
                for i in layers:
                    layer = get_vector_layer_by_name(gln[i])
                    layer.removeSelection()
                    layer.setSubsetString('\"id_msk\" = \'' + self.idMSK + '\'')
                    layer.setCrs(crs)
                    # layer.setCoordinateSystem()

                layer = get_vector_layer_by_name(gln['ln_rayon'])
                provider = layer.dataProvider()
                listId = []

                for feat in provider.getFeatures(QgsFeatureRequest().setFlags(QgsFeatureRequest.NoGeometry)):
                    listId.append(feat.id())

                for i in listId:
                    layer.select(i)      
                
                self.canvas.mapRenderer().setDestinationCrs(crs)
                self.canvas.zoomToSelected(layer)
                layer.removeSelection()
                self.canvas.zoomScale(500000)

                self.isChangeMSK = True

            else:
                QMessageBox.warning(self.iface.mainWindow(), u"Ошибка выбора системы координат", 
                                                             u'Параметры выбранной системы координат некорректны для QGis. Проверьте таблицу МСК в базе данных.')
            del layer
            del provider
            del feat

    def selectDirectory(self):
        path = QFileDialog.getExistingDirectory(self, u'Укажите директорию', 
                                                self.currentPath, 
                                                QFileDialog.ShowDirsOnly | QFileDialog.DontResolveSymlinks)
        if path > ' ':
            path = unicode(path)
            self.currentPath = os.path.abspath(os.path.dirname(path))
            self.lineEditPathToXmlCreate.setText(path)

    def selectFile(self):
        qgsFile = QFileDialog.getSaveFileName(self, u'Укажите файл проекта QGIS или введите имя нового файла', 
                                              self.currentPath, u'QGS файлы(*.qgs *.QGS)')
        if qgsFile > ' ':
            qgsFile = unicode(qgsFile)
            self.currentPath = os.path.abspath(os.path.dirname(qgsFile))
            self.lineEditProjectFile.setText(qgsFile)

#        QMessageBox.information(self.iface.mainWindow(), u'test', 'read')
