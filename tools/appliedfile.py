# -*- coding: utf-8 -*-
'''
/***************************************************************************
 appliedfile for openland (cadastral engineer tools)
 copyright            : (C) 2013 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
import os.path
from appliedfile_ui import Ui_DialogAppliedFile
from common import *

class AppliedFile(QDialog, Ui_DialogAppliedFile):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        fillComboBox(self.comboBoxTypeFile, 'cl_type_applied_file', 'id', 
                                            'name', '01')
        self.connect(self.pushButtonFileSelect, SIGNAL("clicked()"), 
                     self.selectFile)        

        self.currentPath = ''
        self.typeAppliedFile = None
        self.nameAppliedFile = None
        self.pathAppliedFile = None
        
    def fillLinesEdit(self):
        self.lineEditFile.setText('')

    def selectFile(self):
        self.pathAppliedFile = QFileDialog.getOpenFileName(self, 
                                                           u'Укажите приложенный файл', 
                                                           self.currentPath, 
                                                           u'файлы (*.jpg *.JPG *.pdf *.PDF *.tiff *.TIFF)')
        if self.pathAppliedFile > ' ':
            self.pathAppliedFile = unicode(self.pathAppliedFile)
            self.currentPath = os.path.abspath(os.path.dirname(self.pathAppliedFile))
            self.nameAppliedFile = os.path.basename(self.pathAppliedFile)
            self.lineEditFile.setText(self.pathAppliedFile)

    def accept(self):
        self.typeAppliedFile = self.comboBoxTypeFile.itemData(self.comboBoxTypeFile.currentIndex())
        QDialog.accept(self)

#        QMessageBox.information(self.iface.mainWindow(), 'test', str())
