# -*- coding: utf-8 -*-
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *

import os, sys, shutil, platform, codecs, webbrowser

# Формирование словаря глобальных переменных
# gv - global variable
gv = {}

gv['versionPlugin']   = '0.2.10'    # номер версии последнего релиза модуля
gv['datePlugin']      = '2014-04-09'# дата версии последнего релиза модуля
gv['versionDatabase'] = '17'        # номер версии последнего релиза БД

gv['casualParcelCode']   = '01'     # код типа ЗУ по классификатору для землепользования                            class.vid_zemelnogo_uchastka
gv['unitedParcelCode']   = '02'     # код типа ЗУ по классификатору для единого землепользования                    class.vid_zemelnogo_uchastka
gv['isolatedParcelCode'] = '03'     # код типа ЗУ по классификатору для обособленного участка                       class.vid_zemelnogo_uchastka
gv['nominalParcelCode']  = '04'     # код типа ЗУ по классификатору для условного участка                           class.vid_zemelnogo_uchastka
gv['multiContourCode']   = '05'     # код типа ЗУ по классификатору для многоконтурного участка                     class.vid_zemelnogo_uchastka
gv['oneContourCode']     = '06'     # код типа ЗУ по классификатору для одного контура многоконтурного участка      class.vid_zemelnogo_uchastka
gv['onePartCode']        = '07'     # код типа ЗУ по классификатору для части земельного участка                    class.vid_zemelnogo_uchastka
                                    
gv['methodAllotment']       = '1'   # Выдел - код способа образования ЗУ                    class.sposob_obrazovaniya_uchastka
gv['methodSection']         = '2'   # Раздел - код способа образования ЗУ                   class.sposob_obrazovaniya_uchastka
gv['methodSectionChanged']  = '3'   # Раздел с измененным земельным участком                class.sposob_obrazovaniya_uchastka
gv['methodRedistribution']  = '4'   # Перераспределение - код способа образования ЗУ        class.sposob_obrazovaniya_uchastka
gv['methodCreationOfLand']  = '5'   # Образование из земель - код способа образования ЗУ    class.sposob_obrazovaniya_uchastka
gv['methodCombination']     = '6'   # Объединение - код способа образования ЗУ              class.sposob_obrazovaniya_uchastka

gv['prevKn']        = 1             # код типа КН для кадастровых номеров предыдущих ЗУ                             поле tip_kn таблицы public.kn
gv['providingKn']   = 2             # код типа КН для кадастровых номеров ЗУ для прохода и проезда                  поле tip_kn таблицы public.kn
gv['innerKn']       = 3             # код типа КН для кадастровых номеров ЗУ объектов капитального строительства    поле tip_kn таблицы public.kn
gv['restrictionKn'] = 4             # код типа КН для кадастровых номеров ЗУ в пользу которого установлен сервитут  поле tip_kn таблицы public.kn

gv['accurateArea'] = '009'          # код типа уточненной площади ЗУ                                                class.vid_ploshadi
gv['squareMeter']  = '055'          # код единиц измерения «квадратный метр»                                        class.edinicy_izmereniya

gv['newContour']          = '1'     # код типа для образуемого контура МЗУ         class.obekt_kadastrovyh_rabot
gv['specifyContour']      = '2'     # код типа для уточняемого контура МЗУ         class.obekt_kadastrovyh_rabot
gv['deleteContour']       = '3'     # код типа для исключаемого контура МЗУ        class.obekt_kadastrovyh_rabot
gv['newSubParcel']        = '4'     # код типа для образуемой ЧЗУ                  class.obekt_kadastrovyh_rabot
gv['specifySubParcel']    = '5'     # код типа для уточняемой ЧЗУ                  class.obekt_kadastrovyh_rabot
gv['invariableSubParcel'] = '6'     # код типа для неизменяемая ЧЗУ                class.obekt_kadastrovyh_rabot
gv['insertEntryParcels']  = '7'     # код типа для включаемого в ЕЗ сущ-го(!) ЗУ   class.obekt_kadastrovyh_rabot
gv['existEntryParcels']   = '8'     # код типа для уточняемого ЗУ, входящего в ЕЗ  class.obekt_kadastrovyh_rabot
gv['deleteEntryParcels']  = '9'     # код типа для исключаемого из ЕЗ участка      class.obekt_kadastrovyh_rabot

# Формирование словаря слоёв
# gln - global layer name 
# Префиксы: ln(layer name) - схема msk; cl - схема class; pb - схема public, ds(design) - слои shp для оформления.
gln = {}
gln['ln_tochka']   = u'Точка'
gln['ln_granica']  = u'Граница'
gln['ln_uchastok'] = u'Участок'
gln['ln_kvartal']  = u'Квартал'
gln['ln_rayon']    = u'Район'

