# -*- coding: utf-8 -*-
from PyQt4 import QtCore, QtGui
from coordcatalog import CatalogData

__name__ = 'createCoordCatalog'
__version__ = '0.1'
__author__ = 'Filippov Vladislav'

from PyQt4.QtGui import QDialog, QMessageBox
from createCoordCatalog_ui import Ui_CoordCatalog
# открывать html-файлы с помощью браузера. корректно показывает Firefox

#currentPath = os.path.dirname(__file__)


class CreateCoordCatalog(QDialog, Ui_CoordCatalog):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.setupUi(self)

        self.connect(self.btnCreateCoord, QtCore.SIGNAL("clicked()"), self.calculate)

    def calculate(self):
        if (self.iface.mapCanvas().currentLayer() is not None) \
            and (self.iface.mapCanvas().currentLayer().selectedFeatures() is not None):
            for feature in self.iface.mapCanvas().currentLayer().selectedFeatures():
                QMessageBox.warning(self.iface.mainWindow(), 'area', \
                                    str(feature.geometry().area()), QtGui.QMessageBox.Ok, \
                                    QtGui.QMessageBox.Ok)
                ved = CatalogData(feature)
                data = ved.list_contours[0]
                QMessageBox.warning(self.iface.mainWindow(), 'data', \
                                    data, QtGui.QMessageBox.Ok, \
                                    QtGui.QMessageBox.Ok)