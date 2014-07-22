# -*- coding: utf-8 -*-
'''
/***************************************************************************
 splitParcel for openLand (cadastral engineer tools)
 copyright            : (C) 2013 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from common import *
from splitparcel_ui import Ui_SplitParcel

import uuid

class splitParcel(QDialog,  Ui_SplitParcel):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        QObject.connect(self.pushButtonOk, SIGNAL("clicked()"), self.doSplit)
        QObject.connect(self.pushButtonCancel, SIGNAL("clicked()"), self.doCancel)

        self.layerParcel = get_vector_layer_by_name(gln['ln_uchastok'])
        self.layerBorder = get_vector_layer_by_name(gln['ln_granica'])

        self.featParcel = QgsFeature()
        self.featBorder = QgsFeature()

        self.prevKn = ''
        self.currentSpatialElement = 0
        self.orderPoint = 0
        self.numberPoint = 0

    def toPrepare(self):
        selectParcel = self.layerParcel.selectedFeatures()
        lsParcel = len(selectParcel)
        selectBorder = self.layerBorder.selectedFeatures()
        lsBorder = len(selectBorder)
        if lsParcel == lsBorder == 1:
            idParcel = int(selectParcel[0].id())
            listParent = attributesByKeys('pb_parcel_parcel', 'id_children', [idParcel], ['id_parent'])
            if len(listParent):
                QMessageBox.warning(self.iface.mainWindow(), u"Ошибка выбора данных", 
                                                             u'Выбранный полигон является контуром \
                                                             (входящим в ЕЗП, ЧЗУ)')
                return False

            self.featParcel = selectParcel[0]
            self.featBorder = selectBorder[0]
            self.prevKn = self.featParcel.attributes()[self.layerParcel.fieldNameIndex('kn')]
            self.prevKn = reNull(self.prevKn, '')

            self.lineEditKN.setText(self.prevKn)
            for i in self.featBorder.geometry().asPolyline():
                self.listWidget.addItem(str(i.x()) +'   '+ str(i.y()))

            return True

        else:
            QMessageBox.warning(self.iface.mainWindow(), u"Ошибка выбора данных", 
                                                         u'Необходимо выбрать только одну границу и \
                                                         один земельный участок для раздела.')
            return False
    
    def doSplit(self):
        attributesParcel = attributesFromSelection('ln_uchastok', 
                                                   attributesNamesParcel)
        if len(attributesParcel) == 1:
            attributesParcel = attributesParcel[0]
        geomParcel = self.featParcel.geometry()
        geomBorder = self.featBorder.geometry()
        splitParcelRezult = geomParcel.splitGeometry(geomBorder.asPolyline(), True)

        if splitParcelRezult[0] == 0:
            idParcelPrev =  self.featParcel.id()

            geomSplitParcel1 = roundPointsCoordinates(geomParcel)
            guid1 = str(uuid.uuid4())

            listNames  = ['id_kvartal', 'id_vid_uchastka', 'id_kategoriya', 
                          'id_sposob_obrazovaniya', 'guid', 'id_msk', 'geom']
            listValues = []
            listValues.append(attributesParcel['id_kvartal'])     
            listValues.append(attributesParcel['id_vid_uchastka'])
            listValues.append(attributesParcel['id_kategoriya'])
            listValues.append(gv['methodSection'])
            listValues.append(guid1)
            listValues.append(attributesParcel['id_msk'])
            listValues.append(geomSplitParcel1)

            if insertFeatures('ln_uchastok', listNames, [listValues]):
                idParcel1 = valueByFieldValue('ln_uchastok', 'id', 'i', 
                                              'guid', guid1, 's')
            if (idParcel1 > 0):
                # кадастровые номера
                listNames  = ['id_uchastok', 'tip_kn', 'kn']
                listValues = [idParcel1, gv['prevKn'], self.prevKn]
                insertFeatures('pb_kn', listNames, [listValues])

                # местоположения
                idAddress = valueByFieldValue('pb_uchastok_adres', 'id_adres', 
                                              'i', 'id_uchastok', idParcelPrev, 'i')
                if idAddress > 0:
                    listNames  = ['id_uchastok', 'id_adres']
                    listValues = [idParcel1, idAddress]
                    insertFeatures('pb_uchastok_adres', listNames, [listValues])

                # точки - границы
                self.doPointsFromGeometry(geomSplitParcel1, idParcel1)
            
                for geomSplitParcel2 in splitParcelRezult[1]:
                    geomSplitParcel2 = roundPointsCoordinates(geomSplitParcel2)
                    guid2 = str(uuid.uuid4())

                    listNames  = ['id_kvartal', 'id_vid_uchastka', 'id_kategoriya', 
                                  'id_sposob_obrazovaniya', 'guid', 'id_msk', 'geom']
                    listValues = []
                    listValues.append(attributesParcel['id_kvartal'])     
                    listValues.append(attributesParcel['id_vid_uchastka'])
                    listValues.append(attributesParcel['id_kategoriya'])
                    listValues.append(gv['methodSection'])
                    listValues.append(guid2)
                    listValues.append(attributesParcel['id_msk'])
                    listValues.append(geomSplitParcel2)

                    if insertFeatures('ln_uchastok', listNames, [listValues]):
                        idParcel2 = valueByFieldValue('ln_uchastok', 'id', 'i', 'guid', guid2, 's')

                    if (idParcel2 > 0):
                        # кадастровые номера
                        listNames  = ['id_uchastok', 'tip_kn', 'kn']
                        listValues = [idParcel2, gv['prevKn'], self.prevKn]
                        insertFeatures('pb_kn', listNames, [listValues])

                        # местоположения
                        idAddress = valueByFieldValue('pb_uchastok_adres', 'id_adres', 
                                                      'i', 'id_uchastok', idParcelPrev, 'i')
                        if idAddress > 0:
                            listNames  = ['id_uchastok', 'id_adres']
                            listValues = [idParcel2, idAddress]
                            insertFeatures('pb_uchastok_adres', listNames, [listValues])

                        # точки - границы
                        self.doPointsFromGeometry(geomSplitParcel2, idParcel2)
            
                    else:
                        QMessageBox.warning(self.iface.mainWindow(), u"Ошибка операции", 
                                                                     u'Не удалось создать один или более новых ЗУ')
                updateFeature('ln_uchastok', idParcelPrev, ['pre'], [1])

                self.layerParcel.removeSelection()
                self.layerBorder.removeSelection()
            
            else:
                QMessageBox.warning(self.iface.mainWindow(), u"Ошибка операции", 
                                    u'Не удалось создать один или более новых ЗУ. \
                                    Выполнение операции раздела ЗУ прервано.')
            
        else:
            QMessageBox.warning(self.iface.mainWindow(), u"Ошибка операции", 
                                                         u'Не удалось произвести раздел геометрии. \
                                                         Проконтролируйте линию раздела! \
                                                         Выполнение операции раздела ЗУ прервано.')
            return

        self.close()

    def doPointsFromGeometry(self, geom, idParcel):
        if (geom != None) and geom.isGeosValid() and (idParcel > 0):    
            self.orderPoint = 1
            self.numberPoint = 1

            if geom.isMultipart():
                polygons = geom.asMultiPolygon()
                for polygon in polygons:
                    self.currentSpatialElement = 0
                    for ring in polygon:
                        listPoint = []
                        self.currentSpatialElement += 1
                        for point in ring:
                            x = round(point.x(), 2)
                            y = round(point.y(), 2)
                            listPoint.append([x, y])

                        self.doAppend(listPoint, idParcel)

            else:
                self.currentSpatialElement = 0
                polygon = geom.asPolygon()
                for ring in polygon:
                    listPoint = []
                    self.currentSpatialElement += 1
                    for point in ring:
                        x = round(point.x(), 2)
                        y = round(point.y(), 2)
                        listPoint.append([x, y])

                    self.doAppend(listPoint, idParcel)
    
    def doAppend(self, listPoint, idParcel):
        listPoint = checkClockWise(listPoint)
        idMSK = idCurrentMSK()
        listAllValues = []
        for i in range(len(listPoint) - 1):
            l = [QgsPoint(listPoint[i][0],   listPoint[i][1]), 
                 QgsPoint(listPoint[i+1][0], listPoint[i+1][1])] 
            geo = QgsGeometry.fromPolyline(l)

            if (geo != None) and geo.isGeosValid():
                listNames  = ['id_uchastok', 'uslovnyy_znak', 'id_msk', 'geom']
                listValues = [idParcel, 0, idMSK, geo]
                listAllValues.append(listValues)

        insertFeatures('ln_granica', listNames, listAllValues)
        listPoint.pop() 

        listAllValues = []
        accuracy = accuracyById(idParcel)
        for point in listPoint:
            geo = QgsGeometry.fromPoint(QgsPoint(point[0], point[1]))
            if (geo != None) and geo.isGeosValid():
                listNames  = ['id_uchastok', 'x', 'y', 'poryadok_obhoda', 
                              'nomer', 'prefiks_nomera', 'pogreshnost', 
                              'nomer_chasti', 'id_msk', 'geom']
                listValues = [idParcel, point[1], point[0], self.orderPoint,
                              self.numberPoint, u'н', accuracy,
                              self.currentSpatialElement, idMSK, geo]
                listAllValues.append(listValues)
        
        insertFeatures('ln_tochka', listNames, listAllValues)
        
    def doCancel(self):
        self.close()

#        QMessageBox.information(self.iface.mainWindow(), u'test', str())