gln['cl_vid_zemelnogo_uchastka']        = u'Вид земельного участка'
gln['cl_status_zemelnogo_uchastka']     = u'Статус земельного участка'
gln['cl_kategoriya_zemli']              = u'Категория земли'
gln['cl_vid_ploshadi']                  = u'Вид площади'
gln['cl_edinicy_izmereniya']            = u'Единицы измерения'
gln['cl_ispolzovanie_zemli']            = u'Разрешенное использование'
gln['cl_sposob_obrazovaniya_uchastka']  = u'Способ образования участка'
gln['cl_region']                        = u'Регион'
gln['cl_rayon']                         = u'Тип района'
gln['cl_ato_rayonogo_podchineniya']     = u'Тип АТО районного подчинения'
gln['cl_gorodskoy_rayon']               = u'Тип городского района'
gln['cl_selsovet']                      = u'Тип сельсовета'
gln['cl_naselen_punkt']                 = u'Тип населенного пункта'
gln['cl_ulica']                         = u'Тип улицы'
gln['cl_dom']                           = u'Тип дома'
gln['cl_korpus']                        = u'Тип корпуса'
gln['cl_stroenie']                      = u'Тип строения'
gln['cl_kvartira']                      = u'Тип квартиры'
gln['cl_sposob_zakrepleniya_tochki']    = u'Способ закрепления точки'
gln['cl_metod_opredeleniya_tochki']     = u'Метод определения точки'
gln['cl_sistema_koordinat']             = u'Система координат'
gln['cl_obremeneniya']                  = u'Обременения'
gln['cl_obekt_gkn']                     = u'Объект ГКН'
gln['cl_obekt_kadastrovyh_rabot']       = u'Тип объекта кадастровых работ'
gln['cl_database_version']              = u'Версия БД'
gln['cl_section_mp']                    = u'Схема разделов межевого плана'
gln['cl_type_applied_file']             = u'Тип приложенного файла'
gln['cl_type_document']                 = u'Тип документа'
gln['cl_kladr']     = u'kladr'          # таблица из БД kladr.db формата SQLite
gln['cl_street']    = u'street'         # таблица из БД kladr.db формата SQLite
gln['cl_doma']      = u'doma'           # таблица из БД kladr.db формата SQLite
                                        
gln['pb_owner_neighbour_document']      = u'Документ права смежного ЗУ'
gln['pb_owner_neighbour']               = u'Правообладатель смежного ЗУ'
gln['pb_parcel_neighbour']              = u'Смежный ЗУ'
gln['pb_kn_document']                   = u'Документы для КН'
gln['pb_common_text']                   = u'Стандартные текстовые формулировки'
gln['pb_contractor']                    = u'Кадастровый инженер'
gln['pb_fiz_liczo']                     = u'Физическое лицо'
gln['pb_yur_liczo']                     = u'Юридическое лицо'
gln['pb_governance']                    = u'Орган власти'
gln['pb_foreign_organization']          = u'Иностранное юридическое лицо'
gln['pb_client']                        = u'Заказчик'
gln['pb_oks']                           = u'Объект строительства'
gln['pb_subparcel']                     = u'Сведения о ЧЗУ'
gln['pb_applied_file']                  = u'Приложенный файл'
gln['pb_document_applied_file']         = u'Приложенный файл документа'
gln['pb_document']                      = u'Документ'
gln['pb_mp_section_data']               = u'Данные раздела межевого плана'
gln['pb_mp']                            = u'Межевой план'
gln['pb_parcel_parcel']                 = u'Взаимосвязанные участки'
gln['pb_kn']                            = u'Кадастровый номер'
gln['pb_sredstva_izmereniya']           = u'Средства измерения'
gln['pb_geo_osnova']                    = u'Геодезическая основа'
gln['pb_granica_tochka']                = u'Граница-точка'
gln['pb_ploshad']                       = u'Площадь'
gln['pb_adres']                         = u'Адрес'
gln['pb_rayon']                         = u'Район административный'
gln['pb_mo']                            = u'МО'
gln['pb_gorodskoy_rayon']               = u'Городской район'
gln['pb_selsovet']                      = u'Сельсовет'
gln['pb_naselen_punkt']                 = u'Населенный пункт'
gln['pb_ulica']                         = u'Улица'
gln['pb_dom']                           = u'Дом'
gln['pb_korpus']                        = u'Корпус'
gln['pb_stroenie']                      = u'Строение'
gln['pb_kvartira']                      = u'Квартира'
gln['pb_uchastok_adres']                = u'Адрес участка'

gln['ds_point']     = u'Точечные'
gln['ds_line']      = u'Линейные'
gln['ds_polygone']  = u'Площадные'

# Формирование списка слоёв для которых в проекте установлен фильтр данных
# gpre - global previous
# то есть слоёв, для которых нужно возвращать изначальный фильтр после выполнения пользовательских запросов
gpre = []
gpre.append('ln_tochka')
gpre.append('ln_granica')
gpre.append('ln_uchastok')
gpre.append('ln_kvartal')
gpre.append('ln_rayon')
gpre.append('cl_sistema_koordinat')
gpre.append('pb_geo_osnova')

# Списки атрибутов = имена полей таблиц БД
attributesNamesMP                   = ['guid', 'codetype', 'version', 'date_work', 
                                    'purpose', 'reason', 'guid_contractor', 
                                    'date_accept', 'conclusion', 'guid_client']

attributesNamesContractor           = ['guid', 'surname', 'first', 'patronymic', 
                                    'n_certificate', 'telephone', 'address', 
                                    'email', 'organization']

attributesNamesCommonText           = ['guid', 'text_type', 'text_value']

