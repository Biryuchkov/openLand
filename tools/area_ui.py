# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'area.ui'
#
# Created: Thu Dec 05 18:56:21 2013
#      by: PyQt4 UI code generator 4.8.3
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_DialogArea(object):
    def setupUi(self, DialogArea):
        DialogArea.setObjectName(_fromUtf8("DialogArea"))
        DialogArea.resize(400, 220)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/attributes.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        DialogArea.setWindowIcon(icon)
        DialogArea.setSizeGripEnabled(True)
        DialogArea.setModal(True)
        self.gridLayout = QtGui.QGridLayout(DialogArea)
        self.gridLayout.setObjectName(_fromUtf8("gridLayout"))
        self.formLayout = QtGui.QFormLayout()
        self.formLayout.setFieldGrowthPolicy(QtGui.QFormLayout.AllNonFixedFieldsGrow)
        self.formLayout.setObjectName(_fromUtf8("formLayout"))
        self.label = QtGui.QLabel(DialogArea)
        self.label.setObjectName(_fromUtf8("label"))
        self.formLayout.setWidget(0, QtGui.QFormLayout.LabelRole, self.label)
        self.comboBoxVidPlosh = QtGui.QComboBox(DialogArea)
        self.comboBoxVidPlosh.setObjectName(_fromUtf8("comboBoxVidPlosh"))
        self.formLayout.setWidget(0, QtGui.QFormLayout.FieldRole, self.comboBoxVidPlosh)
        self.label_2 = QtGui.QLabel(DialogArea)
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.formLayout.setWidget(2, QtGui.QFormLayout.LabelRole, self.label_2)
        self.lineEditPlosh = QtGui.QLineEdit(DialogArea)
        self.lineEditPlosh.setObjectName(_fromUtf8("lineEditPlosh"))
        self.formLayout.setWidget(2, QtGui.QFormLayout.FieldRole, self.lineEditPlosh)
        self.label_3 = QtGui.QLabel(DialogArea)
        self.label_3.setAlignment(QtCore.Qt.AlignLeading|QtCore.Qt.AlignLeft|QtCore.Qt.AlignVCenter)
        self.label_3.setObjectName(_fromUtf8("label_3"))
        self.formLayout.setWidget(3, QtGui.QFormLayout.LabelRole, self.label_3)
        self.comboBoxEdnIzm = QtGui.QComboBox(DialogArea)
        self.comboBoxEdnIzm.setObjectName(_fromUtf8("comboBoxEdnIzm"))
        self.formLayout.setWidget(3, QtGui.QFormLayout.FieldRole, self.comboBoxEdnIzm)
        self.label_5 = QtGui.QLabel(DialogArea)
        self.label_5.setObjectName(_fromUtf8("label_5"))
        self.formLayout.setWidget(4, QtGui.QFormLayout.LabelRole, self.label_5)
        self.lineEditDelta = QtGui.QLineEdit(DialogArea)
        self.lineEditDelta.setObjectName(_fromUtf8("lineEditDelta"))
        self.formLayout.setWidget(4, QtGui.QFormLayout.FieldRole, self.lineEditDelta)
        self.label_4 = QtGui.QLabel(DialogArea)
        self.label_4.setObjectName(_fromUtf8("label_4"))
        self.formLayout.setWidget(5, QtGui.QFormLayout.LabelRole, self.label_4)
        self.lineEditPogrIzm = QtGui.QLineEdit(DialogArea)
        self.lineEditPogrIzm.setObjectName(_fromUtf8("lineEditPogrIzm"))
        self.formLayout.setWidget(5, QtGui.QFormLayout.FieldRole, self.lineEditPogrIzm)
        self.gridLayout.addLayout(self.formLayout, 0, 0, 1, 1)
        self.horizontalLayout = QtGui.QHBoxLayout()
        self.horizontalLayout.setObjectName(_fromUtf8("horizontalLayout"))
        self.pushButtonSave = QtGui.QPushButton(DialogArea)
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/save.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonSave.setIcon(icon1)
        self.pushButtonSave.setObjectName(_fromUtf8("pushButtonSave"))
        self.horizontalLayout.addWidget(self.pushButtonSave)
        self.pushButtonClose = QtGui.QPushButton(DialogArea)
        icon2 = QtGui.QIcon()
        icon2.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/close.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonClose.setIcon(icon2)
        self.pushButtonClose.setObjectName(_fromUtf8("pushButtonClose"))
        self.horizontalLayout.addWidget(self.pushButtonClose)
        self.gridLayout.addLayout(self.horizontalLayout, 2, 0, 1, 1)
        spacerItem = QtGui.QSpacerItem(20, 40, QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Expanding)
        self.gridLayout.addItem(spacerItem, 1, 0, 1, 1)

        self.retranslateUi(DialogArea)
        QtCore.QMetaObject.connectSlotsByName(DialogArea)
        DialogArea.setTabOrder(self.comboBoxVidPlosh, self.lineEditPlosh)
        DialogArea.setTabOrder(self.lineEditPlosh, self.comboBoxEdnIzm)
        DialogArea.setTabOrder(self.comboBoxEdnIzm, self.lineEditDelta)
        DialogArea.setTabOrder(self.lineEditDelta, self.lineEditPogrIzm)
        DialogArea.setTabOrder(self.lineEditPogrIzm, self.pushButtonSave)
        DialogArea.setTabOrder(self.pushButtonSave, self.pushButtonClose)

    def retranslateUi(self, DialogArea):
        DialogArea.setWindowTitle(QtGui.QApplication.translate("DialogArea", "Площадь", None, QtGui.QApplication.UnicodeUTF8))
        self.label.setText(QtGui.QApplication.translate("DialogArea", "<html><head/><body><p align=\"right\">Вид площади</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.label_2.setText(QtGui.QApplication.translate("DialogArea", "<html><head/><body><p>Площадь</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.label_3.setText(QtGui.QApplication.translate("DialogArea", "<html><head/><body><p align=\"right\">Единицы<br/>измерения</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.label_5.setText(QtGui.QApplication.translate("DialogArea", "<html><head/><body><p align=\"right\">Погрешность<br/>измерения точек</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.lineEditDelta.setInputMask(QtGui.QApplication.translate("DialogArea", "9.9; ", None, QtGui.QApplication.UnicodeUTF8))
        self.lineEditDelta.setText(QtGui.QApplication.translate("DialogArea", "0.0", None, QtGui.QApplication.UnicodeUTF8))
        self.label_4.setText(QtGui.QApplication.translate("DialogArea", "<html><head/><body><p align=\"right\">Погрешность<br />измерения площади</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonSave.setText(QtGui.QApplication.translate("DialogArea", "OK", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonClose.setText(QtGui.QApplication.translate("DialogArea", "Отмена", None, QtGui.QApplication.UnicodeUTF8))

import resources_rc
