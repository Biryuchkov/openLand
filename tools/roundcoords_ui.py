# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'roundcoords.ui'
#
# Created: Mon Oct 28 11:22:39 2013
#      by: PyQt4 UI code generator 4.9.4
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_dlRoundCoords(object):
    def setupUi(self, dlRoundCoords):
        dlRoundCoords.setObjectName(_fromUtf8("dlRoundCoords"))
        dlRoundCoords.resize(460, 140)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Minimum)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(dlRoundCoords.sizePolicy().hasHeightForWidth())
        dlRoundCoords.setSizePolicy(sizePolicy)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/coord_round.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        dlRoundCoords.setWindowIcon(icon)
        dlRoundCoords.setSizeGripEnabled(True)
        dlRoundCoords.setModal(True)
        self.gridLayout = QtGui.QGridLayout(dlRoundCoords)
        self.gridLayout.setObjectName(_fromUtf8("gridLayout"))
        self.spinBox = QtGui.QSpinBox(dlRoundCoords)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Maximum, QtGui.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.spinBox.sizePolicy().hasHeightForWidth())
        self.spinBox.setSizePolicy(sizePolicy)
        self.spinBox.setProperty("value", 2)
        self.spinBox.setObjectName(_fromUtf8("spinBox"))
        self.gridLayout.addWidget(self.spinBox, 1, 1, 1, 1)
        self.label = QtGui.QLabel(dlRoundCoords)
        self.label.setObjectName(_fromUtf8("label"))
        self.gridLayout.addWidget(self.label, 1, 0, 1, 1)
        self.label_2 = QtGui.QLabel(dlRoundCoords)
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.gridLayout.addWidget(self.label_2, 1, 2, 1, 1)
        self.pushButtonOk = QtGui.QPushButton(dlRoundCoords)
        self.pushButtonOk.setIcon(icon)
        self.pushButtonOk.setObjectName(_fromUtf8("pushButtonOk"))
        self.gridLayout.addWidget(self.pushButtonOk, 2, 0, 1, 1)
        self.progressBar = QtGui.QProgressBar(dlRoundCoords)
        self.progressBar.setProperty("value", 0)
        self.progressBar.setObjectName(_fromUtf8("progressBar"))
        self.gridLayout.addWidget(self.progressBar, 3, 0, 1, 3)
        self.label_3 = QtGui.QLabel(dlRoundCoords)
        self.label_3.setObjectName(_fromUtf8("label_3"))
        self.gridLayout.addWidget(self.label_3, 0, 0, 1, 1)
        self.lineEdit = QtGui.QLineEdit(dlRoundCoords)
        self.lineEdit.setReadOnly(True)
        self.lineEdit.setObjectName(_fromUtf8("lineEdit"))
        self.gridLayout.addWidget(self.lineEdit, 0, 1, 1, 1)
        self.pushButtonCancel = QtGui.QPushButton(dlRoundCoords)
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/close.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonCancel.setIcon(icon1)
        self.pushButtonCancel.setObjectName(_fromUtf8("pushButtonCancel"))
        self.gridLayout.addWidget(self.pushButtonCancel, 2, 1, 1, 2)

        self.retranslateUi(dlRoundCoords)
        QtCore.QMetaObject.connectSlotsByName(dlRoundCoords)
        dlRoundCoords.setTabOrder(self.lineEdit, self.spinBox)
        dlRoundCoords.setTabOrder(self.spinBox, self.pushButtonOk)
        dlRoundCoords.setTabOrder(self.pushButtonOk, self.pushButtonCancel)

    def retranslateUi(self, dlRoundCoords):
        dlRoundCoords.setWindowTitle(QtGui.QApplication.translate("dlRoundCoords", "Округление координат", None, QtGui.QApplication.UnicodeUTF8))
        self.label.setText(QtGui.QApplication.translate("dlRoundCoords", "Округлить координаты выбранного объекта до", None, QtGui.QApplication.UnicodeUTF8))
        self.label_2.setText(QtGui.QApplication.translate("dlRoundCoords", "знаков после запятой", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonOk.setText(QtGui.QApplication.translate("dlRoundCoords", "Округлить", None, QtGui.QApplication.UnicodeUTF8))
        self.label_3.setText(QtGui.QApplication.translate("dlRoundCoords", "<html><head/><body><p align=\"right\">Количество выбранных объектов</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonCancel.setText(QtGui.QApplication.translate("dlRoundCoords", "Закрыть", None, QtGui.QApplication.UnicodeUTF8))

import resources_rc
