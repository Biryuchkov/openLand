# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'createGeodata.ui'
#
# Created: Fri Dec 20 23:33:00 2013
#      by: PyQt4 UI code generator 4.10.3
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

class Ui_Geodata(object):
    def setupUi(self, CoordCatalog):
        CoordCatalog.setObjectName(_fromUtf8("CoordCatalog"))
        CoordCatalog.resize(876, 682)
        self.verticalLayout = QtGui.QVBoxLayout(CoordCatalog)
        self.verticalLayout.setObjectName(_fromUtf8("verticalLayout"))
        self.textEdit = QtWebKit.QWebView(CoordCatalog)
        self.textEdit.setUrl(QtCore.QUrl(_fromUtf8("about:blank")))
        self.textEdit.setObjectName(_fromUtf8("textEdit"))
        self.verticalLayout.addWidget(self.textEdit)
        self.radioBtnNewPoint = QtGui.QCheckBox(CoordCatalog)
        self.radioBtnNewPoint.setChecked(True)
        self.radioBtnNewPoint.setObjectName(_fromUtf8("radioBtnNewPoint"))
        self.verticalLayout.addWidget(self.radioBtnNewPoint)
        self.radioBtnZiped = QtGui.QCheckBox(CoordCatalog)
        self.radioBtnZiped.setObjectName(_fromUtf8("radioBtnZiped"))
        self.verticalLayout.addWidget(self.radioBtnZiped)
        self.line_3 = QtGui.QFrame(CoordCatalog)
        self.line_3.setFrameShape(QtGui.QFrame.HLine)
        self.line_3.setFrameShadow(QtGui.QFrame.Sunken)
        self.line_3.setObjectName(_fromUtf8("line_3"))
        self.verticalLayout.addWidget(self.line_3)
        self.cmbSheetSize = QtGui.QComboBox(CoordCatalog)
        self.cmbSheetSize.setEditable(True)
        self.cmbSheetSize.setObjectName(_fromUtf8("cmbSheetSize"))
        self.verticalLayout.addWidget(self.cmbSheetSize)
        self.line_2 = QtGui.QFrame(CoordCatalog)
        self.line_2.setLineWidth(4)
        self.line_2.setFrameShape(QtGui.QFrame.HLine)
        self.line_2.setFrameShadow(QtGui.QFrame.Sunken)
        self.line_2.setObjectName(_fromUtf8("line_2"))
        self.verticalLayout.addWidget(self.line_2)
        self.btnGeodata = QtGui.QPushButton(CoordCatalog)
        self.btnGeodata.setObjectName(_fromUtf8("btnGeodata"))
        self.verticalLayout.addWidget(self.btnGeodata)
        self.line = QtGui.QFrame(CoordCatalog)
        self.line.setLineWidth(4)
        self.line.setFrameShape(QtGui.QFrame.HLine)
        self.line.setFrameShadow(QtGui.QFrame.Sunken)
        self.line.setObjectName(_fromUtf8("line"))
        self.verticalLayout.addWidget(self.line)
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
        self.cmbSheetSize.setCurrentIndex(-1)
        QtCore.QObject.connect(self.buttonBox, QtCore.SIGNAL(_fromUtf8("accepted()")), CoordCatalog.accept)
        QtCore.QObject.connect(self.buttonBox, QtCore.SIGNAL(_fromUtf8("rejected()")), CoordCatalog.reject)
        QtCore.QMetaObject.connectSlotsByName(CoordCatalog)

    def retranslateUi(self, CoordCatalog):
        CoordCatalog.setWindowTitle(_translate("CoordCatalog", "Ведомость координат", None))
        self.radioBtnNewPoint.setText(_translate("CoordCatalog", "Новые точки", None))
        self.radioBtnZiped.setText(_translate("CoordCatalog", "Сжатые геоданные", None))
        #self.cmbSheetSize.setCurrentText(_translate("CoordCatalog", "размер листа", None))
        self.btnGeodata.setText(_translate("CoordCatalog", "Создать геоданные выделенного ЗУ", None))
        self.btnSave.setText(_translate("CoordCatalog", "Сохранить HTML", None))

from PyQt4 import QtWebKit
