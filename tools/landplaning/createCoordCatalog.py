# -*- coding: utf-8 -*-
__name__ = 'createCoordCatalog'
__version__ = '0.1'
__author__ = 'Filippov Vladislav'

from PyQt4.QtGui import QDialog
from tools.landplaning.createCoordCatalog_ui import Ui_CoordCatalog
# открывать html-файлы с помощью браузера. корректно показывает Firefox
import webbrowser, os

currentPath = os.path.dirname(__file__)

class CreateCoordCatalog(QDialog, Ui_CoordCatalog):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.setupUi(self)