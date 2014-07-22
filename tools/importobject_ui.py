# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'importobject.ui'
#
# Created: Sat Apr 26 11:03:34 2014
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

class Ui_importObject(object):
    def setupUi(self, importObject):
        importObject.setObjectName(_fromUtf8("importObject"))
        importObject.resize(360, 240)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Minimum)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(importObject.sizePolicy().hasHeightForWidth())
        importObject.setSizePolicy(sizePolicy)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/importzu.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        importObject.setWindowIcon(icon)
        importObject.setSizeGripEnabled(True)
        importObject.setModal(True)
        self.gridLayout = QtGui.QGridLayout(importObject)
        self.gridLayout.setObjectName(_fromUtf8("gridLayout"))
        self.radioButtonDistrict = QtGui.QRadioButton(importObject)
        self.radioButtonDistrict.setObjectName(_fromUtf8("radioButtonDistrict"))
        self.gridLayout.addWidget(self.radioButtonDistrict, 2, 1, 1, 1)
        self.label_4 = QtGui.QLabel(importObject)
        self.label_4.setObjectName(_fromUtf8("label_4"))
        self.gridLayout.addWidget(self.label_4, 0, 0, 3, 1)
        self.label_3 = QtGui.QLabel(importObject)
        self.label_3.setObjectName(_fromUtf8("label_3"))
        self.gridLayout.addWidget(self.label_3, 4, 0, 1, 1)
        self.label = QtGui.QLabel(importObject)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Preferred, QtGui.QSizePolicy.Preferred)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.label.sizePolicy().hasHeightForWidth())
        self.label.setSizePolicy(sizePolicy)
        self.label.setAlignment(QtCore.Qt.AlignRight|QtCore.Qt.AlignTrailing|QtCore.Qt.AlignVCenter)
        self.label.setObjectName(_fromUtf8("label"))
        self.gridLayout.addWidget(self.label, 3, 0, 1, 1)
        self.lineEdit4Import = QtGui.QLineEdit(importObject)
        self.lineEdit4Import.setReadOnly(True)
        self.lineEdit4Import.setObjectName(_fromUtf8("lineEdit4Import"))
        self.gridLayout.addWidget(self.lineEdit4Import, 3, 1, 1, 1)
        self.label_2 = QtGui.QLabel(importObject)
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.gridLayout.addWidget(self.label_2, 5, 0, 1, 1)
        self.pushButtonOk = QtGui.QPushButton(importObject)
        self.pushButtonOk.setIcon(icon)
        self.pushButtonOk.setObjectName(_fromUtf8("pushButtonOk"))
        self.gridLayout.addWidget(self.pushButtonOk, 6, 0, 1, 1)
        self.lineEditSelectedCount = QtGui.QLineEdit(importObject)
        self.lineEditSelectedCount.setReadOnly(True)
        self.lineEditSelectedCount.setObjectName(_fromUtf8("lineEditSelectedCount"))
        self.gridLayout.addWidget(self.lineEditSelectedCount, 4, 1, 1, 1)
        self.radioButtonParcel = QtGui.QRadioButton(importObject)
        self.radioButtonParcel.setObjectName(_fromUtf8("radioButtonParcel"))
        self.gridLayout.addWidget(self.radioButtonParcel, 0, 1, 1, 1)
        self.pushButtonCancel = QtGui.QPushButton(importObject)
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/close.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonCancel.setIcon(icon1)
        self.pushButtonCancel.setObjectName(_fromUtf8("pushButtonCancel"))
        self.gridLayout.addWidget(self.pushButtonCancel, 6, 1, 1, 1)
        self.radioButtonBlock = QtGui.QRadioButton(importObject)
        self.radioButtonBlock.setChecked(True)
        self.radioButtonBlock.setObjectName(_fromUtf8("radioButtonBlock"))
        self.gridLayout.addWidget(self.radioButtonBlock, 1, 1, 1, 1)
        self.comboBoxKn = QtGui.QComboBox(importObject)
        self.comboBoxKn.setObjectName(_fromUtf8("comboBoxKn"))
        self.gridLayout.addWidget(self.comboBoxKn, 5, 1, 1, 1)

        self.retranslateUi(importObject)
        QtCore.QMetaObject.connectSlotsByName(importObject)
        importObject.setTabOrder(self.radioButtonParcel, self.radioButtonBlock)
        importObject.setTabOrder(self.radioButtonBlock, self.radioButtonDistrict)
        importObject.setTabOrder(self.radioButtonDistrict, self.lineEdit4Import)
        importObject.setTabOrder(self.lineEdit4Import, self.lineEditSelectedCount)
        importObject.setTabOrder(self.lineEditSelectedCount, self.comboBoxKn)
        importObject.setTabOrder(self.comboBoxKn, self.pushButtonOk)
        importObject.setTabOrder(self.pushButtonOk, self.pushButtonCancel)

    def retranslateUi(self, importObject):
        importObject.setWindowTitle(_translate("importObject", "Импортировать кадастровые объекты", None))
        self.radioButtonDistrict.setText(_translate("importObject", "Кадастровый район", None))
        self.label_4.setText(_translate("importObject", "<html><head/><body><p align=\"right\">Импортировать</p></body></html>", None))
        self.label_3.setText(_translate("importObject", "<html><head/><body><p align=\"right\">Выбрано объектов для импорта</p></body></html>", None))
        self.label.setText(_translate("importObject", "<html><head/><body><p align=\"right\">из векторного слоя</p></body></html>", None))
        self.label_2.setText(_translate("importObject", "<html><head/><body><p align=\"right\">Кадастровый номер из поля</p></body></html>", None))
        self.pushButtonOk.setText(_translate("importObject", "Импортировать", None))
        self.radioButtonParcel.setText(_translate("importObject", "Земельный участок", None))
        self.pushButtonCancel.setText(_translate("importObject", "Закрыть", None))
        self.radioButtonBlock.setText(_translate("importObject", "Кадастровый квартал", None))

import resources_rc
