# -*- coding: utf-8 -*-
__name__ = 'coordCatalog'
__version__ = '0.1'
__author__ = 'Filippov Vladislav'

import math
from qgis.core import QGis


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
        self.calclenght(self)
        self.calcangle(self)

    def getdata(self):
        return self.angle + ';' + self.lenght

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
                self.calcdegmin(self)
            elif (self.ddx < 0) and (self.ddy > 0):
                self.ang = 180 - alfa
                self.calcdegmin(self)
            elif (self.ddx < 0) and (self.ddy < 0):
                self.ang = 180 + alfa
                self.calcdegmin(self)
            elif (self.ddx > 0) and (self.ddy < 0):
                self.ang = 360 - alfa
                self.calcdegmin(self)
            elif (self.ddx > 0) and (self.ddy == 0):
                self.angle = u'0°0,0\''
            elif (self.ddx < 0) and (self.ddy == 0):
                self.angle = u'180°0,0\''

    def calcdegmin(self):
        a = int(self.ang)
        minute = (self.ang - a) * 60
        self.angle = str(a) + u'°' + '{:.2\'}'.format(minute)


class CatalogData():

    def __init__(self, feature):
        self.feature = feature
        self.number_ring = 0
        self.number_contours = 0
        self.list_contours = []
        self.prepare_data()

    def prepare_data(self):
        geom = self.feature.geometry()
        # 1 x1 y1 angTo2 lengTo2
        # 2 x2 y2 angTo3 lengTo3
        # 3 x3 y3 angTo1 lengTo1
        # 1 x1 y1
        iter = 1
        if geom.isMultipart():
            polygons = geom.asMultiPolygon()
            for polygon in polygons:
                self.number_contours += 1
                self.number_ring = 0
                list_ring = []
                for ring in polygon:
                    self.number_ring += 1
                    list_ponts = []
                    #numberNode = len(ring)
                    for node in ring:
                        # Тут происходит переход к геодезической СК
                        iter += 1
                        x = round(node.y(), 2)
                        y = round(node.x(), 2)
                        list_ponts.append([x, y])
                        #list_data = []  #'numbers', 'x', 'y', 'angles', 'lenghts'
                        #if iter > 1 and iter != len(ring) - 1:
                        #    measure = Measure(list_ponts[iter], list_ponts[iter - 1])
                        #    list_data.append([iter, x, y, measure.angle, measure.lenght])
                        #elif iter == len(ring):
                        #    measure = Measure(list_ponts[iter], list_ponts[0])
                        #    list_data.append([iter, list_ponts[iter][0],
                        #                      list_ponts[iter][1], measure.angle, measure.lenght])
                    #list_ring.append(list_data)
                    list_ring.append(list_ponts)
                self.list_contours.append(list_ring)
        else:
            self.number_ring = 0
            polygon = geom.asPolygon()
            for ring in polygon:
                self.number_ring += 1
                list_ponts = []
                #numberNode = len(ring)
                list_ring = []
                for node in ring:
                    # Тут происходит переход к геодезической СК
                    iter += 1
                    x = round(node.y(), 2)
                    y = round(node.x(), 2)
                    list_ponts.append([x, y])
                    #list_data = []  #'numbers', 'x', 'y', 'angles', 'lenghts'
                    #if iter > 1 and iter != len(ring)-1:
                    #    measure = Measure(list_ponts[iter], list_ponts[iter-1])
                    #    list_data.append([iter, x, y, measure.angle, measure.lenght])
                    #elif iter == len(ring):
                    #    measure = Measure(list_ponts[iter], list_ponts[0])
                    #    list_data.append([iter, list_ponts[iter][0],
                    #                      list_ponts[iter][1], measure.angle, measure.lenght])

                #list_ring.append(list_data)
                list_ring.append(list_ponts)
                self.list_contours.append(list_ring)