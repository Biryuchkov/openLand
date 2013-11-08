# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'kladr.ui'
#
# Created: Mon Oct 28 11:22:28 2013
#      by: PyQt4 UI code generator 4.9.4
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_DialogKladr(object):
    def setupUi(self, DialogKladr):
        DialogKladr.setObjectName(_fromUtf8("DialogKladr"))
        DialogKladr.resize(365, 180)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/symbol_check.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        DialogKladr.setWindowIcon(icon)
        DialogKladr.setSizeGripEnabled(True)
        DialogKladr.setModal(True)
        self.verticalLayout = QtGui.QVBoxLayout(DialogKladr)
        self.verticalLayout.setObjectName(_fromUtf8("verticalLayout"))
        self.comboBox1 = QtGui.QComboBox(DialogKladr)
        self.comboBox1.setEnabled(False)
        self.comboBox1.setToolTip(_fromUtf8(""))
        self.comboBox1.setStatusTip(_fromUtf8(""))
        self.comboBox1.setWhatsThis(_fromUtf8(""))
        self.comboBox1.setObjectName(_fromUtf8("comboBox1"))
        self.verticalLayout.addWidget(self.comboBox1)
        self.comboBox2 = QtGui.QComboBox(DialogKladr)
        self.comboBox2.setEnabled(False)
        self.comboBox2.setObjectName(_fromUtf8("comboBox2"))
        self.verticalLayout.addWidget(self.comboBox2)
        self.comboBox3 = QtGui.QComboBox(DialogKladr)
        self.comboBox3.setEnabled(False)
        self.comboBox3.setObjectName(_fromUtf8("comboBox3"))
        self.verticalLayout.addWidget(self.comboBox3)
        self.comboBox4 = QtGui.QComboBox(DialogKladr)
        self.comboBox4.setEnabled(False)
        self.comboBox4.setObjectName(_fromUtf8("comboBox4"))
        self.verticalLayout.addWidget(self.comboBox4)
        self.buttonBox = QtGui.QDialogButtonBox(DialogKladr)
        self.buttonBox.setOrientation(QtCore.Qt.Horizontal)
        self.buttonBox.setStandardButtons(QtGui.QDialogButtonBox.Cancel|QtGui.QDialogButtonBox.Ok)
        self.buttonBox.setObjectName(_fromUtf8("buttonBox"))
        self.verticalLayout.addWidget(self.buttonBox)

        self.retranslateUi(DialogKladr)
        QtCore.QObject.connect(self.buttonBox, QtCore.SIGNAL(_fromUtf8("accepted()")), DialogKladr.accept)
        QtCore.QObject.connect(self.buttonBox, QtCore.SIGNAL(_fromUtf8("rejected()")), DialogKladr.reject)
        QtCore.QMetaObject.connectSlotsByName(DialogKladr)

    def retranslateUi(self, DialogKladr):
        DialogKladr.setWindowTitle(QtGui.QApplication.translate("DialogKladr", "КЛАДР", None, QtGui.QApplication.UnicodeUTF8))

import resources_rc