attributesNamesClient               = ['guid', 'guid_fiz_liczo', 'guid_yur_liczo', 
                                    'guid_governance', 'guid_foreign_organization', 
                                    'guid_agent', 'appointment']

attributesNamesPerson               = ['guid', 'familiya', 'imya', 'otchestvo']

attributesNamesOrganization         = ['guid', 'nazvanie']

attributesNamesForeignOrganization  = ['guid', 'name', 'country']

attributesNamesGovernance           = ['guid', 'name']

attributesNamesSectionMP            = ['sort_order', 'name', 'xml_name', 'id', 
                                    'id_parent']

attributesNamesMpSectionData        = ['guid', 'guid_mp', 'id_section_mp', 
                                    'id_parcel', 'guid_document', 'guid_geodesic_base', 
                                    'guid_means_survey', 'guid_oks', 'guid_subparcel', 
                                    'guid_applied_file']

attributesNamesAppliedFile          = ['guid', 'kind', 'name', 'path']

attributesNamesDocument             = ['guid', 'code_document', 'name', 'series', 
                                    'number_doc', 'date', 'issue_organ', 'number_reg', 
                                    'date_reg', 'duration_started', 'duration_stopped', 
                                    'register', 'desc_doc', 'issue_organ_code']

attributesNamesDocumentAppliedFile  = ['guid', 'guid_document', 'guid_file']

attributesNamesGeodesicBase         = ['guid', 'id_sistema_koordinat', 'nazvanie_punkta', 
                                       'tip_znaka', 'klass_geo_seti', 'x', 'y']

attributesNamesMeansSurvey          = ['guid', 'naimenovanie', 'sertifikat', 
                                    'svidetelstvo']

attributesNamesRealty               = ['guid', 'cadastral_number', 
                                    'cadastral_number_other_number', 'name_oks']

attributesNamesSubParcel            = ['guid', 'cadastral_number', 'number_record']

attributesNamesKn                   = ['id', 'id_uchastok', 'tip_kn', 'kn', 
                                    'definition', 'other', 'number']

attributesNamesKnDocument           = ['guid', 'id_kn', 'guid_document']

attributesNamesParcel               = ['id', 'id_kvartal', 'kn', 'id_kategoriya', 
                                    'id_vid_uchastka', 'id_status_uchastka', 
                                    'id_ispolzovanie', 'ispolzovanie_dokument', 
                                    'dop_naimenovanie', 'id_sposob_obrazovaniya', 
                                    'oboznachenie_na_plane', 'guid', 'nomer_kontura', 
                                    'id_msk', 'vid_obremeneniya', 'id_obremeneniya', 
                                    'id_tip_chasti', 'pre', 'guid_doc_category', 
                                    'guid_doc_utilization', 'min_area', 
                                    'type_unit_min_area', 'max_area', 
                                    'type_unit_max_area', 'area_in_gkn', 'delta_area',
                                    'subparcel_realty', 'guid_doc_encumbrance', 
                                    'tip_obekta_kadastrovyh_rabot', 'note', 
                                    'create_user', 'create_date', 'update_user', 
                                    'update_date']

attributesNamesCadastralBlock       = ['id', 'kn', 'id_rayon', 'id_msk',
                                    'create_user', 'create_date', 'update_user', 
                                    'update_date']

attributesNamesArea                 = ['id', 'id_uchastok', 'id_vid_ploshadi', 'ploshad', 
                                    'id_edinicy_izmereniya', 'pogreshnost_izmereniya']

attributesNamesParcelAddress        = ['id', 'id_uchastok', 'id_adres']

attributesNamesLocation             = ['id', 'okato', 'kladr', 'indeks', 'id_region', 
                                    'id_rayon', 'id_mo', 'id_gorod_rayon', 
                                    'id_selsovet', 'id_naselen_punkt', 'id_ulica', 
                                    'id_dom', 'id_korpus', 'id_stroenie', 'id_kvartira', 
                                    'inoe', 'opisanie', 'guid_document']

attributesNamesPoint                = ['id', 'id_uchastok', 'x', 'y', 
                                    'poryadok_obhoda', 'nomer', 'pogreshnost', 
                                    'prefiks_nomera', 'id_sposob_zakrepleniya', 
                                    'id_metod_opredeleniya', 'nomer_chasti', 
                                    'podpis_x', 'podpis_y', 'uslovnyy_znak', 
                                    'create_user', 'create_date', 'update_user', 
                                    'update_date', 'id_msk', 'pre', 'id_child'] 

attributesNamesBorder               = ['id', 'id_uchastok', 'opisanie', 
                                    'po_opisaniyu', 'dlina', 'gradusy', 'minuty', 
                                    'uslovnyy_znak', 'create_user', 'create_date', 
                                    'update_user', 'update_date', 'id_msk', 'pre'] 

attributesNamesCreator              = ['create_user', 'create_date']

attributesNamesParcelNeighbour      = ['guid', 'id_parcel', 'definition', 'cadastral_number']

attributesNamesOwnerNeighbour       = ['guid', 'guid_parcel_neighbour', 'name_right', 
                                    'name_owner', 'contact_address']

attributesNamesOwnerNeighbourDoc    = ['guid', 'guid_owner_neighbour', 'guid_document']

