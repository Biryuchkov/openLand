# -*- coding: utf-8 -*-
__name__ = 'coordCatalog'
__version__ = '0.1'
__author__ = 'Filippov Vladislav'

#from pydev import pydevd
import math
from common import *
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
	def __init__(self, features, is_new_point, is_ziped, font_size):
		self.features = features
		self.fontsize = u'xx-small'
		if font_size == 2:
			self.fontsize = u'small'
		elif font_size == 3:
			self.fontsize = u'medium'
		elif font_size == 4:
			self.fontsize = u'large'
		self.is_ziped = is_ziped
		self.list_contours = []  # 1 (если полигон) или N конутуров мультполигона
		self.list_ring = []  # контуры текущего полигона
		self.catalog = u'<HEAD><meta http-equiv=\"Content-type\" ' \
		               u'content=\"text/html;charset=UTF-8\"><style>table { font-size: '+self\
			.fontsize+u'; font-family: Arial;} p { font-size: '+self.fontsize+u'; font-family: Arial;}</style><HEAD/>'
		self.multi = False
		#self.layerUc = get_vector_layer_by_name(gln['ln_uchastok'])
		self.area = []
		self.perimeter = []
		self.is_new_point = is_new_point
		self.prepare_data()
		self.calculate()

	def prepare_data(self):
		# используется принцип openland - мультиполигоны не используются
		# многоконтурные ЗУ собираются по ID из простых полиногов
		if len(self.features) > 1:
			self.multi = True
			for feat in self.features:
				geom = feat.geometry()
				self.area.append(round(geom.area(), 0))
				self.perimeter.append(round(geom.length(), 2))
				self.list_ring = []
				self.parse_polygon(geom.asPolygon())
		else:
			geom = self.features[0].geometry()
			self.area.append(round(geom.area(), 0))
			self.perimeter.append(round(geom.length(), 2))
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
		iter_contour = 0
		iter_ring = 0
		number = 1
		catalog_all_data = u''  # вся ведомость со всеми контурами
		for polygon in self.list_contours:
			contour_table = u''  # ведомость одного контура
			catalog_data = u''
			catalog_header = u''
			if self.multi and len(self.list_contours) > 1:
				contour_header = u'<h3>Контур ' + unicode(iter_contour + 1) + u'</h3>'
				contour_table += contour_header
			contour_table += u'<TABLE CELLSPACING=\"0\" COLS=\"5\" BORDER=\"0\"><COLGROUP SPAN=\"5\" WIDTH=\"120\"></COLGROUP>{0}</TABLE>'
			empty = u'<TD STYLE=\"border-top: 1px solid #000000; border-bottom: 1px solid #000000; ' \
			        u'border-left: 1px solid #000000; border-right: 1px solid #000000\" HEIGHT=\"17\" ALIGN=\"CENTER\">{0}</TD>'
			catalog_header += empty.format(u'№')
			catalog_header += empty.format(u'X, м')
			catalog_header += empty.format(u'Y, м')
			catalog_header += empty.format(u'Дирекционный угол')
			catalog_header += empty.format(u'Расстояние, м')
			catalog_data += u'<TR>{0}</TR>'.format(catalog_header)
			for ring in polygon:
				iter_node = 0
				first_num = number  # номер первой точки внутреннего контура
				for point in ring:
					if self.is_new_point:
						point_num = u'н' + unicode(number)
						first_pt_num = u'н' + unicode(first_num)
					else:
						point_num = unicode(number)
						first_pt_num = unicode(first_num)

					if iter_node > 0 and iter_node < len(ring) - 1:
						point1 = Point(ring[iter_node - 1][0],
						               ring[iter_node - 1][1])
						point2 = Point(ring[iter_node][0],
						               ring[iter_node][1])
						measure = Measure(point1, point2)
						catalog_data += self.decorate_value_html(
							[point_num, unicode(ring[iter_node - 1][0]),
							 unicode(ring[iter_node - 1][1]), measure.angle,
							 unicode(measure.lenght)])
						number += 1

					elif iter_node == len(ring) - 1:
						point1 = Point(ring[iter_node - 1][0], ring[iter_node - 1][1])
						point2 = Point(ring[0][0], ring[0][1])
						measure = Measure(point1, point2)

						catalog_data += self.decorate_value_html(
							[point_num, unicode(ring[iter_node - 1][0]),
							 unicode(ring[iter_node - 1][1]), measure.angle,
							 unicode(measure.lenght)])
						catalog_data += self.decorate_value_html(
							[first_pt_num, unicode(ring[0][0]), unicode(ring[0][1]), u'', u''], True)

						number += 1

					iter_node += 1
				iter_ring += 1
				if len(self.list_ring) > 1:
					if iter_ring != len(self.list_ring):
						catalog_data += empty.format('--')+empty.format('--')+\
						                empty.format('--')+empty.format('--')+empty.format('--')

			catalog_all_data += catalog_data
			self.catalog += contour_table.format(catalog_data)
			self.catalog += u'<p>Площадь: {0} кв.м Периметр: {1} м</p>'.format(self.area[iter_contour], self.perimeter[
				iter_contour])
			iter_contour += 1
			iter_ring = 0
		if self.multi:
			self.catalog += u'<BR/><h5>Общая площадь: {0} кв.м Общий периметр: {1} м<h5>'.format(str(sum(self.area, 0)), str(sum(self.perimeter, 0)))

	def decorate_value_html(self, value, last=False):
		row1 = u'<TR>{0}</TR>'
		row2 = u'<TR>{0}</TR>'
		empty = u'<TD STYLE=\"border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: ' \
		        u'1px solid #000000; border-right: 1px solid #000000\" HEIGHT=\"17\" ALIGN=\"CENTER\">{0}</TD>'
		num = empty.format(value[0])
		x = empty.format(value[1])
		y = empty.format(value[2])
		a = empty.format(value[3])
		l = empty.format(value[4])
		data1 = num + x + y + empty.format('</BR>') + empty.format('</BR>')
		data2 = empty.format('</BR>') + empty.format('</BR>') + empty.format('</BR>') + a + l
		if not last:
			return row1.format(data1) + row2.format(data2)
		else:
			return row1.format(data1)
