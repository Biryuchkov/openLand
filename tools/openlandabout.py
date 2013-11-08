# -*- coding: utf-8 -*-
'''
/***************************************************************************
 address for openland (cadastral engineer tools)
 copyright            : (C) 2012 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from openlandabout_ui import Ui_OpenLandAbout
import webbrowser, os

currentPath = os.path.dirname(__file__)

class OpenLandAbout(QDialog, Ui_OpenLandAbout):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.setupUi(self)
      
        QObject.connect(self.labelSiteUrl, SIGNAL("linkActivated(QString)"), self.openLink)
        QObject.connect(self.labelGnuUrl, SIGNAL("linkActivated(QString)"), self.openLink)
        QObject.connect(self.labelGnuRusUrl, SIGNAL("linkActivated(QString)"), self.openLink)
        QObject.connect(self.pushButtonAboutQt, SIGNAL("clicked()"), self.aboutQt)
        
    def openLink(self, textLink='http://openlandgis.ru/'):
        webbrowser.open(textLink)
    
    def aboutQt(self):
        QMessageBox.aboutQt(self, u'О Qt')
