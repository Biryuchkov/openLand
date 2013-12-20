# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'createmulticontour.ui'
#
# Created: Fri Nov 08 20:20:18 2013
#      by: PyQt4 UI code generator 4.9.4
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_createMultiContour(object):
    def setupUi(self, createMultiContour):
        createMultiContour.setObjectName(_fromUtf8("createMultiContour"))
        createMultiContour.resize(360, 140)
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
        self.progressBar = QtGui.QProgressBar(createMultiContour)
        self.progressBar.setProperty("value", 0)
        self.progressBar.setObjectName(_fromUtf8("progressBar"))
        self.formLayout.setWidget(6, QtGui.QFormLayout.SpanningRole, self.progressBar)
        spacerItem = QtGui.QSpacerItem(20, 40, QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Expanding)
        self.formLayout.setItem(5, QtGui.QFormLayout.LabelRole, spacerItem)

        self.retranslateUi(createMultiContour)
        QtCore.QMetaObject.connectSlotsByName(createMultiContour)
        createMultiContour.setTabOrder(self.lineEditSelectedCount, self.comboBoxKvr)
        createMultiContour.setTabOrder(self.comboBoxKvr, self.pushButtonOk)
        createMultiContour.setTabOrder(self.pushButtonOk, self.pushButtonCancel)

    def retranslateUi(self, createMultiContour):
        createMultiContour.setWindowTitle(QtGui.QApplication.translate("createMultiContour", "Создание многоконтурного участка", None, QtGui.QApplication.UnicodeUTF8))
        self.label.setText(QtGui.QApplication.translate("createMultiContour", "<html><head/><body><p align=\"right\">Количество выбранных контуров</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.label_2.setText(QtGui.QApplication.translate("createMultiContour", "<html><head/><body><p align=\"right\">Квартал для многоконтурного</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonOk.setText(QtGui.QApplication.translate("createMultiContour", "Создать многоконтурный", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonCancel.setText(QtGui.QApplication.translate("createMultiContour", "Закрыть", None, QtGui.QApplication.UnicodeUTF8))

import resources_rc
