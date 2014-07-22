# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'unionparcels.ui'
#
# Created: Mon May 19 20:19:48 2014
#      by: PyQt4 UI code generator 4.10.2
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

class Ui_UnionParcels(object):
    def setupUi(self, UnionParcels):
        UnionParcels.setObjectName(_fromUtf8("UnionParcels"))
        UnionParcels.resize(300, 100)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Minimum)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(UnionParcels.sizePolicy().hasHeightForWidth())
        UnionParcels.setSizePolicy(sizePolicy)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/unionparcels.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        UnionParcels.setWindowIcon(icon)
        UnionParcels.setSizeGripEnabled(True)
        UnionParcels.setModal(True)
        self.gridLayout = QtGui.QGridLayout(UnionParcels)
        self.gridLayout.setObjectName(_fromUtf8("gridLayout"))
        self.label = QtGui.QLabel(UnionParcels)
        self.label.setObjectName(_fromUtf8("label"))
        self.gridLayout.addWidget(self.label, 0, 0, 1, 1)
        self.lineEditSelectedCount = QtGui.QLineEdit(UnionParcels)
        self.lineEditSelectedCount.setReadOnly(True)
        self.lineEditSelectedCount.setObjectName(_fromUtf8("lineEditSelectedCount"))
        self.gridLayout.addWidget(self.lineEditSelectedCount, 0, 1, 1, 1)
        self.pushButtonOk = QtGui.QPushButton(UnionParcels)
        self.pushButtonOk.setIcon(icon)
        self.pushButtonOk.setObjectName(_fromUtf8("pushButtonOk"))
        self.gridLayout.addWidget(self.pushButtonOk, 1, 0, 1, 1)
        self.pushButtonCancel = QtGui.QPushButton(UnionParcels)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.pushButtonCancel.sizePolicy().hasHeightForWidth())
        self.pushButtonCancel.setSizePolicy(sizePolicy)
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/close.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonCancel.setIcon(icon1)
        self.pushButtonCancel.setObjectName(_fromUtf8("pushButtonCancel"))
        self.gridLayout.addWidget(self.pushButtonCancel, 1, 1, 1, 1)

        self.retranslateUi(UnionParcels)
        QtCore.QMetaObject.connectSlotsByName(UnionParcels)

    def retranslateUi(self, UnionParcels):
        UnionParcels.setWindowTitle(_translate("UnionParcels", "Объединение ЗУ", None))
        self.label.setText(_translate("UnionParcels", "<html><head/><body><p align=\"right\">Объединить выбранные<br />участки в количестве</p></body></html>", None))
        self.pushButtonOk.setText(_translate("UnionParcels", "Объединить выбранные", None))
        self.pushButtonCancel.setText(_translate("UnionParcels", "Закрыть", None))

import resources_rc
