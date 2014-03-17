# -*- coding: utf-8 -*-
'''
/***************************************************************************
 xml2print for openland (cadastral engineer tools)
 copyright            : (C) 2012 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from qgis.gui import *
from datetime import *
from math import *
from xml.etree.ElementTree import *
from common import *
from xml2print_ui import Ui_XML2Print
import os, shutil, platform, codecs, zipfile, webbrowser

class xml2Print(QDialog, Ui_XML2Print):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        self.fileXmlName = ''
        self.fileOdtName = ''
        self.pathIn = ''
        self.pathOut = ''
        self.pathCurrent = ''
        self.pathPrint = ''
        self.pathTpl = ''
        self.pathXslt = '' 
        self.pathStatement = '' 
        self.versionMp = ''

        QObject.connect(self.pushButtonFileXML, SIGNAL("clicked()"), self.selectFileXML)
        QObject.connect(self.pushButtonPrint, SIGNAL("clicked()"), self.startPrint)
        QObject.connect(self.pushButtonClose, SIGNAL("clicked()"), self.closeDialog)

        self.comboBoxDocumentType.addItem(u'Межевой план', '01')        
        self.comboBoxDocumentType.addItem(u'Ведомость вычисления площади ЗУ в МСК-56-3 и МСК Орска', '02')        
        self.comboBoxDocumentType.setCurrentIndex(0)

        self.dictTplFile = {}
        self.dictTplFile['03'] = 'V03_STD_MP.zip'
        self.dictTplFile['04'] = 'V04_STD_MP.zip'

        self.dictXsltFile = {}
        self.dictXsltFile['03'] = 'STD_MP_03.xslt'
        self.dictXsltFile['04'] = 'STD_MP_04.xslt'

    def toPrepare(self, pathCurrent):
        self.pathCurrent = pathCurrent

    def selectFileXML(self):
        self.fileXmlName = QFileDialog.getOpenFileName(self, u'Укажите XML файл для создания документа', self.pathIn, u'XML файлы(*.xml *.XML)')
        if self.fileXmlName > ' ':
            self.fileXmlName = unicode(self.fileXmlName)
            self.pathIn = os.path.abspath(os.path.dirname(self.fileXmlName))

            self.lineEditFileXML.setText(self.fileXmlName)
            self.listWidgetEvents.addItem('')
            self.listWidgetEvents.addItem(u'Выбран файл ' + self.fileXmlName)

            xmlTree = parse(self.fileXmlName)
            root = xmlTree.getroot()

            eDocument = root.find('eDocument')
            if (eDocument != None): 
                self.versionMp = eDocument.get('Version')
            else: 
                self.versionMp = ''

    def startPrint(self):
        if self.comboBoxDocumentType.itemData(self.comboBoxDocumentType.currentIndex()) == '01' and self.fileXmlName == '':
            self.highlightLine(u'Ошибка! Файл XML не указан.')
            return

        if self.pathOut > ' ':
            tmp = self.pathOut + u'/Document.odt'
        else: 
            tmp = u'Document.odt'
            
        self.fileOdtName = QFileDialog.getSaveFileName(self, u'Сохранить документ как ', tmp, u'ODT файлы(*.odt *.ODT)')

        if self.fileOdtName > ' ':
            self.fileOdtName = unicode(self.fileOdtName)
            self.pathOut = os.path.abspath(os.path.dirname(self.fileOdtName))
            
            self.listWidgetEvents.addItem('')
            self.listWidgetEvents.addItem(datetime.now().strftime('%Y-%m-%d %H:%M:%S'))                 
            self.listWidgetEvents.addItem(u'Начало создания документа для печати ' + self.fileOdtName)                 

            self.pathPrint = self.pathCurrent + '/print'
            self.pathTpl = self.pathPrint + '/tpl'
            self.pathXslt = self.pathPrint + '/xslt'
            self.pathStatement = self.pathPrint + '/statement'
            
            # Межевой план
            if self.comboBoxDocumentType.itemData(self.comboBoxDocumentType.currentIndex()) == '01':
                os.chdir(self.pathPrint)

                tplFile = self.dictTplFile[self.versionMp]
                xlstFile = self.dictXsltFile[self.versionMp]

                if os.path.exists('openlandtempdoc.zip'): os.remove('openlandtempdoc.zip')
                shutil.copyfile(self.pathTpl + '/' + tplFile, 'openlandtempdoc.zip')

                if 'Windows' in platform.system():
                    cmd = 'xslt_mp.cmd xslt/' + xlstFile + ' \"' + self.fileXmlName.encode('cp1251') + '\"'
                    os.system(cmd)
                else:
                    cmd = 'sh xslt_mp.sh xslt/' + xlstFile + ' ' + self.fileXmlName
                    os.system(cmd)
                
                z = zipfile.ZipFile('openlandtempdoc.zip', 'a', zipfile.ZIP_DEFLATED)
                z.write('content.xml')
                z.close()

                os.remove('content.xml')
                shutil.move('openlandtempdoc.zip', self.fileOdtName)
                self.listWidgetEvents.addItem(u'Создан документ для печати ' + self.fileOdtName)                 
                
            # Ведомость вычисления площади ЗУ в разных системах координат
            elif self.comboBoxDocumentType.itemData(self.comboBoxDocumentType.currentIndex()) == '02':
                layerUch = get_vector_layer_by_name(gln['ln_uchastok'])
                selection = layerUch.selectedFeatures()
                if not (len(selection) == 1):
                    self.highlightLine(u'Предварительно необходимо выбрать только один земельный участок!')
                    return
                else:
                    geom = QgsGeometry(selection[0].geometry())
                    sourcePoints = allPointsPolygon(geom)
                    sourceArea = round(geom.area(), 0)
                    
                    defineProj4 = '+proj=tmerc +lat_0=0 +lon_0=58.03333333333 +k=1 +x_0=3300000 +y_0=-5309414.7 +ellps=krass +units=m +no_defs'
                    sourceCRS = QgsCoordinateReferenceSystem()
                    sourceCRS.createFromProj4(defineProj4)
#                    sourceCRS = layerUch.crs()

#                    defineProj4 = '+proj=tmerc +lat_0=0 +lon_0=58.5 +k=1 +x_0=10000 +y_0=-5670000 +ellps=krass +towgs84=23.92,-141.27,-80.9,0,0.35,0.82,-0.12 +units=m +no_defs'
                    defineProj4 = '+proj=tmerc +lat_0=0 +lon_0=58.5 +k=1 +x_0=10000 +y_0=-5670000 +ellps=krass +units=m +no_defs'
                    targetCRS = QgsCoordinateReferenceSystem()
                    targetCRS.createFromProj4(defineProj4)

                    coordTransform = QgsCoordinateTransform(sourceCRS, targetCRS)
                    geom.transform(coordTransform)
                    targetPoints = allPointsPolygon(geom)
                    targetArea = round(geom.area(), 0)

                    sourcePoints = checkClockWise(sourcePoints)
                    sourcePoints = self.addNumAndLen2ListPoints(sourcePoints)
                    targetPoints = checkClockWise(targetPoints)
                    targetPoints = self.addNumAndLen2ListPoints(targetPoints)
                    if (len(sourcePoints) > 2) and (len(sourcePoints) == len(targetPoints)):
                        self.insertData2Fodt(sourcePoints, sourceArea, targetPoints, targetArea)
                        
                    else:
                        self.highlightLine(u'Ошибка при определении и пересчёте точек ЗУ!')
                        return
            
            if self.checkBoxIsOpenDoc.isChecked(): 
                self.listWidgetEvents.addItem(u'Открывается документ ' + self.fileOdtName)                 
                if 'Windows' in platform.system():
                    if os.path.exists(self.fileOdtName.encode('cp1251')):
                        cmd = '\"' + self.fileOdtName.encode('cp1251') + '\"'
                        webbrowser.open(cmd)
                else:
                    if os.path.exists(self.fileOdtName):
                        cmd = self.fileOdtName
                        webbrowser.open(cmd)

    def highlightLine(self, t):
        self.listWidgetEvents.addItem(t)                 
        c = self.listWidgetEvents.count()
        font = self.listWidgetEvents.item(c - 1).font()
        font.setBold(True)
        self.listWidgetEvents.item(c - 1).setFont(font)     

    def insertData2Fodt(self, sourcePoints, sourceArea, targetPoints, targetArea):
        settings = QSettings("openLand", "openLand")
        curSurname = unicode(settings.value('current/Surname', u'Фамилия не указана'))
        curFirst = unicode(settings.value('current/First', u'Имя не указано'))
        curPatronymic = unicode(settings.value('current/Patronymic', u'Отчество не указано'))
        executor = curFirst[0] + '.' + curPatronymic[0] + '. ' + curSurname

        fileStatement = self.pathStatement + u'/calculation-area-different-cs.fodt'
        file4Print = self.fileOdtName.encode('cp1251')
        if (os.path.exists(fileStatement)):
            fileInput = codecs.open(fileStatement, 'r', 'utf-8') 
            fileOutput = codecs.open(file4Print, 'w', 'utf-8') 

            counter = 0
            for oneLine in fileInput:
                findString = u'Е.Н. Соколова'
                findPosition = oneLine.find(findString)
                if findPosition > -1:
                    l = len(oneLine)
                    oneLine = oneLine[:findPosition] + executor + oneLine[findPosition - l + len(findString):] 

                findString = u'Площадь земельного участка:'
                findPosition = oneLine.find(findString)
                if findPosition > -1:
                    if counter == 1:
                        oneLine = u'      <text:p text:style-name="P18">Площадь земельного участка: ' + str(targetArea) + u' кв.м. </text:p>'
                    elif counter == 2:
                        oneLine = u'      <text:p text:style-name="P18">Площадь земельного участка: ' + str(sourceArea) + u' кв.м. </text:p>'
                
                findString = '</table:table-row>'
                findPosition = oneLine.find(findString)
                if (findPosition == -1):
                    fileOutput.write(oneLine)
                else:
                    fileOutput.writelines([oneLine])
                        
                    if (counter == 0):
                        for point in targetPoints:
                            fileOutput.writelines([u'       <table:table-row>'])
                            fileOutput.writelines([u'        <table:table-cell table:style-name="Таблица2.A2" office:value-type="string">'])
                            fileOutput.writelines([u'         <text:p text:style-name="P17"><text:span text:style-name="T5">' + str(point[0]) + '</text:span></text:p>'])
                            fileOutput.writelines([u'        </table:table-cell>'])
                            fileOutput.writelines([u'        <table:table-cell table:style-name="Таблица2.A2" office:value-type="string">'])
                            fileOutput.writelines([u'         <text:p text:style-name="P17"><text:span text:style-name="T5">' + '%.2f'%point[1] + '</text:span></text:p>'])
                            fileOutput.writelines([u'        </table:table-cell>'])
                            fileOutput.writelines([u'        <table:table-cell table:style-name="Таблица2.A2" office:value-type="string">'])
                            fileOutput.writelines([u'         <text:p text:style-name="P17"><text:span text:style-name="T5">' + '%.2f'%point[2] + '</text:span></text:p>'])
                            fileOutput.writelines([u'        </table:table-cell>'])
                            fileOutput.writelines([u'        <table:table-cell table:style-name="Таблица2.D2" office:value-type="string">'])
                            fileOutput.writelines([u'         <text:p text:style-name="P17"><text:span text:style-name="T5">' + '%.2f'%point[3] + '</text:span></text:p>'])
                            fileOutput.writelines([u'        </table:table-cell>'])
                            fileOutput.writelines([u'       </table:table-row>'])

                        counter += 1

                    elif (counter == 1):
                        for point in sourcePoints:
                            fileOutput.writelines([u'       <table:table-row>'])
                            fileOutput.writelines([u'        <table:table-cell table:style-name="Таблица3.A2" office:value-type="string">'])
                            fileOutput.writelines([u'         <text:p text:style-name="P17"><text:span text:style-name="T5">' + str(point[0]) + '</text:span></text:p>'])
                            fileOutput.writelines([u'        </table:table-cell>'])
                            fileOutput.writelines([u'        <table:table-cell table:style-name="Таблица3.A2" office:value-type="string">'])
                            fileOutput.writelines([u'         <text:p text:style-name="P17"><text:span text:style-name="T5">' + '%.2f'%point[1] + '</text:span></text:p>'])
                            fileOutput.writelines([u'        </table:table-cell>'])
                            fileOutput.writelines([u'        <table:table-cell table:style-name="Таблица3.A2" office:value-type="string">'])
                            fileOutput.writelines([u'         <text:p text:style-name="P17"><text:span text:style-name="T5">' + '%.2f'%point[2] + '</text:span></text:p>'])
                            fileOutput.writelines([u'        </table:table-cell>'])
                            fileOutput.writelines([u'        <table:table-cell table:style-name="Таблица3.D2" office:value-type="string">'])
                            fileOutput.writelines([u'         <text:p text:style-name="P17"><text:span text:style-name="T5">' + '%.2f'%point[3] + '</text:span></text:p>'])
                            fileOutput.writelines([u'        </table:table-cell>'])
                            fileOutput.writelines([u'       </table:table-row>'])
                        
                        counter += 1

            fileInput.close()
            fileOutput.close()
    
    def addNumAndLen2ListPoints(self, points):
        p = []
        newPoints = []
        l = len(points)
        if l > 2:
            for i in range(l):
                if i == 0:
                    p = [i+1, points[i][1], points[i][0], 0.00]
                
                elif i == (l - 1):
                    borderLen = sqrt((points[i][1] - points[i-1][1])**2 + (points[i][0] - points[i-1][0])**2)
                    p = [1, points[i][1], points[i][0], borderLen]
                
                else:
                    borderLen = sqrt((points[i][1] - points[i-1][1])**2 + (points[i][0] - points[i-1][0])**2)
                    p = [i+1, points[i][1], points[i][0], borderLen]
                
                newPoints.append(p)
            
        else:
            newPoints = points

        return newPoints
    
    def closeDialog(self):
        self.close()

#        QMessageBox.information(self.iface.mainWindow(), 'test', str())
