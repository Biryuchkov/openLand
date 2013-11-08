# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'filterset.ui'
#
# Created: Mon Oct 28 11:22:24 2013
#      by: PyQt4 UI code generator 4.9.4
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_FilterSet(object):
    def setupUi(self, FilterSet):
        FilterSet.setObjectName(_fromUtf8("FilterSet"))
        FilterSet.resize(365, 180)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/filter.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        FilterSet.setWindowIcon(icon)
        FilterSet.setSizeGripEnabled(True)
        FilterSet.setModal(True)
        self.verticalLayout = QtGui.QVBoxLayout(FilterSet)
        self.verticalLayout.setObjectName(_fromUtf8("verticalLayout"))
        self.radioButtonNone = QtGui.QRadioButton(FilterSet)
        self.radioButtonNone.setChecked(True)
        self.radioButtonNone.setObjectName(_fromUtf8("radioButtonNone"))
        self.verticalLayout.addWidget(self.radioButtonNone)
        self.radioButtonKvr = QtGui.QRadioButton(FilterSet)
        self.radioButtonKvr.setObjectName(_fromUtf8("radioButtonKvr"))
        self.verticalLayout.addWidget(self.radioButtonKvr)
        self.radioButtonUch = QtGui.QRadioButton(FilterSet)
        self.radioButtonUch.setObjectName(_fromUtf8("radioButtonUch"))
        self.verticalLayout.addWidget(self.radioButtonUch)
        self.checkBoxOnlyCurrentUser = QtGui.QCheckBox(FilterSet)
        self.checkBoxOnlyCurrentUser.setEnabled(False)
        self.checkBoxOnlyCurrentUser.setObjectName(_fromUtf8("checkBoxOnlyCurrentUser"))
        self.verticalLayout.addWidget(self.checkBoxOnlyCurrentUser)
        self.buttonBox = QtGui.QDialogButtonBox(FilterSet)
        self.buttonBox.setOrientation(QtCore.Qt.Horizontal)
        self.buttonBox.setStandardButtons(QtGui.QDialogButtonBox.Cancel|QtGui.QDialogButtonBox.Ok)
        self.buttonBox.setObjectName(_fromUtf8("buttonBox"))
        self.verticalLayout.addWidget(self.buttonBox)

        self.retranslateUi(FilterSet)
        QtCore.QObject.connect(self.buttonBox, QtCore.SIGNAL(_fromUtf8("accepted()")), FilterSet.accept)
        QtCore.QObject.connect(self.buttonBox, QtCore.SIGNAL(_fromUtf8("rejected()")), FilterSet.reject)
        QtCore.QMetaObject.connectSlotsByName(FilterSet)
        FilterSet.setTabOrder(self.radioButtonNone, self.radioButtonKvr)
        FilterSet.setTabOrder(self.radioButtonKvr, self.radioButtonUch)
        FilterSet.setTabOrder(self.radioButtonUch, self.checkBoxOnlyCurrentUser)
        FilterSet.setTabOrder(self.checkBoxOnlyCurrentUser, self.buttonBox)

    def retranslateUi(self, FilterSet):
        FilterSet.setWindowTitle(QtGui.QApplication.translate("FilterSet", "Установить фильтр", None, QtGui.QApplication.UnicodeUTF8))
        self.radioButtonNone.setText(QtGui.QApplication.translate("FilterSet", "Убрать фильтр по кварталам/участкам", None, QtGui.QApplication.UnicodeUTF8))
        self.radioButtonKvr.setText(QtGui.QApplication.translate("FilterSet", "По выбранному кварталу(кварталам)", None, QtGui.QApplication.UnicodeUTF8))
        self.radioButtonUch.setText(QtGui.QApplication.translate("FilterSet", "По выбранному участку(участкам)", None, QtGui.QApplication.UnicodeUTF8))
        self.checkBoxOnlyCurrentUser.setText(QtGui.QApplication.translate("FilterSet", "Только объекты пользователя БД из настроек", None, QtGui.QApplication.UnicodeUTF8))

import resources_rc
