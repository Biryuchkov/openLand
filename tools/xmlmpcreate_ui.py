# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'xmlmpcreate.ui'
#
# Created: Mon Oct 28 11:22:44 2013
#      by: PyQt4 UI code generator 4.9.4
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_XmlMpCreate(object):
    def setupUi(self, XmlMpCreate):
        XmlMpCreate.setObjectName(_fromUtf8("XmlMpCreate"))
        XmlMpCreate.resize(640, 320)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/export_xml.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        XmlMpCreate.setWindowIcon(icon)
        XmlMpCreate.setSizeGripEnabled(True)
        XmlMpCreate.setModal(True)
        self.gridLayout = QtGui.QGridLayout(XmlMpCreate)
        self.gridLayout.setObjectName(_fromUtf8("gridLayout"))
        self.pushButtonClose = QtGui.QPushButton(XmlMpCreate)
        self.pushButtonClose.setText(_fromUtf8(""))
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/close.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonClose.setIcon(icon1)
        self.pushButtonClose.setAutoDefault(False)
        self.pushButtonClose.setObjectName(_fromUtf8("pushButtonClose"))
        self.gridLayout.addWidget(self.pushButtonClose, 1, 3, 1, 1)
        self.listWidgetEvents = QtGui.QListWidget(XmlMpCreate)
        self.listWidgetEvents.setSelectionMode(QtGui.QAbstractItemView.SingleSelection)
        self.listWidgetEvents.setObjectName(_fromUtf8("listWidgetEvents"))
        self.gridLayout.addWidget(self.listWidgetEvents, 0, 2, 1, 1)
        self.label_3 = QtGui.QLabel(XmlMpCreate)
        self.label_3.setObjectName(_fromUtf8("label_3"))
        self.gridLayout.addWidget(self.label_3, 0, 0, 1, 1)
        self.progressBar = QtGui.QProgressBar(XmlMpCreate)
        self.progressBar.setProperty("value", 0)
        self.progressBar.setObjectName(_fromUtf8("progressBar"))
        self.gridLayout.addWidget(self.progressBar, 1, 2, 1, 1)
        self.pushButtonExport = QtGui.QPushButton(XmlMpCreate)
        self.pushButtonExport.setText(_fromUtf8(""))
        self.pushButtonExport.setIcon(icon)
        self.pushButtonExport.setObjectName(_fromUtf8("pushButtonExport"))
        self.gridLayout.addWidget(self.pushButtonExport, 0, 3, 1, 1)

        self.retranslateUi(XmlMpCreate)
        QtCore.QMetaObject.connectSlotsByName(XmlMpCreate)
        XmlMpCreate.setTabOrder(self.listWidgetEvents, self.pushButtonExport)
        XmlMpCreate.setTabOrder(self.pushButtonExport, self.pushButtonClose)

    def retranslateUi(self, XmlMpCreate):
        XmlMpCreate.setWindowTitle(QtGui.QApplication.translate("XmlMpCreate", "Формирование XML файла", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonClose.setToolTip(QtGui.QApplication.translate("XmlMpCreate", "Закрыть окно", None, QtGui.QApplication.UnicodeUTF8))
        self.label_3.setText(QtGui.QApplication.translate("XmlMpCreate", "<html><head/><body><p align=\"right\">Выполнение<br/>операций</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonExport.setToolTip(QtGui.QApplication.translate("XmlMpCreate", "Создать XML файл", None, QtGui.QApplication.UnicodeUTF8))

import resources_rc
