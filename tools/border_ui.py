# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'border.ui'
#
# Created: Mon Oct 28 11:22:19 2013
#      by: PyQt4 UI code generator 4.9.4
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_Border(object):
    def setupUi(self, Border):
        Border.setObjectName(_fromUtf8("Border"))
        Border.resize(414, 220)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/only_border.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        Border.setWindowIcon(icon)
        Border.setSizeGripEnabled(True)
        self.gridLayout = QtGui.QGridLayout(Border)
        self.gridLayout.setObjectName(_fromUtf8("gridLayout"))
        self.label = QtGui.QLabel(Border)
        self.label.setObjectName(_fromUtf8("label"))
        self.gridLayout.addWidget(self.label, 0, 0, 1, 1)
        self.lineEditOpisanie = QtGui.QLineEdit(Border)
        self.lineEditOpisanie.setObjectName(_fromUtf8("lineEditOpisanie"))
        self.gridLayout.addWidget(self.lineEditOpisanie, 0, 1, 1, 3)
        self.label_2 = QtGui.QLabel(Border)
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.gridLayout.addWidget(self.label_2, 2, 0, 1, 1)
        self.label_3 = QtGui.QLabel(Border)
        self.label_3.setObjectName(_fromUtf8("label_3"))
        self.gridLayout.addWidget(self.label_3, 3, 0, 1, 1)
        self.checkBoxPoOpisaniyu = QtGui.QCheckBox(Border)
        self.checkBoxPoOpisaniyu.setTristate(False)
        self.checkBoxPoOpisaniyu.setObjectName(_fromUtf8("checkBoxPoOpisaniyu"))
        self.gridLayout.addWidget(self.checkBoxPoOpisaniyu, 1, 1, 1, 1)
        self.lineEditDlina = QtGui.QLineEdit(Border)
        self.lineEditDlina.setObjectName(_fromUtf8("lineEditDlina"))
        self.gridLayout.addWidget(self.lineEditDlina, 2, 1, 1, 1)
        self.lineEditGradusy = QtGui.QLineEdit(Border)
        self.lineEditGradusy.setObjectName(_fromUtf8("lineEditGradusy"))
        self.gridLayout.addWidget(self.lineEditGradusy, 3, 1, 1, 1)
        self.lineEditMinuty = QtGui.QLineEdit(Border)
        self.lineEditMinuty.setObjectName(_fromUtf8("lineEditMinuty"))
        self.gridLayout.addWidget(self.lineEditMinuty, 3, 3, 1, 1)
        self.label_4 = QtGui.QLabel(Border)
        self.label_4.setObjectName(_fromUtf8("label_4"))
        self.gridLayout.addWidget(self.label_4, 3, 2, 1, 1)
        self.comboBoxColor = QtGui.QComboBox(Border)
        self.comboBoxColor.setObjectName(_fromUtf8("comboBoxColor"))
        self.gridLayout.addWidget(self.comboBoxColor, 2, 3, 1, 1)
        self.pushButtonClose = QtGui.QPushButton(Border)
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/close.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonClose.setIcon(icon1)
        self.pushButtonClose.setObjectName(_fromUtf8("pushButtonClose"))
        self.gridLayout.addWidget(self.pushButtonClose, 5, 3, 1, 1)
        self.label_5 = QtGui.QLabel(Border)
        self.label_5.setObjectName(_fromUtf8("label_5"))
        self.gridLayout.addWidget(self.label_5, 2, 2, 1, 1)
        self.pushButtonSave = QtGui.QPushButton(Border)
        icon2 = QtGui.QIcon()
        icon2.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/save.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonSave.setIcon(icon2)
        self.pushButtonSave.setObjectName(_fromUtf8("pushButtonSave"))
        self.gridLayout.addWidget(self.pushButtonSave, 5, 1, 1, 1)
        self.checkBoxIsPre = QtGui.QCheckBox(Border)
        self.checkBoxIsPre.setEnabled(False)
        font = QtGui.QFont()
        font.setUnderline(True)
        self.checkBoxIsPre.setFont(font)
        self.checkBoxIsPre.setCheckable(True)
        self.checkBoxIsPre.setObjectName(_fromUtf8("checkBoxIsPre"))
        self.gridLayout.addWidget(self.checkBoxIsPre, 4, 1, 1, 3)

        self.retranslateUi(Border)
        QtCore.QMetaObject.connectSlotsByName(Border)
        Border.setTabOrder(self.lineEditOpisanie, self.checkBoxPoOpisaniyu)
        Border.setTabOrder(self.checkBoxPoOpisaniyu, self.lineEditDlina)
        Border.setTabOrder(self.lineEditDlina, self.comboBoxColor)
        Border.setTabOrder(self.comboBoxColor, self.lineEditGradusy)
        Border.setTabOrder(self.lineEditGradusy, self.lineEditMinuty)
        Border.setTabOrder(self.lineEditMinuty, self.checkBoxIsPre)
        Border.setTabOrder(self.checkBoxIsPre, self.pushButtonSave)
        Border.setTabOrder(self.pushButtonSave, self.pushButtonClose)

    def retranslateUi(self, Border):
        Border.setWindowTitle(QtGui.QApplication.translate("Border", "Атрибуты границы", None, QtGui.QApplication.UnicodeUTF8))
        self.label.setText(QtGui.QApplication.translate("Border", "<html><head/><body><p align=\"right\">Описание</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.label_2.setText(QtGui.QApplication.translate("Border", "<html><head/><body><p align=\"right\">Длина</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.label_3.setText(QtGui.QApplication.translate("Border", "<html><head/><body><p align=\"right\">Градусы</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.checkBoxPoOpisaniyu.setText(QtGui.QApplication.translate("Border", "По описанию", None, QtGui.QApplication.UnicodeUTF8))
        self.label_4.setText(QtGui.QApplication.translate("Border", "<html><head/><body><p align=\"right\">Минуты</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonClose.setText(QtGui.QApplication.translate("Border", "Отмена", None, QtGui.QApplication.UnicodeUTF8))
        self.label_5.setText(QtGui.QApplication.translate("Border", "Цвет", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonSave.setText(QtGui.QApplication.translate("Border", "OK", None, QtGui.QApplication.UnicodeUTF8))
        self.checkBoxIsPre.setText(QtGui.QApplication.translate("Border", "Прекратившая существованиение", None, QtGui.QApplication.UnicodeUTF8))

import resources_rc
