# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'addpartorcontour.ui'
#
# Created: Thu Dec 05 18:51:07 2013
#      by: PyQt4 UI code generator 4.8.3
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_addPartOrContour(object):
    def setupUi(self, addPartOrContour):
        addPartOrContour.setObjectName(_fromUtf8("addPartOrContour"))
        addPartOrContour.resize(320, 220)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Minimum)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(addPartOrContour.sizePolicy().hasHeightForWidth())
        addPartOrContour.setSizePolicy(sizePolicy)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/addcontour.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        addPartOrContour.setWindowIcon(icon)
        addPartOrContour.setSizeGripEnabled(True)
        addPartOrContour.setModal(True)
        self.formLayout = QtGui.QFormLayout(addPartOrContour)
        self.formLayout.setFieldGrowthPolicy(QtGui.QFormLayout.AllNonFixedFieldsGrow)
        self.formLayout.setObjectName(_fromUtf8("formLayout"))
        self.label = QtGui.QLabel(addPartOrContour)
        self.label.setObjectName(_fromUtf8("label"))
        self.formLayout.setWidget(0, QtGui.QFormLayout.LabelRole, self.label)
        self.lineEditSelectedCount = QtGui.QLineEdit(addPartOrContour)
        self.lineEditSelectedCount.setReadOnly(True)
        self.lineEditSelectedCount.setObjectName(_fromUtf8("lineEditSelectedCount"))
        self.formLayout.setWidget(0, QtGui.QFormLayout.FieldRole, self.lineEditSelectedCount)
        self.label_3 = QtGui.QLabel(addPartOrContour)
        self.label_3.setObjectName(_fromUtf8("label_3"))
        self.formLayout.setWidget(1, QtGui.QFormLayout.LabelRole, self.label_3)
        self.radioButtonIsPart = QtGui.QRadioButton(addPartOrContour)
        self.radioButtonIsPart.setChecked(True)
        self.radioButtonIsPart.setObjectName(_fromUtf8("radioButtonIsPart"))
        self.formLayout.setWidget(1, QtGui.QFormLayout.FieldRole, self.radioButtonIsPart)
        self.radioButtonIsContour = QtGui.QRadioButton(addPartOrContour)
        self.radioButtonIsContour.setObjectName(_fromUtf8("radioButtonIsContour"))
        self.formLayout.setWidget(2, QtGui.QFormLayout.FieldRole, self.radioButtonIsContour)
        self.radioButtonIsNominal = QtGui.QRadioButton(addPartOrContour)
        self.radioButtonIsNominal.setObjectName(_fromUtf8("radioButtonIsNominal"))
        self.formLayout.setWidget(3, QtGui.QFormLayout.FieldRole, self.radioButtonIsNominal)
        self.label_4 = QtGui.QLabel(addPartOrContour)
        self.label_4.setObjectName(_fromUtf8("label_4"))
        self.formLayout.setWidget(4, QtGui.QFormLayout.LabelRole, self.label_4)
        self.comboBoxZU = QtGui.QComboBox(addPartOrContour)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.comboBoxZU.sizePolicy().hasHeightForWidth())
        self.comboBoxZU.setSizePolicy(sizePolicy)
        self.comboBoxZU.setObjectName(_fromUtf8("comboBoxZU"))
        self.formLayout.setWidget(4, QtGui.QFormLayout.FieldRole, self.comboBoxZU)
        self.pushButtonOk = QtGui.QPushButton(addPartOrContour)
        self.pushButtonOk.setIcon(icon)
        self.pushButtonOk.setObjectName(_fromUtf8("pushButtonOk"))
        self.formLayout.setWidget(5, QtGui.QFormLayout.LabelRole, self.pushButtonOk)
        self.pushButtonCancel = QtGui.QPushButton(addPartOrContour)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.pushButtonCancel.sizePolicy().hasHeightForWidth())
        self.pushButtonCancel.setSizePolicy(sizePolicy)
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/close.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonCancel.setIcon(icon1)
        self.pushButtonCancel.setObjectName(_fromUtf8("pushButtonCancel"))
        self.formLayout.setWidget(5, QtGui.QFormLayout.FieldRole, self.pushButtonCancel)
        self.progressBar = QtGui.QProgressBar(addPartOrContour)
        self.progressBar.setProperty(_fromUtf8("value"), 0)
        self.progressBar.setObjectName(_fromUtf8("progressBar"))
        self.formLayout.setWidget(7, QtGui.QFormLayout.SpanningRole, self.progressBar)
        spacerItem = QtGui.QSpacerItem(20, 40, QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Expanding)
        self.formLayout.setItem(6, QtGui.QFormLayout.LabelRole, spacerItem)

        self.retranslateUi(addPartOrContour)
        QtCore.QMetaObject.connectSlotsByName(addPartOrContour)
        addPartOrContour.setTabOrder(self.lineEditSelectedCount, self.radioButtonIsPart)
        addPartOrContour.setTabOrder(self.radioButtonIsPart, self.radioButtonIsContour)
        addPartOrContour.setTabOrder(self.radioButtonIsContour, self.radioButtonIsNominal)
        addPartOrContour.setTabOrder(self.radioButtonIsNominal, self.comboBoxZU)
        addPartOrContour.setTabOrder(self.comboBoxZU, self.pushButtonOk)
        addPartOrContour.setTabOrder(self.pushButtonOk, self.pushButtonCancel)

    def retranslateUi(self, addPartOrContour):
        addPartOrContour.setWindowTitle(QtGui.QApplication.translate("addPartOrContour", "Добавление контура, ЧЗУ или входящего", None, QtGui.QApplication.UnicodeUTF8))
        self.label.setText(QtGui.QApplication.translate("addPartOrContour", "<html><head/><body><p align=\"right\">Добавить выбранные<br />объекты в количестве</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.label_3.setText(QtGui.QApplication.translate("addPartOrContour", "<html><head/><body><p align=\"right\">в качестве</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.radioButtonIsPart.setText(QtGui.QApplication.translate("addPartOrContour", "части ЗУ", None, QtGui.QApplication.UnicodeUTF8))
        self.radioButtonIsContour.setText(QtGui.QApplication.translate("addPartOrContour", "контура", None, QtGui.QApplication.UnicodeUTF8))
        self.radioButtonIsNominal.setText(QtGui.QApplication.translate("addPartOrContour", "входящего в ЕЗП", None, QtGui.QApplication.UnicodeUTF8))
        self.label_4.setText(QtGui.QApplication.translate("addPartOrContour", "<html><head/><body><p align=\"right\">земельного участка</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonOk.setText(QtGui.QApplication.translate("addPartOrContour", "Добавить выбранные", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonCancel.setText(QtGui.QApplication.translate("addPartOrContour", "Закрыть", None, QtGui.QApplication.UnicodeUTF8))

import resources_rc