okay    = QMessageBox.Ok
cancel  = QMessageBox.Cancel

################################################################################
def numberSpatialElements(selectedPolygones):
    '''
    Посчёт количества частей-колец выбранных полигонов(мультполигонов)
    selectedPolygones:          QgsFeatureList
    numberSpatialElements():    Integer
    '''
    n = 0
    for e in selectedPolygones:
        g = e.geometry()
        if g.isMultipart():
            ps = g.asMultiPolygon()
            for p in ps:
                for r in p:
                    n += 1
        else:
            rs = g.asPolygon()
            for r in rs:
                n += 1
    return n

################################################################################
def reNull(v, n):
    '''
    Проверка значения на NULL и возврат значения не NULL
    v:Variant
    reNull():Variant
    '''
    if v == None:
        return n
    else:
        return v

################################################################################
def checkDataNull(v, e):
    '''
    Проверка значения на NULL и заполнение элемента интерфейса
    v:Variant
    e: in (QLineEdit, QSpinBox, QCheckBox)
    '''
    if v == None:
        if type(e) in (type(QLineEdit()), type(QTextEdit())):
            e.setText('')
        elif type(e) == (type(QSpinBox())):
            e.setValue(0)
        elif type(e) == (type(QCheckBox())):
            e.setChecked(False)
    else:
        if type(e) in (type(QLineEdit()), type(QTextEdit())):
            e.setText(unicode(v))
        elif type(e) == (type(QSpinBox())):
            e.setValue(int(v))
        elif type(e) == (type(QCheckBox())):
            if v == u't':
                e.setChecked(True)
            else:
                e.setChecked(False)

################################################################################
def calculatedArea(idParcel):
    '''
    Определение площади земельного участка по идентификатору, 
    с учётом наличия дочерних пространственных элементов (контуров, частей)
    idParcel:integer
    calculatedArea():float 
    '''
    listIdParcel = listIdChildByIdParent(idParcel)
    if len(listIdParcel) == 0:
        listIdParcel = [idParcel]

    layer = get_vector_layer_by_name(gln['ln_uchastok'])
    provider = layer.dataProvider()
    feat = QgsFeature()
        
    pre = layer.subsetString()

    search = unicode(listIdParcel)
    search = '(' + search[1:len(search)-1] + ')'
    layer.setSubsetString('\"id\" IN ' + search)

    calculatedArea = 0.0
    for feat in provider.getFeatures(QgsFeatureRequest()):
        if feat.geometry().isGeosValid() and feat.attribute('pre') <> 1:
            calculatedArea += feat.geometry().area()

    layer.setSubsetString(pre)
    del feat
    del provider
    del layer

    return calculatedArea

################################################################################
def systemShowFile(currentItem):
    '''
    Открытие файла средствами операционной системы
    systemShowFile:bool
    currentItem:QTreeWidgetItem() 
    '''
    fileNameUnicode = unicode(currentItem.text(1))
    fileName1251 = fileNameUnicode.encode('cp1251')
    
    if 'Windows' in platform.system():
        if os.path.exists(fileName1251):
            cmd = '\"' + fileName1251 + '\"'
            webbrowser.open(cmd)
            return True
        else:
            return False
    else:
        if os.path.exists(fileNameUnicode):
            cmd = fileNameUnicode
            webbrowser.open(cmd)
            return True
        else:
            return False

################################################################################
def selectVectorObjectsById(layerName, listId):
    '''
    Выбор объектов векторного слоя по Id
    selectVectorObjectsById:bool
    layerName:string 
    listId:list(int) 
    '''
    layer = get_vector_layer_by_name(gln[layerName])
    if layer == None:
        return False

    if len(listId) < 1:
        return False

    layer.removeSelection()
    for everyId in listId:
        layer.select(everyId)
        
    selection = layer.selectedFeatures()
    for everyFeat in selection:
        geom = everyFeat.geometry()
        if not geom.isGeosValid():
            layer.deselect(everyFeat.id())

    selected = layer.selectedFeatures()
    if len(selected) > 0:
        return True
    else:
        return False

################################################################################
def attributesFromSelection(layerName, attribiteList):
    '''
    Формирование списка attributeValues словарей с ключами по списку attribiteList
    по выбранным объектам слоя layer
    attributesFromSelection():list[dict{}]
    layerName:string 
    attribiteList:list[string]
    '''
    attributeValues = []

    if layerName == '':
        return attributeValues

    layer = get_vector_layer_by_name(gln[layerName])
    if layer == None:
        return attributeValues

    selection = layer.selectedFeatures()
    if len(selection) == 0:
        return attributeValues

    for every in selection:
        oneRowAttributes = {}
        for attributeName in attribiteList:
            oneRowAttributes[attributeName] = every.attribute(attributeName)
            
        attributeValues.append(oneRowAttributes)

    del layer
    
    return attributeValues

