# -*- coding: utf-8 -*-
__name__ = 'coordCatalog'
__version__ = '0.1'
__author__ = 'Filippov Vladislav'

from pydev import pydevd
import math
from qgis.core import QGis


class Point():
	def __init__(self, x, y):
		self.x = x
		self.y = y


class Measure():
# Измерение дирекционного угла и горизонтального проложения
	def __init__(self, point1, point2):
		self.point1 = point1
		self.point2 = point2
		self.ddx = self.point2.x - self.point1.x
		self.ddy = self.point2.y - self.point1.y
		self.ang = -1
		self.len = -1
		self.angle = ''
		self.lenght = ''
		self.calclenght()
		self.calcangle()

	def calclenght(self):
		a = math.pow(self.ddx, 2)
		b = math.pow(self.ddy, 2)
		self.len = math.sqrt(a + b)
		self.lenght = round(self.len, 2)

	def calcangle(self):
		if self.ddx == 0:
			if self.ddy < 0:
				self.angle = u'270°0,0\''
			else:
				self.angle = u'90°0,0\''
		else:
			alfa = math.fabs(math.atan(self.ddy / self.ddx) \
			                 * (180 / math.pi))
			if (self.ddx > 0) and (self.ddy > 0):
				self.ang = alfa
				self.calcdegmin()
			elif (self.ddx < 0) and (self.ddy > 0):
				self.ang = 180 - alfa
				self.calcdegmin()
			elif (self.ddx < 0) and (self.ddy < 0):
				self.ang = 180 + alfa
				self.calcdegmin()
			elif (self.ddx > 0) and (self.ddy < 0):
				self.ang = 360 - alfa
				self.calcdegmin()
			elif (self.ddx > 0) and (self.ddy == 0):
				self.angle = u'0°0\''
			elif (self.ddx < 0) and (self.ddy == 0):
				self.angle = u'180°0\''

	def calcdegmin(self):
		a = int(self.ang)
		minute = (self.ang - a) * 60
		self.angle = unicode(a) + u'°' + unicode('{0:.1f}'.format(minute)) + u'\''


class CatalogData():
	def __init__(self, feature, is_new_point):
		self.feature = feature
		self.number_contours = 0
		self.list_contours = []  # 1 (если полигон) или N конутуров мультполигона
		self.list_ring = []  # контуры текущего полигона
		self.list_data = []
		self.catalog = u''
		self.multi = False
		self.is_new_point = is_new_point
		self.prepare_data()
		self.calculate()

	def prepare_data(self):
		geom = self.feature.geometry()
		if geom.isMultipart():
			self.multi = True
			polygons = geom.asMultiPolygon()
			for polygon in polygons:
				self.parse_polygon(polygon)
		else:
			self.parse_polygon(geom.asPolygon())

	# полигон может содержать один внешний и от нуля до N внутренних контуров (дырок)
	def parse_polygon(self, polygon):
		for ring in polygon:
			list_ponts = []
			for node in ring:
				# Тут происходит переход к геодезической СК
				x = round(node.y(), 2)
				y = round(node.x(), 2)
				list_ponts.append([x, y])
			self.list_ring.append(list_ponts)
		self.list_contours.append(self.list_ring)

	def calculate(self):
		iter_n = 0
		iter_c = 0
		iter_r = 0
		number = 1
		first_num = 1
		for polygon in self.list_contours:
			if self.multi:
				self.catalog += u'<h1>Контур ' + unicode(iter_c + 1) + u'</h1>'
			for ring in polygon:
				iter_n = 1
				for point in ring:
					if self.is_new_point:
						point_num = u'н' + unicode(number)
						first_pt_num = u'н' + unicode(first_num)
					else:
						point_num = unicode(number)
						first_pt_num = unicode(first_num)
					if iter_n < len(ring)-1:
						point1 = Point(self.list_contours[iter_c][iter_r][iter_n-1][0], self.list_contours[iter_c][iter_r][iter_n-1][1])
						point2 = Point(self.list_contours[iter_c][iter_r][iter_n][0], self.list_contours[iter_c][iter_r][iter_n][1])
						measure = Measure(point1, point2)
						#self.list_data.append([point_num, unicode(ring[iter_n-1][0]), unicode(ring[iter_n-1][1]), measure.angle,
						#                       unicode(measure.lenght)])
						self.catalog += self.decorate_value_html([point_num, unicode(self.list_contours[iter_c][iter_r][iter_n-1][0]),
							unicode(self.list_contours[iter_c][iter_r][iter_n-1][1]), measure.angle, unicode(measure.lenght)])
						pass  #TODO Создание точек на слое
					elif iter_n == len(ring):
						point1 = Point(self.list_contours[iter_c][iter_r][iter_n-1][0], self.list_contours[iter_c][iter_r][iter_n-1][1])
						point2 = Point(self.list_contours[iter_c][iter_r][0][0], self.list_contours[iter_c][iter_r][0][1])
						measure = Measure(point1, point2)
						self.list_data.append(
							[point_num, unicode(self.list_contours[iter_c][iter_r][iter_n-1][0]),
							 unicode(self.list_contours[iter_c][iter_r][iter_n-1][1]), measure.angle,
							 unicode(measure.lenght)])
						self.catalog += self.decorate_value_html(self.list_data[len(self.list_data)-1])
						self.list_data.append(
							[first_pt_num, unicode(self.list_contours[iter_c][iter_r][0][0]),
							 unicode(self.list_contours[iter_c][iter_r][0][1]), u'', u''])
						self.catalog += self.decorate_value_html(self.list_data[len(self.list_data)-1], True)

					number += 1
					iter_n += 1
				iter_r += 1
			self.catalog += u'<BR>'
			iter_c += 1
			self.catalog += u'<BR>'
		self.catalog += u'Площадь: '

			#number = 1

#  Одна строка таблицы со значениями
	@staticmethod
	def decorate_value_html(value, last=False):
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
			data2 = empty.format('<BR>') + empty.format('<BR>') + empty.format('<BR>') + a + l
			return row1.format(data1) + row2.format(data2)
		else:
			num = empty.format(''.join(value[0]))
			x = empty.format(''.join(value[1]))
			y = empty.format(''.join(value[2]))
			row1.format(num + x + y + empty.format('<BR>') + empty.format('<BR>'))
			return row1