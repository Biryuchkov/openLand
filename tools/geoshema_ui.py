# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'geoshema.ui'
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

class Ui_geoShema(object):
    def setupUi(self, geoShema):
        geoShema.setObjectName(_fromUtf8("geoShema"))
        geoShema.resize(353, 330)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Minimum)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(geoShema.sizePolicy().hasHeightForWidth())
        geoShema.setSizePolicy(sizePolicy)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/geoshema.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        geoShema.setWindowIcon(icon)
        geoShema.setSizeGripEnabled(True)
        geoShema.setModal(True)
        self.gridLayout = QtGui.QGridLayout(geoShema)
        self.gridLayout.setObjectName(_fromUtf8("gridLayout"))
        self.pushButtonCancel = QtGui.QPushButton(geoShema)
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/close.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonCancel.setIcon(icon1)
        self.pushButtonCancel.setObjectName(_fromUtf8("pushButtonCancel"))
        self.gridLayout.addWidget(self.pushButtonCancel, 4, 1, 1, 1)
        self.label = QtGui.QLabel(geoShema)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Preferred, QtGui.QSizePolicy.Preferred)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.label.sizePolicy().hasHeightForWidth())
        self.label.setSizePolicy(sizePolicy)
        self.label.setAlignment(QtCore.Qt.AlignRight|QtCore.Qt.AlignTrailing|QtCore.Qt.AlignVCenter)
        self.label.setObjectName(_fromUtf8("label"))
        self.gridLayout.addWidget(self.label, 0, 0, 1, 1)
        self.pushButtonOk = QtGui.QPushButton(geoShema)
        self.pushButtonOk.setIcon(icon)
        self.pushButtonOk.setObjectName(_fromUtf8("pushButtonOk"))
        self.gridLayout.addWidget(self.pushButtonOk, 4, 0, 1, 1)
        self.progressBar = QtGui.QProgressBar(geoShema)
        self.progressBar.setProperty("value", 0)
        self.progressBar.setObjectName(_fromUtf8("progressBar"))
        self.gridLayout.addWidget(self.progressBar, 5, 0, 1, 2)
        self.label_2 = QtGui.QLabel(geoShema)
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.gridLayout.addWidget(self.label_2, 1, 0, 1, 1)
        self.lineEditSelectedCountAreas = QtGui.QLineEdit(geoShema)
        self.lineEditSelectedCountAreas.setReadOnly(True)
        self.lineEditSelectedCountAreas.setObjectName(_fromUtf8("lineEditSelectedCountAreas"))
        self.gridLayout.addWidget(self.lineEditSelectedCountAreas, 1, 1, 1, 1)
        self.lineEditSelectedCountPoints = QtGui.QLineEdit(geoShema)
        self.lineEditSelectedCountPoints.setReadOnly(True)
        self.lineEditSelectedCountPoints.setObjectName(_fromUtf8("lineEditSelectedCountPoints"))
        self.gridLayout.addWidget(self.lineEditSelectedCountPoints, 0, 1, 1, 1)
        self.groupBox = QtGui.QGroupBox(geoShema)
        self.groupBox.setObjectName(_fromUtf8("groupBox"))
        self.verticalLayout = QtGui.QVBoxLayout(self.groupBox)
        self.verticalLayout.setObjectName(_fromUtf8("verticalLayout"))
        self.radioButtonPoints = QtGui.QRadioButton(self.groupBox)
        self.radioButtonPoints.setChecked(True)
        self.radioButtonPoints.setObjectName(_fromUtf8("radioButtonPoints"))
        self.verticalLayout.addWidget(self.radioButtonPoints)
        self.radioButtonAreas = QtGui.QRadioButton(self.groupBox)
        self.radioButtonAreas.setChecked(False)
        self.radioButtonAreas.setObjectName(_fromUtf8("radioButtonAreas"))
        self.verticalLayout.addWidget(self.radioButtonAreas)
        self.comboBoxTypeLine = QtGui.QComboBox(self.groupBox)
        self.comboBoxTypeLine.setObjectName(_fromUtf8("comboBoxTypeLine"))
        self.verticalLayout.addWidget(self.comboBoxTypeLine)
        self.gridLayout.addWidget(self.groupBox, 2, 0, 1, 2)
        self.groupBox_2 = QtGui.QGroupBox(geoShema)
        self.groupBox_2.setObjectName(_fromUtf8("groupBox_2"))
        self.verticalLayout_2 = QtGui.QVBoxLayout(self.groupBox_2)
        self.verticalLayout_2.setObjectName(_fromUtf8("verticalLayout_2"))
        self.checkBoxCreateNoScalePoint = QtGui.QCheckBox(self.groupBox_2)
        self.checkBoxCreateNoScalePoint.setObjectName(_fromUtf8("checkBoxCreateNoScalePoint"))
        self.verticalLayout_2.addWidget(self.checkBoxCreateNoScalePoint)
        self.comboBoxTypePoint = QtGui.QComboBox(self.groupBox_2)
        self.comboBoxTypePoint.setObjectName(_fromUtf8("comboBoxTypePoint"))
        self.verticalLayout_2.addWidget(self.comboBoxTypePoint)
        self.gridLayout.addWidget(self.groupBox_2, 3, 0, 1, 2)

        self.retranslateUi(geoShema)
        QtCore.QMetaObject.connectSlotsByName(geoShema)
        geoShema.setTabOrder(self.lineEditSelectedCountPoints, self.lineEditSelectedCountAreas)
        geoShema.setTabOrder(self.lineEditSelectedCountAreas, self.radioButtonPoints)
        geoShema.setTabOrder(self.radioButtonPoints, self.radioButtonAreas)
        geoShema.setTabOrder(self.radioButtonAreas, self.comboBoxTypeLine)
        geoShema.setTabOrder(self.comboBoxTypeLine, self.checkBoxCreateNoScalePoint)
        geoShema.setTabOrder(self.checkBoxCreateNoScalePoint, self.comboBoxTypePoint)
        geoShema.setTabOrder(self.comboBoxTypePoint, self.pushButtonOk)
        geoShema.setTabOrder(self.pushButtonOk, self.pushButtonCancel)

    def retranslateUi(self, geoShema):
        geoShema.setWindowTitle(QtGui.QApplication.translate("geoShema", "Оформление схемы геодезических постороений", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonCancel.setText(QtGui.QApplication.translate("geoShema", "Закрыть", None, QtGui.QApplication.UnicodeUTF8))
        self.label.setText(QtGui.QApplication.translate("geoShema", "<html><head/><body><p align=\"right\">Количество выбранных точек оформления</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonOk.setText(QtGui.QApplication.translate("geoShema", "Создать схему геопостроений", None, QtGui.QApplication.UnicodeUTF8))
        self.label_2.setText(QtGui.QApplication.translate("geoShema", "<html><head/><body><p align=\"right\">Количество выбранных участков</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.groupBox.setTitle(QtGui.QApplication.translate("geoShema", "Построить линии к", None, QtGui.QApplication.UnicodeUTF8))
        self.radioButtonPoints.setText(QtGui.QApplication.translate("geoShema", "точкам ЗУ", None, QtGui.QApplication.UnicodeUTF8))
        self.radioButtonAreas.setText(QtGui.QApplication.translate("geoShema", "центрам ЗУ", None, QtGui.QApplication.UnicodeUTF8))
        self.groupBox_2.setTitle(QtGui.QApplication.translate("geoShema", "Внемасштабные ЗУ", None, QtGui.QApplication.UnicodeUTF8))
        self.checkBoxCreateNoScalePoint.setText(QtGui.QApplication.translate("geoShema", "Создавать точечные объекты", None, QtGui.QApplication.UnicodeUTF8))

import resources_rc