################################################################################
def attributesByKeys(layerName, keyFieldName, keyValues, attribiteList, 
                     isReturnGeometry = False):
    '''
    Формирование двухмерного списка значений attributeValues атрибутов attribiteList
    по условию равенства атрибута keyFieldName значениям из списка keyValues
    attributesByKeys():dict(string)
    layerName:string 
    keyFieldName:string
    keyValues:list(variant)
    attribiteList:list(string) 
    '''
    attributeValues = []

    layer = get_vector_layer_by_name(gln[layerName])
    if layer == None:
        return attributeValues

    provider = layer.dataProvider()

    try: gpre.index(layerName)
    except: isLeaveFilter = False
    else: isLeaveFilter = True

    feat = QgsFeature()
    pre = ''
    if (len(keyValues) > 0) and (len(attribiteList) > 0):
        if isLeaveFilter: pre = layer.subsetString()
        
        if type(keyValues[0]) in (str, unicode):
            search = "("
            for everyKeyValue in keyValues:
                search = search + "\'"+ everyKeyValue +"\',"
            search = search[:len(search) - 1] + ")"
                
        else:
            search = unicode(keyValues)
            search = '(' + search[1:len(search)-1] + ')'

        if pre == '':
            layer.setSubsetString('\"' + keyFieldName + '\" IN ' + search)
        else:
            layer.setSubsetString(pre + ' AND \"' + keyFieldName + '\" IN ' + search)

        if isReturnGeometry:
            request = QgsFeatureRequest()
        else:
            request = QgsFeatureRequest().setFlags(QgsFeatureRequest.NoGeometry)

        for feat in provider.getFeatures(request):
            oneRowAttributes = {}
            for attributeName in attribiteList:
                if attributeName == 'geom-polygon':
                    oneRowAttributes[attributeName] = feat.geometry().asPolygon()
                else:
                    oneRowAttributes[attributeName] = feat.attribute(attributeName)
            
            attributeValues.append(oneRowAttributes)

        if isLeaveFilter: layer.setSubsetString(pre)

    del feat
    del provider
    del layer
    
    return attributeValues

################################################################################
def attributesBySearchCondition(layerName, searchCondition, attribiteList, 
                                isReturnGeometry = False):
    '''
    Формирование двухмерного списка значений attributeValues атрибутов attribiteList
    по условию searchCondition
    attributesBySearchCondition():dict(string)
    layerName:string 
    searchCondition:string 
    attribiteList: list(string) 
    '''
    attributeValues = []

    layer = get_vector_layer_by_name(gln[layerName])
    if layer == None:
        return attributeValues

    provider = layer.dataProvider()

    try: gpre.index(layerName)
    except: isLeaveFilter = False
    else: isLeaveFilter = True

    feat = QgsFeature()
    pre = ''
    if (searchCondition > ' '):
        if isLeaveFilter: pre = layer.subsetString()
        
        if pre == '':
            layer.setSubsetString(searchCondition)
        else:
            layer.setSubsetString(pre + ' AND ' + searchCondition)

        if isReturnGeometry:
            request = QgsFeatureRequest()
        else:
            request = QgsFeatureRequest().setFlags(QgsFeatureRequest.NoGeometry)

        for feat in provider.getFeatures(request):
            oneRowAttributes = {}
            for attributeName in attribiteList:
                oneRowAttributes[attributeName] = feat.attribute(attributeName)
            
            attributeValues.append(oneRowAttributes)

        if isLeaveFilter: layer.setSubsetString(pre)

    del feat
    del provider
    del layer
    
    return attributeValues

################################################################################
def updateFeature(layerName, idFeat, listFieldsNames, listFieldsValues):
    '''
    Обновление атрибутов объектов
    updateFeature():bool
    layerName:string
    idFeat: in (int, guid)
    listFieldsNames:list(string)
    listFieldsValues:list(variant)
    '''
    layer = get_vector_layer_by_name(gln[layerName])
    if layer == None:
        return False

    if not type(idFeat) in (int, long):
        idFeat = featureIdByGuid(layer, idFeat)

    if idFeat < 1:
        return False
         
    if len(listFieldsNames) < 1:
        return False

    if len(listFieldsNames) != len(listFieldsValues):
        return False

    attributes = {}
    geomNew = None
    for i in range(len(listFieldsNames)):
        if listFieldsNames[i] == 'geom':
            geomNew = listFieldsValues[i]
        else:
            attributes[layer.fieldNameIndex(listFieldsNames[i])] = listFieldsValues[i]

    if layer.dataProvider().changeAttributeValues({idFeat: attributes}):
        if (geomNew != None) and geomNew.isGeosValid():
            layer.dataProvider().changeGeometryValues({idFeat:geomNew})
        return True
    else:
        return False

################################################################################
def insertFeatures(layerName, listFieldsNames, listFieldsValues):
    '''
    Добавление объектов
    insertFeatures():bool
    layerName:string
    listFieldsNames:list(string)
    listFieldsValues:list(list(variant))
    '''
    layer = get_vector_layer_by_name(gln[layerName])
    if layer == None:
        return False

    if len(listFieldsValues) < 1:
        return False

    if len(listFieldsNames) != len(listFieldsValues[0]):
        return False

    listFeats = []
    for everyValues in listFieldsValues:
        feat = QgsFeature()
        feat.initAttributes(len(layer.dataProvider().attributeIndexes()))
        for i in range(len(listFieldsNames)):
            if listFieldsNames[i] == 'geom':
                feat.setGeometry(everyValues[i])                        

            else:
                feat.setAttribute(layer.fieldNameIndex(listFieldsNames[i]), 
                                  everyValues[i])
        listFeats.append(feat)
        del feat

    if layer.dataProvider().addFeatures(listFeats)[0]:
        return True
    else:
        return False


