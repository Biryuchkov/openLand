# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'scale2area.ui'
#
# Created: Wed Apr 02 20:45:05 2014
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

class Ui_olScaleArea(object):
    def setupUi(self, olScaleArea):
        olScaleArea.setObjectName(_fromUtf8("olScaleArea"))
        olScaleArea.resize(402, 164)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/scalearea.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        olScaleArea.setWindowIcon(icon)
        olScaleArea.setSizeGripEnabled(True)
        olScaleArea.setModal(True)
        self.formLayout = QtGui.QFormLayout(olScaleArea)
        self.formLayout.setFieldGrowthPolicy(QtGui.QFormLayout.AllNonFixedFieldsGrow)
        self.formLayout.setObjectName(_fromUtf8("formLayout"))
        self.label = QtGui.QLabel(olScaleArea)
        self.label.setAlignment(QtCore.Qt.AlignRight|QtCore.Qt.AlignTrailing|QtCore.Qt.AlignVCenter)
        self.label.setObjectName(_fromUtf8("label"))
        self.formLayout.setWidget(1, QtGui.QFormLayout.LabelRole, self.label)
        self.lineEdit = QtGui.QLineEdit(olScaleArea)
        self.lineEdit.setReadOnly(True)
        self.lineEdit.setObjectName(_fromUtf8("lineEdit"))
        self.formLayout.setWidget(1, QtGui.QFormLayout.FieldRole, self.lineEdit)
        self.label_2 = QtGui.QLabel(olScaleArea)
        self.label_2.setAlignment(QtCore.Qt.AlignRight|QtCore.Qt.AlignTrailing|QtCore.Qt.AlignVCenter)
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.formLayout.setWidget(3, QtGui.QFormLayout.LabelRole, self.label_2)
        self.lineEdit_2 = QtGui.QLineEdit(olScaleArea)
        font = QtGui.QFont()
        font.setBold(False)
        font.setWeight(50)
        self.lineEdit_2.setFont(font)
        self.lineEdit_2.setObjectName(_fromUtf8("lineEdit_2"))
        self.formLayout.setWidget(3, QtGui.QFormLayout.FieldRole, self.lineEdit_2)
        self.radioButton = QtGui.QRadioButton(olScaleArea)
        self.radioButton.setEnabled(True)
        self.radioButton.setToolTip(_fromUtf8(""))
        self.radioButton.setChecked(True)
        self.radioButton.setObjectName(_fromUtf8("radioButton"))
        self.formLayout.setWidget(5, QtGui.QFormLayout.FieldRole, self.radioButton)
        self.radioButton_2 = QtGui.QRadioButton(olScaleArea)
        self.radioButton_2.setObjectName(_fromUtf8("radioButton_2"))
        self.formLayout.setWidget(6, QtGui.QFormLayout.FieldRole, self.radioButton_2)
        self.pushButtonClose = QtGui.QPushButton(olScaleArea)
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/close.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonClose.setIcon(icon1)
        self.pushButtonClose.setObjectName(_fromUtf8("pushButtonClose"))
        self.formLayout.setWidget(7, QtGui.QFormLayout.FieldRole, self.pushButtonClose)
        self.pushButtonOk = QtGui.QPushButton(olScaleArea)
        icon2 = QtGui.QIcon()
        icon2.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/symbol_check.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonOk.setIcon(icon2)
        self.pushButtonOk.setObjectName(_fromUtf8("pushButtonOk"))
        self.formLayout.setWidget(7, QtGui.QFormLayout.LabelRole, self.pushButtonOk)

        self.retranslateUi(olScaleArea)
        QtCore.QMetaObject.connectSlotsByName(olScaleArea)
        olScaleArea.setTabOrder(self.lineEdit, self.lineEdit_2)
        olScaleArea.setTabOrder(self.lineEdit_2, self.radioButton)
        olScaleArea.setTabOrder(self.radioButton, self.radioButton_2)
        olScaleArea.setTabOrder(self.radioButton_2, self.pushButtonOk)
        olScaleArea.setTabOrder(self.pushButtonOk, self.pushButtonClose)

    def retranslateUi(self, olScaleArea):
        olScaleArea.setWindowTitle(_translate("olScaleArea", "Параметры масштабирования", None))
        self.label.setText(_translate("olScaleArea", "Площадь выбранного объекта (кв.м.):", None))
        self.lineEdit.setText(_translate("olScaleArea", "123.45", None))
        self.label_2.setText(_translate("olScaleArea", "Необходимая площадь объекта (кв.м.):", None))
        self.radioButton.setText(_translate("olScaleArea", "Обновить выбранный объект", None))
        self.radioButton_2.setText(_translate("olScaleArea", "Создать новый объект", None))
        self.pushButtonClose.setText(_translate("olScaleArea", "Закрыть", None))
        self.pushButtonOk.setText(_translate("olScaleArea", "Масштабировать полигон", None))

import resources_rc
