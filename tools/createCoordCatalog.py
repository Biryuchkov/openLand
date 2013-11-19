# -*- coding: utf-8 -*-
from PyQt4 import QtCore, QtGui
from coordcatalog import CatalogData

__name__ = 'createCoordCatalog'
__version__ = '0.1'
__author__ = 'Filippov Vladislav'

from PyQt4.QtGui import QDialog, QMessageBox
from createCoordCatalog_ui import Ui_CoordCatalog
# открывать html-файлы с помощью браузера. корректно показывает Firefox

#currentPath = os.path.dirname(__file__)


class CreateCoordCatalog(QDialog, Ui_CoordCatalog):
	def __init__(self, iface):
		QDialog.__init__(self, iface.mainWindow())
		self.iface = iface
		self.setupUi(self)
		#self.template = u'<HTML><HEAD><META HTTP-EQUIV="CONTENT-TYPE"CONTENT="text/html; charset=UTF-8">' \
		#                u'</HEAD><BODY>{0}</BODY></HTML>'
		self.connect(self.btnCreateCoord, QtCore.SIGNAL("clicked()"), self.calculate)

	def calculate(self):
		if (self.iface.mapCanvas().currentLayer() is not None) \
			and (self.iface.mapCanvas().currentLayer().selectedFeatures() is not None):
			for feature in self.iface.mapCanvas().currentLayer().selectedFeatures():
				#QMessageBox.warning(self.iface.mainWindow(), 'area', \
				#                    str(feature.geometry().area()), QtGui.QMessageBox.Ok, \
				#                    QtGui.QMessageBox.Ok)
				ved = CatalogData(feature, self.radioBtnNewPoint.checkStateSet())
				data = ''

				for val in ved.list_data:
					data += self.decorate_value_HTML(val)
					#self.textEdit.append(self.decorate_value_HTML(val))
				self.textEdit.append(data.encode('utf-8'))

				QMessageBox.warning(self.iface.mainWindow(), 'data', \
				                    data, QtGui.QMessageBox.Ok, \
				                    QtGui.QMessageBox.Ok)

	#  Одна строка таблицы со значениями
	def decorate_value_HTML(self, value, last=False):
		row1 = u'<TR>{0}</TR>'
		row2 = u'<TR>{0}</TR>'
		empty = u'<TD STYLE=\"border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: ' \
			      u'1px solid #000000; border-right: 1px solid #000000\" HEIGHT=\"17\" ALIGN=\"CENTER\">{0}</TD>'

		if not last:
			num = empty.format(value[0])
			x = empty.format(value[1])
			y = empty.format(value[2])
			a = empty.format(value[3])
			l = empty.format(value[4])
			data1 = num + x + y + empty.format('<BR>') + empty.format('<BR>')
			QMessageBox.warning(self.iface.mainWindow(), 'data', \
				                   empty + '=====' +  data1, QtGui.QMessageBox.Ok, \
				                    QtGui.QMessageBox.Ok)
			row1.format(data1)
			data2 = empty.format('<BR>') + empty.format('<BR>') + empty.format('<BR>') + a + l
			row2.format(data2)
			return (row1 + row2)
		else:
			num = empty.format(''.join(value[0]))
			x = empty.format(''.join(value[1]))
			y = empty.format(''.join(value[2]))
			row1.format(num + x + y + empty.format('<BR>') + empty.format('<BR>'))
			return row1