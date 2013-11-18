# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'createCoordCatalog.ui'
#
# Created: Tue Nov 12 23:02:17 2013
#      by: PyQt4 UI code generator 4.10
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    def _fromUtf8(s):
        return s

try:
    _encoding = QtGui.QApplication.UnicodeUTF8
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig, _encoding)
except AttributeError:
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig)

class Ui_CoordCatalog(object):
    def setupUi(self, CoordCatalog):
        CoordCatalog.setObjectName(_fromUtf8("CoordCatalog"))
        CoordCatalog.resize(586, 552)
        self.verticalLayout = QtGui.QVBoxLayout(CoordCatalog)
        self.verticalLayout.setObjectName(_fromUtf8("verticalLayout"))
        self.textEdit = QtGui.QTextEdit(CoordCatalog)
        self.textEdit.setObjectName(_fromUtf8("textEdit"))
        self.verticalLayout.addWidget(self.textEdit)
        self.radioBtnNewPoint = QtGui.QRadioButton(CoordCatalog)
        self.radioBtnNewPoint.setChecked(True)
        self.radioBtnNewPoint.setObjectName(_fromUtf8("radioBtnNewPoint"))
        self.verticalLayout.addWidget(self.radioBtnNewPoint)
        self.btnCreateCoord = QtGui.QPushButton(CoordCatalog)
        self.btnCreateCoord.setObjectName(_fromUtf8("btnCreateCoord"))
        self.verticalLayout.addWidget(self.btnCreateCoord)
        self.btnSave = QtGui.QPushButton(CoordCatalog)
        self.btnSave.setEnabled(False)
        self.btnSave.setObjectName(_fromUtf8("btnSave"))
        self.verticalLayout.addWidget(self.btnSave)
        self.buttonBox = QtGui.QDialogButtonBox(CoordCatalog)
        self.buttonBox.setOrientation(QtCore.Qt.Horizontal)
        self.buttonBox.setStandardButtons(QtGui.QDialogButtonBox.Cancel|QtGui.QDialogButtonBox.Ok)
        self.buttonBox.setObjectName(_fromUtf8("buttonBox"))
        self.verticalLayout.addWidget(self.buttonBox)

        self.retranslateUi(CoordCatalog)
        QtCore.QObject.connect(self.buttonBox, QtCore.SIGNAL(_fromUtf8("accepted()")), CoordCatalog.accept)
        QtCore.QObject.connect(self.buttonBox, QtCore.SIGNAL(_fromUtf8("rejected()")), CoordCatalog.reject)
        QtCore.QMetaObject.connectSlotsByName(CoordCatalog)

    def retranslateUi(self, CoordCatalog):
        CoordCatalog.setWindowTitle(_translate("CoordCatalog", "Ведомость координат", None))
        self.textEdit.setHtml(_translate("CoordCatalog", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n"
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
"p, li { white-space: pre-wrap; }\n"
"</style></head><body style=\" font-family:\'Sans Serif\'; font-size:9pt; font-weight:400; font-style:normal;\">\n"
"<p align=\"justify\" style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-family:\'MS Shell Dlg 2\'; font-size:8pt;\"><br /></p></body></html>", None))
        self.radioBtnNewPoint.setText(_translate("CoordCatalog", "Новые точки", None))
        self.btnCreateCoord.setText(_translate("CoordCatalog", "Создать ведомость выделенного ЗУ", None))
        self.btnSave.setText(_translate("CoordCatalog", "Сохранить ведомость", None))

