# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'createCoordCatalog.ui'
#
# Created: Tue Nov 12 16:41:17 2013
#      by: PyQt4 UI code generator 4.9.4
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_Vertex(object):
    def setupUi(self, Vertex):
        Vertex.setObjectName(_fromUtf8("Vertex"))
        Vertex.resize(586, 552)
        self.verticalLayout = QtGui.QVBoxLayout(Vertex)
        self.verticalLayout.setObjectName(_fromUtf8("verticalLayout"))
        self.textEdit = QtGui.QTextEdit(Vertex)
        self.textEdit.setObjectName(_fromUtf8("textEdit"))
        self.verticalLayout.addWidget(self.textEdit)
        self.radioBtnNewPoint = QtGui.QRadioButton(Vertex)
        self.radioBtnNewPoint.setChecked(True)
        self.radioBtnNewPoint.setObjectName(_fromUtf8("radioBtnNewPoint"))
        self.verticalLayout.addWidget(self.radioBtnNewPoint)
        self.btnCreateCoord = QtGui.QPushButton(Vertex)
        self.btnCreateCoord.setObjectName(_fromUtf8("btnCreateCoord"))
        self.verticalLayout.addWidget(self.btnCreateCoord)
        self.btnSave = QtGui.QPushButton(Vertex)
        self.btnSave.setEnabled(False)
        self.btnSave.setObjectName(_fromUtf8("btnSave"))
        self.verticalLayout.addWidget(self.btnSave)
        self.buttonBox = QtGui.QDialogButtonBox(Vertex)
        self.buttonBox.setOrientation(QtCore.Qt.Horizontal)
        self.buttonBox.setStandardButtons(QtGui.QDialogButtonBox.Cancel|QtGui.QDialogButtonBox.Ok)
        self.buttonBox.setObjectName(_fromUtf8("buttonBox"))
        self.verticalLayout.addWidget(self.buttonBox)

        self.retranslateUi(Vertex)
        QtCore.QObject.connect(self.buttonBox, QtCore.SIGNAL(_fromUtf8("accepted()")), Vertex.accept)
        QtCore.QObject.connect(self.buttonBox, QtCore.SIGNAL(_fromUtf8("rejected()")), Vertex.reject)
        QtCore.QMetaObject.connectSlotsByName(Vertex)

    def retranslateUi(self, Vertex):
        Vertex.setWindowTitle(QtGui.QApplication.translate("Vertex", "Vertex", None, QtGui.QApplication.UnicodeUTF8))
        self.textEdit.setHtml(QtGui.QApplication.translate("Vertex", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n"
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
"p, li { white-space: pre-wrap; }\n"
"</style></head><body style=\" font-family:\'MS Shell Dlg 2\'; font-size:8.25pt; font-weight:400; font-style:normal;\">\n"
"<p align=\"justify\" style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-size:8pt;\"><br /></p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.radioBtnNewPoint.setText(QtGui.QApplication.translate("Vertex", "Новые точки", None, QtGui.QApplication.UnicodeUTF8))
        self.btnCreateCoord.setText(QtGui.QApplication.translate("Vertex", "Создать ведомость выделенного ЗУ", None, QtGui.QApplication.UnicodeUTF8))
        self.btnSave.setText(QtGui.QApplication.translate("Vertex", "Сохранить ведомость", None, QtGui.QApplication.UnicodeUTF8))

