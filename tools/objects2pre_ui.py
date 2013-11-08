# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'objects2pre.ui'
#
# Created: Mon Oct 28 11:22:34 2013
#      by: PyQt4 UI code generator 4.9.4
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_objects2pre(object):
    def setupUi(self, objects2pre):
        objects2pre.setObjectName(_fromUtf8("objects2pre"))
        objects2pre.resize(280, 160)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Minimum)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(objects2pre.sizePolicy().hasHeightForWidth())
        objects2pre.setSizePolicy(sizePolicy)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/objects2pre.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        objects2pre.setWindowIcon(icon)
        objects2pre.setSizeGripEnabled(True)
        objects2pre.setModal(True)
        self.formLayout = QtGui.QFormLayout(objects2pre)
        self.formLayout.setFieldGrowthPolicy(QtGui.QFormLayout.AllNonFixedFieldsGrow)
        self.formLayout.setObjectName(_fromUtf8("formLayout"))
        self.label = QtGui.QLabel(objects2pre)
        self.label.setObjectName(_fromUtf8("label"))
        self.formLayout.setWidget(0, QtGui.QFormLayout.LabelRole, self.label)
        self.lineEditSelectedPoints = QtGui.QLineEdit(objects2pre)
        self.lineEditSelectedPoints.setReadOnly(True)
        self.lineEditSelectedPoints.setObjectName(_fromUtf8("lineEditSelectedPoints"))
        self.formLayout.setWidget(0, QtGui.QFormLayout.FieldRole, self.lineEditSelectedPoints)
        self.pushButtonOk = QtGui.QPushButton(objects2pre)
        self.pushButtonOk.setIcon(icon)
        self.pushButtonOk.setObjectName(_fromUtf8("pushButtonOk"))
        self.formLayout.setWidget(4, QtGui.QFormLayout.LabelRole, self.pushButtonOk)
        self.pushButtonCancel = QtGui.QPushButton(objects2pre)
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/close.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonCancel.setIcon(icon1)
        self.pushButtonCancel.setObjectName(_fromUtf8("pushButtonCancel"))
        self.formLayout.setWidget(4, QtGui.QFormLayout.FieldRole, self.pushButtonCancel)
        self.progressBar = QtGui.QProgressBar(objects2pre)
        self.progressBar.setProperty("value", 0)
        self.progressBar.setObjectName(_fromUtf8("progressBar"))
        self.formLayout.setWidget(5, QtGui.QFormLayout.SpanningRole, self.progressBar)
        self.lineEditSelectedParcels = QtGui.QLineEdit(objects2pre)
        self.lineEditSelectedParcels.setReadOnly(True)
        self.lineEditSelectedParcels.setObjectName(_fromUtf8("lineEditSelectedParcels"))
        self.formLayout.setWidget(2, QtGui.QFormLayout.FieldRole, self.lineEditSelectedParcels)
        self.lineEditSelectedBorders = QtGui.QLineEdit(objects2pre)
        self.lineEditSelectedBorders.setReadOnly(True)
        self.lineEditSelectedBorders.setObjectName(_fromUtf8("lineEditSelectedBorders"))
        self.formLayout.setWidget(1, QtGui.QFormLayout.FieldRole, self.lineEditSelectedBorders)
        self.label_2 = QtGui.QLabel(objects2pre)
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.formLayout.setWidget(1, QtGui.QFormLayout.LabelRole, self.label_2)
        self.label_3 = QtGui.QLabel(objects2pre)
        self.label_3.setObjectName(_fromUtf8("label_3"))
        self.formLayout.setWidget(2, QtGui.QFormLayout.LabelRole, self.label_3)

        self.retranslateUi(objects2pre)
        QtCore.QMetaObject.connectSlotsByName(objects2pre)
        objects2pre.setTabOrder(self.lineEditSelectedPoints, self.lineEditSelectedBorders)
        objects2pre.setTabOrder(self.lineEditSelectedBorders, self.lineEditSelectedParcels)
        objects2pre.setTabOrder(self.lineEditSelectedParcels, self.pushButtonOk)
        objects2pre.setTabOrder(self.pushButtonOk, self.pushButtonCancel)

    def retranslateUi(self, objects2pre):
        objects2pre.setWindowTitle(QtGui.QApplication.translate("objects2pre", "Прекратить существование объектов учёта", None, QtGui.QApplication.UnicodeUTF8))
        self.label.setText(QtGui.QApplication.translate("objects2pre", "<html><head/><body><p align=\"right\">Выбрано точек</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.lineEditSelectedPoints.setText(QtGui.QApplication.translate("objects2pre", "0", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonOk.setText(QtGui.QApplication.translate("objects2pre", "Прекратить существование", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonCancel.setText(QtGui.QApplication.translate("objects2pre", "Закрыть", None, QtGui.QApplication.UnicodeUTF8))
        self.lineEditSelectedParcels.setText(QtGui.QApplication.translate("objects2pre", "0", None, QtGui.QApplication.UnicodeUTF8))
        self.lineEditSelectedBorders.setText(QtGui.QApplication.translate("objects2pre", "0", None, QtGui.QApplication.UnicodeUTF8))
        self.label_2.setText(QtGui.QApplication.translate("objects2pre", "<html><head/><body><p>Выбрано границ</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.label_3.setText(QtGui.QApplication.translate("objects2pre", "<html><head/><body><p>Выбрано ЗУ / ЧЗУ</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))

import resources_rc
