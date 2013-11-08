# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'createpoints.ui'
#
# Created: Mon Oct 28 11:22:22 2013
#      by: PyQt4 UI code generator 4.9.4
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_createPoints(object):
    def setupUi(self, createPoints):
        createPoints.setObjectName(_fromUtf8("createPoints"))
        createPoints.resize(315, 123)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Minimum)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(createPoints.sizePolicy().hasHeightForWidth())
        createPoints.setSizePolicy(sizePolicy)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/border.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        createPoints.setWindowIcon(icon)
        createPoints.setSizeGripEnabled(True)
        createPoints.setModal(True)
        self.formLayout = QtGui.QFormLayout(createPoints)
        self.formLayout.setFieldGrowthPolicy(QtGui.QFormLayout.AllNonFixedFieldsGrow)
        self.formLayout.setObjectName(_fromUtf8("formLayout"))
        self.label = QtGui.QLabel(createPoints)
        self.label.setObjectName(_fromUtf8("label"))
        self.formLayout.setWidget(0, QtGui.QFormLayout.LabelRole, self.label)
        self.lineEditSelectedCount = QtGui.QLineEdit(createPoints)
        self.lineEditSelectedCount.setReadOnly(True)
        self.lineEditSelectedCount.setObjectName(_fromUtf8("lineEditSelectedCount"))
        self.formLayout.setWidget(0, QtGui.QFormLayout.FieldRole, self.lineEditSelectedCount)
        self.pushButtonOk = QtGui.QPushButton(createPoints)
        self.pushButtonOk.setIcon(icon)
        self.pushButtonOk.setObjectName(_fromUtf8("pushButtonOk"))
        self.formLayout.setWidget(2, QtGui.QFormLayout.LabelRole, self.pushButtonOk)
        self.pushButtonCancel = QtGui.QPushButton(createPoints)
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/close.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonCancel.setIcon(icon1)
        self.pushButtonCancel.setObjectName(_fromUtf8("pushButtonCancel"))
        self.formLayout.setWidget(2, QtGui.QFormLayout.FieldRole, self.pushButtonCancel)
        self.progressBar = QtGui.QProgressBar(createPoints)
        self.progressBar.setProperty("value", 0)
        self.progressBar.setObjectName(_fromUtf8("progressBar"))
        self.formLayout.setWidget(3, QtGui.QFormLayout.SpanningRole, self.progressBar)
        self.checkBox = QtGui.QCheckBox(createPoints)
        self.checkBox.setChecked(True)
        self.checkBox.setObjectName(_fromUtf8("checkBox"))
        self.formLayout.setWidget(1, QtGui.QFormLayout.SpanningRole, self.checkBox)

        self.retranslateUi(createPoints)
        QtCore.QMetaObject.connectSlotsByName(createPoints)

    def retranslateUi(self, createPoints):
        createPoints.setWindowTitle(QtGui.QApplication.translate("createPoints", "Создание точек и границ для выбранных участков", None, QtGui.QApplication.UnicodeUTF8))
        self.label.setText(QtGui.QApplication.translate("createPoints", "Количество выбранных участков", None, QtGui.QApplication.UnicodeUTF8))
        self.lineEditSelectedCount.setText(QtGui.QApplication.translate("createPoints", "0", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonOk.setText(QtGui.QApplication.translate("createPoints", "Создать точки и границы", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonCancel.setText(QtGui.QApplication.translate("createPoints", "Закрыть", None, QtGui.QApplication.UnicodeUTF8))
        self.checkBox.setText(QtGui.QApplication.translate("createPoints", "Упорядочить точки по часовой стрелке для каждого", None, QtGui.QApplication.UnicodeUTF8))

import resources_rc
