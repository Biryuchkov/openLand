# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'importgeometry.ui'
#
# Created: Mon Oct 28 11:22:26 2013
#      by: PyQt4 UI code generator 4.9.4
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_ImportGeometry(object):
    def setupUi(self, ImportGeometry):
        ImportGeometry.setObjectName(_fromUtf8("ImportGeometry"))
        ImportGeometry.setWindowModality(QtCore.Qt.WindowModal)
        ImportGeometry.resize(340, 200)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Minimum)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(ImportGeometry.sizePolicy().hasHeightForWidth())
        ImportGeometry.setSizePolicy(sizePolicy)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/importgeomzu.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        ImportGeometry.setWindowIcon(icon)
        ImportGeometry.setSizeGripEnabled(True)
        ImportGeometry.setModal(True)
        self.gridLayout = QtGui.QGridLayout(ImportGeometry)
        self.gridLayout.setObjectName(_fromUtf8("gridLayout"))
        self.label = QtGui.QLabel(ImportGeometry)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Preferred, QtGui.QSizePolicy.Preferred)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.label.sizePolicy().hasHeightForWidth())
        self.label.setSizePolicy(sizePolicy)
        self.label.setAlignment(QtCore.Qt.AlignRight|QtCore.Qt.AlignTrailing|QtCore.Qt.AlignVCenter)
        self.label.setObjectName(_fromUtf8("label"))
        self.gridLayout.addWidget(self.label, 3, 0, 1, 1)
        self.pushButtonOk = QtGui.QPushButton(ImportGeometry)
        self.pushButtonOk.setIcon(icon)
        self.pushButtonOk.setObjectName(_fromUtf8("pushButtonOk"))
        self.gridLayout.addWidget(self.pushButtonOk, 4, 0, 1, 1)
        self.progressBar = QtGui.QProgressBar(ImportGeometry)
        self.progressBar.setProperty("value", 0)
        self.progressBar.setObjectName(_fromUtf8("progressBar"))
        self.gridLayout.addWidget(self.progressBar, 5, 0, 1, 2)
        self.pushButtonCancel = QtGui.QPushButton(ImportGeometry)
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/close.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonCancel.setIcon(icon1)
        self.pushButtonCancel.setObjectName(_fromUtf8("pushButtonCancel"))
        self.gridLayout.addWidget(self.pushButtonCancel, 4, 1, 1, 1)
        self.radioButtonBlock = QtGui.QRadioButton(ImportGeometry)
        self.radioButtonBlock.setEnabled(False)
        self.radioButtonBlock.setChecked(False)
        self.radioButtonBlock.setObjectName(_fromUtf8("radioButtonBlock"))
        self.gridLayout.addWidget(self.radioButtonBlock, 1, 1, 1, 1)
        self.lineEdit4Import = QtGui.QLineEdit(ImportGeometry)
        self.lineEdit4Import.setReadOnly(True)
        self.lineEdit4Import.setObjectName(_fromUtf8("lineEdit4Import"))
        self.gridLayout.addWidget(self.lineEdit4Import, 3, 1, 1, 1)
        self.radioButtonParcel = QtGui.QRadioButton(ImportGeometry)
        self.radioButtonParcel.setEnabled(False)
        self.radioButtonParcel.setObjectName(_fromUtf8("radioButtonParcel"))
        self.gridLayout.addWidget(self.radioButtonParcel, 0, 1, 1, 1)
        self.radioButtonDistrict = QtGui.QRadioButton(ImportGeometry)
        self.radioButtonDistrict.setEnabled(False)
        self.radioButtonDistrict.setObjectName(_fromUtf8("radioButtonDistrict"))
        self.gridLayout.addWidget(self.radioButtonDistrict, 2, 1, 1, 1)
        self.label_2 = QtGui.QLabel(ImportGeometry)
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.gridLayout.addWidget(self.label_2, 0, 0, 3, 1)

        self.retranslateUi(ImportGeometry)
        QtCore.QMetaObject.connectSlotsByName(ImportGeometry)
        ImportGeometry.setTabOrder(self.radioButtonParcel, self.radioButtonBlock)
        ImportGeometry.setTabOrder(self.radioButtonBlock, self.radioButtonDistrict)
        ImportGeometry.setTabOrder(self.radioButtonDistrict, self.lineEdit4Import)
        ImportGeometry.setTabOrder(self.lineEdit4Import, self.pushButtonOk)
        ImportGeometry.setTabOrder(self.pushButtonOk, self.pushButtonCancel)

    def retranslateUi(self, ImportGeometry):
        ImportGeometry.setWindowTitle(QtGui.QApplication.translate("ImportGeometry", "Импортировать геометрию", None, QtGui.QApplication.UnicodeUTF8))
        self.label.setText(QtGui.QApplication.translate("ImportGeometry", "<html><head/><body><p align=\"right\">из векторного слоя</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonOk.setText(QtGui.QApplication.translate("ImportGeometry", "Импортировать геометрию", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonCancel.setText(QtGui.QApplication.translate("ImportGeometry", "Закрыть", None, QtGui.QApplication.UnicodeUTF8))
        self.radioButtonBlock.setText(QtGui.QApplication.translate("ImportGeometry", "Кадастрового квартала", None, QtGui.QApplication.UnicodeUTF8))
        self.radioButtonParcel.setText(QtGui.QApplication.translate("ImportGeometry", "Земельного участка", None, QtGui.QApplication.UnicodeUTF8))
        self.radioButtonDistrict.setText(QtGui.QApplication.translate("ImportGeometry", "Кадастрового района", None, QtGui.QApplication.UnicodeUTF8))
        self.label_2.setText(QtGui.QApplication.translate("ImportGeometry", "<html><head/><body><p align=\"right\">Импортировать геометрию</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))

import resources_rc
