# -*- coding: utf-8 -*-
__name__ = 'createpolygonfrompoint'
__version__ = '0.1'
__author__ = 'Filippov Vladislav'

from qgis.core import *
from common import *


class CreatePolygonFromPoints():
    def __init__(self, iface):
        self.iface = iface

    def createpolygon(self):
        parcellayer = get_vector_layer_by_name(u'Участок')
        idMsk = idCurrentMSK()
        if (self.iface.mapCanvas().currentLayer() is not None) \
            and (self.iface.mapCanvas().currentLayer().selectedFeatures() is not None):
            points = self.iface.mapCanvas().currentLayer().selectedFeatures()
            pgeom = []
            for point in points:
                geom = point.geometry().asPoint()
                pgeom.append(QgsPoint(geom.x(), geom.y()))

            if not parcellayer is None:
                pg = QgsGeometry.fromPolygon([pgeom])
                feat = QgsFeature()
                feat.initAttributes(len(parcellayer.dataProvider().attributeIndexes()))
                feat.setAttribute(parcellayer.fieldNameIndex('id_msk'), idMsk)
                feat.setGeometry(pg)
                if parcellayer.dataProvider().addFeatures([feat]):
                    pass
                else:
                    QMessageBox.warning(self.iface.mainWindow(), u'Внимание!', u'Не удалось добавить участок')
        else:
            QMessageBox.warning(self.iface.mainWindow(), u'Внимание!', u'Нет слоя \'Участок\'. Негде создавать участок')

    def createmultipolygon(self):
        pass