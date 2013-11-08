# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'kvrattributes.ui'
#
# Created: Mon Oct 28 11:22:32 2013
#      by: PyQt4 UI code generator 4.9.4
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_kvrAttributes(object):
    def setupUi(self, kvrAttributes):
        kvrAttributes.setObjectName(_fromUtf8("kvrAttributes"))
        kvrAttributes.setWindowModality(QtCore.Qt.ApplicationModal)
        kvrAttributes.resize(400, 300)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/attributes.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        kvrAttributes.setWindowIcon(icon)
        kvrAttributes.setSizeGripEnabled(True)
        self.gridLayout = QtGui.QGridLayout(kvrAttributes)
        self.gridLayout.setObjectName(_fromUtf8("gridLayout"))
        self.buttonBox = QtGui.QDialogButtonBox(kvrAttributes)
        self.buttonBox.setOrientation(QtCore.Qt.Horizontal)
        self.buttonBox.setStandardButtons(QtGui.QDialogButtonBox.Cancel|QtGui.QDialogButtonBox.Ok)
        self.buttonBox.setObjectName(_fromUtf8("buttonBox"))
        self.gridLayout.addWidget(self.buttonBox, 7, 2, 1, 1)
        self.comboBoxRn = QtGui.QComboBox(kvrAttributes)
        self.comboBoxRn.setMaxCount(2147483646)
        self.comboBoxRn.setInsertPolicy(QtGui.QComboBox.InsertAlphabetically)
        self.comboBoxRn.setModelColumn(0)
        self.comboBoxRn.setObjectName(_fromUtf8("comboBoxRn"))
        self.gridLayout.addWidget(self.comboBoxRn, 1, 2, 1, 1)
        self.lineEditKn = QtGui.QLineEdit(kvrAttributes)
        self.lineEditKn.setObjectName(_fromUtf8("lineEditKn"))
        self.gridLayout.addWidget(self.lineEditKn, 0, 2, 1, 1)
        self.lineEditCreateUser = QtGui.QLineEdit(kvrAttributes)
        self.lineEditCreateUser.setReadOnly(True)
        self.lineEditCreateUser.setObjectName(_fromUtf8("lineEditCreateUser"))
        self.gridLayout.addWidget(self.lineEditCreateUser, 2, 2, 1, 1)
        self.lineEditUpdateUser = QtGui.QLineEdit(kvrAttributes)
        self.lineEditUpdateUser.setReadOnly(True)
        self.lineEditUpdateUser.setObjectName(_fromUtf8("lineEditUpdateUser"))
        self.gridLayout.addWidget(self.lineEditUpdateUser, 4, 2, 1, 1)
        self.label_3 = QtGui.QLabel(kvrAttributes)
        self.label_3.setObjectName(_fromUtf8("label_3"))
        self.gridLayout.addWidget(self.label_3, 4, 1, 1, 1)
        self.label = QtGui.QLabel(kvrAttributes)
        self.label.setObjectName(_fromUtf8("label"))
        self.gridLayout.addWidget(self.label, 2, 1, 1, 1)
        self.label_2 = QtGui.QLabel(kvrAttributes)
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.gridLayout.addWidget(self.label_2, 3, 1, 1, 1)
        self.lineEditCreateDate = QtGui.QLineEdit(kvrAttributes)
        self.lineEditCreateDate.setReadOnly(True)
        self.lineEditCreateDate.setObjectName(_fromUtf8("lineEditCreateDate"))
        self.gridLayout.addWidget(self.lineEditCreateDate, 3, 2, 1, 1)
        spacerItem = QtGui.QSpacerItem(20, 40, QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Expanding)
        self.gridLayout.addItem(spacerItem, 6, 2, 1, 1)
        self.labelRn = QtGui.QLabel(kvrAttributes)
        self.labelRn.setObjectName(_fromUtf8("labelRn"))
        self.gridLayout.addWidget(self.labelRn, 1, 1, 1, 1)
        self.labelKn = QtGui.QLabel(kvrAttributes)
        self.labelKn.setObjectName(_fromUtf8("labelKn"))
        self.gridLayout.addWidget(self.labelKn, 0, 1, 1, 1)
        self.label_4 = QtGui.QLabel(kvrAttributes)
        self.label_4.setObjectName(_fromUtf8("label_4"))
        self.gridLayout.addWidget(self.label_4, 5, 1, 1, 1)
        self.lineEditUpdateDate = QtGui.QLineEdit(kvrAttributes)
        self.lineEditUpdateDate.setReadOnly(True)
        self.lineEditUpdateDate.setObjectName(_fromUtf8("lineEditUpdateDate"))
        self.gridLayout.addWidget(self.lineEditUpdateDate, 5, 2, 1, 1)

        self.retranslateUi(kvrAttributes)
        self.comboBoxRn.setCurrentIndex(-1)
        QtCore.QObject.connect(self.buttonBox, QtCore.SIGNAL(_fromUtf8("accepted()")), kvrAttributes.accept)
        QtCore.QObject.connect(self.buttonBox, QtCore.SIGNAL(_fromUtf8("rejected()")), kvrAttributes.reject)
        QtCore.QMetaObject.connectSlotsByName(kvrAttributes)
        kvrAttributes.setTabOrder(self.lineEditKn, self.comboBoxRn)
        kvrAttributes.setTabOrder(self.comboBoxRn, self.lineEditCreateUser)
        kvrAttributes.setTabOrder(self.lineEditCreateUser, self.lineEditCreateDate)
        kvrAttributes.setTabOrder(self.lineEditCreateDate, self.lineEditUpdateUser)
        kvrAttributes.setTabOrder(self.lineEditUpdateUser, self.lineEditUpdateDate)
        kvrAttributes.setTabOrder(self.lineEditUpdateDate, self.buttonBox)

    def retranslateUi(self, kvrAttributes):
        kvrAttributes.setWindowTitle(QtGui.QApplication.translate("kvrAttributes", "Атрибуты кадастрового квартала", None, QtGui.QApplication.UnicodeUTF8))
        self.label_3.setText(QtGui.QApplication.translate("kvrAttributes", "<html><head/><body><p align=\"right\">Последнее<br/>изменение:</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.label.setText(QtGui.QApplication.translate("kvrAttributes", "<html><head/><body><p align=\"right\">Создание:</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.label_2.setText(QtGui.QApplication.translate("kvrAttributes", "<html><head/><body><p align=\"right\">Дата:</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.labelRn.setText(QtGui.QApplication.translate("kvrAttributes", "<html><head/><body><p align=\"right\">Кадастровый<br />район</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.labelKn.setText(QtGui.QApplication.translate("kvrAttributes", "<html><head/><body><p align=\"right\">Кадастровый<br/>номер</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.label_4.setText(QtGui.QApplication.translate("kvrAttributes", "<html><head/><body><p align=\"right\">Дата:</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))

import resources_rc
