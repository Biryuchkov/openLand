# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'appliedfile.ui'
#
# Created: Mon Oct 28 11:22:15 2013
#      by: PyQt4 UI code generator 4.9.4
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_DialogAppliedFile(object):
    def setupUi(self, DialogAppliedFile):
        DialogAppliedFile.setObjectName(_fromUtf8("DialogAppliedFile"))
        DialogAppliedFile.resize(400, 150)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/jpg.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        DialogAppliedFile.setWindowIcon(icon)
        DialogAppliedFile.setSizeGripEnabled(True)
        DialogAppliedFile.setModal(True)
        self.gridLayout = QtGui.QGridLayout(DialogAppliedFile)
        self.gridLayout.setObjectName(_fromUtf8("gridLayout"))
        self.label = QtGui.QLabel(DialogAppliedFile)
        self.label.setObjectName(_fromUtf8("label"))
        self.gridLayout.addWidget(self.label, 0, 0, 1, 1)
        self.comboBoxTypeFile = QtGui.QComboBox(DialogAppliedFile)
        self.comboBoxTypeFile.setObjectName(_fromUtf8("comboBoxTypeFile"))
        self.gridLayout.addWidget(self.comboBoxTypeFile, 0, 1, 1, 1)
        self.label_2 = QtGui.QLabel(DialogAppliedFile)
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.gridLayout.addWidget(self.label_2, 1, 0, 1, 1)
        self.lineEditFile = QtGui.QLineEdit(DialogAppliedFile)
        self.lineEditFile.setReadOnly(True)
        self.lineEditFile.setObjectName(_fromUtf8("lineEditFile"))
        self.gridLayout.addWidget(self.lineEditFile, 1, 1, 1, 1)
        self.pushButtonFileSelect = QtGui.QPushButton(DialogAppliedFile)
        self.pushButtonFileSelect.setText(_fromUtf8(""))
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/find_search.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonFileSelect.setIcon(icon1)
        self.pushButtonFileSelect.setObjectName(_fromUtf8("pushButtonFileSelect"))
        self.gridLayout.addWidget(self.pushButtonFileSelect, 1, 2, 1, 1)
        self.buttonBox = QtGui.QDialogButtonBox(DialogAppliedFile)
        self.buttonBox.setOrientation(QtCore.Qt.Horizontal)
        self.buttonBox.setStandardButtons(QtGui.QDialogButtonBox.Cancel|QtGui.QDialogButtonBox.Ok)
        self.buttonBox.setObjectName(_fromUtf8("buttonBox"))
        self.gridLayout.addWidget(self.buttonBox, 2, 0, 1, 3)

        self.retranslateUi(DialogAppliedFile)
        QtCore.QObject.connect(self.buttonBox, QtCore.SIGNAL(_fromUtf8("accepted()")), DialogAppliedFile.accept)
        QtCore.QObject.connect(self.buttonBox, QtCore.SIGNAL(_fromUtf8("rejected()")), DialogAppliedFile.reject)
        QtCore.QMetaObject.connectSlotsByName(DialogAppliedFile)
        DialogAppliedFile.setTabOrder(self.comboBoxTypeFile, self.lineEditFile)
        DialogAppliedFile.setTabOrder(self.lineEditFile, self.pushButtonFileSelect)
        DialogAppliedFile.setTabOrder(self.pushButtonFileSelect, self.buttonBox)

    def retranslateUi(self, DialogAppliedFile):
        DialogAppliedFile.setWindowTitle(QtGui.QApplication.translate("DialogAppliedFile", "Приложенный файл", None, QtGui.QApplication.UnicodeUTF8))
        self.label.setText(QtGui.QApplication.translate("DialogAppliedFile", "Вид файла", None, QtGui.QApplication.UnicodeUTF8))
        self.label_2.setText(QtGui.QApplication.translate("DialogAppliedFile", "Файл", None, QtGui.QApplication.UnicodeUTF8))

import resources_rc
