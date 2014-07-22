# -*- coding: utf-8 -*-
'''
/***************************************************************************
 importZU for openland (cadastral engineer tools)
 copyright            : (C) 2012 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from common import *
from importobject_ui import Ui_importObject

class importObject(QDialog,  Ui_importObject):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        QObject.connect(self.pushButtonOk, SIGNAL("clicked()"), self.doImportObject)
        QObject.connect(self.pushButtonCancel, SIGNAL("clicked()"), self.doCancel)

        self.layerName = ''
        self.layer4Import = None

    def toPrepare(self, ls=0):
        self.layer4Import = self.iface.mainWindow().activeLayer()
        selection = self.layer4Import.selectedFeatures()
        ls = len(selection)
        if not (ls >= 1):
            QMessageBox.warning(self.iface.mainWindow(), u"Ошибка выбора данных", 
                                                         u'Необходимо выбрать не менее одного полигона для импорта кадастровых объектов.')
            return False
        else:
            self.lineEdit4Import.setText(unicode(self.layer4Import.name()))
            self.lineEditSelectedCount.setText(str(ls))
            allFields = get_layer_str_fields(self.layer4Import)
            self.comboBoxKn.addItem(' ')
            for i in allFields:
                self.comboBoxKn.addItem(unicode(i))        
            return True

    def doImportObject(self):
        if self.radioButtonParcel.isChecked():
            self.layerName = 'ln_uchastok'

        elif self.radioButtonBlock.isChecked():
            self.layerName = 'ln_kvartal'

        elif self.radioButtonDistrict.isChecked():
            self.layerName = 'ln_rayon'
        
        selection4Import    = self.layer4Import.selectedFeatures()
        fieldName4ImportKn  = self.comboBoxKn.currentText()
        idMSK       = idCurrentMSK()
        listValues  = []
        progress    = QProgressBar()

        progressMessageBar = self.iface.messageBar().createMessage(u'Подготовка данных ...')
        progress.setMaximum(int(len(selection4Import)))
        progress.setAlignment(Qt.AlignLeft|Qt.AlignVCenter)
        progressMessageBar.layout().addWidget(progress)
        self.iface.messageBar().pushWidget(progressMessageBar, 
                                           self.iface.messageBar().INFO)
        numberObject = 0
        for every in selection4Import:
            geo = every.geometry()
            att = every.attributes()

            if fieldName4ImportKn == ' ':
                kn = ''
            else:
                kn = att[self.layer4Import.fieldNameIndex(fieldName4ImportKn)]

            listValues.append([kn, idMSK, geo])
            numberObject += 1
            progress.setValue(numberObject)

        progressMessageBar.setText(u'Импорт объектов в базу данных...')
        insertFeatures(self.layerName, ['kn', 'id_msk', 'geom'], listValues)
        progressMessageBar.setText(u'Импорт завершен.')

        self.canvas.refresh()
            
    def doCancel(self):
        self.iface.messageBar().clearWidgets()
        self.close()

#        QMessageBox.information(self.iface.mainWindow(), u'test', str())
