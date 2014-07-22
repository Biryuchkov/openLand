# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'createmulticontour.ui'
#
# Created: Tue May 13 12:34:04 2014
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

class Ui_createMultiContour(object):
    def setupUi(self, createMultiContour):
        createMultiContour.setObjectName(_fromUtf8("createMultiContour"))
        createMultiContour.resize(360, 120)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Minimum)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(createMultiContour.sizePolicy().hasHeightForWidth())
        createMultiContour.setSizePolicy(sizePolicy)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/combcontours.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        createMultiContour.setWindowIcon(icon)
        createMultiContour.setSizeGripEnabled(True)
        createMultiContour.setModal(True)
        self.formLayout = QtGui.QFormLayout(createMultiContour)
        self.formLayout.setFieldGrowthPolicy(QtGui.QFormLayout.AllNonFixedFieldsGrow)
        self.formLayout.setObjectName(_fromUtf8("formLayout"))
        self.label = QtGui.QLabel(createMultiContour)
        self.label.setObjectName(_fromUtf8("label"))
        self.formLayout.setWidget(0, QtGui.QFormLayout.LabelRole, self.label)
        self.lineEditSelectedCount = QtGui.QLineEdit(createMultiContour)
        self.lineEditSelectedCount.setReadOnly(True)
        self.lineEditSelectedCount.setObjectName(_fromUtf8("lineEditSelectedCount"))
        self.formLayout.setWidget(0, QtGui.QFormLayout.FieldRole, self.lineEditSelectedCount)
        self.label_2 = QtGui.QLabel(createMultiContour)
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.formLayout.setWidget(2, QtGui.QFormLayout.LabelRole, self.label_2)
        self.comboBoxKvr = QtGui.QComboBox(createMultiContour)
        self.comboBoxKvr.setEditable(True)
        self.comboBoxKvr.setObjectName(_fromUtf8("comboBoxKvr"))
        self.formLayout.setWidget(2, QtGui.QFormLayout.FieldRole, self.comboBoxKvr)
        self.pushButtonOk = QtGui.QPushButton(createMultiContour)
        self.pushButtonOk.setIcon(icon)
        self.pushButtonOk.setObjectName(_fromUtf8("pushButtonOk"))
        self.formLayout.setWidget(4, QtGui.QFormLayout.LabelRole, self.pushButtonOk)
        self.pushButtonCancel = QtGui.QPushButton(createMultiContour)
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/close.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonCancel.setIcon(icon1)
        self.pushButtonCancel.setObjectName(_fromUtf8("pushButtonCancel"))
        self.formLayout.setWidget(4, QtGui.QFormLayout.FieldRole, self.pushButtonCancel)

        self.retranslateUi(createMultiContour)
        QtCore.QMetaObject.connectSlotsByName(createMultiContour)
        createMultiContour.setTabOrder(self.lineEditSelectedCount, self.comboBoxKvr)
        createMultiContour.setTabOrder(self.comboBoxKvr, self.pushButtonOk)
        createMultiContour.setTabOrder(self.pushButtonOk, self.pushButtonCancel)

    def retranslateUi(self, createMultiContour):
        createMultiContour.setWindowTitle(_translate("createMultiContour", "Создание многоконтурного участка", None))
        self.label.setText(_translate("createMultiContour", "<html><head/><body><p align=\"right\">Количество выбранных контуров</p></body></html>", None))
        self.label_2.setText(_translate("createMultiContour", "<html><head/><body><p align=\"right\">Квартал для многоконтурного</p></body></html>", None))
        self.pushButtonOk.setText(_translate("createMultiContour", "Создать многоконтурный", None))
        self.pushButtonCancel.setText(_translate("createMultiContour", "Закрыть", None))

import resources_rc
