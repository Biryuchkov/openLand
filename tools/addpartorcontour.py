# -*- coding: utf-8 -*-
'''
/***************************************************************************
 addPartOrContour for openLand (cadastral engineer tools)
 copyright            : (C) 2013 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from common import *
from addpartorcontour_ui import Ui_addPartOrContour

class addPartOrAddContour(QDialog,  Ui_addPartOrContour):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        QObject.connect(self.pushButtonOk, SIGNAL("clicked()"), self.doAdd)
        QObject.connect(self.pushButtonCancel, SIGNAL("clicked()"), self.doCancel)

        self.selectionCount = 0
        self.id2add = []

    def toPrepare(self):
        listNames = ['id', 'kn', 'id_vid_uchastka']
        attributesSelection = attributesFromSelection('ln_uchastok', listNames)
        ls = len(attributesSelection)
        if ls > 1:
            listContour = []
            listPart = []
            listUnited = []
            listNewChild = []

            for every in attributesSelection:
                idEvery = int(every['id'])
                if every['kn'] == None:
                    knEvery = ''
                else:
                    knEvery = every['kn']

                if every['id_vid_uchastka'] == gv['oneContourCode']:
                    listContour.append([idEvery, knEvery])

                elif every['id_vid_uchastka'] == gv['onePartCode']:
                    listPart.append([idEvery, knEvery])

                elif every['id_vid_uchastka'] in (gv['isolatedParcelCode'], 
                                                  gv['nominalParcelCode']):
                    listUnited.append([idEvery, knEvery])

                else:
                    listNewChild.append([idEvery, knEvery])

            if len(listContour) == 1:
                listIdParent = attributesByKeys('pb_parcel_parcel', 'id_children', 
                                            [listContour[0][0]], ['id_parent'])
                if len(listIdParent) == 1:
                    idParent = int(listIdParent[0]['id_parent'])
                    attributesParent = attributesByKeys('ln_uchastok', 'id', 
                                                        [idParent], ['id', 'kn'])
                    if len(attributesParent) > 0:
                        self.selectionCount = len(listNewChild)
                        self.lineEditSelectedCount.setText(str(self.selectionCount))
                        self.radioButtonIsContour.setChecked(True)
                        self.id2add = listNewChild
                        for every in attributesParent:
                            idEvery = str(int(every['id']))
                            if every['kn'] == None:
                                knEvery = ''
                            else:
                                knEvery = every['kn']

                            self.comboBoxZU.addItem(knEvery, idEvery)

                        self.comboBoxZU.setCurrentIndex(0)

            elif len(listUnited) == 1:
                listIdParent = attributesByKeys('pb_parcel_parcel', 'id_children', 
                                                [listUnited[0][0]], ['id_parent'])
                if len(listIdParent) == 1:
                    idParent = int(listIdParent[0]['id_parent'])
                    attributesParent = attributesByKeys('ln_uchastok', 'id', 
                                                        [idParent], ['id', 'kn'])
                    if len(attributesParent) > 0:
                        self.selectionCount = len(listNewChild)
                        self.lineEditSelectedCount.setText(str(self.selectionCount))
                        self.radioButtonIsNominal.setChecked(True)
                        self.id2add = listNewChild
                        for every in attributesParent:
                            idEvery = str(int(every['id']))
                            if every['kn'] == None:
                                knEvery = ''
                            else:
                                knEvery = every['kn']

                            self.comboBoxZU.addItem(knEvery, idEvery)

                        self.comboBoxZU.setCurrentIndex(0)

            elif len(listPart) == 1:
                listIdParent = attributesByKeys('pb_parcel_parcel', 'id_children', 
                                                [listPart[0][0]], ['id_parent'])
                if len(listIdParent) > 0:
                    idParent = int(listIdParent[0]['id_parent'])
                    attributesParent = attributesByKeys('ln_uchastok', 'id', 
                                                        [idParent], ['id', 'kn'])
                    if len(attributesParent) > 0:
                        self.selectionCount = len(listNewChild)
                        self.lineEditSelectedCount.setText(str(self.selectionCount))
                        self.radioButtonIsPart.setChecked(True)
                        self.id2add = listNewChild
                        for every in attributesParent:
                            idEvery = str(int(every['id']))
                            if every['kn'] == None:
                                knEvery = ''
                            else:
                                knEvery = every['kn']

                            self.comboBoxZU.addItem(knEvery, idEvery)

                        self.comboBoxZU.setCurrentIndex(0)

            else:
                self.selectionCount = len(listNewChild) - 1
                self.lineEditSelectedCount.setText(str(self.selectionCount))
                self.radioButtonIsPart.setChecked(True)
                self.id2add = listNewChild
                for every in listNewChild:
                    idEvery = str(int(every[0]))
                    if every[1] == None:
                        knEvery = ''
                    else:
                        knEvery = every[1]

                    self.comboBoxZU.addItem(knEvery, idEvery)

                self.comboBoxZU.setCurrentIndex(0)

            return True

        else:
            QMessageBox.warning(self.iface.mainWindow(), u"Ошибка выбора данных", 
                                                         u'Необходимо выбрать не менее двух объектов для выполнения процедуры.\n 1. «Что добавить» - один и более. \n 2. «К чему добавить» - выбрать один входящий в ЕЗП или контур МЗУ.')
            return False
    
    def doAdd(self):
        if len(self.id2add) > 0:
            idParent = int(self.comboBoxZU.itemData(self.comboBoxZU.currentIndex()))

            if idParent > 0:
                self.progressBar.setValue(0)
                n = 1

                listAllValues = []
                for every in self.id2add:
                    if not (every[0] == idParent):
                        if self.radioButtonIsPart.isChecked():
                            listValues = []
                            listValues.append(gv['onePartCode'])

                        elif self.radioButtonIsContour.isChecked():
                            listValues = []
                            listValues.append(gv['oneContourCode'])

                        elif self.radioButtonIsNominal.isChecked():
                            listValues = []
                            listValues.append(gv['isolatedParcelCode'])

                        updateFeature('ln_uchastok', every[0], 
                                      ['id_vid_uchastka'], listValues)
                        
                        listValues = []
                        listValues.append(idParent)
                        listValues.append(every[0])

                        listAllValues.append(listValues) 

                    self.progressBar.setValue(int(n / self.selectionCount * 100))
                    n += 1

                insertFeatures('pb_parcel_parcel', ['id_parent', 'id_children'], 
                                listAllValues)

                self.progressBar.setValue(100)

        self.close()
            
    def doCancel(self):
        self.close()

#        QMessageBox.information(self.iface.mainWindow(), 'test', str())
