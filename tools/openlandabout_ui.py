# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'openlandabout.ui'
#
# Created: Mon Oct 28 12:18:43 2013
#      by: PyQt4 UI code generator 4.9.4
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_OpenLandAbout(object):
    def setupUi(self, OpenLandAbout):
        OpenLandAbout.setObjectName(_fromUtf8("OpenLandAbout"))
        OpenLandAbout.resize(360, 360)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/about.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        OpenLandAbout.setWindowIcon(icon)
        OpenLandAbout.setSizeGripEnabled(True)
        self.gridlayout = QtGui.QGridLayout(OpenLandAbout)
        self.gridlayout.setObjectName(_fromUtf8("gridlayout"))
        self.btnClose = QtGui.QPushButton(OpenLandAbout)
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/close.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.btnClose.setIcon(icon1)
        self.btnClose.setObjectName(_fromUtf8("btnClose"))
        self.gridlayout.addWidget(self.btnClose, 13, 2, 1, 1)
        self.lblTitle = QtGui.QLabel(OpenLandAbout)
        font = QtGui.QFont()
        font.setFamily(_fromUtf8("Verdana"))
        font.setPointSize(20)
        font.setBold(True)
        font.setWeight(75)
        self.lblTitle.setFont(font)
        self.lblTitle.setTextFormat(QtCore.Qt.RichText)
        self.lblTitle.setObjectName(_fromUtf8("lblTitle"))
        self.gridlayout.addWidget(self.lblTitle, 0, 0, 1, 2)
        self.pushButtonAboutQt = QtGui.QPushButton(OpenLandAbout)
        icon2 = QtGui.QIcon()
        icon2.addPixmap(QtGui.QPixmap(_fromUtf8(":/plugins/openland/icons/qt-logo.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButtonAboutQt.setIcon(icon2)
        self.pushButtonAboutQt.setObjectName(_fromUtf8("pushButtonAboutQt"))
        self.gridlayout.addWidget(self.pushButtonAboutQt, 13, 0, 1, 1)
        self.textEdit = QtGui.QTextEdit(OpenLandAbout)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Expanding)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.textEdit.sizePolicy().hasHeightForWidth())
        self.textEdit.setSizePolicy(sizePolicy)
        self.textEdit.setMaximumSize(QtCore.QSize(16777215, 50))
        self.textEdit.setBaseSize(QtCore.QSize(0, 0))
        palette = QtGui.QPalette()
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0, 0))
        brush.setStyle(QtCore.Qt.SolidPattern)
        palette.setBrush(QtGui.QPalette.Active, QtGui.QPalette.Base, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0, 0))
        brush.setStyle(QtCore.Qt.SolidPattern)
        palette.setBrush(QtGui.QPalette.Inactive, QtGui.QPalette.Base, brush)
        brush = QtGui.QBrush(QtGui.QColor(212, 208, 200))
        brush.setStyle(QtCore.Qt.SolidPattern)
        palette.setBrush(QtGui.QPalette.Disabled, QtGui.QPalette.Base, brush)
        self.textEdit.setPalette(palette)
        self.textEdit.setAutoFillBackground(False)
        self.textEdit.setFrameShape(QtGui.QFrame.NoFrame)
        self.textEdit.setFrameShadow(QtGui.QFrame.Plain)
        self.textEdit.setReadOnly(True)
        self.textEdit.setObjectName(_fromUtf8("textEdit"))
        self.gridlayout.addWidget(self.textEdit, 5, 0, 1, 3)
        self.labelDbVersion = QtGui.QLabel(OpenLandAbout)
        self.labelDbVersion.setObjectName(_fromUtf8("labelDbVersion"))
        self.gridlayout.addWidget(self.labelDbVersion, 3, 0, 1, 3)
        self.lblVersion = QtGui.QLabel(OpenLandAbout)
        self.lblVersion.setObjectName(_fromUtf8("lblVersion"))
        self.gridlayout.addWidget(self.lblVersion, 2, 0, 1, 3)
        self.txtAbout = QtGui.QTextEdit(OpenLandAbout)
        palette = QtGui.QPalette()
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0, 0))
        brush.setStyle(QtCore.Qt.SolidPattern)
        palette.setBrush(QtGui.QPalette.Active, QtGui.QPalette.Base, brush)
        brush = QtGui.QBrush(QtGui.QColor(0, 0, 0, 0))
        brush.setStyle(QtCore.Qt.SolidPattern)
        palette.setBrush(QtGui.QPalette.Inactive, QtGui.QPalette.Base, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.SolidPattern)
        palette.setBrush(QtGui.QPalette.Disabled, QtGui.QPalette.Base, brush)
        self.txtAbout.setPalette(palette)
        self.txtAbout.setAutoFillBackground(True)
        self.txtAbout.setFrameShape(QtGui.QFrame.NoFrame)
        self.txtAbout.setFrameShadow(QtGui.QFrame.Plain)
        self.txtAbout.setReadOnly(True)
        self.txtAbout.setObjectName(_fromUtf8("txtAbout"))
        self.gridlayout.addWidget(self.txtAbout, 11, 0, 1, 3)
        self.labelSite = QtGui.QLabel(OpenLandAbout)
        self.labelSite.setObjectName(_fromUtf8("labelSite"))
        self.gridlayout.addWidget(self.labelSite, 4, 0, 1, 1)
        self.label = QtGui.QLabel(OpenLandAbout)
        self.label.setObjectName(_fromUtf8("label"))
        self.gridlayout.addWidget(self.label, 9, 0, 1, 1)
        self.labelGnuUrl = QtGui.QLabel(OpenLandAbout)
        self.labelGnuUrl.setObjectName(_fromUtf8("labelGnuUrl"))
        self.gridlayout.addWidget(self.labelGnuUrl, 6, 1, 1, 2)
        self.labelGnuRusUrl = QtGui.QLabel(OpenLandAbout)
        self.labelGnuRusUrl.setObjectName(_fromUtf8("labelGnuRusUrl"))
        self.gridlayout.addWidget(self.labelGnuRusUrl, 9, 1, 1, 2)
        self.labelSiteUrl = QtGui.QLabel(OpenLandAbout)
        self.labelSiteUrl.setObjectName(_fromUtf8("labelSiteUrl"))
        self.gridlayout.addWidget(self.labelSiteUrl, 4, 1, 1, 2)
        self.label_3 = QtGui.QLabel(OpenLandAbout)
        self.label_3.setObjectName(_fromUtf8("label_3"))
        self.gridlayout.addWidget(self.label_3, 6, 0, 1, 1)

        self.retranslateUi(OpenLandAbout)
        QtCore.QObject.connect(self.btnClose, QtCore.SIGNAL(_fromUtf8("clicked()")), OpenLandAbout.reject)
        QtCore.QMetaObject.connectSlotsByName(OpenLandAbout)
        OpenLandAbout.setTabOrder(self.txtAbout, self.pushButtonAboutQt)
        OpenLandAbout.setTabOrder(self.pushButtonAboutQt, self.btnClose)

    def retranslateUi(self, OpenLandAbout):
        OpenLandAbout.setWindowTitle(QtGui.QApplication.translate("OpenLandAbout", "О модуле openLand", None, QtGui.QApplication.UnicodeUTF8))
        self.btnClose.setText(QtGui.QApplication.translate("OpenLandAbout", "Закрыть", None, QtGui.QApplication.UnicodeUTF8))
        self.lblTitle.setText(QtGui.QApplication.translate("OpenLandAbout", "openLand", None, QtGui.QApplication.UnicodeUTF8))
        self.pushButtonAboutQt.setText(QtGui.QApplication.translate("OpenLandAbout", "О Qt", None, QtGui.QApplication.UnicodeUTF8))
        self.textEdit.setHtml(QtGui.QApplication.translate("OpenLandAbout", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n"
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
"p, li { white-space: pre-wrap; }\n"
"</style></head><body style=\" font-family:\'MS Shell Dlg 2\'; font-size:8.25pt; font-weight:400; font-style:normal;\">\n"
"<p align=\"justify\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:8pt;\">Модуль кадастрового инженера openLand распространяется на основании GNU General Public License </span></p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.labelDbVersion.setText(QtGui.QApplication.translate("OpenLandAbout", "Версия базы данных не определена.", None, QtGui.QApplication.UnicodeUTF8))
        self.lblVersion.setText(QtGui.QApplication.translate("OpenLandAbout", "<html><head/><body><p>Версия 0.0.13 <span style=\" color:#ff0000; vertical-align:sub;\">альфа</span> от 2013-06-22</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.txtAbout.setHtml(QtGui.QApplication.translate("OpenLandAbout", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n"
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
"p, li { white-space: pre-wrap; }\n"
"</style></head><body style=\" font-family:\'MS Shell Dlg 2\'; font-size:8.25pt; font-weight:400; font-style:normal;\">\n"
"<p align=\"justify\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:8pt;\">Любое использование вами модуля openLand означает полное и безоговорочное принятие вами  условий GNU GPL. Если вы не принимаете условия лицензионного соглашения в полном объеме, вы не имеете права использовать модуль openLand и его программный код на Python в каких-либо целях.</span></p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.labelSite.setText(QtGui.QApplication.translate("OpenLandAbout", "Сайт проекта", None, QtGui.QApplication.UnicodeUTF8))
        self.label.setText(QtGui.QApplication.translate("OpenLandAbout", "<html><head/><body><p>Русский перевод</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.labelGnuUrl.setText(QtGui.QApplication.translate("OpenLandAbout", "<html><head/><body><p><a href=\"http://www.gnu.org/licenses/gpl.html\"><span style=\" text-decoration: underline; color:#0000ff;\">http://www.gnu.org/licenses/gpl.html</span></a></p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.labelGnuRusUrl.setText(QtGui.QApplication.translate("OpenLandAbout", "<html><head/><body><p><a href=\"http://rusgpl.ru/rusgpl.html\"><span style=\" text-decoration: underline; color:#0000ff;\">http://rusgpl.ru/rusgpl.html</span></a></p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.labelSiteUrl.setText(QtGui.QApplication.translate("OpenLandAbout", "<html><head/><body><p><a href=\"http://openlandgis.ru/\"><span style=\" text-decoration: underline; color:#0000ff;\">http://openlandgis.ru</span></a></p></body></html>", None, QtGui.QApplication.UnicodeUTF8))
        self.label_3.setText(QtGui.QApplication.translate("OpenLandAbout", "<html><head/><body><p>Текст лицензии</p></body></html>", None, QtGui.QApplication.UnicodeUTF8))

import resources_rc