################################################################################
def deleteFeatures(layerName, listId):
    '''
    Удаление объектов по списку идентификаторов
    deleteFeatures():bool
    layerName:string
    listId: in (int, long, guid)
    '''
    layer = get_vector_layer_by_name(gln[layerName])
    if layer == None:
        return False

    if len(listId) < 1:
        return False

    listIdChecked = []
    for everyId in listId:
        if not type(everyId) in (int, long):
            everyId = featureIdByGuid(layer, everyId)

        if everyId > 0:
            listIdChecked.append(everyId)
         
    if len(listIdChecked) < 1:
        return False

    if layer.dataProvider().deleteFeatures(listIdChecked):
        return True
    else:
        return False


################################################################################
def deleteById(ln, id):
    '''
    Удаление объекта слоя по первичному ключу 
    deleteById():boolean
    ln:string
    id: in (int, long, guid)
    '''
    l = get_vector_layer_by_name(gln[ln])
    if l != None:
        try: gpre.index(ln)
        except: isLeaveFilter = False
        else: isLeaveFilter = True
        p = l.dataProvider()
        caps = p.capabilities()
        
        if caps & QgsVectorDataProvider.DeleteFeatures:
            if not (type(id) in (int, long)):
                guid = id
                id = featureIdByGuid(l, id)
                if (id != None):
                    if not isLeaveFilter: 
                        l.setSubsetString('\"guid\" = \'' + guid + '\'')

                    if p.deleteFeatures([id]): 
                        return True
                    else: 
                        return False

                else: 
                    return False
            else:    
                if not isLeaveFilter: 
                    l.setSubsetString('\"id\" = ' + str(id))

                if p.deleteFeatures([id]): 
                    return True
                else: 
                    return False
        else: 
            return False
    else: 
        return False

################################################################################
def featureIdByGuid(l, guid):
    '''
    Возвращает featureId по GUID
    featureIdByGuid():int
    l:QgsVectorLayer() 
    guid:string
    '''
    f = QgsFeature()
    p = l.dataProvider()

    pre = l.subsetString()
    l.setSubsetString('\"guid\"=' + "\'" + guid + "\'")

    for f in p.getFeatures(QgsFeatureRequest().setFlags(QgsFeatureRequest.NoGeometry)):
        id = f.id()

    l.setSubsetString(pre)

    if id > 0:
        return id
    else:
        return None

################################################################################
def addControlNumber2OKATO(k):
    '''
    Расчёт и добавление контрольного числа к номеру ОКАТО
    addControlNumber2OKATO():string
    k:string
    '''
    if not(k == None):
        l = len(k)
        s = 0
        for i in range(l):
            try: n = int(k[i:i+1])
            except: return None
            else: s = s + n * (i+1)
        r = k + str(s - s/11)
        return r
    else:
        return None

################################################################################
def subsVarFromDic(txt, dic):
    '''
    Замена в строке txt подстрок равных значению ключа k на соответсвующие значения v из словаря
    subsVarFromDic():string
    txt:string, dic:словарь {string:string ....}
    '''
    if (txt != None) and (dic != None):
        for k, v in dic.iteritems():
            if v > '': txt.replace(k, v)
        return txt
    else:
        return ''

################################################################################
def idCurrentMSK():
    '''
    Возвращает значение идентификатора МСК текущего проекта. 
    Уникальность обеспечивается установленным подмножеством в каждом проекте!
    idCurrentMSK():string
    '''
    layer = get_vector_layer_by_name(gln['cl_sistema_koordinat'])
    provider = layer.dataProvider()
    feat = QgsFeature()
    guidCurrentMsk = None
    for feat in provider.getFeatures(QgsFeatureRequest().setFlags(QgsFeatureRequest.NoGeometry)):
        guidCurrentMsk = feat.attribute('id')

    del feat
    del provider
    del layer

    return guidCurrentMsk

################################################################################
def allPointsPolygon(g, isRound=False, toRound=2):
    '''
    Список точек геометрии полигона
    allPointsPolygon():list
    g: QgsGeometry()
    '''
    l = []
    if (g != None) and g.isGeosValid():
        if g.isMultipart():
            polygons = g.asMultiPolygon()
            for polygon in polygons:
                for ring in polygon:
                    for p in ring:
                        if isRound:
                            x = round(p.x(), toRound)
                            y = round(p.y(), toRound)
                            l.append([x, y])
                        else:
                            l.append([p.x(), p.y()])
        else:
            polygon = g.asPolygon()
            for ring in polygon:
                for p in ring:
                    if isRound:
                        x = round(p.x(), toRound)
                        y = round(p.y(), toRound)
                        l.append([x, y])
                    else:
                        l.append([p.x(), p.y()])
    return l

