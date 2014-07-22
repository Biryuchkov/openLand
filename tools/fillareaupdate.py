# -*- coding: utf-8 -*-
'''
/***************************************************************************
 fillAreaUpdate for openland (cadastral engineer tools)
 copyright            : (C) 2012 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from common import *
from math import sqrt
from fillareaupdate_ui import Ui_fillAreaUpdate

class fillAreaUpdate(QDialog,  Ui_fillAreaUpdate):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        QObject.connect(self.pushButtonOk, SIGNAL("clicked()"), self.doCreate)
        QObject.connect(self.pushButtonCancel, SIGNAL("clicked()"), self.doCancel)

        self.selection      = []
        self.selectionCount = 0

    def doCreate(self):
        self.progress       = QProgressBar()
        progressMessageBar  = self.iface.messageBar().createMessage(u'Расчёт уточнённых площадей контуров...')
        self.progress.setMaximum(self.selectionCount)
        self.progress.setAlignment(Qt.AlignLeft|Qt.AlignVCenter)
        progressMessageBar.layout().addWidget(self.progress)
        self.iface.messageBar().pushWidget(progressMessageBar, 
                                           self.iface.messageBar().INFO)
        idParent    = 0
        idContour   = 0
        idKat       = ''
        idVid       = ''
        dictArea    = {}
        n           = 0
        
        for everyParcel in self.selection:
            dictArea[int(everyParcel.id())] = everyParcel.geometry().area()

        listAttributes = attributesFromSelection('ln_uchastok', 
                                                 ['id', 'oboznachenie_na_plane', 'id_kategoriya', 'id_vid_uchastka'])
        listAllValues = []
        for everyParcel in listAttributes:
            idContour = int(everyParcel['id'])
            idKat = everyParcel['id_kategoriya']
            idVid = everyParcel['id_vid_uchastka']
            if (idKat < '000000000000') or (idVid != gv['oneContourCode']):
                QMessageBox.information(self.iface.mainWindow(), u'Ошибка обработки контура', 
                                                                 u'Не указана категория земель или полигон из числа выбранных не является контуром.\nНе обработан участок с обозначением ' + everyParcel['oboznachenie_na_plane'])
            else:
                idParent = valueByFieldValue('pb_parcel_parcel', 'id_parent', 'i', 'id_children', idContour, 'i')
                if idParent < 1:
                    QMessageBox.information(self.iface.mainWindow(), u'Ошибка обработки контура', 
                                                                     u'Не найден многоконтурный участок\nНе обработан участок с обозначением ' + everyParcel['oboznachenie_na_plane'])
                else:
                    roundArea       = int(self.spinBoxRoundArea.value())
                    roundInaccuracy = int(self.spinBoxRoundInaccuracy.value())
                    plosh = round(float(dictArea[idContour]), roundArea)
                    if plosh < 0.01:
                        QMessageBox.information(self.iface.mainWindow(), u'Ошибка обработки контура', 
                                                                         u'Площадь меньше одного квадратного сантиметра\nНе обработан участок с обозначением ' + everyParcel['oboznachenie_na_plane'])
                    else:
                        pogr = round(sqrt(plosh) * 3.5 * accuracyById(idContour), roundInaccuracy)
                        if pogr < 1: 
                            pogr = 1
                    
                        listValues = []
                        listValues.append(idContour)
                        listValues.append(gv['accurateArea'])
                        listValues.append(plosh)
                        listValues.append(gv['squareMeter'])
                        listValues.append(pogr)

                        listAllValues.append(listValues)

            n += 1
            self.progress.setValue(n)

        if len(listAllValues) > 0:
            listNames = ['id_uchastok', 'id_vid_ploshadi', 'ploshad', 'id_edinicy_izmereniya', 'pogreshnost_izmereniya']
            if not insertFeatures('pb_ploshad', listNames, listAllValues):
                QMessageBox.information(self.iface.mainWindow(), u'Ошибка', u'Площади контуров не добавлены.')
            
        self.iface.messageBar().clearWidgets()
        self.close()

    def doCancel(self):
        self.close()

#        QMessageBox.information(self.iface.mainWindow(), 'test', str())
                                          