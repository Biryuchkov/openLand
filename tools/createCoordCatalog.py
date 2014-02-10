# -*- coding: utf-8 -*-
__name__ = 'createCoordCatalog'
__version__ = '0.1'
__author__ = 'Filippov Vladislav'

from PyQt4 import QtCore, QtGui
from coordcatalog import CatalogData
import os.path
from PyQt4.QtGui import QDialog, QMessageBox, QFileDialog
from createCoordCatalog_ui import Ui_CoordCatalog


# Ведомость создаётся на один ЗУ с любым количеством контуров
class CreateCoordCatalog(QDialog, Ui_CoordCatalog):
    def __init__(self, iface):
        self.html_cataloga_data = u''
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.setupUi(self)
        self.curr_path = u''
        self.connect(self.btnCreateCoord, QtCore.SIGNAL("clicked()"), self.calculate)
        self.connect(self.btnSave, QtCore.SIGNAL("clicked()"), self.save_catalog)

    def calculate(self):
        if (self.iface.mapCanvas().currentLayer() is not None) \
            and (self.iface.mapCanvas().currentLayer().selectedFeatures() is not None):
            #for feature in self.iface.mapCanvas().currentLayer().selectedFeatures():
            ved = CatalogData(self.iface.mapCanvas().currentLayer().selectedFeatures(),
                              self.radioBtnNewPoint.isChecked(), False, self.spinBoxFontSize.value())
            data = ved.catalog
            self.textEdit.setHtml(data)
            self.btnSave.setEnabled(True)
            self.html_cataloga_data = data
            #QMessageBox.warning(self.iface.mainWindow(), 'end', \
            #                    data, QtGui.QMessageBox.Ok, \
            #                    QtGui.QMessageBox.Ok)

    def save_catalog(self):
        if self.curr_path == u'':
            self.curr_path = os.getcwd()
        file_name = QFileDialog.getSaveFileName(self, u'Сохраните данные', self.curr_path, u'HTML файлы(*.html *.HTML)')
        if not file_name is None or not file_name == u'':
            current_path = os.path.dirname(unicode(file_name))
            self.curr_path = current_path
            filepath = file_name  #os.path.join(current_path, '.html')
            ccf = open(filepath, 'w')
            ccf.write(self.html_cataloga_data.encode('utf8'))
            ccf.close()