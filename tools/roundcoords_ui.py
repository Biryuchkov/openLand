# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'roundcoords.ui'
#
# Created: Wed Apr 02 17:44:53 2014
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

class Ui_dlRoundCoords(object):
    def setupUi(self, dlRoundCoords):
        dlRoundCoords.setObjectName(_fromUtf8("dlRoundCoords"))
        dlRoundCoords.resize(498, 122)
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
        self.gridLayout.addWidget(self.pushButtonCancel, 3, 1, 1, 2)
        self.checkBoxDeleteDouble = QtGui.QCheckBox(dlRoundCoords)
        self.checkBoxDeleteDouble.setChecked(True)
        self.checkBoxDeleteDouble.setObjectName(_fromUtf8("checkBoxDeleteDouble"))
        self.gridLayout.addWidget(self.checkBoxDeleteDouble, 2, 1, 1, 2)
        self.pushButtonOk = QtGui.QPushButton(dlRoundCoords)
        self.pushButtonOk.setIcon(icon)
        self.pushButtonOk.setObjectName(_fromUtf8("pushButtonOk"))
        self.gridLayout.addWidget(self.pushButtonOk, 3, 0, 1, 1)
        self.spinBox = QtGui.QSpinBox(dlRoundCoords)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Maximum, QtGui.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.spinBox.sizePolicy().hasHeightForWidth())
        self.spinBox.setSizePolicy(sizePolicy)
        self.spinBox.setProperty("value", 2)
        self.spinBox.setObjectName(_fromUtf8("spinBox"))
        self.gridLayout.addWidget(self.spinBox, 1, 1, 1, 1)
        self.label_2 = QtGui.QLabel(dlRoundCoords)
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.gridLayout.addWidget(self.label_2, 1, 2, 1, 1)
        self.label = QtGui.QLabel(dlRoundCoords)
        self.label.setObjectName(_fromUtf8("label"))
        self.gridLayout.addWidget(self.label, 1, 0, 1, 1)

        self.retranslateUi(dlRoundCoords)
        QtCore.QMetaObject.connectSlotsByName(dlRoundCoords)
        dlRoundCoords.setTabOrder(self.lineEdit, self.spinBox)
        dlRoundCoords.setTabOrder(self.spinBox, self.checkBoxDeleteDouble)
        dlRoundCoords.setTabOrder(self.checkBoxDeleteDouble, self.pushButtonOk)
        dlRoundCoords.setTabOrder(self.pushButtonOk, self.pushButtonCancel)

    def retranslateUi(self, dlRoundCoords):
        dlRoundCoords.setWindowTitle(_translate("dlRoundCoords", "Округление координат", None))
        self.label_3.setText(_translate("dlRoundCoords", "<html><head/><body><p align=\"right\">Количество выбранных объектов</p></body></html>", None))
        self.pushButtonCancel.setText(_translate("dlRoundCoords", "Закрыть", None))
        self.checkBoxDeleteDouble.setText(_translate("dlRoundCoords", "Удалять дубли точек", None))
        self.pushButtonOk.setText(_translate("dlRoundCoords", "Округлить", None))
        self.label_2.setText(_translate("dlRoundCoords", "знаков после запятой", None))
        self.label.setText(_translate("dlRoundCoords", "Округлить координаты выбранного объекта до", None))

import resources_rc