################################################################################
def idParentByIdChild(idChild):
    '''
    Id      многоконтурного ЗУ, единого землепользования, ЗУ с частями 
    по Id   контура             обособленного ЗУ          ЧЗУ
    idParentByIdChild():integer
    idChild: integer
    '''
    idParent = 0
    listChild = attributesByKeys('pb_parcel_parcel', 'id_children', 
                                 [idChild], ['id_parent'])
    if len(listChild) == 1:
        idParent = int(listChild[0]['id_parent'])

    return idParent

################################################################################
def listIdChildByIdParent(idParent):
    '''
    Список id всех контуров многоконтурного участка
    listIdChildByIdParent():list(integer)
    idParent:integer
    '''
    allIdSort = []
    listParent = attributesByKeys('pb_parcel_parcel', 'id_parent', 
                                  [idParent], ['id_children'])
    listIntIdParcel = [int(e['id_children']) for e in listParent]
    attributesContour = attributesByKeys('ln_uchastok', 'id', 
                                         listIntIdParcel, ['nomer_kontura', 'id'])
    listForSort = []
    for e in attributesContour:
        try:  
            intNumber = int(str(e['nomer_kontura']))
            listForSort.append([intNumber, int(e['id'])])
        except ValueError:
            listForSort.append([0, int(e['id'])])
    
    listForSort.sort()
    allIdSort = [e[1] for e in listForSort]
    return allIdSort

################################################################################
def paramByName(n):
    '''
    Значение параметра модуля openLand
    paramByName():list
    n:list[[string]] 
    '''
    s = QSettings("openLand", "openLand")
    r = []
    if  len(n) > 0:
        for i in n:
            if i[1] == 'int':
                v = int(s.value(i[0], 0))
            elif i[1] == 'bool':
                if s.value(i[0], 'true') == 'true':
                    v = True
                else:
                    v = False
            else:
                v = s.value(i[0], '-')
            
            r.append(v)
    del s
    return r

################################################################################
def valueByFieldValue(l, fv, tv, fk, k, tk):
    '''
    Значение атрибута fv объекта слоя l по значению k ключевого поля fk. 
    Ссылочная целостность обеспечивается на сервере!
    valueByFieldValue():variant
    l:string, fv: string, tv: string, fk:string, k:string, tk:string
    '''
    try: gpre.index(l)
    except: isLeaveFilter = False
    else: isLeaveFilter = True

    v = None
    l = get_vector_layer_by_name(gln[l])
    p = l.dataProvider()
    f = QgsFeature()
    
    if isLeaveFilter: pre = l.subsetString()
    if tk == 's':
        l.setSubsetString('\"' + fk + '\"=' + "\'" + k + "\'")
    else:
        l.setSubsetString('\"' + fk + '\"=' + str(k))

    for f in p.getFeatures(QgsFeatureRequest().setFlags(QgsFeatureRequest.NoGeometry)):
        r = f.attributes()
        i = l.fieldNameIndex(fv)
        if i >= 0: 
            if tv == 'i': 
                v = int(r[i])
            elif tv == 'b': 
                v = r[i]
            else: 
                v = r[i]
        del r

    if isLeaveFilter: l.setSubsetString(pre)
    del f
    del p
    del l
    return v

################################################################################
def accuracyById(id):
    '''
    Точность определения координат по id участка
    accuracyById():numeric(2, 1)
    id:integer
    '''
    f = QgsFeature()
    l = get_vector_layer_by_name(gln['ln_uchastok'])
    d = 0.0

    if (l != None) and (id > 0):
        p = l.dataProvider()
        for f in p.getFeatures(QgsFeatureRequest().setFilterFid(id)):
            a = f.attributes()
            idk = reNull(a[l.fieldNameIndex('id_kategoriya')], '')
            idi = reNull(a[l.fieldNameIndex('id_ispolzovanie')], '')

            if idk > '0':
                k = {}
                k['003002000000'] = 0.1 
                k['003001000000'] = 2.5 
                k['003003000000'] = 0.5 
                k['003004000000'] = 2.5 
                k['003005000000'] = 5.0
                k['003006000000'] = 5.0
                k['003007000000'] = 5.0
                k['003008000000'] = 2.5
                d = k[idk]
                '''
                if idi > '0':
                    i = ['141003000000', '141004000000', '141006000000', 
                         '142001010000', '142002160000']

                    if i.count(idi) == 1: d = 0.2
                '''
        del p
    del l
    del f

    return d

################################################################################
def checkClockWise(a):
    '''
    Проверка списка точек на условие обхода по часовой стрелке. 
    Корректура при необходимости.
    checkClockwise():list[[x,y]]
    a:listlist[[x,y]]
    '''
    l = len(a)
    if l > 2:
        area = 0
        for i in range(l-1): 
            area += a[i][0]*a[i+1][1] - a[i+1][0]*a[i][1]
        if area > 0: 
            a.reverse()

    return a

################################################################################
def checkDoublePoint(a):
    '''
    Проверка списка точек на наличие дублей. Корректура при необходимости.
    checkDoublePoint():list
    pa:list
    '''
    l = len(a)
    new = []
    if l > 2:
        for i in range(l-1): 
            if (a[i] != a[i+1]):
                new.append(a[i])

        j = len(new) - 1
        if (new[j] != a[l-1]):
            new.append(a[l-1])

    return new

