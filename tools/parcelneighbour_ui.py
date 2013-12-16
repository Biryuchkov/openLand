# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'parcelneighbour.ui'
#
# Created: Wed Dec 11 11:26:11 2013
#      by: PyQt4 UI code generator 4.8.3
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_DialogParcelNeighbour(object):
    def setupUi(self, DialogParcelNeighbour):
        DialogParcelNeighbour.setObjectName(_fromUtf8("DialogParcelNeighbour"))
        DialogParcelNeighbour.resize(460, 280)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/kn.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        DialogParcelNeighbour.setWindowIcon(icon)
        DialogParcelNeighbour.setSizeGripEnabled(True)
        DialogParcelNeighbour.setModal(True)
        self.gridLayout = QtGui.QGridLayout(DialogParcelNeighbour)
        self.gridLayout.setObjectName(_fromUtf8("gridLayout"))
        self.gridLayout_2 = QtGui.QGridLayout()
        self.gridLayout_2.setObjectName(_fromUtf8("gridLayout_2"))
        self.label_3 = QtGui.QLabel(DialogParcelNeighbour)
        self.label_3.setObjectName(_fromUtf8("label_3"))
        self.gridLayout_2.addWidget(self.label_3, 2, 0, 1, 1)
        self.lineEditDefinition = QtGui.QLineEdit(DialogParcelNeighbour)
        self.lineEditDefinition.setEnabled(True)
        self.lineEditDefinition.setMaxLength(40)
        self.lineEditDefinition.setObjectName(_fromUtf8("lineEditDefinition"))
        self.gridLayout_2.addWidget(self.lineEditDefinition, 0, 1, 1, 1)
        self.treeWidget = QtGui.QTreeWidget(DialogParcelNeighbour)
        self.treeWidget.setEnabled(True)
        self.treeWidget.setObjectName(_fromUtf8("treeWidget"))
        self.gridLayout_2.addWidget(self.treeWidget, 2, 1, 1, 1)
        self.verticalLayout = QtGui.QVBoxLayout()
        self.verticalLayout.setObjectName(_fromUtf8("verticalLayout"))
        self.pushButtonAddOwner = QtGui.QPushButton(DialogParcelNeighbour)
        self.pushButtonAddOwner.setEnabled(True)
        self.pushButtonAddOwner.setText(_fromUtf8(""))
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/symbol_add.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonAddOwner.setIcon(icon1)
        self.pushButtonAddOwner.setObjectName(_fromUtf8("pushButtonAddOwner"))
        self.verticalLayout.addWidget(self.pushButtonAddOwner)
        self.pushButtonEditOwner = QtGui.QPushButton(DialogParcelNeighbour)
        self.pushButtonEditOwner.setEnabled(True)
        self.pushButtonEditOwner.setText(_fromUtf8(""))
        icon2 = QtGui.QIcon()
        icon2.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/edit.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonEditOwner.setIcon(icon2)
        self.pushButtonEditOwner.setObjectName(_fromUtf8("pushButtonEditOwner"))
        self.verticalLayout.addWidget(self.pushButtonEditOwner)
        self.pushButtonDelOwner = QtGui.QPushButton(DialogParcelNeighbour)
        self.pushButtonDelOwner.setEnabled(True)
        self.pushButtonDelOwner.setText(_fromUtf8(""))
        icon3 = QtGui.QIcon()
        icon3.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/symbol_remove.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonDelOwner.setIcon(icon3)
        self.pushButtonDelOwner.setObjectName(_fromUtf8("pushButtonDelOwner"))
        self.verticalLayout.addWidget(self.pushButtonDelOwner)
        self.gridLayout_2.addLayout(self.verticalLayout, 2, 2, 1, 1)
        self.lineEditCadastralNumber = QtGui.QLineEdit(DialogParcelNeighbour)
        self.lineEditCadastralNumber.setEnabled(True)
        self.lineEditCadastralNumber.setObjectName(_fromUtf8("lineEditCadastralNumber"))
        self.gridLayout_2.addWidget(self.lineEditCadastralNumber, 1, 1, 1, 1)
        self.label_4 = QtGui.QLabel(DialogParcelNeighbour)
        self.label_4.setObjectName(_fromUtf8("label_4"))
        self.gridLayout_2.addWidget(self.label_4, 0, 0, 1, 1)
        self.label = QtGui.QLabel(DialogParcelNeighbour)
        self.label.setObjectName(_fromUtf8("label"))
        self.gridLayout_2.addWidget(self.label, 1, 0, 1, 1)
        self.gridLayout.addLayout(self.gridLayout_2, 0, 0, 1, 1)
        self.horizontalLayout = QtGui.QHBoxLayout()
        self.horizontalLayout.setObjectName(_fromUtf8("horizontalLayout"))
        self.pushButtonSave = QtGui.QPushButton(DialogParcelNeighbour)
        icon4 = QtGui.QIcon()
        icon4.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/save.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonSave.setIcon(icon4)
        self.pushButtonSave.setDefault(True)
        self.pushButtonSave.setObjectName(_fromUtf8("pushButtonSave"))
        self.horizontalLayout.addWidget(self.pushButtonSave)
        self.pushButtonClose = QtGui.QPushButton(DialogParcelNeighbour)
        icon5 = QtGui.QIcon()
        icon5.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/close.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonClose.setIcon(icon5)
        self.pushButtonClose.setObjectName(_fromUtf8("pushButtonClose"))
        self.horizontalLayout.addWidget(self.pushButtonClose)
        self.gridLayout.addLayout(self.horizontalLayout, 1, 0, 1, 1)

        self.retranslateUi(DialogParcelNeighbour)
        QtCore.QObject.connect(self.treeWidget, QtCore.SIGNAL(_fromUtf8("doubleClicked(QModelIndex)")), self.pushButtonEditOwner.click)
        QtCore.QMetaObject.connectSlotsByName(DialogParcelNeighbour)
        DialogParcelNeighbour.setTabOrder(self.lineEditDefinition, self.lineEditCadastralNumber)
        DialogParcelNeighbour.setTabOrder(self.lineEditCadastralNumber, self.treeWidget)
        DialogParcelNeighbour.setTabOrder(self.treeWidget, self.pushButtonAddOwner)
        DialogParcelNeighbour.setTabOrder(self.pushButtonAddOwner, self.pushButtonEditOwner)
        DialogParcelNeighbour.setTabOrder(self.pushButtonEditOwner, self.pushButtonDelOwner)
        DialogParcelNeighbour.setTabOrder(self.pushButtonDelOwner, self.pushButtonSave)
        DialogParcelNeighbour.setTabOrder(self.pushButtonSave, self.pushButtonClose)

    def retranslateUi(self, DialogParcelNeighbour):
        DialogParcelNeighbour.setWindowTitle(QtGui.QApplication.translate("DialogParcelNeighbour", "Смежный ЗУ", None, QtGui.QApplication.UnicodeUTF8))
        self.label_3.setText(QtGui.QApplication.translate("DialogParcelNeighbour", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n"
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
"p, li { white-space: pre-wrap; }\n"
"</style></head><body style=\" font-family:\'MS Shell Dlg 2\'; font-size:8.25pt; font-weight:400; font-style:normal;\">\n"
"<p align=\"right\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Правообладатели<br />смежного участка</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.treeWidget.setSortingEnabled(True)
        self.treeWidget.headerItem().setText(0, QtGui.QApplication.translate("DialogParcelNeighbour", "ФИО или название организации", None, QtGui.QApplication.UnicodeUTF8))
        self.label_4.setText(QtGui.QApplication.translate("DialogParcelNeighbour", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n"
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
"p, li { white-space: pre-wrap; }\n"
"</style></head><body style=\" font-family:\'MS Shell Dlg 2\'; font-size:8.25pt; font-weight:400; font-style:normal;\">\n"
"<p align=\"right\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:8pt; font-weight:600;\">Обозначение характерной<br />точки или части границы</span></p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.label.setText(QtGui.QApplication.translate("DialogParcelNeighbour", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n"
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
"p, li { white-space: pre-wrap; }\n"
"</style></head><body style=\" font-family:\'MS Shell Dlg 2\'; font-size:8.25pt; font-weight:400; font-style:normal;\">\n"
"<p align=\"right\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:8pt; font-weight:600;\">Кадастровый <br />номер</span></p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonSave.setText(QtGui.QApplication.translate("DialogParcelNeighbour", "OK", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonClose.setText(QtGui.QApplication.translate("DialogParcelNeighbour", "Отмена", None, QtGui.QApplication.UnicodeUTF8))

import resources_rc
