# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'unionparcels.ui'
#
# Created: Mon Oct 28 11:22:42 2013
#      by: PyQt4 UI code generator 4.9.4
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_UnionParcels(object):
    def setupUi(self, UnionParcels):
        UnionParcels.setObjectName(_fromUtf8("UnionParcels"))
        UnionParcels.resize(300, 137)
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
        self.formLayout = QtGui.QFormLayout(UnionParcels)
        self.formLayout.setFieldGrowthPolicy(QtGui.QFormLayout.AllNonFixedFieldsGrow)
        self.formLayout.setObjectName(_fromUtf8("formLayout"))
        self.label = QtGui.QLabel(UnionParcels)
        self.label.setObjectName(_fromUtf8("label"))
        self.formLayout.setWidget(0, QtGui.QFormLayout.LabelRole, self.label)
        self.lineEditSelectedCount = QtGui.QLineEdit(UnionParcels)
        self.lineEditSelectedCount.setReadOnly(True)
        self.lineEditSelectedCount.setObjectName(_fromUtf8("lineEditSelectedCount"))
        self.formLayout.setWidget(0, QtGui.QFormLayout.FieldRole, self.lineEditSelectedCount)
        self.label_4 = QtGui.QLabel(UnionParcels)
        self.label_4.setObjectName(_fromUtf8("label_4"))
        self.formLayout.setWidget(1, QtGui.QFormLayout.LabelRole, self.label_4)
        self.comboBoxZU = QtGui.QComboBox(UnionParcels)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.comboBoxZU.sizePolicy().hasHeightForWidth())
        self.comboBoxZU.setSizePolicy(sizePolicy)
        self.comboBoxZU.setObjectName(_fromUtf8("comboBoxZU"))
        self.formLayout.setWidget(1, QtGui.QFormLayout.FieldRole, self.comboBoxZU)
        self.pushButtonOk = QtGui.QPushButton(UnionParcels)
        self.pushButtonOk.setIcon(icon)
        self.pushButtonOk.setObjectName(_fromUtf8("pushButtonOk"))
        self.formLayout.setWidget(2, QtGui.QFormLayout.LabelRole, self.pushButtonOk)
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
        self.formLayout.setWidget(2, QtGui.QFormLayout.FieldRole, self.pushButtonCancel)
        self.progressBar = QtGui.QProgressBar(UnionParcels)
        self.progressBar.setProperty("value", 0)
        self.progressBar.setObjectName(_fromUtf8("progressBar"))
        self.formLayout.setWidget(3, QtGui.QFormLayout.SpanningRole, self.progressBar)

        self.retranslateUi(UnionParcels)
        QtCore.QMetaObject.connectSlotsByName(UnionParcels)

    def retranslateUi(self, UnionParcels):
        UnionParcels.setWindowTitle(QtGui.QApplication.translate("UnionParcels", "Объединение ЗУ", None, QtGui.QApplication.UnicodeUTF8))
        self.label.setText(QtGui.QApplication.translate("UnionParcels", "<html><head/><body><p align=\"right\">Объединить выбранные<br />участки в количестве</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.label_4.setText(QtGui.QApplication.translate("UnionParcels", "<html><head/><body><p align=\"right\">и выбрать основным ЗУ<br />при объединении </p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonOk.setText(QtGui.QApplication.translate("UnionParcels", "Объединить выбранные", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonCancel.setText(QtGui.QApplication.translate("UnionParcels", "Закрыть", None, QtGui.QApplication.UnicodeUTF8))

import resources_rc
