# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'contractor.ui'
#
# Created: Mon Oct 28 11:22:21 2013
#      by: PyQt4 UI code generator 4.9.4
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_DialogContractor(object):
    def setupUi(self, DialogContractor):
        DialogContractor.setObjectName(_fromUtf8("DialogContractor"))
        DialogContractor.resize(420, 420)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/attributes.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        DialogContractor.setWindowIcon(icon)
        DialogContractor.setSizeGripEnabled(True)
        DialogContractor.setModal(True)
        self.verticalLayout = QtGui.QVBoxLayout(DialogContractor)
        self.verticalLayout.setObjectName(_fromUtf8("verticalLayout"))
        self.treeWidget = QtGui.QTreeWidget(DialogContractor)
        self.treeWidget.setObjectName(_fromUtf8("treeWidget"))
        self.verticalLayout.addWidget(self.treeWidget)
        self.formLayout = QtGui.QFormLayout()
        self.formLayout.setFieldGrowthPolicy(QtGui.QFormLayout.AllNonFixedFieldsGrow)
        self.formLayout.setObjectName(_fromUtf8("formLayout"))
        self.label = QtGui.QLabel(DialogContractor)
        self.label.setObjectName(_fromUtf8("label"))
        self.formLayout.setWidget(0, QtGui.QFormLayout.LabelRole, self.label)
        self.lineEditSurname = QtGui.QLineEdit(DialogContractor)
        self.lineEditSurname.setInputMethodHints(QtCore.Qt.ImhNone)
        self.lineEditSurname.setInputMask(_fromUtf8(""))
        self.lineEditSurname.setObjectName(_fromUtf8("lineEditSurname"))
        self.formLayout.setWidget(0, QtGui.QFormLayout.FieldRole, self.lineEditSurname)
        self.label_2 = QtGui.QLabel(DialogContractor)
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.formLayout.setWidget(1, QtGui.QFormLayout.LabelRole, self.label_2)
        self.lineEditFirst = QtGui.QLineEdit(DialogContractor)
        self.lineEditFirst.setInputMethodHints(QtCore.Qt.ImhNone)
        self.lineEditFirst.setObjectName(_fromUtf8("lineEditFirst"))
        self.formLayout.setWidget(1, QtGui.QFormLayout.FieldRole, self.lineEditFirst)
        self.label_3 = QtGui.QLabel(DialogContractor)
        self.label_3.setObjectName(_fromUtf8("label_3"))
        self.formLayout.setWidget(2, QtGui.QFormLayout.LabelRole, self.label_3)
        self.lineEditPatronymic = QtGui.QLineEdit(DialogContractor)
        self.lineEditPatronymic.setInputMask(_fromUtf8(""))
        self.lineEditPatronymic.setObjectName(_fromUtf8("lineEditPatronymic"))
        self.formLayout.setWidget(2, QtGui.QFormLayout.FieldRole, self.lineEditPatronymic)
        self.label_4 = QtGui.QLabel(DialogContractor)
        self.label_4.setObjectName(_fromUtf8("label_4"))
        self.formLayout.setWidget(3, QtGui.QFormLayout.LabelRole, self.label_4)
        self.lineEditNCertificate = QtGui.QLineEdit(DialogContractor)
        self.lineEditNCertificate.setObjectName(_fromUtf8("lineEditNCertificate"))
        self.formLayout.setWidget(3, QtGui.QFormLayout.FieldRole, self.lineEditNCertificate)
        self.label_5 = QtGui.QLabel(DialogContractor)
        self.label_5.setObjectName(_fromUtf8("label_5"))
        self.formLayout.setWidget(4, QtGui.QFormLayout.LabelRole, self.label_5)
        self.lineEditTelephone = QtGui.QLineEdit(DialogContractor)
        self.lineEditTelephone.setObjectName(_fromUtf8("lineEditTelephone"))
        self.formLayout.setWidget(4, QtGui.QFormLayout.FieldRole, self.lineEditTelephone)
        self.label_6 = QtGui.QLabel(DialogContractor)
        self.label_6.setObjectName(_fromUtf8("label_6"))
        self.formLayout.setWidget(5, QtGui.QFormLayout.LabelRole, self.label_6)
        self.lineEditAddress = QtGui.QLineEdit(DialogContractor)
        self.lineEditAddress.setObjectName(_fromUtf8("lineEditAddress"))
        self.formLayout.setWidget(5, QtGui.QFormLayout.FieldRole, self.lineEditAddress)
        self.label_7 = QtGui.QLabel(DialogContractor)
        self.label_7.setObjectName(_fromUtf8("label_7"))
        self.formLayout.setWidget(6, QtGui.QFormLayout.LabelRole, self.label_7)
        self.lineEditEmail = QtGui.QLineEdit(DialogContractor)
        self.lineEditEmail.setInputMethodHints(QtCore.Qt.ImhNone)
        self.lineEditEmail.setObjectName(_fromUtf8("lineEditEmail"))
        self.formLayout.setWidget(6, QtGui.QFormLayout.FieldRole, self.lineEditEmail)
        self.label_8 = QtGui.QLabel(DialogContractor)
        self.label_8.setObjectName(_fromUtf8("label_8"))
        self.formLayout.setWidget(7, QtGui.QFormLayout.LabelRole, self.label_8)
        self.lineEditOrganization = QtGui.QLineEdit(DialogContractor)
        self.lineEditOrganization.setObjectName(_fromUtf8("lineEditOrganization"))
        self.formLayout.setWidget(7, QtGui.QFormLayout.FieldRole, self.lineEditOrganization)
        self.verticalLayout.addLayout(self.formLayout)
        self.horizontalLayout = QtGui.QHBoxLayout()
        self.horizontalLayout.setObjectName(_fromUtf8("horizontalLayout"))
        self.pushButtonSelect = QtGui.QPushButton(DialogContractor)
        self.pushButtonSelect.setEnabled(False)
        self.pushButtonSelect.setStatusTip(_fromUtf8(""))
        self.pushButtonSelect.setWhatsThis(_fromUtf8(""))
        self.pushButtonSelect.setText(_fromUtf8(""))
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/symbol_check.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonSelect.setIcon(icon1)
        self.pushButtonSelect.setAutoDefault(False)
        self.pushButtonSelect.setDefault(True)
        self.pushButtonSelect.setObjectName(_fromUtf8("pushButtonSelect"))
        self.horizontalLayout.addWidget(self.pushButtonSelect)
        self.pushButtonAdd = QtGui.QPushButton(DialogContractor)
        self.pushButtonAdd.setText(_fromUtf8(""))
        icon2 = QtGui.QIcon()
        icon2.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/symbol_add.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonAdd.setIcon(icon2)
        self.pushButtonAdd.setAutoDefault(False)
        self.pushButtonAdd.setObjectName(_fromUtf8("pushButtonAdd"))
        self.horizontalLayout.addWidget(self.pushButtonAdd)
        self.pushButtonEdit = QtGui.QPushButton(DialogContractor)
        self.pushButtonEdit.setText(_fromUtf8(""))
        icon3 = QtGui.QIcon()
        icon3.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/edit.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonEdit.setIcon(icon3)
        self.pushButtonEdit.setAutoDefault(False)
        self.pushButtonEdit.setObjectName(_fromUtf8("pushButtonEdit"))
        self.horizontalLayout.addWidget(self.pushButtonEdit)
        self.pushButtonDel = QtGui.QPushButton(DialogContractor)
        self.pushButtonDel.setText(_fromUtf8(""))
        icon4 = QtGui.QIcon()
        icon4.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/symbol_remove.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonDel.setIcon(icon4)
        self.pushButtonDel.setAutoDefault(False)
        self.pushButtonDel.setObjectName(_fromUtf8("pushButtonDel"))
        self.horizontalLayout.addWidget(self.pushButtonDel)
        self.pushButtonSave = QtGui.QPushButton(DialogContractor)
        self.pushButtonSave.setEnabled(False)
        self.pushButtonSave.setText(_fromUtf8(""))
        icon5 = QtGui.QIcon()
        icon5.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/save.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonSave.setIcon(icon5)
        self.pushButtonSave.setAutoDefault(False)
        self.pushButtonSave.setObjectName(_fromUtf8("pushButtonSave"))
        self.horizontalLayout.addWidget(self.pushButtonSave)
        self.pushButtonRefresh = QtGui.QPushButton(DialogContractor)
        self.pushButtonRefresh.setText(_fromUtf8(""))
        icon6 = QtGui.QIcon()
        icon6.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/refresh.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonRefresh.setIcon(icon6)
        self.pushButtonRefresh.setAutoDefault(False)
        self.pushButtonRefresh.setObjectName(_fromUtf8("pushButtonRefresh"))
        self.horizontalLayout.addWidget(self.pushButtonRefresh)
        self.pushButtonClose = QtGui.QPushButton(DialogContractor)
        self.pushButtonClose.setText(_fromUtf8(""))
        icon7 = QtGui.QIcon()
        icon7.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/close.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonClose.setIcon(icon7)
        self.pushButtonClose.setAutoDefault(False)
        self.pushButtonClose.setObjectName(_fromUtf8("pushButtonClose"))
        self.horizontalLayout.addWidget(self.pushButtonClose)
        self.verticalLayout.addLayout(self.horizontalLayout)
        self.labelMessage = QtGui.QLabel(DialogContractor)
        self.labelMessage.setText(_fromUtf8(""))
        self.labelMessage.setObjectName(_fromUtf8("labelMessage"))
        self.verticalLayout.addWidget(self.labelMessage)

        self.retranslateUi(DialogContractor)
        QtCore.QMetaObject.connectSlotsByName(DialogContractor)
        DialogContractor.setTabOrder(self.treeWidget, self.lineEditSurname)
        DialogContractor.setTabOrder(self.lineEditSurname, self.lineEditFirst)
        DialogContractor.setTabOrder(self.lineEditFirst, self.lineEditPatronymic)
        DialogContractor.setTabOrder(self.lineEditPatronymic, self.lineEditNCertificate)
        DialogContractor.setTabOrder(self.lineEditNCertificate, self.lineEditTelephone)
        DialogContractor.setTabOrder(self.lineEditTelephone, self.lineEditAddress)
        DialogContractor.setTabOrder(self.lineEditAddress, self.lineEditEmail)
        DialogContractor.setTabOrder(self.lineEditEmail, self.lineEditOrganization)
        DialogContractor.setTabOrder(self.lineEditOrganization, self.pushButtonSelect)
        DialogContractor.setTabOrder(self.pushButtonSelect, self.pushButtonAdd)
        DialogContractor.setTabOrder(self.pushButtonAdd, self.pushButtonEdit)
        DialogContractor.setTabOrder(self.pushButtonEdit, self.pushButtonDel)
        DialogContractor.setTabOrder(self.pushButtonDel, self.pushButtonSave)
        DialogContractor.setTabOrder(self.pushButtonSave, self.pushButtonRefresh)
        DialogContractor.setTabOrder(self.pushButtonRefresh, self.pushButtonClose)

    def retranslateUi(self, DialogContractor):
        DialogContractor.setWindowTitle(QtGui.QApplication.translate("DialogContractor", "Кадастровый инженер", None, QtGui.QApplication.UnicodeUTF8))
        self.treeWidget.setSortingEnabled(True)
        self.treeWidget.headerItem().setText(0, QtGui.QApplication.translate("DialogContractor", "Фамилия", None, QtGui.QApplication.UnicodeUTF8))
        self.treeWidget.headerItem().setText(1, QtGui.QApplication.translate("DialogContractor", "Имя", None, QtGui.QApplication.UnicodeUTF8))
        self.treeWidget.headerItem().setText(2, QtGui.QApplication.translate("DialogContractor", "Отчество", None, QtGui.QApplication.UnicodeUTF8))
        self.label.setText(QtGui.QApplication.translate("DialogContractor", "Фамилия", None, QtGui.QApplication.UnicodeUTF8))
        self.label_2.setText(QtGui.QApplication.translate("DialogContractor", "Имя", None, QtGui.QApplication.UnicodeUTF8))
        self.label_3.setText(QtGui.QApplication.translate("DialogContractor", "Отчество", None, QtGui.QApplication.UnicodeUTF8))
        self.label_4.setText(QtGui.QApplication.translate("DialogContractor", "Номер аттестата", None, QtGui.QApplication.UnicodeUTF8))
        self.label_5.setText(QtGui.QApplication.translate("DialogContractor", "Контактный телефон", None, QtGui.QApplication.UnicodeUTF8))
        self.label_6.setText(QtGui.QApplication.translate("DialogContractor", "Почтовый адрес", None, QtGui.QApplication.UnicodeUTF8))
        self.label_7.setText(QtGui.QApplication.translate("DialogContractor", "Электронный адрес", None, QtGui.QApplication.UnicodeUTF8))
        self.label_8.setText(QtGui.QApplication.translate("DialogContractor", "<html><head/><body><p>Наименование<br /> юридического лица</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonSelect.setToolTip(QtGui.QApplication.translate("DialogContractor", "Выбрать кадастрового инженера", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonAdd.setToolTip(QtGui.QApplication.translate("DialogContractor", "Добавить кадастрового инженера", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonEdit.setToolTip(QtGui.QApplication.translate("DialogContractor", "Редактировать атрибуты кадастрового инженера", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonDel.setToolTip(QtGui.QApplication.translate("DialogContractor", "Удалить кадастрового инженера", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonSave.setToolTip(QtGui.QApplication.translate("DialogContractor", "Сохранить атрибуты кадастрового инженера", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonRefresh.setToolTip(QtGui.QApplication.translate("DialogContractor", "Обновить атрибуты кадастрового инженера", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonClose.setToolTip(QtGui.QApplication.translate("DialogContractor", "Закрыть окно", None, QtGui.QApplication.UnicodeUTF8))

import resources_rc
