# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'createpoints.ui'
#
# Created: Wed Apr 02 09:35:19 2014
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

class Ui_createPoints(object):
    def setupUi(self, createPoints):
        createPoints.setObjectName(_fromUtf8("createPoints"))
        createPoints.resize(315, 100)
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
        self.checkBox = QtGui.QCheckBox(createPoints)
        self.checkBox.setChecked(True)
        self.checkBox.setObjectName(_fromUtf8("checkBox"))
        self.formLayout.setWidget(1, QtGui.QFormLayout.SpanningRole, self.checkBox)
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

        self.retranslateUi(createPoints)
        QtCore.QMetaObject.connectSlotsByName(createPoints)

    def retranslateUi(self, createPoints):
        createPoints.setWindowTitle(_translate("createPoints", "Создание точек и границ для выбранных участков", None))
        self.label.setText(_translate("createPoints", "Количество выбранных участков", None))
        self.lineEditSelectedCount.setText(_translate("createPoints", "0", None))
        self.checkBox.setText(_translate("createPoints", "Упорядочить точки по часовой стрелке для каждого", None))
        self.pushButtonOk.setText(_translate("createPoints", "Создать точки и границы", None))
        self.pushButtonCancel.setText(_translate("createPoints", "Закрыть", None))

import resources_rc
