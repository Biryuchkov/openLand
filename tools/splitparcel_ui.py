# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'splitparcel.ui'
#
# Created: Sat May 24 13:19:26 2014
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

class Ui_SplitParcel(object):
    def setupUi(self, SplitParcel):
        SplitParcel.setObjectName(_fromUtf8("SplitParcel"))
        SplitParcel.resize(360, 240)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Preferred, QtGui.QSizePolicy.Preferred)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(SplitParcel.sizePolicy().hasHeightForWidth())
        SplitParcel.setSizePolicy(sizePolicy)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/splitparcel.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        SplitParcel.setWindowIcon(icon)
        SplitParcel.setSizeGripEnabled(True)
        SplitParcel.setModal(True)
        self.formLayout = QtGui.QFormLayout(SplitParcel)
        self.formLayout.setFieldGrowthPolicy(QtGui.QFormLayout.AllNonFixedFieldsGrow)
        self.formLayout.setObjectName(_fromUtf8("formLayout"))
        self.label = QtGui.QLabel(SplitParcel)
        self.label.setObjectName(_fromUtf8("label"))
        self.formLayout.setWidget(0, QtGui.QFormLayout.LabelRole, self.label)
        self.lineEditKN = QtGui.QLineEdit(SplitParcel)
        self.lineEditKN.setReadOnly(True)
        self.lineEditKN.setObjectName(_fromUtf8("lineEditKN"))
        self.formLayout.setWidget(0, QtGui.QFormLayout.FieldRole, self.lineEditKN)
        self.label_2 = QtGui.QLabel(SplitParcel)
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.formLayout.setWidget(1, QtGui.QFormLayout.LabelRole, self.label_2)
        self.listWidget = QtGui.QListWidget(SplitParcel)
        self.listWidget.setObjectName(_fromUtf8("listWidget"))
        self.formLayout.setWidget(2, QtGui.QFormLayout.SpanningRole, self.listWidget)
        self.pushButtonOk = QtGui.QPushButton(SplitParcel)
        self.pushButtonOk.setIcon(icon)
        self.pushButtonOk.setObjectName(_fromUtf8("pushButtonOk"))
        self.formLayout.setWidget(3, QtGui.QFormLayout.LabelRole, self.pushButtonOk)
        self.pushButtonCancel = QtGui.QPushButton(SplitParcel)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.pushButtonCancel.sizePolicy().hasHeightForWidth())
        self.pushButtonCancel.setSizePolicy(sizePolicy)
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/close.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonCancel.setIcon(icon1)
        self.pushButtonCancel.setObjectName(_fromUtf8("pushButtonCancel"))
        self.formLayout.setWidget(3, QtGui.QFormLayout.FieldRole, self.pushButtonCancel)

        self.retranslateUi(SplitParcel)
        QtCore.QMetaObject.connectSlotsByName(SplitParcel)
        SplitParcel.setTabOrder(self.lineEditKN, self.listWidget)
        SplitParcel.setTabOrder(self.listWidget, self.pushButtonOk)
        SplitParcel.setTabOrder(self.pushButtonOk, self.pushButtonCancel)

    def retranslateUi(self, SplitParcel):
        SplitParcel.setWindowTitle(_translate("SplitParcel", "Разделение ЗУ", None))
        self.label.setText(_translate("SplitParcel", "<html><head/><body><p align=\"right\">Выбран участок с КН</p></body></html>", None))
        self.label_2.setText(_translate("SplitParcel", "<html><head/><body><p align=\"right\">Координаты линии разделения</p></body></html>", None))
        self.pushButtonOk.setText(_translate("SplitParcel", "Разделить участок по линии", None))
        self.pushButtonCancel.setText(_translate("SplitParcel", "Закрыть", None))

import resources_rc
