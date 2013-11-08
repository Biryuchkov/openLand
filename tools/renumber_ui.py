# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'renumber.ui'
#
# Created: Mon Oct 28 11:22:38 2013
#      by: PyQt4 UI code generator 4.9.4
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_reNumber(object):
    def setupUi(self, reNumber):
        reNumber.setObjectName(_fromUtf8("reNumber"))
        reNumber.resize(334, 160)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Minimum)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(reNumber.sizePolicy().hasHeightForWidth())
        reNumber.setSizePolicy(sizePolicy)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/reorder.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        reNumber.setWindowIcon(icon)
        reNumber.setSizeGripEnabled(True)
        reNumber.setModal(True)
        self.gridLayout = QtGui.QGridLayout(reNumber)
        self.gridLayout.setObjectName(_fromUtf8("gridLayout"))
        self.label = QtGui.QLabel(reNumber)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Preferred, QtGui.QSizePolicy.Preferred)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.label.sizePolicy().hasHeightForWidth())
        self.label.setSizePolicy(sizePolicy)
        self.label.setAlignment(QtCore.Qt.AlignRight|QtCore.Qt.AlignTrailing|QtCore.Qt.AlignVCenter)
        self.label.setObjectName(_fromUtf8("label"))
        self.gridLayout.addWidget(self.label, 0, 0, 1, 1)
        self.pushButtonOk = QtGui.QPushButton(reNumber)
        self.pushButtonOk.setIcon(icon)
        self.pushButtonOk.setObjectName(_fromUtf8("pushButtonOk"))
        self.gridLayout.addWidget(self.pushButtonOk, 3, 0, 1, 1)
        self.lineEditSelectedCount = QtGui.QLineEdit(reNumber)
        self.lineEditSelectedCount.setReadOnly(True)
        self.lineEditSelectedCount.setObjectName(_fromUtf8("lineEditSelectedCount"))
        self.gridLayout.addWidget(self.lineEditSelectedCount, 0, 1, 1, 1)
        self.pushButtonCancel = QtGui.QPushButton(reNumber)
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/close.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonCancel.setIcon(icon1)
        self.pushButtonCancel.setObjectName(_fromUtf8("pushButtonCancel"))
        self.gridLayout.addWidget(self.pushButtonCancel, 3, 1, 1, 1)
        self.progressBar = QtGui.QProgressBar(reNumber)
        self.progressBar.setProperty("value", 0)
        self.progressBar.setObjectName(_fromUtf8("progressBar"))
        self.gridLayout.addWidget(self.progressBar, 4, 0, 1, 2)
        self.checkBoxIsReOrder = QtGui.QCheckBox(reNumber)
        self.checkBoxIsReOrder.setChecked(True)
        self.checkBoxIsReOrder.setObjectName(_fromUtf8("checkBoxIsReOrder"))
        self.gridLayout.addWidget(self.checkBoxIsReOrder, 2, 0, 1, 2)
        self.label_2 = QtGui.QLabel(reNumber)
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.gridLayout.addWidget(self.label_2, 1, 0, 1, 1)
        self.lineEditDelta = QtGui.QLineEdit(reNumber)
        self.lineEditDelta.setInputMethodHints(QtCore.Qt.ImhFormattedNumbersOnly)
        self.lineEditDelta.setObjectName(_fromUtf8("lineEditDelta"))
        self.gridLayout.addWidget(self.lineEditDelta, 1, 1, 1, 1)

        self.retranslateUi(reNumber)
        QtCore.QMetaObject.connectSlotsByName(reNumber)
        reNumber.setTabOrder(self.lineEditSelectedCount, self.lineEditDelta)
        reNumber.setTabOrder(self.lineEditDelta, self.checkBoxIsReOrder)
        reNumber.setTabOrder(self.checkBoxIsReOrder, self.pushButtonOk)
        reNumber.setTabOrder(self.pushButtonOk, self.pushButtonCancel)

    def retranslateUi(self, reNumber):
        reNumber.setWindowTitle(QtGui.QApplication.translate("reNumber", "Изменить точки", None, QtGui.QApplication.UnicodeUTF8))
        self.label.setText(QtGui.QApplication.translate("reNumber", "<html><head/><body><p align=\"right\">Количество выбранных контуров</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonOk.setText(QtGui.QApplication.translate("reNumber", "Изменить точки", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonCancel.setText(QtGui.QApplication.translate("reNumber", "Закрыть", None, QtGui.QApplication.UnicodeUTF8))
        self.checkBoxIsReOrder.setText(QtGui.QApplication.translate("reNumber", "Изменить порядок обхода точек ЗУ из XML выписки", None, QtGui.QApplication.UnicodeUTF8))
        self.label_2.setText(QtGui.QApplication.translate("reNumber", "<html><head/><body><p align=\"right\">Установить погрешность<br/>измерения точек</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.lineEditDelta.setInputMask(QtGui.QApplication.translate("reNumber", "9.9; ", None, QtGui.QApplication.UnicodeUTF8))
        self.lineEditDelta.setText(QtGui.QApplication.translate("reNumber", "0.0", None, QtGui.QApplication.UnicodeUTF8))

import resources_rc