################################################################################
def goTopInTreeView(tree, item, data, coldata):
    try: 
        v = int(item.data(coldata, 0))
    except: 
        v = item.data(coldata, 0)

    while (v != data): 
        item = tree.setCurrentItem(item.parent())
        if item != None:
            try: 
                v = int(item.data(coldata, 0))
            except: 
                v = item.data(coldata, 0)
        else:
            break
        
    return item


################################################################################
def fillComboBox(comboBox, layerName, keyField, listField, currentKey):
    '''
    Заполнение объекта comboBox данными атрибутов слоя
    fillComboBox():bool
    comboBox:QComboBox
    layerName:string
    keyField:string
    listField: in (str, list[str])
    currentKey:variant
    '''
    layer = get_vector_layer_by_name(gln[layerName])
    provider = layer.dataProvider()

    try: gpre.index(layerName)
    except: isLeaveFilter = False
    else: isLeaveFilter = True
    
    feat = QgsFeature()

    if not isLeaveFilter: layer.setSubsetString('')
    fn_id = provider.fieldNameIndex(keyField)
    if type(listField) == list:
        fn_nm = []
        for everyField in listField:
            fn_nm.append(provider.fieldNameIndex(everyField))
    else:
        fn_nm = provider.fieldNameIndex(listField)

    if (fn_id < 0) or (fn_nm < 0) or (fn_id == fn_nm):
        return False

    else:
        keyFieldType = str(provider.fields()[fn_id].typeName())[:3]
        dic = {}
        for feat in provider.getFeatures(QgsFeatureRequest().setFlags(QgsFeatureRequest.NoGeometry)):
            attrs = feat.attributes()
            if keyFieldType == 'int':
                if type(fn_nm) == list:
                    comboTitle = ''
                    for i in fn_nm:
                        comboTitle = comboTitle + ' ' + attrs[i]
                    dic[int(attrs[fn_id])] = comboTitle.trimmed()

                else:
                    dic[int(attrs[fn_id])] = attrs[fn_nm]

            else:
                if type(fn_nm) == list:
                    comboTitle = ''
                    for i in fn_nm:
                        comboTitle = comboTitle + ' ' + attrs[i]
                    if type(comboTitle) in (str, unicode):
                        comboTitle = comboTitle.strip()    
                    dic[attrs[fn_id]] = comboTitle

                else:
                    dic[attrs[fn_id]] = attrs[fn_nm]
        
        del feat

        comboBox.clear()
        comboBox.addItem(u' ', None)
#        comboBox.addItem(u' ', '')

        for every in sorted(dic.items(), key=lambda dic: dic[1]):
            if every[1] > ' ':
                comboBox.addItem(every[1], every[0])        

        if (currentKey == 0): comboBox.setCurrentIndex(-1)
        else: 
            currentindex = comboBox.findData(currentKey)           
            comboBox.setCurrentIndex(currentindex)

        return True

################################################################################
def get_layer_all_fields(layer):
    '''
    Return all fields for layer
    Use fTools code
    '''
    field_map = layer.dataProvider().fields()
    field_list = []
    for num, field in field_map.iteritems():
            field_list.append( unicode( field.name() ) )
    return field_list # sorted( field_list, cmp=locale.strcoll ) 


################################################################################
def get_layer_str_fields(layer):
    '''
    Return only string fields for layer
    Use fTools code
    '''
    field_map = layer.dataProvider().fields()
    field_list = []
    for field in field_map:
        if field.typeName() == 'String':
            field_list.append(unicode(field.name()))
    return field_list # sorted( field_list, cmp=locale.strcoll ) 
     

################################################################################
def get_layer_names(types):
    """
    Return list of names of all layers in QgsMapLayerRegistry
    Use fTools code
    """
    layermap = QgsMapLayerRegistry.instance().mapLayers()
    layerlist = []
    if types == "all":
        for name, layer in layermap.iteritems():
            layerlist.append( unicode( layer.name() ) )
    else:
        for name, layer in layermap.iteritems():
            if layer.type() == QgsMapLayer.VectorLayer:
                if layer.geometryType() in types:
                    layerlist.append( unicode( layer.name() ) )
            elif layer.type() == QgsMapLayer.RasterLayer:
                if "Raster" in types:
                    layerlist.append( unicode( layer.name() ) )
    return layerlist

################################################################################
def get_vector_layer_by_name(lyr_name):
    """
    Return QgsVectorLayer from a layer name ( as string )
    Use fTools code
    """
    layermap = QgsMapLayerRegistry.instance().mapLayers()
    for name, layer in layermap.iteritems():
        if layer.type() == QgsMapLayer.VectorLayer and layer.name() == lyr_name:
            if layer.isValid():
                return layer
            else:
                return None

################################################################################
def copyTree(src, dst, symlinks=0):
    names = os.listdir(src)

    if not os.path.exists(dst):
        os.mkdir(dst)

    for name in names:
        srcname = os.path.join(src, name)
        dstname = os.path.join(dst, name)
        try:
            if symlinks and os.path.islink(srcname):
                linkto = os.readlink(srcname)
                os.symlink(linkto, dstname)

            elif os.path.isdir(srcname):
                copytree(srcname, dstname, symlinks)

            else:
                shutil.copy2(srcname, dstname)

        except (IOError, os.error):
            pass
