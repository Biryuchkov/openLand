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
            alfa = math.fabs(math.atan(self.ddy/self.ddx) \
                * (180/math.pi))
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
        self.angle = unicode(a) + u'°' + unicode('{0:.0f}'.format(minute)) + u'\''


class CatalogData():

    def __init__(self, feature, is_new_point):
        self.feature = feature
        self.number_contours = 0
        self.list_contours = []  # 1 (если полигон) или N конутуров мультполигона
        self.list_ring = []  # контуры текущего полигона
        self.list_data = []
        self.is_new_point = is_new_point
        self.prepare_data()
        self.calculate()

    def prepare_data(self):
        geom = self.feature.geometry()
        if geom.isMultipart():
            polygons = geom.asMultiPolygon()
            for polygon in polygons:
                #self.number_contours += 1
                #self.number_ring = 0
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

            #list_ring.append(list_data)
            self.list_ring.append(list_ponts)
            self.list_contours.append(self.list_ring)
            #self.list_contours[self.number_contours].append(self.list_ring)

    # 1 x1 y1 angTo2 lengTo2
    # 2 x2 y2 angTo3 lengTo3
    # 3 x3 y3 angTo1 lengTo1
    # 1 x1 y1
    def calculate(self):
        iter_r = 0
        iter_c = 0
        number = 1
        for polygon in self.list_contours:
            first_num = number
            #'numbers', 'x', 'y', 'angles', 'lenghts'
            for ring in polygon:
                if self.is_new_point:
                    point_num = u'н' + str(number)
                    first_pt_num = u'н' + str(first_num)
                else:
                    point_num = str(number)
                    first_pt_num = str(first_num)
                point1 = Point(ring[iter_r][0], ring[iter_r][1])
                point2 = Point(ring[iter_r + 1][0], ring[iter_r + 1][1])
                measure = Measure(point1, point2)
                self.list_data.append([point_num, unicode(ring[iter_r][0]), unicode(ring[iter_r][1]), measure.angle,
                                       unicode(measure.lenght)])
                if iter_r == len(ring)-1:
                    point1 = Point(ring[iter_r][0], ring[iter_r][1])
                    point2 = Point(ring[0][1])
                    measure = Measure(point1, point2)
                    self.list_data.append(
                        [point_num, unicode(ring[iter_r][0]), unicode(ring[iter_r][1]), measure.angle,
                         unicode(measure.lenght)])
                    self.list_data.append(
                        [first_pt_num, unicode(ring[0][0]), unicode(ring[0][1]), u'', u''])
                number += 1
            iter_c += 1
            number = 1