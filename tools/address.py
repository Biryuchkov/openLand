# -*- coding: utf-8 -*-
'''
/***************************************************************************
 address for openland (cadastral engineer tools)
 copyright            : (C) 2012 by Dmitriy Biryuchkov
 email                : biryuchkov@gmail.com
 ***************************************************************************/
'''
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from common import *
from address_ui import Ui_Address 
from kladr import Kladr
from document import Document

class address(QDialog,  Ui_Address):
    def __init__(self, iface):
        QDialog.__init__(self, iface.mainWindow())
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.setupUi(self)

        self.dlgKladr = None
        self.dlgDocument = None

        self.layer = get_vector_layer_by_name(gln['pb_adres'])
        self.layerlink = get_vector_layer_by_name(gln['pb_uchastok_adres'])

        self.id = None
        self.id_uchastok = None
        self.action = None
        self.okato = ''
        self.kladr = ''
        self.indeks = ''
        self.id_region = ''
        self.idt_rayon = ''
        self.id_rayon = 0
        self.idt_mo = ''
        self.id_mo = 0
        self.idt_gorod_rayon = ''
        self.id_gorod_rayon = 0
        self.idt_selsovet = ''
        self.id_selsovet = 0
        self.idt_naselen_punkt = ''
        self.id_naselen_punkt = 0
        self.idt_ulica = ''
        self.id_ulica = 0
        self.idt_dom = ''
        self.id_dom = 0
        self.idt_korpus = ''
        self.id_korpus = 0
        self.idt_stroenie = ''
        self.id_stroenie = 0
        self.idt_kvartira = ''
        self.id_kvartira = 0
        self.inoe = ''
        self.opisanie = ''
        self.guid_document = ''

        self.connect(self.pushButtonRefresh, SIGNAL("clicked()"), self.refresh)        
        self.connect(self.pushButtonCreateDesc, SIGNAL("clicked()"), self.createDescription)        
        self.connect(self.pushButtonOk, SIGNAL("clicked()"), self.save)        
        self.connect(self.pushButtonClose, SIGNAL("clicked()"), self.close)        
        self.connect(self.pushButtonKladr, SIGNAL("clicked()"), self.doKladr)        
        self.connect(self.pushButtonDocument, SIGNAL("clicked()"), self.doDocument)        
        self.connect(self.comboBoxRegion, SIGNAL("currentIndexChanged(int)"), self.regionSelect)        

    def dlgFill(self):
        tmp = []
        tmp.append([self.lineEditOKATO, self.okato])
        tmp.append([self.lineEditKLADR, self.kladr])
        tmp.append([self.lineEditIndeks, self.indeks])
        tmp.append([self.textEditInoe, self.inoe])
        tmp.append([self.textEditOpisanie, self.opisanie])
        for i in tmp:
            i[0].setText(reNull(i[1], ''))
        del tmp
        
        fillComboBox(self.comboBoxRegion, 'cl_region', 'id', 'znachenie', self.id_region)

        tmp = []
        tmp.append([self.comboBoxTRayon, 'cl_rayon', 'id', 'znachenie', self.idt_rayon])
        tmp.append([self.comboBoxTMo, 'cl_ato_rayonogo_podchineniya', 'id', 'znachenie', self.idt_mo])
        tmp.append([self.comboBoxTGorodRayon, 'cl_gorodskoy_rayon', 'id', 'znachenie', self.idt_gorod_rayon])
        tmp.append([self.comboBoxTSelsovet, 'cl_selsovet', 'id', 'znachenie', self.idt_selsovet])
        tmp.append([self.comboBoxTNaselenPunkt, 'cl_naselen_punkt', 'id', 'znachenie', self.idt_naselen_punkt])
        tmp.append([self.comboBoxTUlica, 'cl_ulica', 'id', 'znachenie', self.idt_ulica])
        tmp.append([self.comboBoxTDom, 'cl_dom', 'id', 'znachenie', self.idt_dom])
        tmp.append([self.comboBoxTKorpus, 'cl_korpus', 'id', 'znachenie', self.idt_korpus])
        tmp.append([self.comboBoxTStroenie, 'cl_stroenie', 'id', 'znachenie', self.idt_stroenie])
        tmp.append([self.comboBoxTKvartira, 'cl_kvartira', 'id', 'znachenie', self.idt_kvartira])
        for i in tmp:
            fillComboBox(i[0], i[1], i[2], i[3], i[4])
        del tmp

        tmp = []
        tmp.append([self.comboBoxRayon, 'pb_rayon', 'id', 'naimenovanie', self.id_rayon])
        tmp.append([self.comboBoxMo, 'pb_mo', 'id', 'naimenovanie', self.id_mo])
        tmp.append([self.comboBoxGorodRayon, 'pb_gorodskoy_rayon', 'id', 'naimenovanie', self.id_gorod_rayon])
        tmp.append([self.comboBoxSelsovet, 'pb_selsovet', 'id', 'naimenovanie', self.id_selsovet])
        tmp.append([self.comboBoxNaselenPunkt, 'pb_naselen_punkt', 'id', 'naimenovanie', self.id_naselen_punkt])
        tmp.append([self.comboBoxUlica, 'pb_ulica', 'id', 'naimenovanie', self.id_ulica])
        tmp.append([self.comboBoxDom, 'pb_dom', 'id', 'naimenovanie', self.id_dom])
        tmp.append([self.comboBoxKorpus, 'pb_korpus', 'id', 'naimenovanie', self.id_korpus])
        tmp.append([self.comboBoxStroenie, 'pb_stroenie', 'id', 'naimenovanie', self.id_stroenie])
        tmp.append([self.comboBoxKvartira, 'pb_kvartira', 'id', 'naimenovanie', self.id_kvartira])
        for i in tmp:
            fillComboBox(i[0], i[1], i[2], i[3], i[4])
        del tmp

        self.comboBoxDocument.clear()
        self.comboBoxDocument.addItem(u' ', None)

        if self.guid_document > ' ':
            attributesDocument = attributesByKeys('pb_document', 'guid', [str(self.guid_document)], attributesNamesDocument)
            if len(attributesDocument) == 1:
                attributesDocument = attributesDocument[0]
                title = attributesDocument['number_doc'] + ' ' + attributesDocument['date'].toString('yyyy-MM-dd') + ' ' + attributesDocument['name'][:33]
                self.comboBoxDocument.addItem(unicode(title), str(self.guid_document))
                self.comboBoxDocument.setCurrentIndex(1)

    def checkClassValue(self, cBox, cBoxT, ln):
        '''
        Проверка наличия в классификаторе выбранного или введенного значения cBox с учетом значения cBoxT
        Пример - может быть и проспект Ленина и улица.
        checkClassValue():string
        ln: string
        cBox, cBoxT:QComboBox()
        '''
        l = get_vector_layer_by_name(gln[ln])
        p = l.dataProvider()
        isCreateRecord = False
        if (cBox.itemData(cBox.currentIndex())) and (cBoxT.itemData(cBoxT.currentIndex()) > ' '): # проверка True была
            id = cBox.itemData(cBox.currentIndex())
            id2 = cBoxT.itemData(cBoxT.currentIndex())
            pre = l.subsetString()
            l.setSubsetString('\"id\"=' + str(id))
            if (int(l.featureCount()) == 1):
                for f in p.getFeatures(QgsFeatureRequest().setFlags(QgsFeatureRequest.NoGeometry)):
                    a = f.attributes()
                    id0 = a[1]

                if  id2 == id0: 
                    l.setSubsetString(pre)
                    return id
                else:
                    isCreateRecord = True
            else:
                isCreateRecord = True
            
            l.setSubsetString(pre)
        else:
            isCreateRecord = True

        if isCreateRecord:
            id2 = cBoxT.itemData(cBoxT.currentIndex())
            n = unicode(cBox.currentText()).strip()
            if (id2 > ' ') and (n > ' '):
                c = l.dataProvider().capabilities()
                if c & QgsVectorDataProvider.ChangeAttributeValues:
                    f = QgsFeature()
                    f.initAttributes(len(p.attributeIndexes()))
                    f.setAttribute(1, id2)
                    f.setAttribute(2, n)
                    if p.addFeatures([f])[0]:
                        s =  '\"' +str(l.attributeDisplayName(1))+ '\"=\'' +id2+ '\' and \"' +str(l.attributeDisplayName(2))+ '\"=\'' +n+ '\''
                        pre = l.subsetString()
                        l.setSubsetString(s)
                        if (int(l.featureCount()) == 1):
                            for f in p.getFeatures(QgsFeatureRequest().setFlags(QgsFeatureRequest.NoGeometry)):
                                a = f.attributes()
                                idnew = a[0]
                            
                            l.setSubsetString(pre)
                            return idnew
                        else:
                            l.setSubsetString(pre)
                            return 0
                    del f
                    return 0
            else:
                return 0
                
    def refresh(self):
        reply = QMessageBox.question(self, u'Потверждение обновления атрибутов', 
                                           u'Действительно желаете обновить значения атрибутов данными из базы?', 
                                           okay|cancel, defaultButton=cancel)
        if reply == okay: self.dlgFill()

    def save(self):
        listNames  = ['okato', 'kladr', 'id_region', 'opisanie']
        listValues = []
        listValues.append(self.lineEditOKATO.text())
        listValues.append(self.lineEditKLADR.text())
        listValues.append(self.comboBoxRegion.itemData(self.comboBoxRegion.currentIndex()))
        listValues.append(self.textEditOpisanie.toPlainText())
    
        listNames.append('indeks')
        listValues.append(self.lineEditIndeks.text())
        listNames.append('inoe')
        listValues.append(self.textEditInoe.toPlainText())

        if self.comboBoxDocument.currentIndex() > 0:
            listNames.append('guid_document')
            listValues.append(self.comboBoxDocument.itemData(self.comboBoxDocument.currentIndex()))

        self.id_rayon = self.checkClassValue(self.comboBoxRayon, 
                                             self.comboBoxTRayon, 
                                             'pb_rayon')
        if self.id_rayon > 0: 
            listNames.append('id_rayon')
            listValues.append(self.id_rayon)

        self.id_mo = self.checkClassValue(self.comboBoxMo, 
                                          self.comboBoxTMo, 
                                          'pb_mo')
        if self.id_mo > 0: 
            listNames.append('id_mo')
            listValues.append(self.id_mo)

        self.id_gorod_rayon = self.checkClassValue(self.comboBoxGorodRayon, 
                                                   self.comboBoxTGorodRayon, 
                                                   'pb_gorodskoy_rayon')
        if self.id_gorod_rayon > 0: 
            listNames.append('id_gorod_rayon')
            listValues.append(self.id_gorod_rayon)

        self.id_selsovet = self.checkClassValue(self.comboBoxSelsovet, 
                                                self.comboBoxTSelsovet, 
                                                'pb_selsovet')
        if self.id_selsovet > 0: 
            listNames.append('id_selsovet')
            listValues.append(self.id_selsovet)

        self.id_naselen_punkt = self.checkClassValue(self.comboBoxNaselenPunkt, 
                                                     self.comboBoxTNaselenPunkt, 
                                                     'pb_naselen_punkt')
        if self.id_naselen_punkt > 0: 
            listNames.append('id_naselen_punkt')
            listValues.append(self.id_naselen_punkt)

        self.id_ulica = self.checkClassValue(self.comboBoxUlica, 
                                             self.comboBoxTUlica, 
                                             'pb_ulica')
        if self.id_ulica > 0: 
            listNames.append('id_ulica')
            listValues.append(self.id_ulica)

        self.id_dom = self.checkClassValue(self.comboBoxDom, 
                                           self.comboBoxTDom, 
                                           'pb_dom')
        if self.id_dom > 0: 
            listNames.append('id_dom')
            listValues.append(self.id_dom)

        self.id_korpus = self.checkClassValue(self.comboBoxKorpus, 
                                              self.comboBoxTKorpus, 
                                              'pb_korpus')
        if self.id_korpus > 0: 
            listNames.append('id_korpus')
            listValues.append(self.id_korpus)

        self.id_stroenie = self.checkClassValue(self.comboBoxStroenie, 
                                                self.comboBoxTStroenie, 
                                                'pb_stroenie')
        if self.id_stroenie > 0: 
            listNames.append('id_stroenie')
            listValues.append(self.id_stroenie)

        self.id_kvartira = self.checkClassValue(self.comboBoxKvartira, 
                                                self.comboBoxTKvartira, 
                                                'pb_kvartira')
        if self.id_kvartira > 0: 
            listNames.append('id_kvartira')
            listValues.append(self.id_kvartira)

        if self.action == 'add':
            listNames.append('komanda_serveru')
            listValues.append('id_uch=' + str(self.id_uchastok))

            insertFeatures('pb_adres', listNames, [listValues])

        elif self.action == 'edit':
            self.layer.setSubsetString('\"id\"=' + str(self.id))
            updateFeature('pb_adres', self.id, listNames, listValues)

        else:
            QMessageBox.warning(self.iface.mainWindow(), u'Ошибка вызова диалога редактирования адреса', 
                                                         u'Не определена цель вызова диалога')
        self.done(1)

    def createDescription(self):
        if self.textEditOpisanie.toPlainText() < ' ':
            opisanie = reNull(self.comboBoxRegion.currentText(), '')

            listComBox = [[self.comboBoxTRayon,         self.comboBoxRayon],
                          [self.comboBoxTMo,            self.comboBoxMo],
                          [self.comboBoxTGorodRayon,    self.comboBoxGorodRayon],
                          [self.comboBoxTSelsovet,      self.comboBoxSelsovet],
                          [self.comboBoxTNaselenPunkt,  self.comboBoxNaselenPunkt],
                          [self.comboBoxTUlica,         self.comboBoxUlica],
                          [self.comboBoxTDom,           self.comboBoxDom],
                          [self.comboBoxTKorpus,        self.comboBoxKorpus],
                          [self.comboBoxTStroenie,      self.comboBoxStroenie],
                          [self.comboBoxTKvartira,      self.comboBoxKvartira]]

            for every in listComBox:
                row = reNull(every[0].itemData(every[0].currentIndex()), '') 
                row = row + '. ' + reNull(every[1].currentText(), '')
                if row > '. ': 
                    if opisanie > '': 
                        opisanie = opisanie +', '+ row
                    else: 
                        opisanie = row

            if opisanie > '. ': 
                self.textEditOpisanie.setText(opisanie)

    def regionSelect(self, itemIndex):
        self.pushButtonKladr.setEnabled(False)
        if itemIndex >= 0:
            if self.comboBoxRegion.itemData(itemIndex) > '00':
                self.pushButtonKladr.setEnabled(True)
    
    
    def doKladr(self):
        if self.dlgKladr == None:
            self.dlgKladr = Kladr(self.iface)

        self.dlgKladr.idRegion = self.comboBoxRegion.itemData(self.comboBoxRegion.currentIndex())
        self.dlgKladr.fillFirstComboBox()
        self.dlgKladr.exec_()
        if self.dlgKladr.kladr > '':
            self.lineEditKLADR.setText(self.dlgKladr.kladr)
            self.lineEditOKATO.setText(self.dlgKladr.okato)
            self.lineEditIndeks.setText(self.dlgKladr.index)
    
    def doDocument(self):
        if self.dlgDocument == None:
            self.dlgDocument = Document(self.iface)
            self.dlgDocument.fillTree()
        
        self.dlgDocument.selectedGuid = None

        self.dlgDocument.exec_()
        if self.dlgDocument.selectedGuid != None:

            self.comboBoxDocument.clear()
            self.comboBoxDocument.addItem(u' ', None)

            if self.dlgDocument.selectedGuid > ' ':
                attributesDocument = attributesByKeys('pb_document', 
                                                      'guid', 
                                                      [str(self.dlgDocument.selectedGuid)], 
                                                      attributesNamesDocument)
                if len(attributesDocument) == 1:
                    attributesDocument = attributesDocument[0]
                    title = attributesDocument['number_doc'] + ' ' + attributesDocument['date'].toString('yyyy-MM-dd') + ' ' + attributesDocument['name'][:33]
                    self.comboBoxDocument.addItem(unicode(title), str(self.dlgDocument.selectedGuid))
                    self.comboBoxDocument.setCurrentIndex(1)
    
    def close(self):
        self.done(0)

#        QMessageBox.information(self.iface.mainWindow(), 'test', str())
