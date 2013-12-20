# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'ownerneighbour.ui'
#
# Created: Thu Dec 12 10:55:51 2013
#      by: PyQt4 UI code generator 4.8.3
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_DialogOwnerNeighbour(object):
    def setupUi(self, DialogOwnerNeighbour):
        DialogOwnerNeighbour.setObjectName(_fromUtf8("DialogOwnerNeighbour"))
        DialogOwnerNeighbour.resize(460, 280)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/kn.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        DialogOwnerNeighbour.setWindowIcon(icon)
        DialogOwnerNeighbour.setSizeGripEnabled(True)
        DialogOwnerNeighbour.setModal(True)
        self.gridLayout = QtGui.QGridLayout(DialogOwnerNeighbour)
        self.gridLayout.setObjectName(_fromUtf8("gridLayout"))
        self.gridLayout_2 = QtGui.QGridLayout()
        self.gridLayout_2.setObjectName(_fromUtf8("gridLayout_2"))
        self.lineEditNameOwner = QtGui.QLineEdit(DialogOwnerNeighbour)
        self.lineEditNameOwner.setEnabled(True)
        self.lineEditNameOwner.setObjectName(_fromUtf8("lineEditNameOwner"))
        self.gridLayout_2.addWidget(self.lineEditNameOwner, 1, 1, 1, 1)
        self.lineEditContactAddress = QtGui.QLineEdit(DialogOwnerNeighbour)
        self.lineEditContactAddress.setEnabled(True)
        self.lineEditContactAddress.setObjectName(_fromUtf8("lineEditContactAddress"))
        self.gridLayout_2.addWidget(self.lineEditContactAddress, 2, 1, 1, 1)
        self.label_2 = QtGui.QLabel(DialogOwnerNeighbour)
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.gridLayout_2.addWidget(self.label_2, 2, 0, 1, 1)
        self.label_3 = QtGui.QLabel(DialogOwnerNeighbour)
        self.label_3.setObjectName(_fromUtf8("label_3"))
        self.gridLayout_2.addWidget(self.label_3, 3, 0, 1, 1)
        self.label = QtGui.QLabel(DialogOwnerNeighbour)
        self.label.setObjectName(_fromUtf8("label"))
        self.gridLayout_2.addWidget(self.label, 1, 0, 1, 1)
        self.lineEditNameRight = QtGui.QLineEdit(DialogOwnerNeighbour)
        self.lineEditNameRight.setEnabled(True)
        self.lineEditNameRight.setMaxLength(40)
        self.lineEditNameRight.setObjectName(_fromUtf8("lineEditNameRight"))
        self.gridLayout_2.addWidget(self.lineEditNameRight, 0, 1, 1, 1)
        self.treeWidget = QtGui.QTreeWidget(DialogOwnerNeighbour)
        self.treeWidget.setEnabled(True)
        self.treeWidget.setObjectName(_fromUtf8("treeWidget"))
        self.gridLayout_2.addWidget(self.treeWidget, 3, 1, 1, 1)
        self.label_4 = QtGui.QLabel(DialogOwnerNeighbour)
        self.label_4.setObjectName(_fromUtf8("label_4"))
        self.gridLayout_2.addWidget(self.label_4, 0, 0, 1, 1)
        self.verticalLayout = QtGui.QVBoxLayout()
        self.verticalLayout.setObjectName(_fromUtf8("verticalLayout"))
        self.pushButtonAddDocument = QtGui.QPushButton(DialogOwnerNeighbour)
        self.pushButtonAddDocument.setEnabled(True)
        self.pushButtonAddDocument.setText(_fromUtf8(""))
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/symbol_add.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonAddDocument.setIcon(icon1)
        self.pushButtonAddDocument.setObjectName(_fromUtf8("pushButtonAddDocument"))
        self.verticalLayout.addWidget(self.pushButtonAddDocument)
        self.pushButtonEditDocument = QtGui.QPushButton(DialogOwnerNeighbour)
        self.pushButtonEditDocument.setEnabled(True)
        self.pushButtonEditDocument.setText(_fromUtf8(""))
        icon2 = QtGui.QIcon()
        icon2.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/edit.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonEditDocument.setIcon(icon2)
        self.pushButtonEditDocument.setObjectName(_fromUtf8("pushButtonEditDocument"))
        self.verticalLayout.addWidget(self.pushButtonEditDocument)
        self.pushButtonDelDocument = QtGui.QPushButton(DialogOwnerNeighbour)
        self.pushButtonDelDocument.setEnabled(True)
        self.pushButtonDelDocument.setText(_fromUtf8(""))
        icon3 = QtGui.QIcon()
        icon3.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/symbol_remove.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonDelDocument.setIcon(icon3)
        self.pushButtonDelDocument.setObjectName(_fromUtf8("pushButtonDelDocument"))
        self.verticalLayout.addWidget(self.pushButtonDelDocument)
        self.gridLayout_2.addLayout(self.verticalLayout, 3, 2, 1, 1)
        self.gridLayout.addLayout(self.gridLayout_2, 0, 0, 1, 1)
        self.horizontalLayout = QtGui.QHBoxLayout()
        self.horizontalLayout.setObjectName(_fromUtf8("horizontalLayout"))
        self.pushButtonSave = QtGui.QPushButton(DialogOwnerNeighbour)
        icon4 = QtGui.QIcon()
        icon4.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/save.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonSave.setIcon(icon4)
        self.pushButtonSave.setDefault(True)
        self.pushButtonSave.setObjectName(_fromUtf8("pushButtonSave"))
        self.horizontalLayout.addWidget(self.pushButtonSave)
        self.pushButtonClose = QtGui.QPushButton(DialogOwnerNeighbour)
        icon5 = QtGui.QIcon()
        icon5.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/close.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonClose.setIcon(icon5)
        self.pushButtonClose.setObjectName(_fromUtf8("pushButtonClose"))
        self.horizontalLayout.addWidget(self.pushButtonClose)
        self.gridLayout.addLayout(self.horizontalLayout, 1, 0, 1, 1)

        self.retranslateUi(DialogOwnerNeighbour)
        QtCore.QObject.connect(self.treeWidget, QtCore.SIGNAL(_fromUtf8("doubleClicked(QModelIndex)")), self.pushButtonEditDocument.click)
        QtCore.QMetaObject.connectSlotsByName(DialogOwnerNeighbour)
        DialogOwnerNeighbour.setTabOrder(self.lineEditNameRight, self.lineEditNameOwner)
        DialogOwnerNeighbour.setTabOrder(self.lineEditNameOwner, self.lineEditContactAddress)
        DialogOwnerNeighbour.setTabOrder(self.lineEditContactAddress, self.treeWidget)
        DialogOwnerNeighbour.setTabOrder(self.treeWidget, self.pushButtonAddDocument)
        DialogOwnerNeighbour.setTabOrder(self.pushButtonAddDocument, self.pushButtonEditDocument)
        DialogOwnerNeighbour.setTabOrder(self.pushButtonEditDocument, self.pushButtonDelDocument)
        DialogOwnerNeighbour.setTabOrder(self.pushButtonDelDocument, self.pushButtonSave)
        DialogOwnerNeighbour.setTabOrder(self.pushButtonSave, self.pushButtonClose)

    def retranslateUi(self, DialogOwnerNeighbour):
        DialogOwnerNeighbour.setWindowTitle(QtGui.QApplication.translate("DialogOwnerNeighbour", "Правообладатель смежного ЗУ", None, QtGui.QApplication.UnicodeUTF8))
        self.label_2.setText(QtGui.QApplication.translate("DialogOwnerNeighbour", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n"
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
"p, li { white-space: pre-wrap; }\n"
"</style></head><body style=\" font-family:\'MS Shell Dlg 2\'; font-size:8.25pt; font-weight:400; font-style:normal;\">\n"
"<p align=\"right\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-weight:600;\">Контактный адрес<br />правообладателя</span></p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.label_3.setText(QtGui.QApplication.translate("DialogOwnerNeighbour", "<html><head/><body><p align=\"right\">Документы</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.label.setText(QtGui.QApplication.translate("DialogOwnerNeighbour", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n"
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
"p, li { white-space: pre-wrap; }\n"
"</style></head><body style=\" font-family:\'MS Shell Dlg 2\'; font-size:8.25pt; font-weight:400; font-style:normal;\">\n"
"<p align=\"right\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-weight:600;\">Правообладатель</span></p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.treeWidget.setSortingEnabled(True)
        self.treeWidget.headerItem().setText(0, QtGui.QApplication.translate("DialogOwnerNeighbour", "Номер", None, QtGui.QApplication.UnicodeUTF8))
        self.treeWidget.headerItem().setText(1, QtGui.QApplication.translate("DialogOwnerNeighbour", "Наменование", None, QtGui.QApplication.UnicodeUTF8))
        self.label_4.setText(QtGui.QApplication.translate("DialogOwnerNeighbour", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n"
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
"p, li { white-space: pre-wrap; }\n"
"</style></head><body style=\" font-family:\'MS Shell Dlg 2\'; font-size:8.25pt; font-weight:400; font-style:normal;\">\n"
"<p align=\"right\" style=\" margin-top:12px; margin-bottom:12px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-weight:600;\">Вид права</span></p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonSave.setText(QtGui.QApplication.translate("DialogOwnerNeighbour", "OK", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonClose.setText(QtGui.QApplication.translate("DialogOwnerNeighbour", "Отмена", None, QtGui.QApplication.UnicodeUTF8))

import resources_rc
