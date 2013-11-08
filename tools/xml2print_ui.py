# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'xml2print.ui'
#
# Created: Mon Oct 28 11:22:43 2013
#      by: PyQt4 UI code generator 4.9.4
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_XML2Print(object):
    def setupUi(self, XML2Print):
        XML2Print.setObjectName(_fromUtf8("XML2Print"))
        XML2Print.resize(640, 480)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/print.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        XML2Print.setWindowIcon(icon)
        XML2Print.setSizeGripEnabled(True)
        XML2Print.setModal(True)
        self.gridLayout = QtGui.QGridLayout(XML2Print)
        self.gridLayout.setObjectName(_fromUtf8("gridLayout"))
        self.label_2 = QtGui.QLabel(XML2Print)
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.gridLayout.addWidget(self.label_2, 0, 0, 1, 1)
        self.lineEditFileXML = QtGui.QLineEdit(XML2Print)
        self.lineEditFileXML.setReadOnly(True)
        self.lineEditFileXML.setObjectName(_fromUtf8("lineEditFileXML"))
        self.gridLayout.addWidget(self.lineEditFileXML, 1, 1, 1, 1)
        self.pushButtonFileXML = QtGui.QPushButton(XML2Print)
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/find_search.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonFileXML.setIcon(icon1)
        self.pushButtonFileXML.setObjectName(_fromUtf8("pushButtonFileXML"))
        self.gridLayout.addWidget(self.pushButtonFileXML, 1, 2, 1, 1)
        self.label_3 = QtGui.QLabel(XML2Print)
        self.label_3.setObjectName(_fromUtf8("label_3"))
        self.gridLayout.addWidget(self.label_3, 2, 0, 1, 1)
        self.label = QtGui.QLabel(XML2Print)
        self.label.setObjectName(_fromUtf8("label"))
        self.gridLayout.addWidget(self.label, 1, 0, 1, 1)
        self.pushButtonPrint = QtGui.QPushButton(XML2Print)
        self.pushButtonPrint.setIcon(icon)
        self.pushButtonPrint.setObjectName(_fromUtf8("pushButtonPrint"))
        self.gridLayout.addWidget(self.pushButtonPrint, 2, 2, 1, 1)
        self.checkBoxIsOpenDoc = QtGui.QCheckBox(XML2Print)
        self.checkBoxIsOpenDoc.setChecked(True)
        self.checkBoxIsOpenDoc.setObjectName(_fromUtf8("checkBoxIsOpenDoc"))
        self.gridLayout.addWidget(self.checkBoxIsOpenDoc, 3, 1, 1, 1)
        self.listWidgetEvents = QtGui.QListWidget(XML2Print)
        self.listWidgetEvents.setObjectName(_fromUtf8("listWidgetEvents"))
        self.gridLayout.addWidget(self.listWidgetEvents, 2, 1, 1, 1)
        self.comboBoxDocumentType = QtGui.QComboBox(XML2Print)
        self.comboBoxDocumentType.setObjectName(_fromUtf8("comboBoxDocumentType"))
        self.gridLayout.addWidget(self.comboBoxDocumentType, 0, 1, 1, 1)
        self.pushButtonClose = QtGui.QPushButton(XML2Print)
        icon2 = QtGui.QIcon()
        icon2.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/close.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonClose.setIcon(icon2)
        self.pushButtonClose.setObjectName(_fromUtf8("pushButtonClose"))
        self.gridLayout.addWidget(self.pushButtonClose, 3, 2, 1, 1)

        self.retranslateUi(XML2Print)
        QtCore.QMetaObject.connectSlotsByName(XML2Print)
        XML2Print.setTabOrder(self.comboBoxDocumentType, self.lineEditFileXML)
        XML2Print.setTabOrder(self.lineEditFileXML, self.pushButtonFileXML)
        XML2Print.setTabOrder(self.pushButtonFileXML, self.listWidgetEvents)
        XML2Print.setTabOrder(self.listWidgetEvents, self.pushButtonPrint)
        XML2Print.setTabOrder(self.pushButtonPrint, self.checkBoxIsOpenDoc)
        XML2Print.setTabOrder(self.checkBoxIsOpenDoc, self.pushButtonClose)

    def retranslateUi(self, XML2Print):
        XML2Print.setWindowTitle(QtGui.QApplication.translate("XML2Print", "Формирование печатной формы документа", None, QtGui.QApplication.UnicodeUTF8))
        self.label_2.setText(QtGui.QApplication.translate("XML2Print", "<html><head/><body><p align=\"right\">Вид документа</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonFileXML.setText(QtGui.QApplication.translate("XML2Print", "Выбрать...", None, QtGui.QApplication.UnicodeUTF8))
        self.label_3.setText(QtGui.QApplication.translate("XML2Print", "<html><head/><body><p align=\"right\">Выполнение<br/>операций </p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.label.setText(QtGui.QApplication.translate("XML2Print", "<html><head/><body><p align=\"right\">Файл XML</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonPrint.setText(QtGui.QApplication.translate("XML2Print", "Создать", None, QtGui.QApplication.UnicodeUTF8))
        self.checkBoxIsOpenDoc.setText(QtGui.QApplication.translate("XML2Print", "Открыть документ после создания", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonClose.setText(QtGui.QApplication.translate("XML2Print", "Закрыть", None, QtGui.QApplication.UnicodeUTF8))

import resources_rc
