<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:anim="urn:oasis:names:tc:opendocument:xmlns:animation:1.0" xmlns:calcext="urn:org:documentfoundation:names:experimental:calc:xmlns:calcext:1.0" xmlns:chart="urn:oasis:names:tc:opendocument:xmlns:chart:1.0" xmlns:config="urn:oasis:names:tc:opendocument:xmlns:config:1.0" xmlns:css3t="http://www.w3.org/TR/css3-text/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dom="http://www.w3.org/2001/xml-events" xmlns:dr3d="urn:oasis:names:tc:opendocument:xmlns:dr3d:1.0" xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0" xmlns:drawooo="http://openoffice.org/2010/draw" xmlns:ext="http://exslt.org/common" xmlns:field="urn:openoffice:names:experimental:ooo-ms-interop:xmlns:field:1.0" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0" xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0" xmlns:formx="urn:openoffice:names:experimental:ooxml-odf-interop:xmlns:form:1.0" xmlns:grddl="http://www.w3.org/2003/g/data-view#" xmlns:math="http://www.w3.org/1998/Math/MathML" xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0" xmlns:number="urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0" xmlns:of="urn:oasis:names:tc:opendocument:xmlns:of:1.2" xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" xmlns:officeooo="http://openoffice.org/2009/office" xmlns:ooo="http://openoffice.org/2004/office" xmlns:oooc="http://openoffice.org/2004/calc" xmlns:ooow="http://openoffice.org/2004/writer" xmlns:presentation="urn:oasis:names:tc:opendocument:xmlns:presentation:1.0" xmlns:rpt="http://openoffice.org/2005/report" xmlns:script="urn:oasis:names:tc:opendocument:xmlns:script:1.0" xmlns:smil="urn:oasis:names:tc:opendocument:xmlns:smil-compatible:1.0" xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0" xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0" xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" xmlns:tableooo="http://openoffice.org/2009/table" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" xmlns:xforms="http://www.w3.org/2002/xforms" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"><xsl:output method="xml" version="1.0" encoding="UTF-8"/> 	<xsl:variable name="crlf"><xsl:text>&#13;&#10;</xsl:text></xsl:variable>
		<xsl:variable name="v_dict">
<!--Регионы РФ-->
<xs:enumeration value="01"><xs:annotation><xs:documentation>Республика Адыгея (Адыгея)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="02"><xs:annotation><xs:documentation>Республика Башкортостан</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="03"><xs:annotation><xs:documentation>Республика Бурятия</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="04"><xs:annotation><xs:documentation>Республика Алтай</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="05"><xs:annotation><xs:documentation>Республика Дагестан</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="06"><xs:annotation><xs:documentation>Республика Ингушетия</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="07"><xs:annotation><xs:documentation>Кабардино-Балкарская Республика</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="08"><xs:annotation><xs:documentation>Республика Калмыкия</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="09"><xs:annotation><xs:documentation>Карачаево-Черкесская Республика</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="10"><xs:annotation><xs:documentation>Республика Карелия</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="11"><xs:annotation><xs:documentation>Республика Коми</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="12"><xs:annotation><xs:documentation>Республика Марий Эл</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="13"><xs:annotation><xs:documentation>Республика Мордовия</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="14"><xs:annotation><xs:documentation>Республика Саха (Якутия)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="15"><xs:annotation><xs:documentation>Республика Северная Осетия-Алания</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="16"><xs:annotation><xs:documentation>Республика Татарстан (Татарстан)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="17"><xs:annotation><xs:documentation>Республика Тыва</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="18"><xs:annotation><xs:documentation>Удмуртская Республика</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="19"><xs:annotation><xs:documentation>Республика Хакасия</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="20"><xs:annotation><xs:documentation>Чеченская Республика</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="21"><xs:annotation><xs:documentation>Чувашская Республика-Чувашия</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="22"><xs:annotation><xs:documentation>Алтайский край</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="23"><xs:annotation><xs:documentation>Краснодарский край</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="24"><xs:annotation><xs:documentation>Красноярский край</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="25"><xs:annotation><xs:documentation>Приморский край</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="26"><xs:annotation><xs:documentation>Ставропольский край</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="27"><xs:annotation><xs:documentation>Хабаровский край</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="28"><xs:annotation><xs:documentation>Амурская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="29"><xs:annotation><xs:documentation>Архангельская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="30"><xs:annotation><xs:documentation>Астраханская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="31"><xs:annotation><xs:documentation>Белгородская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="32"><xs:annotation><xs:documentation>Брянская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="33"><xs:annotation><xs:documentation>Владимирская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="34"><xs:annotation><xs:documentation>Волгоградская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="35"><xs:annotation><xs:documentation>Вологодская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="36"><xs:annotation><xs:documentation>Воронежская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="37"><xs:annotation><xs:documentation>Ивановская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="38"><xs:annotation><xs:documentation>Иркутская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="39"><xs:annotation><xs:documentation>Калининградская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="40"><xs:annotation><xs:documentation>Калужская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="41"><xs:annotation><xs:documentation>Камчатский край</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="42"><xs:annotation><xs:documentation>Кемеровская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="43"><xs:annotation><xs:documentation>Кировская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="44"><xs:annotation><xs:documentation>Костромская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="45"><xs:annotation><xs:documentation>Курганская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="46"><xs:annotation><xs:documentation>Курская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="47"><xs:annotation><xs:documentation>Ленинградская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="48"><xs:annotation><xs:documentation>Липецкая область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="49"><xs:annotation><xs:documentation>Магаданская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="50"><xs:annotation><xs:documentation>Московская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="51"><xs:annotation><xs:documentation>Мурманская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="52"><xs:annotation><xs:documentation>Нижегородская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="53"><xs:annotation><xs:documentation>Новгородская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="54"><xs:annotation><xs:documentation>Новосибирская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="55"><xs:annotation><xs:documentation>Омская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="56"><xs:annotation><xs:documentation>Оренбургская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="57"><xs:annotation><xs:documentation>Орловская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="58"><xs:annotation><xs:documentation>Пензенская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="59"><xs:annotation><xs:documentation>Пермский край</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="60"><xs:annotation><xs:documentation>Псковская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="61"><xs:annotation><xs:documentation>Ростовская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="62"><xs:annotation><xs:documentation>Рязанская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="63"><xs:annotation><xs:documentation>Самарская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="64"><xs:annotation><xs:documentation>Саратовская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="65"><xs:annotation><xs:documentation>Сахалинская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="66"><xs:annotation><xs:documentation>Свердловская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="67"><xs:annotation><xs:documentation>Смоленская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="68"><xs:annotation><xs:documentation>Тамбовская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="69"><xs:annotation><xs:documentation>Тверская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="70"><xs:annotation><xs:documentation>Томская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="71"><xs:annotation><xs:documentation>Тульская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="72"><xs:annotation><xs:documentation>Тюменская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="73"><xs:annotation><xs:documentation>Ульяновская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="74"><xs:annotation><xs:documentation>Челябинская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="75"><xs:annotation><xs:documentation>Забайкальский край</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="76"><xs:annotation><xs:documentation>Ярославская область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="77"><xs:annotation><xs:documentation>Москва</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="78"><xs:annotation><xs:documentation>Санкт-Петербург</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="79"><xs:annotation><xs:documentation>Еврейская автономная область</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="83"><xs:annotation><xs:documentation>Ненецкий автономный округ</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="86"><xs:annotation><xs:documentation>Ханты-Мансийский автономный округ - Югра</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="87"><xs:annotation><xs:documentation>Чукотский автономный округ</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="89"><xs:annotation><xs:documentation>Ямало-Ненецкий автономный округ</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="98"><xs:annotation><xs:documentation>Неопределено</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="99"><xs:annotation><xs:documentation>Значение отсутствует</xs:documentation></xs:annotation></xs:enumeration>

<!--Закрепление точки-->

<xs:enumeration value="626001000000"><xs:annotation><xs:documentation>Долговременный межевой знак</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="626002000000"><xs:annotation><xs:documentation>Временный межевой знак</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="626003000000"><xs:annotation><xs:documentation>-</xs:documentation></xs:annotation></xs:enumeration>

<!--Категории земель-->

<xs:enumeration value="003001000000"><xs:annotation><xs:documentation>Земли сельскохозяйственного назначения</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="003002000000"><xs:annotation><xs:documentation>Земли населенных пунктов</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="003003000000"><xs:annotation><xs:documentation>Земли промышленности, энергетики, транспорта, связи, радиовещания, телевидения, информатики, земли для обеспечения космической деятельности, земли обороны, безопасности и земли иного специального назначения</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="003004000000"><xs:annotation><xs:documentation>Земли особо охраняемых территорий и объектов</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="003005000000"><xs:annotation><xs:documentation>Земли лесного фонда</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="003006000000"><xs:annotation><xs:documentation>Земли водного фонда</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="003007000000"><xs:annotation><xs:documentation>Земли запаса</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="003008000000"><xs:annotation><xs:documentation>Категория не установлена</xs:documentation></xs:annotation></xs:enumeration>

<!--Документы-->

<xs:enumeration value="008001000000"><xs:annotation><xs:documentation>Документы, удостоверяющие личность физического лица</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008001001000"><xs:annotation><xs:documentation>Паспорт гражданина Российской Федерации</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008001002000"><xs:annotation><xs:documentation>Паспорт гражданина СССР</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008001003000"><xs:annotation><xs:documentation>Паспорт гражданина иностранного государства</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008001004000"><xs:annotation><xs:documentation>Общегражданский заграничный паспорт</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008001005000"><xs:annotation><xs:documentation>Заграничный паспорт Министерства морского флота</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008001006000"><xs:annotation><xs:documentation>Дипломатический паспорт</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008001007000"><xs:annotation><xs:documentation>Паспорт моряка (удостоверение личности моряка)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008001008000"><xs:annotation><xs:documentation>Военный билет военнослужащего</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008001009000"><xs:annotation><xs:documentation>Временное удостоверение, выданное взамен военного билета</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008001010000"><xs:annotation><xs:documentation>Удостоверение личности офицера Министерства обороны Российской Федерации, Министерства внутренних дел Российской Федерации и других воинских формирований с приложением справки о прописке (регистрации) Ф-33</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008001011000"><xs:annotation><xs:documentation>Свидетельство о рождении</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008001012000"><xs:annotation><xs:documentation>Свидетельство о рассмотрении ходатайства о признании беженцем на территории Российской Федерации по существу</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008001013000"><xs:annotation><xs:documentation>Вид на жительство иностранного гражданина или лица без гражданства</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008001014000"><xs:annotation><xs:documentation>Справка об освобождении из мест лишения свободы</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008001015000"><xs:annotation><xs:documentation>Временное удостоверение личности гражданина Российской Федерации</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008001016000"><xs:annotation><xs:documentation>Удостоверение вынужденного переселенца</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008001017000"><xs:annotation><xs:documentation>Разрешение на временное проживание в Российской Федерации</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008001018000"><xs:annotation><xs:documentation>Удостоверение беженца в Российской Федерации</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008001019000"><xs:annotation><xs:documentation>Свидетельство о рассмотрении ходатайства о признании лица вынужденным переселенцем</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008001020000"><xs:annotation><xs:documentation>Свидетельство о предоставлении временного убежища на территории Российской Федерации</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008001099000"><xs:annotation><xs:documentation>Иные документы, предусмотренные законодательством Российской Федерации или признаваемые в соответствии с международным договором Российской Федерации в качестве документов, удостоверяющих личность</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008002000000"><xs:annotation><xs:documentation>Документы, идентифицирующие юридическое лицо</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008002001000"><xs:annotation><xs:documentation>Свидетельство о государственной регистрации юридического лица</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008002002000"><xs:annotation><xs:documentation>Свидетельство о внесении записей в ЕГРЮЛ</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008002004000"><xs:annotation><xs:documentation>Устав</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008002005000"><xs:annotation><xs:documentation>Учредительный договор</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008002006000"><xs:annotation><xs:documentation>Положение (общее положение об организации)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008002007000"><xs:annotation><xs:documentation>Свидетельство (или уведомление) о постановке на учет в налоговом органе с указанием ИНН</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008002008000"><xs:annotation><xs:documentation>Выписка из ЕГРЮЛ</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008002099000"><xs:annotation><xs:documentation>Иной документ</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="555001000000"><xs:annotation><xs:documentation>Квитанция</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="555002000000"><xs:annotation><xs:documentation>Платежное поручение</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="555003000000"><xs:annotation><xs:documentation>Чек</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="555004000000"><xs:annotation><xs:documentation>Подтверждение электронного платежа</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="555005000000"><xs:annotation><xs:documentation>Документ, подтверждающий право заявителя на безвозмездное получение сведений</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558100000000"><xs:annotation><xs:documentation>ЗАЯВЛЕНИЯ</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558101000000"><xs:annotation><xs:documentation>Заявления и запросы, связанные с кадастровым учетом</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558101010000"><xs:annotation><xs:documentation>Запрос о предоставлении сведений, внесенных в государственный кадастр недвижимости</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558101020000"><xs:annotation><xs:documentation>Заявление о постановке на кадастровый учет объекта недвижимости</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558101030000"><xs:annotation><xs:documentation>Заявление о государственном учете изменений объекта недвижимости</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558101040000"><xs:annotation><xs:documentation>Заявление о внесении в Единый государственный реестр объектов капитального строительства (ЕГРОКС) сведений об объекте капитального строительства (ОКС)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558101050000"><xs:annotation><xs:documentation>Заявление о предоставлении сведений об ОКС</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558101060000"><xs:annotation><xs:documentation>Заявление о снятии с кадастрового учета объекта недвижимости</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558101070000"><xs:annotation><xs:documentation>Заявление о внесении в ГКН сведений о ранее учтенном объекте недвижимости</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558101080000"><xs:annotation><xs:documentation>Заявление об исправлении кадастровой ошибки</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558101090000"><xs:annotation><xs:documentation>Заявление об исправлении технической ошибки в сведениях государственного кадастра недвижимости</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558101090100"><xs:annotation><xs:documentation>Заявление об исправлении технической ошибки в сведениях государственного кадастра недвижимости об объекте недвижимости</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558101090200"><xs:annotation><xs:documentation>Заявление об исправлении технической ошибки в сведениях в сведениях государственного кадастра недвижимости о прохождении участка Государственной границы Российской Федерации; о границах между субъектами Российской Федерации; о границах муниципальных образований; о границах населенных пунктов; о территориальных зонах и зонах с особыми условиями использования территорий; о картографической и геодезической основах государственного кадастра недвижимости</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558101100000"><xs:annotation><xs:documentation>Заявление о представлении дополнительных документов на кадастровый учет</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558101110000"><xs:annotation><xs:documentation>Внутриведомственный запрос информации ГКН</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558101120000"><xs:annotation><xs:documentation>Запрос о предоставлении копии документа, на основании которого сведения об объекте недвижимости внесены в государственный кадастр недвижимости</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558102000000"><xs:annotation><xs:documentation>Заявления, связанные с регистрацией прав</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558102010000"><xs:annotation><xs:documentation>Заявление о государственной регистрации прав на недвижимое имущество и сделок с ним</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558102020000"><xs:annotation><xs:documentation>Заявление о внесении в ЕГРП записи о прекращении права (ограничения (обременения) права)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558102030000"><xs:annotation><xs:documentation>Заявление о внесении изменений в ЕГРП</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558102040000"><xs:annotation><xs:documentation>Заявление об исправлении технической ошибки, допущенной при государственной регистрации права</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558102050000"><xs:annotation><xs:documentation>Заявление о представлении дополнительных документов для государственной регистрации прав</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558102060000"><xs:annotation><xs:documentation>Заявление о приостановлении государственной регистрации прав на недвижимое имущество и сделок с ним</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558102070000"><xs:annotation><xs:documentation>Заявление о возобновлении государственной регистрации</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558102080000"><xs:annotation><xs:documentation>Заявление о прекращении государственной регистрации</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558102090000"><xs:annotation><xs:documentation>Заявление о повторной выдаче свидетельства о государственной регистрации права</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558102100000"><xs:annotation><xs:documentation>Запрос о предоставлении сведений, содержащихся в Едином государственном реестре прав на недвижимое имущество и сделок с ним</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558102110000"><xs:annotation><xs:documentation>Заявление о постановке на учет бесхозяйного имущества</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558102120000"><xs:annotation><xs:documentation>Заявление о выдаче закладной (новой закладной, дубликата закладной, аннулированной закладной)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558102130000"><xs:annotation><xs:documentation>Заявление о выдаче копий договоров и иных документов, выражающих содержание односторонних сделок, совершенных в простой письменной форме</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558103000000"><xs:annotation><xs:documentation>Заявления о государственном учете объектов капитального строительства и запросы о предоставлении сведений Единого государственного реестра объектов капитального строительства (ЕГРОКС)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558103010000"><xs:annotation><xs:documentation>Заявление о постановке на государственный учет объекта капитального строительства</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558103020000"><xs:annotation><xs:documentation>Заявление о внесении в ЕГРОКС сведений о ранее учтенном объекте капитального строительства</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558103030000"><xs:annotation><xs:documentation>Заявление о государственном учете изменений объекта капитального строительства</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558103040000"><xs:annotation><xs:documentation>Заявление о снятии с государственного учета объекта капитального строительства</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558103050000"><xs:annotation><xs:documentation>Заявление об исправлении технической ошибки в сведениях ЕГРОКС</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558103060000"><xs:annotation><xs:documentation>Заявление об исключении сведений из ЕГРОКС, носящих временный характер</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558103070000"><xs:annotation><xs:documentation>Запрос о предоставлении копии документа, на основании которого сведения об объекте капитального строительства внесены в ЕГРОКС</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558103080000"><xs:annotation><xs:documentation>Запрос о предоставлении сведений ЕГРОКС в виде кадастровой выписки и кадастрового паспорта</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558103090000"><xs:annotation><xs:documentation>Заявление о представлении дополнительных документов на государственный учет объекта капитального строительства</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558104000000"><xs:annotation><xs:documentation>Заявление о возврате платежа</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558199000000"><xs:annotation><xs:documentation>Иное заявление</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558200000000"><xs:annotation><xs:documentation>ДОКУМЕНТЫ, СОДЕРЖАЩИЕ ОПИСАНИЕ ОБЪЕКТА</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558201000000"><xs:annotation><xs:documentation>Описание земельных участков</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558202000000"><xs:annotation><xs:documentation>Землеустроительное дело</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558203000000"><xs:annotation><xs:documentation>Межевой план</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558204000000"><xs:annotation><xs:documentation>Документ (копия), на основании которого сведения об объекте недвижимости внесены в ГКН</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558205000000"><xs:annotation><xs:documentation>Технический паспорт объекта учета</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558205010000"><xs:annotation><xs:documentation>Технический паспорт домовладения</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558205020000"><xs:annotation><xs:documentation>Технический паспорт здания (строения)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558205030000"><xs:annotation><xs:documentation>Технический паспорт жилого помещения (квартиры)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558205040000"><xs:annotation><xs:documentation>Технический паспорт объекта индивидуального жилищного строительства</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558206000000"><xs:annotation><xs:documentation>Выписка из технического паспорта</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558206010000"><xs:annotation><xs:documentation>Выписка из технического паспорта на здание (строение)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558206020000"><xs:annotation><xs:documentation>Выписка из технического паспорта БТИ</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558207000000"><xs:annotation><xs:documentation>Документ (копия), подтверждающий разрешение земельного спора о согласовании местоположения границ земельного участка</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558208000000"><xs:annotation><xs:documentation>Документ (копия), подтверждающий принадлежность земельного участка к определенной категории земель</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558209000000"><xs:annotation><xs:documentation>Документ (копия), подтверждающий установленное разрешенное использование земельного участка</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558210000000"><xs:annotation><xs:documentation>Кадастровый план земельного участка (выписка из государственного земельного кадастра)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558211000000"><xs:annotation><xs:documentation>Планы иных объектов недвижимости</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558211010000"><xs:annotation><xs:documentation>Технический план здания, сооружения, помещения либо объекта незавершенного строительства (поэтажный план)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558211020000"><xs:annotation><xs:documentation>План участка лесного фонда</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558211030000"><xs:annotation><xs:documentation>План объекта недвижимости</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558211040000"><xs:annotation><xs:documentation>Экспликация к поэтажному плану</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558212000000"><xs:annotation><xs:documentation>Декларация об объекте недвижимого имущества</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558213000000"><xs:annotation><xs:documentation>Кадастровый паспорт объекта недвижимости</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558213010000"><xs:annotation><xs:documentation>Кадастровый паспорт земельного участка</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558213020000"><xs:annotation><xs:documentation>Кадастровый паспорт помещения</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558213030000"><xs:annotation><xs:documentation>Кадастровый паспорт здания, сооружения, объекта незавершенного строительства</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558214000000"><xs:annotation><xs:documentation>Кадастровая выписка об объекте недвижимости</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558214010000"><xs:annotation><xs:documentation>Кадастровая выписка о земельном участке</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558216000000"><xs:annotation><xs:documentation>Документ, подтверждающий изменение назначения здания или помещения</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558217000000"><xs:annotation><xs:documentation>Кадастровый план территории</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558218000000"><xs:annotation><xs:documentation>Кадастровая справка</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558219000000"><xs:annotation><xs:documentation>Акт обследования, подтверждающий прекращение существования объекта недвижимости</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558220000000"><xs:annotation><xs:documentation>Выписки из Реестра</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558220010000"><xs:annotation><xs:documentation>Выписка из Реестра, содержащая относящиеся к информации ограниченного доступа сведения об объекте учета</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558220020000"><xs:annotation><xs:documentation>Выписка из Реестра, содержащая сведения об объекте учета</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558220030000"><xs:annotation><xs:documentation>Выписка из Реестра, подтверждающая факт отсутствия в Реестре сведений об объекте учета</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558221000000"><xs:annotation><xs:documentation>ПРОЧИЕ</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558221010000"><xs:annotation><xs:documentation>Документы об исправлении кадастровой ошибки, направляемые в государственные органы</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558221020000"><xs:annotation><xs:documentation>Документ, содержащий необходимые для внесения в государственный кадастр недвижимости сведения о границах РФ</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558221030000"><xs:annotation><xs:documentation>Документ, содержащий необходимые для внесения в государственный кадастр недвижимости сведения о границе между субъектами Российской Федерации, границе муниципального образования, границе населенного пункта</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558221040000"><xs:annotation><xs:documentation>Документ, содержащий необходимые для внесения в государственный кадастр недвижимости сведения об установлении или изменении территориальной зоны или зоны с особыми условиями использования территорий, либо об отмене установления такой зоны</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558221050000"><xs:annotation><xs:documentation>Копия решения органа государственной власти или органа местного самоуправления об изменении (установлении) адреса</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558221060000"><xs:annotation><xs:documentation>Документы органов, осуществляющих ведение лесного и водного кадастра, содержащие сведения о природных объектах</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558221070000"><xs:annotation><xs:documentation>Документ, содержащий сведения об адресе объекта недвижимости</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558221080000"><xs:annotation><xs:documentation>Документ, содержащий сведения о кадастровой стоимости объекта</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558221990000"><xs:annotation><xs:documentation>Иной документ, содержащий описание объекта</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558300000000"><xs:annotation><xs:documentation>ДОКУМЕНТЫ, СОДЕРЖАЩИЕ ОПИСАНИЕ ЗАЯВИТЕЛЯ ИЛИ ЕГО ПРЕДСТАВИТЕЛЯ</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558301000000"><xs:annotation><xs:documentation>Документы, подтверждающие полномочия представителя</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558301010000"><xs:annotation><xs:documentation>Доверенность</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558301020000"><xs:annotation><xs:documentation>Свидетельство о рождении</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558301030000"><xs:annotation><xs:documentation>Свидетельство об усыновлении</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558301040000"><xs:annotation><xs:documentation>Решение суда</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558301050000"><xs:annotation><xs:documentation>Определение суда</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558301060000"><xs:annotation><xs:documentation>Протокол об избрании (единоличного исполнительного органа юридического лица)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558301070000"><xs:annotation><xs:documentation>Выписка из протокола об избрании (единоличного исполнительного органа юридического лица)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558301080000"><xs:annotation><xs:documentation>Приказ о назначении (руководителя или иного уполномоченного лица)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558301090000"><xs:annotation><xs:documentation>Решение органов опеки и попечительства</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558301100000"><xs:annotation><xs:documentation>Договор коммерческого представительства</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558301110000"><xs:annotation><xs:documentation>Договор доверительного управления</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558301120000"><xs:annotation><xs:documentation>Постановление судебного пристава-исполнителя</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558301130000"><xs:annotation><xs:documentation>Протокол общего собрания</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558301140000"><xs:annotation><xs:documentation>Акт органа государственной власти или органа местного самоуправления, подтверждающий полномочия представителя заявителя</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558301990000"><xs:annotation><xs:documentation>Иной документ</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558400000000"><xs:annotation><xs:documentation>ДОКУМЕНТЫ О ПРАВАХ, СДЕЛКАХ, ОГРАНИЧЕНИЯХ (ОБРЕМЕНЕНИЯХ)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401000000"><xs:annotation><xs:documentation>Правоустанавливающие документы</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010000"><xs:annotation><xs:documentation>Договоры / соглашения</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010100"><xs:annotation><xs:documentation>Сделки об отчуждении</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010101"><xs:annotation><xs:documentation>Договор купли-продажи</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010102"><xs:annotation><xs:documentation>Договор мены</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010103"><xs:annotation><xs:documentation>Договор дарения</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010104"><xs:annotation><xs:documentation>Договор ренты</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010105"><xs:annotation><xs:documentation>Договор пожизненного содержания с иждивением</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010106"><xs:annotation><xs:documentation>Договор приватизации (договор передачи объекта недвижимости в собственность)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010200"><xs:annotation><xs:documentation>Другие сделки</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010201"><xs:annotation><xs:documentation>Договор участия в долевом строительстве</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010202"><xs:annotation><xs:documentation>Соглашение об определении (перераспределении) долей в праве общей долевой собственности</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010203"><xs:annotation><xs:documentation>Брачный договор</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010204"><xs:annotation><xs:documentation>Соглашение об отступном</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010205"><xs:annotation><xs:documentation>Соглашение о разделе имущества</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010206"><xs:annotation><xs:documentation>Соглашение о выделе доли</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010207"><xs:annotation><xs:documentation>Инвестиционный договор (договор об инвестировании)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010208"><xs:annotation><xs:documentation>Мировое соглашение</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010209"><xs:annotation><xs:documentation>Договор аренды (субаренды)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010210"><xs:annotation><xs:documentation>Договор об ипотеке</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010211"><xs:annotation><xs:documentation>Договор безвозмездного срочного пользования земельным участком</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010212"><xs:annotation><xs:documentation>Кредитный договор</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010213"><xs:annotation><xs:documentation>Договор займа</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010214"><xs:annotation><xs:documentation>Соглашение об установлении сервитута</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010215"><xs:annotation><xs:documentation>Соглашение об изменении содержания закладной</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010216"><xs:annotation><xs:documentation>Дополнительное соглашение (соглашение об изменении условий договора) к договору</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010217"><xs:annotation><xs:documentation>Соглашение о расторжении договора</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010218"><xs:annotation><xs:documentation>Соглашение об уступке прав требования по договору (договор о передаче прав и обязанностей)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010219"><xs:annotation><xs:documentation>Договор простого товарищества (договор о совместной деятельности)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010220"><xs:annotation><xs:documentation>Государственный контракт</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401010299"><xs:annotation><xs:documentation>Иная сделка</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401020000"><xs:annotation><xs:documentation>Акты органов государственной власти или органов местного самоуправления</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401020100"><xs:annotation><xs:documentation>Федеральный закон</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401020200"><xs:annotation><xs:documentation>Указ Президента Российской Федерации</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401020300"><xs:annotation><xs:documentation>Постановление Правительства Российской Федерации</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401020400"><xs:annotation><xs:documentation>Закон (законы Российской Федерации, субъекта Российской Федерации)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401029900"><xs:annotation><xs:documentation>Иные акты органов государственной власти или органов местного самоуправления</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401030000"><xs:annotation><xs:documentation>Свидетельство о праве на наследство</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401030100"><xs:annotation><xs:documentation>Свидетельство о праве на наследство по закону</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401030200"><xs:annotation><xs:documentation>Свидетельство о праве на наследство по завещанию</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401040000"><xs:annotation><xs:documentation>Вступившие в силу судебные акты</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401050000"><xs:annotation><xs:documentation>Акты (свидетельства) о правах на объекты недвижимости</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401050100"><xs:annotation><xs:documentation>Регистрационное удостоверение</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401050200"><xs:annotation><xs:documentation>Свидетельство о праве на землю</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401050300"><xs:annotation><xs:documentation>Государственный акт о праве на землю</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401050400"><xs:annotation><xs:documentation>Свидетельство о праве собственности</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401059900"><xs:annotation><xs:documentation>Иные акты, свидетельства о правах на объекты недвижимости</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401060000"><xs:annotation><xs:documentation>Документы на вновь возведенный (реконструированный) объект</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401060100"><xs:annotation><xs:documentation>Разрешение на ввод объекта в эксплуатацию</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401060200"><xs:annotation><xs:documentation>Разрешение на строительство</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401060300"><xs:annotation><xs:documentation>Акт ввода в эксплуатацию</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401070000"><xs:annotation><xs:documentation>Документы при упрощенном порядке оформления прав граждан на отдельные объекты недвижимого имущества</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401070100"><xs:annotation><xs:documentation>Выписка из похозяйственной книги о наличии у гражданина права на земельный участок</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401070200"><xs:annotation><xs:documentation>Кадастровый паспорт объекта недвижимости</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401070300"><xs:annotation><xs:documentation>Декларация об объекте недвижимого имущества</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401080000"><xs:annotation><xs:documentation>Прочие правоустанавливающие документы</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401080100"><xs:annotation><xs:documentation>Передаточный акт</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401080200"><xs:annotation><xs:documentation>Разделительный баланс</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401080300"><xs:annotation><xs:documentation>План приватизации</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401080400"><xs:annotation><xs:documentation>Правила доверительного управления</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401080500"><xs:annotation><xs:documentation>Акт описи и ареста имущества</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401080600"><xs:annotation><xs:documentation>Протокол о выделе земельного участка в счет земельной доли</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401080700"><xs:annotation><xs:documentation>Протокол общего собрания собственников помещений в многоквартирном доме</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401080800"><xs:annotation><xs:documentation>Отказ одаряемого принять дар (отказ от дара)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401080900"><xs:annotation><xs:documentation>Соглашение о новации</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401081000"><xs:annotation><xs:documentation>Соглашение о разделе наследственного имущества</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401081100"><xs:annotation><xs:documentation>Соглашение об уплате алиментов</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401081200"><xs:annotation><xs:documentation>Документ, подтверждающий наличие, возникновение, переход ограничения (обременения) вещного права на объект недвижимости в пользу заявителя</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558401089900"><xs:annotation><xs:documentation>Иной документ</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402000000"><xs:annotation><xs:documentation>СОПУТСТВУЮЩИЕ И ДОПОЛНИТЕЛЬНЫЕ ДОКУМЕНТЫ</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402010000"><xs:annotation><xs:documentation>Согласие супруга на совершение сделки</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402020000"><xs:annotation><xs:documentation>Согласие органов опеки и попечительства</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402030000"><xs:annotation><xs:documentation>Свидетельство о заключении брака</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402040000"><xs:annotation><xs:documentation>Свидетельство о расторжении брака</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402050000"><xs:annotation><xs:documentation>Решение об одобрении (о совершении) сделки</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402060000"><xs:annotation><xs:documentation>Справка о стоимости (справка о соотношении стоимости отчуждаемого объекта и балансовой стоимости имущества или активов хозяйственного общества)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402070000"><xs:annotation><xs:documentation>Справка о заинтересованных лицах в сделке</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402080000"><xs:annotation><xs:documentation>Выписка из домовой книги (сведения о лицах, сохраняющих право проживания в жилом помещении после перехода права на него)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402090000"><xs:annotation><xs:documentation>Выписка из лицевого счета (сведения о лицах, сохраняющих право проживания в жилом помещении после перехода права на него)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402100000"><xs:annotation><xs:documentation>Протокол о результатах торгов</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402110000"><xs:annotation><xs:documentation>Лицензия (лицензия на осуществление определенных видов деятельности)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402120000"><xs:annotation><xs:documentation>Проектная декларация</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402130000"><xs:annotation><xs:documentation>Отказ от преимущественного права покупки (для участников долевой собственности, для субъекта Российской Федерации при продаже земельного участка из состава земель сельскохозяйственного назначения)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402140000"><xs:annotation><xs:documentation>Решение о создании юридического лица</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402150000"><xs:annotation><xs:documentation>Решение о реорганизации юридического лица</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402160000"><xs:annotation><xs:documentation>Решение о ликвидации юридического лица</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402170000"><xs:annotation><xs:documentation>Решение об утверждении оценки имущества (решение об утверждении оценки неденежных вкладов в уставный капитал общества)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402180000"><xs:annotation><xs:documentation>Исполнительный лист</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402190000"><xs:annotation><xs:documentation>Договор поручения</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402200000"><xs:annotation><xs:documentation>Бухгалтерский баланс</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402210000"><xs:annotation><xs:documentation>Закладная</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402220000"><xs:annotation><xs:documentation>Добавочный лист к закладной</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402230000"><xs:annotation><xs:documentation>Выписка из реестра муниципальной собственности</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402240000"><xs:annotation><xs:documentation>Выписка из реестра собственности субъекта Российской Федерации</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402250000"><xs:annotation><xs:documentation>Выписка из реестра федерального имущества</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402260000"><xs:annotation><xs:documentation>Жилищный сертификат</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402270000"><xs:annotation><xs:documentation>Аудиторское заключение</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402280000"><xs:annotation><xs:documentation>Отчет о проведении независимой оценки (акт оценки)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402390000"><xs:annotation><xs:documentation>Акт инвентаризации</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402400000"><xs:annotation><xs:documentation>Охранное обязательство собственника объекта культурного наследия</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558402990000"><xs:annotation><xs:documentation>Иной документ</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558403000000"><xs:annotation><xs:documentation>ДОКУМЕНТЫ, СОДЕРЖАЩИЕ СВЕДЕНИЯ ЕГРП</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558403010000"><xs:annotation><xs:documentation>Свидетельство о государственной регистрации права</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558403020000"><xs:annotation><xs:documentation>Выписка о правах на объект недвижимого имущества</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558403030000"><xs:annotation><xs:documentation>Выписка о переходе прав на объект недвижимого имущества</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558403040000"><xs:annotation><xs:documentation>Выписка о правах отдельного лица на имеющиеся у него объекты недвижимого имущества</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558403050000"><xs:annotation><xs:documentation>Выписка о признании правообладателя недееспособным или ограниченно дееспособным</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558403060000"><xs:annotation><xs:documentation>Справка о содержании правоустанавливающих документов на объект недвижимого имущества</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558403070000"><xs:annotation><xs:documentation>Справка о лицах, получивших сведения об объекте недвижимого имущества</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558403080000"><xs:annotation><xs:documentation>Копии договоров и иных документов, выражающих содержание односторонних сделок, совершенных в простой письменной форме</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558403090000"><xs:annotation><xs:documentation>Выписка из ЕГРП о принятии на учет бесхозяйного объекта недвижимого имущества</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558403100000"><xs:annotation><xs:documentation>Выписка из ЕГРП о принятии на учет бесхозяйного объекта недвижимого имущества, от права собственности на который собственник отказался</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558403110000"><xs:annotation><xs:documentation>Выписка из ЕГРП о бесхозяйном объекте недвижимого имущества, принятом на учет</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558403990000"><xs:annotation><xs:documentation>Иной документ</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558500000000"><xs:annotation><xs:documentation>Решения, уведомления, расписки</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558501000000"><xs:annotation><xs:documentation>Документы о результатах кадастрового учета</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558501010000"><xs:annotation><xs:documentation>РЕШЕНИЯ</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558501010100"><xs:annotation><xs:documentation>Решение об отказе в предоставлении запрашиваемых сведений</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558501010200"><xs:annotation><xs:documentation>Решение об отказе в исправлении кадастровой ошибки</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558501010300"><xs:annotation><xs:documentation>Решение об отказе в исправлении технической ошибки</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558501010400"><xs:annotation><xs:documentation>Решение об исправлении технической и кадастровой ошибок</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558501010500"><xs:annotation><xs:documentation>Решение об отказе в учете</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558501010600"><xs:annotation><xs:documentation>Решение о приостановлении учета</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558501010700"><xs:annotation><xs:documentation>Решение об отказе в снятии приостановления</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558501010800"><xs:annotation><xs:documentation>Решение о снятии с кадастрового учета земельных участков со статусом «временные» по заявлению заинтересованного лица</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558501010900"><xs:annotation><xs:documentation>Решение об отказе в выдаче кадастрового паспорта и выдаче вместо него кадастровой выписки</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558501020000"><xs:annotation><xs:documentation>УВЕДОМЛЕНИЯ</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558501020100"><xs:annotation><xs:documentation>Уведомление об отсутствии в ГКН запрашиваемых сведений</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558501020200"><xs:annotation><xs:documentation>Уведомление об осуществленном кадастровом учете</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558501020300"><xs:annotation><xs:documentation>Уведомление об отказе в приеме документов для внесения в ЕГРОКС сведений об ОКС</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558501020400"><xs:annotation><xs:documentation>Уведомление об отказе в приеме документов для предоставления из ЕГРОКС сведений об ОКС</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558501020500"><xs:annotation><xs:documentation>Уведомление об устранении технической ошибки в сведениях</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558501020600"><xs:annotation><xs:documentation>Уведомление об отказе в выдаче сведений об ОКС</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558501020700"><xs:annotation><xs:documentation>Уведомление о приостановлении осуществления кадастрового учета</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558501020800"><xs:annotation><xs:documentation>Уведомление об отказе в осуществлении кадастрового учета</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558501030000"><xs:annotation><xs:documentation>ПРОЧИЕ</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558501030100"><xs:annotation><xs:documentation>Расписка в получении соответствующих документов для проведения государственного кадастрового учета</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558501039900"><xs:annotation><xs:documentation>Иные документы</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558502000000"><xs:annotation><xs:documentation>Документы о результатах регистрации прав</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558502010000"><xs:annotation><xs:documentation>УВЕДОМЛЕНИЯ, СООБЩЕНИЯ</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558502010100"><xs:annotation><xs:documentation>Уведомление о приостановлении государственной регистрации</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558502010200"><xs:annotation><xs:documentation>Уведомление о прекращении государственной регистрации</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558502010300"><xs:annotation><xs:documentation>Уведомление о проведении государственной регистрации ограничения (обременения) права</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558502010400"><xs:annotation><xs:documentation>Уведомление о внесении изменений в ЕГРП</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558502010500"><xs:annotation><xs:documentation>Уведомление об исправлении технической ошибки</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558502010600"><xs:annotation><xs:documentation>Сообщение об отказе в государственной регистрации</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558502010700"><xs:annotation><xs:documentation>Сообщение об отказе в предоставлении запрашиваемых сведений</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558502010800"><xs:annotation><xs:documentation>Уведомление об отсутствии в ЕГРП запрашиваемых сведений</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558502010900"><xs:annotation><xs:documentation>Сообщение о приеме заявления о государственной регистрации права, ограничения (обременения) права на предприятие, сделки с ним</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558502011000"><xs:annotation><xs:documentation>Сообщение о поступлении документов на государственную регистрацию договоров мены и (или) перехода права</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558502011100"><xs:annotation><xs:documentation>Уведомление о возврате приложенных к заявлению документов без рассмотрения</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558502011200"><xs:annotation><xs:documentation>Уведомление о погашении регистрационной записи</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558502020000"><xs:annotation><xs:documentation>ПРОЧИЕ</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558502020100"><xs:annotation><xs:documentation>Расписка в получении документов на государственную регистрацию</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="558502029900"><xs:annotation><xs:documentation>Иной документ</xs:documentation></xs:annotation></xs:enumeration>

<!--Единицы измерения-->

<xs:enumeration value="003"><xs:annotation><xs:documentation>Миллиметр</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="004"><xs:annotation><xs:documentation>Сантиметр</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="005"><xs:annotation><xs:documentation>Дециметр</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="006"><xs:annotation><xs:documentation>Метр</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="008"><xs:annotation><xs:documentation>Километр</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="009"><xs:annotation><xs:documentation>Мегаметр</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="047"><xs:annotation><xs:documentation>Морская миля</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="050"><xs:annotation><xs:documentation>Квадратный миллиметр</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="051"><xs:annotation><xs:documentation>Квадратный сантиметр</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="053"><xs:annotation><xs:documentation>Квадратный дециметр</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="055"><xs:annotation><xs:documentation>Квадратный метр</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="058"><xs:annotation><xs:documentation>Тысяча квадратных метров</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="059"><xs:annotation><xs:documentation>Гектар</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="061"><xs:annotation><xs:documentation>Квадратный километр</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="109"><xs:annotation><xs:documentation>Ар (100 м2)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="359"><xs:annotation><xs:documentation>Сутки</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="360"><xs:annotation><xs:documentation>Неделя</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="361"><xs:annotation><xs:documentation>Декада</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="362"><xs:annotation><xs:documentation>Месяц</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="364"><xs:annotation><xs:documentation>Квартал</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="365"><xs:annotation><xs:documentation>Полугодие</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="366"><xs:annotation><xs:documentation>Год</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="383"><xs:annotation><xs:documentation>Рубль</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="384"><xs:annotation><xs:documentation>Тысяча рублей</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="385"><xs:annotation><xs:documentation>Миллион рублей</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="386"><xs:annotation><xs:documentation>Миллиард рублей</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="1000"><xs:annotation><xs:documentation>Неопределено</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="1001"><xs:annotation><xs:documentation>Значение отсутствует</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="1002"><xs:annotation><xs:documentation>Рублей за кв. метр</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="1003"><xs:annotation><xs:documentation>Рублей за ар</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="1004"><xs:annotation><xs:documentation>Рублей  за гектар</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="1005"><xs:annotation><xs:documentation>Иные</xs:documentation></xs:annotation></xs:enumeration>
<!--Обременения-->				
<xs:enumeration value="022001000000"><xs:annotation><xs:documentation>Сервитут</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="022001001000"><xs:annotation><xs:documentation>Публичный сервитут</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="022001002000"><xs:annotation><xs:documentation>Частный сервитут</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="022002000000"><xs:annotation><xs:documentation>Арест</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="022003000000"><xs:annotation><xs:documentation>Запрещение</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="022004000000"><xs:annotation><xs:documentation>Ограничения прав на земельный участок, предусмотренные статьями 56, 56.1 Земельного кодекса Российской Федерации</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="022005000000"><xs:annotation><xs:documentation>Решение об изъятии земельного участка, жилого помещения</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="022006000000"><xs:annotation><xs:documentation>Аренда (в том числе, субаренда)</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="022007000000"><xs:annotation><xs:documentation>Ипотека</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="022008000000"><xs:annotation><xs:documentation>Ипотека в силу закона</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="022009000000"><xs:annotation><xs:documentation>Безвозмездное (срочное) пользование земельным/лесным участком</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="022010000000"><xs:annotation><xs:documentation>Доверительное управление</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="022011000000"><xs:annotation><xs:documentation>Рента</xs:documentation></xs:annotation></xs:enumeration>
<xs:enumeration value="022099000000"><xs:annotation><xs:documentation>Иные ограничения (обременения) прав</xs:documentation></xs:annotation></xs:enumeration>

		</xsl:variable>	
				<xsl:template name="get_dict">
		<xsl:param name="p_code"/>
		<xsl:variable name="ret">
			<xsl:value-of select="document('')/.//xsl:variable[@name='v_dict']/.//xs:enumeration[@value=$p_code]"/>
		</xsl:variable>
		<xsl:if test="$ret != ''">
			<xsl:value-of select="$ret"/>
		</xsl:if>
		<xsl:if test="$ret = ''">
			<xsl:value-of select="'-'"/>
		</xsl:if>
	</xsl:template><xsl:template name="get_namedoc">
		<xsl:if test="Name">
			<xsl:value-of select="Name"/>
		</xsl:if>
		<xsl:if test="not(Name)">
			<xsl:value-of select="document('')/.//xsl:variable[@name='v_dict']/.//xs:enumeration[@value=Code_Document]/xs:annotation/xs:documentation"/>
		</xsl:if>
	</xsl:template><xsl:template name="output">
		<xsl:param name="p_val"/>
		<xsl:value-of select="$p_val"/>
	</xsl:template><xsl:template name="format_date">
		<xsl:param name="p_date"/>
		<xsl:variable name="y">
			<xsl:value-of select="substring(string($p_date),1,4)"/>
		</xsl:variable>
		<xsl:variable name="m">
			<xsl:value-of select="substring(string($p_date),6,2)"/>
		</xsl:variable>
		<xsl:variable name="d">
			<xsl:value-of select="substring(string($p_date),9,2)"/>
		</xsl:variable>
		<xsl:value-of select="$d"/>
		<xsl:value-of select="'.'"/>
		<xsl:value-of select="$m"/>
		<xsl:value-of select="'.'"/>
		<xsl:value-of select="$y"/>
	</xsl:template><xsl:template name="point_name">
		<xsl:variable name="p_name">
			<xsl:value-of select="@Point_Pref"/>
			<xsl:value-of select="@Num_Geopoint"/>
		</xsl:variable>
		<xsl:if test="$p_name=''">
			<xsl:value-of select="'-'"/>
		</xsl:if>
		<xsl:if test="$p_name != ''">
			<xsl:value-of select="$p_name"/>
		</xsl:if>
	</xsl:template><xsl:template name="border_point_name">
		<xsl:param name="p1"/>
		<xsl:param name="p2"/>
		<xsl:variable name="p_spatial" select="number(./@Spatial)"/>
		<xsl:variable name="p_pos" select="count(./preceding-sibling::*[@Spatial &lt; $p_spatial])+1"/>
		<xsl:variable name="p_point">
			<xsl:if test="$p_spatial != 1">
				<xsl:if test="$p1">
					<xsl:value-of select="number(./@Point1)"/>
				</xsl:if>
				<xsl:if test="$p2">
					<xsl:value-of select="number(./@Point2)"/>
				</xsl:if>
			</xsl:if>
			<xsl:if test="$p_spatial = 1">
				<xsl:if test="$p2">
					<xsl:value-of select="number(./@Point1)"/>
				</xsl:if>
				<xsl:if test="$p1">
					<xsl:value-of select="number(./@Point2)"/>
				</xsl:if>
			</xsl:if>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="not($p_spatial)">
				<xsl:value-of select="'-'"/>
			</xsl:when>
			<xsl:when test="../../Spatial_Element[$p_spatial]">
				<xsl:value-of select="../../Spatial_Element[$p_spatial]/Spelement_Unit[position() = $p_point]/NewOrdinate/@Point_Pref"/>
				<xsl:value-of select="../../Spatial_Element[$p_spatial]/Spelement_Unit[position() = $p_point]/NewOrdinate/@Num_Geopoint"/>
			</xsl:when>
			<xsl:when test="not(../../Spatial_Element[$p_spatial])">
				<xsl:value-of select="../../Spatial_Element[1]/Spelement_Unit[position() = ($p_pos+$p_point)]/NewOrdinate/@Point_Pref"/>
				<xsl:value-of select="../../Spatial_Element[1]/Spelement_Unit[position() = ($p_pos+$p_point)]/NewOrdinate/@Num_Geopoint"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="../../Spatial_Element[$p_spatial]/Spelement_Unit[position() = $p_point]/NewOrdinate/@Point_Pref"/>
				<xsl:value-of select="../../Spatial_Element[$p_spatial]/Spelement_Unit[position() = $p_point]/NewOrdinate/@Num_Geopoint"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template><xsl:template name="tpl_border_point1">
		<xsl:variable name="p_point" select="./@Point1"/>
		<xsl:variable name="p_spatial" select="./@Spatial"/>
		<xsl:value-of select="./../../Spatial_Element[$p_spatial]/Spelement_Unit/NewOrdinate[position() = $p_point]/@Point_Pref"/>
		<xsl:value-of select="./../../Spatial_Element[$p_spatial]/Spelement_Unit/NewOrdinate[position() = $p_point]/@Num_Geopoint"/>
	</xsl:template><xsl:template name="tpl_border_point2">
		<xsl:variable name="p_point" select="./@Point2"/>
		<xsl:variable name="p_spatial" select="./@Spatial"/>
		<xsl:value-of select="./../../Spatial_Element[$p_spatial]/Spelement_Unit/NewOrdinate[position() = $p_point]/@Point_Pref"/>
		<xsl:value-of select="./../../Spatial_Element[$p_spatial]/Spelement_Unit/NewOrdinate[position() = $p_point]/@Num_Geopoint"/>
	</xsl:template><xsl:template name="mp_type">
		<xsl:choose>
			<xsl:when test="STD_MP/Title/Reason">
				<xsl:value-of select="STD_MP/Title/Reason"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'—'"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template><xsl:template name="mp_target">
		<xsl:choose>
			<xsl:when test="STD_MP/Title/Purpose">
				<xsl:value-of select="STD_MP/Title/Purpose"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'—'"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template><xsl:template name="mp_client">
		<xsl:value-of select="concat(/.//Title/Client/Person/FIO/Surname,' ',             /.//Title/Client/Person/FIO/First,' ',             /.//Title/Client/Person/FIO/Patronymic,             /.//Title/Client/Organization/Name,             /.//Title/Client/Foreign_Organization/Name,             /.//Title/Client/Governance/Name)"/>
	</xsl:template><xsl:template name="mp_client_agent">
		<xsl:value-of select="concat(/.//Title/Client//Agent/Appointment,' ',             /.//Title/Client//Agent/Surname,' ',             /.//Title/Client//Agent/First,' ',             /.//Title/Client//Agent/Patronymic             )"/>
	</xsl:template><xsl:template name="mp_client_date">
		<xsl:call-template name="format_date">
			<xsl:with-param name="p_date" select="//Client/@Date"/>
		</xsl:call-template>
	</xsl:template><xsl:template name="mp_address">
		<!--xsl:value-of select="Postal_Code"/>
	<xsl:call-template name="get_dict">
		<xsl:with-param name="p_code" select="Region"/>	
	</xsl:call-template>
	<xsl:value-of select="District/@Name"/> <xsl:value-of select="District/@Type"/>
	<xsl:value-of select="City/@Type"/> <xsl:value-of select="City/@Name"/>
	<xsl:value-of select="Urban_District/@Name"/> <xsl:value-of select="Urban_District/@Type"/>
	<xsl:value-of select="Soviet_Village/@Name"/> <xsl:value-of select="Soviet_Village/@Type"/>
	<xsl:value-of select="Locality/@Type"/> <xsl:value-of select="Locality/@Name"/>
	<xsl:value-of select="Street/@Type"/> <xsl:value-of select="Street/@Name"/>
	<xsl:value-of select="Level1/@Type"/> <xsl:value-of select="Level1/@Value"/>
	<xsl:value-of select="Level2/@Type"/> <xsl:value-of select="Level2/@Value"/>
	<xsl:value-of select="Level3/@Type"/> <xsl:value-of select="Level3/@Value"/>
	<xsl:value-of select="Apartment/@Type"/> <xsl:value-of select="Apartment/@Value"/-->
		<xsl:value-of select="Note"/>
	</xsl:template><xsl:template match="//Contractor/FIO" name="mp_cad_fio"><xsl:value-of select="Surname"/> <xsl:value-of select="First"/> <xsl:value-of select="Patronymic"/></xsl:template><xsl:template match="//Contractor/N_Certificate" name="mp_cad_cert">
		<xsl:value-of select="text()"/>
	</xsl:template><xsl:template match="//Contractor/Telephone" name="mp_cad_phone">
		<xsl:value-of select="text()"/>
	</xsl:template><xsl:template match="//Contractor" name="mp_cad_address"><xsl:value-of select="Address"/> <xsl:value-of select="E_mail"/></xsl:template><xsl:template match="//Contractor/Organization" name="mp_cad_org">
		<xsl:value-of select="text()"/>
	</xsl:template><xsl:template match="//Contractor/@Date" name="mp_cad_date">
		<xsl:call-template name="format_date">
			<xsl:with-param name="p_date" select="//Contractor/@Date"/>
		</xsl:call-template>
	</xsl:template><xsl:template name="get_value">
		<xsl:param name="p_name"/>
		<xsl:if test="./@*[name()=$p_name] | ./*[name()=$p_name]">
			<xsl:value-of select="./@*[name()=$p_name] | ./*[name()=$p_name]"/>
		</xsl:if>
		<xsl:if test="not(./@*[name()=$p_name] | ./*[name()=$p_name])">
			<xsl:value-of select="'-'"/>
		</xsl:if>
	</xsl:template><xsl:template name="point_coord">
		<xsl:param name="x"/>
		<xsl:param name="y"/>
		<xsl:param name="n"/>
		<xsl:param name="o"/>
		<xsl:variable name="val">
			<xsl:if test="$x">
				<xsl:value-of select="format-number(@X,'#0.00')"/>
			</xsl:if>
			<xsl:if test="$y">
				<xsl:value-of select="format-number(@Y,'#0.00')"/>
			</xsl:if>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="not(@Point_Pref)">
				<xsl:value-of select="'-'"/>
			</xsl:when>
			<xsl:when test="$o">
				<xsl:if test="@Point_Pref = ''">
					<xsl:value-of select="$val"/>
				</xsl:if>
				<xsl:if test="@Point_Pref != ''">
					<xsl:value-of select="'-'"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$n">
				<xsl:if test="@Point_Pref != ''">
					<xsl:value-of select="$val"/>
				</xsl:if>
				<xsl:if test="@Point_Pref = ''">
					<!--xsl:value-of select="'-'"/-->
					<xsl:value-of select="$val"/>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$val"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template><xsl:template match="text:p/@text:style-name[../descendant-or-self::text()='-']" mode="pass2">
		<xsl:attribute name="text:style-name">
			<xsl:value-of select="'P29'"/>
		</xsl:attribute>
	</xsl:template><xsl:template match="@* | node()" mode="pass2">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()" mode="pass2"/>
		</xsl:copy>
	</xsl:template><xsl:template name="sqrt">
		<xsl:param name="num" select="0"/>
		<!-- The number you want to find the square root of -->
		<xsl:param name="try" select="1"/>
		<!-- The current 'try'.  This is used internally. -->
		<xsl:param name="iter" select="1"/>
		<!-- The current iteration, checked against maxiter to limit loop count -->
		<xsl:param name="maxiter" select="10"/>
		<!-- Set this up to insure against infinite loops -->
		<!-- This template was written by Nate Austin using Sir Isaac Newton's method of finding roots -->
		<xsl:choose>
			<xsl:when test="$try * $try = $num or $iter &gt; $maxiter">
				<xsl:value-of select="$try"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="sqrt">
					<xsl:with-param name="num" select="$num"/>
					<xsl:with-param name="try" select="$try - (($try * $try - $num) div (2 * $try))"/>
					<xsl:with-param name="iter" select="$iter + 1"/>
					<xsl:with-param name="maxiter" select="$maxiter"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template><xsl:template name="power">
		<xsl:param name="x"/>
		<xsl:param name="n"/>
		<xsl:choose>
			<xsl:when test="$n = 0">1</xsl:when>
			<xsl:when test="$n = 1">
				<xsl:value-of select="$x"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="pow-1">
					<xsl:call-template name="power">
						<xsl:with-param name="x" select="$x"/>
						<xsl:with-param name="n" select="$n - 1"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:value-of select="$x * $pow-1"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template><xsl:template name="get_m">
		<xsl:variable name="d1">
			<xsl:call-template name="power">
				<xsl:with-param name="x" select="number(/.//*[1]/*/@Delta_Geopoint)"/>
				<xsl:with-param name="n" select="2"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="d2">
			<xsl:call-template name="sqrt">
				<xsl:with-param name="num" select="$d1 div 2"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:value-of select="format-number($d2,'#0.00')"/>
	</xsl:template><xsl:template name="string-replace">
		<xsl:param name="subject" select="''"/>
		<xsl:param name="search" select="''"/>
		<xsl:param name="replacement" select="''"/>
		<xsl:param name="global" select="false()"/>
		<xsl:choose>
			<xsl:when test="contains($subject, $search)">
				<xsl:value-of select="substring-before($subject, $search)"/>
				<xsl:value-of select="$replacement"/>
				<xsl:variable name="rest" select="substring-after($subject, $search)"/>
				<xsl:choose>
					<xsl:when test="$global">
						<xsl:call-template name="string-replace">
							<xsl:with-param name="subject" select="$rest"/>
							<xsl:with-param name="search" select="$search"/>
							<xsl:with-param name="replacement" select="$replacement"/>
							<xsl:with-param name="global" select="$global"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$rest"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$subject"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template><xsl:template name="get_image">
		<xsl:variable name="v_filename">
			<xsl:call-template name="string-replace">
				<xsl:with-param name="subject" select="@Name"/>
				<xsl:with-param name="search" select="'pdf'"/>
				<xsl:with-param name="replacement" select="'jpg'"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="p_name">
			<xsl:value-of select="concat('Pictures/',$v_filename)"/>
		</xsl:variable>
		<text:p text:style-name="P120">
			<draw:frame draw:style-name="fr2" draw:name="Графический объект1" text:anchor-type="paragraph" svg:x="0.496cm" svg:y="0.206cm" svg:width="20.5cm" svg:height="29cm" draw:z-index="0">
				<draw:image xlink:href="{$p_name}" xlink:type="simple" xlink:show="embed" xlink:actuate="onLoad"/>
			</draw:frame>
		</text:p>
	</xsl:template><xsl:template match="/">
		<office:document-content>
			<office:scripts/>
			<office:font-face-decls>
				<style:font-face style:name="Courier New" svg:font-family="'Courier New'" style:font-family-generic="modern" style:font-pitch="fixed"/>
				<style:font-face style:name="Times New Roman" svg:font-family="'Times New Roman'" style:font-family-generic="roman" style:font-pitch="variable"/>
				<style:font-face style:name="Times New Roman1" svg:font-family="'Times New Roman'" style:font-adornments="Курсив" style:font-family-generic="roman" style:font-pitch="variable"/>
				<style:font-face style:name="Times New Roman CYR" svg:font-family="'Times New Roman CYR'" style:font-family-generic="roman" style:font-pitch="variable"/>
				<style:font-face style:name="Arial" svg:font-family="Arial" style:font-family-generic="swiss" style:font-pitch="variable"/>
				<style:font-face style:name="Tahoma" svg:font-family="Tahoma" style:font-family-generic="swiss" style:font-pitch="variable"/>
				<style:font-face style:name="MS Mincho" svg:font-family="'MS Mincho'" style:font-family-generic="system" style:font-pitch="variable"/>
				<style:font-face style:name="Tahoma1" svg:font-family="Tahoma" style:font-family-generic="system" style:font-pitch="variable"/>
			</office:font-face-decls>
			<office:automatic-styles>
				<style:style style:name="Таблица8" style:family="table">
					<style:table-properties style:width="17.09cm" fo:margin-left="0cm" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица8.A" style:family="table-column">
					<style:table-column-properties style:column-width="6.249cm"/>
				</style:style>
				<style:style style:name="Таблица8.B" style:family="table-column">
					<style:table-column-properties style:column-width="3.655cm"/>
				</style:style>
				<style:style style:name="Таблица8.C" style:family="table-column">
					<style:table-column-properties style:column-width="1.401cm"/>
				</style:style>
				<style:style style:name="Таблица8.D" style:family="table-column">
					<style:table-column-properties style:column-width="5.715cm"/>
				</style:style>
				<style:style style:name="Таблица8.E" style:family="table-column">
					<style:table-column-properties style:column-width="0.071cm"/>
				</style:style>
				<style:style style:name="Таблица8.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.483cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица8.A1" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.018cm" fo:padding-right="0.018cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="none"/>
				</style:style>
				<style:style style:name="Таблица8.D1" style:family="table-cell">
					<style:table-cell-properties style:border-line-width="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="1.5pt double #000000"/>
				</style:style>
				<style:style style:name="Таблица8.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.358cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица8.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" style:border-line-width-top="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt double #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица8.B2" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" style:border-line-width-top="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt double #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица8.3" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.697cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица8.B3" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="none"/>
				</style:style>
				<style:style style:name="Таблица8.4" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.508cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица8.A4" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" style:border-line-width-bottom="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="1.5pt double #000000"/>
				</style:style>
				<style:style style:name="Таблица8.B4" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="bottom" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="none"/>
				</style:style>
				<style:style style:name="Таблица8.D4" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="bottom" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="none" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="none"/>
				</style:style>
				<style:style style:name="Таблица8.B5" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="bottom" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" style:border-line-width-bottom="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="1.5pt double #000000"/>
				</style:style>
				<style:style style:name="Таблица8.6" style:family="table-row">
					<style:table-row-properties style:row-height="0.011cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица8.A6" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" style:border-line-width-top="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt double #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица8.A7" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" style:border-line-width-top="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt double #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица8.A8" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="1.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица8.A9" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица8.A10" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" style:border-line-width-bottom="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="1.5pt double #000000"/>
				</style:style>
				<style:style style:name="Таблица8.A11" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" style:border-line-width-top="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt double #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица8.A12" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица8.A13" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица8.14" style:family="table-row">
					<style:table-row-properties style:min-row-height="1.806cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица8.A14" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="bottom" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица8.D14" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица8.15" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.626cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица8.A15" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="bottom" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" style:border-line-width-bottom="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="1.5pt double #000000"/>
				</style:style>
				<style:style style:name="Таблица8.A16" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" style:border-line-width-top="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt double #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица8.A17" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица8.A18" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица8.A19" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица8.A20" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица8.A21" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица8.22" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.593cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица8.A22" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица8.C22" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица8.23" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.926cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица8.A23" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="bottom" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" style:border-line-width-bottom="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="1.5pt double #000000"/>
				</style:style>
				<style:style style:name="Таблица9" style:family="table">
					<style:table-properties style:width="16.78cm" fo:margin-left="0.018cm" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица9.A" style:family="table-column">
					<style:table-column-properties style:column-width="1.61cm"/>
				</style:style>
				<style:style style:name="Таблица9.B" style:family="table-column">
					<style:table-column-properties style:column-width="12.312cm"/>
				</style:style>
				<style:style style:name="Таблица9.C" style:family="table-column">
					<style:table-column-properties style:column-width="2.858cm"/>
				</style:style>
				<style:style style:name="Таблица9.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.667cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица9.A1" style:family="table-cell">
					<style:table-cell-properties fo:padding="0.049cm" fo:border-left="none" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.C1" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-top="0.018cm 0.018cm 0.018cm" fo:padding="0.049cm" fo:border-left="1.5pt solid #000000" fo:border-right="1.5pt solid #000000" fo:border-top="1.5pt double #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.603cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица9.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-top="0.018cm 0.018cm 0.018cm" fo:padding="0.049cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt solid #000000" fo:border-top="1.5pt double #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.3" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.568cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица9.A3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding="0.049cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt solid #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A4" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-top="0.018cm 0.018cm 0.018cm" fo:padding="0.049cm" fo:border-left="1.5pt double #000000" fo:border-right="none" fo:border-top="1.5pt double #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.B4" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-top="0.018cm 0.018cm 0.018cm" fo:padding="0.049cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="1.5pt double #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.C4" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-top="0.018cm 0.018cm 0.018cm" fo:padding="0.049cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt solid #000000" fo:border-top="1.5pt double #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.5" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.374cm"/>
				</style:style>
				<style:style style:name="Таблица9.A5" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding="0.049cm" fo:border-left="1.5pt double #000000" fo:border-right="none" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.B5" style:family="table-cell">
					<style:table-cell-properties fo:padding="0.049cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.C5" style:family="table-cell">
					<style:table-cell-properties fo:padding="0.049cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt solid #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A6" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.B6" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.C6" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A7" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.B7" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.C7" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A8" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A9" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.B9" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.C9" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A10" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A11" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.B11" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.C11" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A12" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A13" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.B13" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.C13" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A14" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A15" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.B15" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.C15" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A16" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A17" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.B17" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.C17" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A18" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A19" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.B19" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.C19" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A20" style:family="table-cell" style:data-style-name="N0">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A21" style:family="table-cell" style:data-style-name="N0">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.B21" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.C21" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A22" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A23" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.B23" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.C23" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A24" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A25" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.B25" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.C25" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A26" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A27" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.B27" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.C27" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A28" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" style:border-line-width-bottom="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="1.5pt double #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A29" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-bottom="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="1.5pt double #000000"/>
				</style:style>
				<style:style style:name="Таблица9.B29" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-bottom="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="1.5pt double #000000"/>
				</style:style>
				<style:style style:name="Таблица9.C29" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" style:border-line-width-bottom="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="1.5pt double #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A30" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" style:border-line-width-bottom="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="1.5pt double #000000"/>
				</style:style>
				<style:style style:name="Таблица11" style:family="table" style:master-page-name="MP2">
					<style:table-properties style:width="17.016cm" fo:margin-left="0.011cm" style:page-number="auto" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица11.A" style:family="table-column">
					<style:table-column-properties style:column-width="1.646cm"/>
				</style:style>
				<style:style style:name="Таблица11.B" style:family="table-column">
					<style:table-column-properties style:column-width="8.255cm"/>
				</style:style>
				<style:style style:name="Таблица11.C" style:family="table-column">
					<style:table-column-properties style:column-width="7.116cm"/>
				</style:style>
				<style:style style:name="Таблица11.1" style:family="table-row">
					<style:table-row-properties style:row-height="0.011cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица11.A1" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" style:border-line-width-top="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt double #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица11.A2" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица11.A3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица11.B3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица11.C3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица20" style:family="table">
					<style:table-properties style:width="17.016cm" fo:margin-left="0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица20.A" style:family="table-column">
					<style:table-column-properties style:column-width="1.646cm"/>
				</style:style>
				<style:style style:name="Таблица20.B" style:family="table-column">
					<style:table-column-properties style:column-width="8.255cm"/>
				</style:style>
				<style:style style:name="Таблица20.C" style:family="table-column">
					<style:table-column-properties style:column-width="7.116cm"/>
				</style:style>
				<style:style style:name="Таблица20.1" style:family="table-row">
					<style:table-row-properties fo:keep-together="always"/>
				</style:style>
				<style:style style:name="Таблица20.A1" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица20.B1" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица20.C1" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица20.A2" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица20.A3" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица20.B3" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица20.C3" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица21" style:family="table">
					<style:table-properties style:width="17.016cm" fo:margin-left="0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица21.A" style:family="table-column">
					<style:table-column-properties style:column-width="1.646cm"/>
				</style:style>
				<style:style style:name="Таблица21.B" style:family="table-column">
					<style:table-column-properties style:column-width="6.025cm"/>
				</style:style>
				<style:style style:name="Таблица21.C" style:family="table-column">
					<style:table-column-properties style:column-width="3.177cm"/>
				</style:style>
				<style:style style:name="Таблица21.E" style:family="table-column">
					<style:table-column-properties style:column-width="2.992cm"/>
				</style:style>
				<style:style style:name="Таблица21.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="1.127cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица21.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица21.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.626cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица21.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица21.B2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица21.D2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица23" style:family="table">
					<style:table-properties style:width="17.016cm" fo:margin-left="0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица23.A" style:family="table-column">
					<style:table-column-properties style:column-width="1.646cm"/>
				</style:style>
				<style:style style:name="Таблица23.B" style:family="table-column">
					<style:table-column-properties style:column-width="6.025cm"/>
				</style:style>
				<style:style style:name="Таблица23.C" style:family="table-column">
					<style:table-column-properties style:column-width="3.177cm"/>
				</style:style>
				<style:style style:name="Таблица23.E" style:family="table-column">
					<style:table-column-properties style:column-width="2.992cm"/>
				</style:style>
				<style:style style:name="Таблица23.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.254cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица23.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица23.B1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица23.E1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица23.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица23.3" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.323cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица23.A3" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица23.B3" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица23.C3" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица23.D3" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица23.E3" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица23.A4" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица24" style:family="table">
					<style:table-properties style:width="17.016cm" fo:margin-left="0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица24.A" style:family="table-column">
					<style:table-column-properties style:column-width="1.646cm"/>
				</style:style>
				<style:style style:name="Таблица24.B" style:family="table-column">
					<style:table-column-properties style:column-width="4.747cm"/>
				</style:style>
				<style:style style:name="Таблица24.C" style:family="table-column">
					<style:table-column-properties style:column-width="5.39cm"/>
				</style:style>
				<style:style style:name="Таблица24.D" style:family="table-column">
					<style:table-column-properties style:column-width="5.233cm"/>
				</style:style>
				<style:style style:name="Таблица24.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.67cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица24.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="bottom" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица24.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="1.261cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица24.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица24.B2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица24.D2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица25" style:family="table">
					<style:table-properties style:width="17.016cm" fo:margin-left="0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица25.A" style:family="table-column">
					<style:table-column-properties style:column-width="1.646cm"/>
				</style:style>
				<style:style style:name="Таблица25.B" style:family="table-column">
					<style:table-column-properties style:column-width="4.747cm"/>
				</style:style>
				<style:style style:name="Таблица25.C" style:family="table-column">
					<style:table-column-properties style:column-width="5.39cm"/>
				</style:style>
				<style:style style:name="Таблица25.D" style:family="table-column">
					<style:table-column-properties style:column-width="5.233cm"/>
				</style:style>
				<style:style style:name="Таблица25.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.254cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица25.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица25.B1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица25.D1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица25.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица25.A3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица25.B3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица25.D3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица26" style:family="table">
					<style:table-properties style:width="17.016cm" fo:margin-left="0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица26.A" style:family="table-column">
					<style:table-column-properties style:column-width="1.646cm"/>
				</style:style>
				<style:style style:name="Таблица26.B" style:family="table-column">
					<style:table-column-properties style:column-width="6.366cm"/>
				</style:style>
				<style:style style:name="Таблица26.C" style:family="table-column">
					<style:table-column-properties style:column-width="9.005cm"/>
				</style:style>
				<style:style style:name="Таблица26.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="1.127cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица26.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="bottom" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица26.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="1.182cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица26.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица26.B2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица26.C2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица27" style:family="table">
					<style:table-properties style:width="17.016cm" fo:margin-left="0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица27.A" style:family="table-column">
					<style:table-column-properties style:column-width="1.646cm"/>
				</style:style>
				<style:style style:name="Таблица27.B" style:family="table-column">
					<style:table-column-properties style:column-width="6.366cm"/>
				</style:style>
				<style:style style:name="Таблица27.C" style:family="table-column">
					<style:table-column-properties style:column-width="9.005cm"/>
				</style:style>
				<style:style style:name="Таблица27.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.254cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица27.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица27.B1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица27.C1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица27.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица27.A3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица27.B3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица27.C3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица28" style:family="table">
					<style:table-properties style:width="17.016cm" fo:margin-left="0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица28.A" style:family="table-column">
					<style:table-column-properties style:column-width="1.646cm"/>
				</style:style>
				<style:style style:name="Таблица28.B" style:family="table-column">
					<style:table-column-properties style:column-width="6.366cm"/>
				</style:style>
				<style:style style:name="Таблица28.C" style:family="table-column">
					<style:table-column-properties style:column-width="9.005cm"/>
				</style:style>
				<style:style style:name="Таблица28.1" style:family="table-row">
					<style:table-row-properties style:row-height="0.776cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица28.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="bottom" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица28.2" style:family="table-row">
					<style:table-row-properties style:row-height="1cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица28.A2" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица28.B2" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица28.C2" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица29" style:family="table">
					<style:table-properties style:width="17.016cm" fo:margin-left="0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица29.A" style:family="table-column">
					<style:table-column-properties style:column-width="1.646cm"/>
				</style:style>
				<style:style style:name="Таблица29.B" style:family="table-column">
					<style:table-column-properties style:column-width="6.366cm"/>
				</style:style>
				<style:style style:name="Таблица29.C" style:family="table-column">
					<style:table-column-properties style:column-width="9.005cm"/>
				</style:style>
				<style:style style:name="Таблица29.1" style:family="table-row">
					<style:table-row-properties style:row-height="0.434cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица29.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица29.B1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица29.C1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица29.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица29.3" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.254cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица29.A3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица29.B3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица29.C3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица29.A4" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="1.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица17" style:family="table" style:master-page-name="MP3">
					<style:table-properties style:width="17.029cm" fo:margin-left="-0.011cm" style:page-number="auto" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица17.A" style:family="table-column">
					<style:table-column-properties style:column-width="1.658cm"/>
				</style:style>
				<style:style style:name="Таблица17.B" style:family="table-column">
					<style:table-column-properties style:column-width="8.264cm"/>
				</style:style>
				<style:style style:name="Таблица17.C" style:family="table-column">
					<style:table-column-properties style:column-width="7.107cm"/>
				</style:style>
				<style:style style:name="Таблица17.1" style:family="table-row">
					<style:table-row-properties style:row-height="0.011cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица17.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="bottom" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" style:border-line-width-top="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt double #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица17.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.824cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица17.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" style:border-line-width-top="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt double #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица17.A3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица17.B3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица17.C3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица30" style:family="table">
					<style:table-properties style:width="17.029cm" fo:margin-left="-0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица30.A" style:family="table-column">
					<style:table-column-properties style:column-width="1.658cm"/>
				</style:style>
				<style:style style:name="Таблица30.B" style:family="table-column">
					<style:table-column-properties style:column-width="8.264cm"/>
				</style:style>
				<style:style style:name="Таблица30.C" style:family="table-column">
					<style:table-column-properties style:column-width="7.107cm"/>
				</style:style>
				<style:style style:name="Таблица30.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.436cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица30.A1" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="none" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица30.B1" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="none" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица30.C1" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица30.A2" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица30.3" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.333cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица30.A3" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица30.B3" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица30.C3" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица32" style:family="table">
					<style:table-properties style:width="17.029cm" fo:margin-left="-0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица32.A" style:family="table-column">
					<style:table-column-properties style:column-width="1.658cm"/>
				</style:style>
				<style:style style:name="Таблица32.B" style:family="table-column">
					<style:table-column-properties style:column-width="6.662cm"/>
				</style:style>
				<style:style style:name="Таблица32.C" style:family="table-column">
					<style:table-column-properties style:column-width="8.708cm"/>
				</style:style>
				<style:style style:name="Таблица32.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.628cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица32.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица32.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="1.261cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица32.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица32.B2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица32.C2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица33" style:family="table">
					<style:table-properties style:width="17.029cm" fo:margin-left="-0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица33.A" style:family="table-column">
					<style:table-column-properties style:column-width="1.658cm"/>
				</style:style>
				<style:style style:name="Таблица33.B" style:family="table-column">
					<style:table-column-properties style:column-width="6.662cm"/>
				</style:style>
				<style:style style:name="Таблица33.C" style:family="table-column">
					<style:table-column-properties style:column-width="8.708cm"/>
				</style:style>
				<style:style style:name="Таблица33.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.254cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица33.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица33.B1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица33.C1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица33.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица33.3" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.323cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица33.A3" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица33.B3" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица33.C3" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица33.A4" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица33.A5" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица33.B5" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица33.C5" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица33.A6" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица34" style:family="table">
					<style:table-properties style:width="17.029cm" fo:margin-left="-0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица34.A" style:family="table-column">
					<style:table-column-properties style:column-width="1.658cm"/>
				</style:style>
				<style:style style:name="Таблица34.B" style:family="table-column">
					<style:table-column-properties style:column-width="5.085cm"/>
				</style:style>
				<style:style style:name="Таблица34.C" style:family="table-column">
					<style:table-column-properties style:column-width="3.801cm"/>
				</style:style>
				<style:style style:name="Таблица34.D" style:family="table-column">
					<style:table-column-properties style:column-width="6.484cm"/>
				</style:style>
				<style:style style:name="Таблица34.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.699cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица34.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица34.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="1.261cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица34.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица34.B2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица34.D2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица37" style:family="table">
					<style:table-properties style:width="17.029cm" fo:margin-left="-0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица37.A" style:family="table-column">
					<style:table-column-properties style:column-width="1.658cm"/>
				</style:style>
				<style:style style:name="Таблица37.B" style:family="table-column">
					<style:table-column-properties style:column-width="5.085cm"/>
				</style:style>
				<style:style style:name="Таблица37.C" style:family="table-column">
					<style:table-column-properties style:column-width="3.801cm"/>
				</style:style>
				<style:style style:name="Таблица37.D" style:family="table-column">
					<style:table-column-properties style:column-width="6.484cm"/>
				</style:style>
				<style:style style:name="Таблица37.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.254cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица37.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица37.B1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица37.D1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица37.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица37.3" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.323cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица37.A3" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица37.B3" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица37.C3" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица37.D3" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица37.A4" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица37.A5" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица37.B5" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица37.C5" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица37.D5" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица37.A6" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица38" style:family="table">
					<style:table-properties style:width="17.029cm" fo:margin-left="-0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица38.A" style:family="table-column">
					<style:table-column-properties style:column-width="1.658cm"/>
				</style:style>
				<style:style style:name="Таблица38.B" style:family="table-column">
					<style:table-column-properties style:column-width="4.78cm"/>
				</style:style>
				<style:style style:name="Таблица38.C" style:family="table-column">
					<style:table-column-properties style:column-width="3.392cm"/>
				</style:style>
				<style:style style:name="Таблица38.D" style:family="table-column">
					<style:table-column-properties style:column-width="7.198cm"/>
				</style:style>
				<style:style style:name="Таблица38.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.573cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица38.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица38.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="1.182cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица38.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица38.B2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица38.D2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица39" style:family="table">
					<style:table-properties style:width="17.029cm" fo:margin-left="-0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица39.A" style:family="table-column">
					<style:table-column-properties style:column-width="1.658cm"/>
				</style:style>
				<style:style style:name="Таблица39.B" style:family="table-column">
					<style:table-column-properties style:column-width="4.78cm"/>
				</style:style>
				<style:style style:name="Таблица39.C" style:family="table-column">
					<style:table-column-properties style:column-width="3.392cm"/>
				</style:style>
				<style:style style:name="Таблица39.D" style:family="table-column">
					<style:table-column-properties style:column-width="7.198cm"/>
				</style:style>
				<style:style style:name="Таблица39.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.254cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица39.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица39.B1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица39.D1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица39.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица39.A3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица39.B3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица39.D3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица39.A4" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица39.A5" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица39.B5" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица39.D5" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица40" style:family="table">
					<style:table-properties style:width="17.029cm" fo:margin-left="-0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица40.A" style:family="table-column">
					<style:table-column-properties style:column-width="1.658cm"/>
				</style:style>
				<style:style style:name="Таблица40.B" style:family="table-column">
					<style:table-column-properties style:column-width="4.457cm"/>
				</style:style>
				<style:style style:name="Таблица40.C" style:family="table-column">
					<style:table-column-properties style:column-width="3.859cm"/>
				</style:style>
				<style:style style:name="Таблица40.D" style:family="table-column">
					<style:table-column-properties style:column-width="1.847cm"/>
				</style:style>
				<style:style style:name="Таблица40.E" style:family="table-column">
					<style:table-column-properties style:column-width="5.207cm"/>
				</style:style>
				<style:style style:name="Таблица40.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.577cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица40.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица40.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.644cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица40.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица40.B2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица40.E2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица41" style:family="table">
					<style:table-properties style:width="17.029cm" fo:margin-left="-0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица41.A" style:family="table-column">
					<style:table-column-properties style:column-width="1.658cm"/>
				</style:style>
				<style:style style:name="Таблица41.B" style:family="table-column">
					<style:table-column-properties style:column-width="4.457cm"/>
				</style:style>
				<style:style style:name="Таблица41.C" style:family="table-column">
					<style:table-column-properties style:column-width="3.859cm"/>
				</style:style>
				<style:style style:name="Таблица41.D" style:family="table-column">
					<style:table-column-properties style:column-width="1.847cm"/>
				</style:style>
				<style:style style:name="Таблица41.E" style:family="table-column">
					<style:table-column-properties style:column-width="5.207cm"/>
				</style:style>
				<style:style style:name="Таблица41.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.254cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица41.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица41.B1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица41.E1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица41.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица41.A3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица41.B3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица41.E3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица41.A4" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица41.A5" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица41.B5" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица41.E5" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица22" style:family="table" style:master-page-name="MP4">
					<style:table-properties style:width="17.027cm" fo:margin-left="-0.011cm" style:page-number="auto" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица22.A" style:family="table-column">
					<style:table-column-properties style:column-width="17.027cm"/>
				</style:style>
				<style:style style:name="Таблица22.1" style:family="table-row">
					<style:table-row-properties style:row-height="0.011cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица22.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица15" style:family="table">
					<style:table-properties style:width="17.027cm" fo:margin-left="-0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица15.A" style:family="table-column">
					<style:table-column-properties style:column-width="3.545cm"/>
				</style:style>
				<style:style style:name="Таблица15.B" style:family="table-column">
					<style:table-column-properties style:column-width="3.246cm"/>
				</style:style>
				<style:style style:name="Таблица15.C" style:family="table-column">
					<style:table-column-properties style:column-width="3.281cm"/>
				</style:style>
				<style:style style:name="Таблица15.D" style:family="table-column">
					<style:table-column-properties style:column-width="3.951cm"/>
				</style:style>
				<style:style style:name="Таблица15.E" style:family="table-column">
					<style:table-column-properties style:column-width="3.004cm"/>
				</style:style>
				<style:style style:name="Таблица15.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.587cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица15.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица15.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица15.3" style:family="table-row">
					<style:table-row-properties style:min-row-height="1.252cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица15.A3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица15.B3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица15.E3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица15.4" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.358cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица12" style:family="table">
					<style:table-properties style:width="17.027cm" fo:margin-left="-0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица12.A" style:family="table-column">
					<style:table-column-properties style:column-width="3.545cm"/>
				</style:style>
				<style:style style:name="Таблица12.B" style:family="table-column">
					<style:table-column-properties style:column-width="3.246cm"/>
				</style:style>
				<style:style style:name="Таблица12.C" style:family="table-column">
					<style:table-column-properties style:column-width="3.276cm"/>
				</style:style>
				<style:style style:name="Таблица12.D" style:family="table-column">
					<style:table-column-properties style:column-width="3.956cm"/>
				</style:style>
				<style:style style:name="Таблица12.E" style:family="table-column">
					<style:table-column-properties style:column-width="3.004cm"/>
				</style:style>
				<style:style style:name="Таблица12.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.254cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица12.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица12.B1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица12.E1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица12.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица12.5" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.323cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица12.A5" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица12.B5" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица12.C5" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица12.D5" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица12.E5" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица12.A10" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:background-color="transparent" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt solid #000000" fo:border-right="0.05pt solid #000000" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.05pt solid #000000">
						<style:background-image/>
					</style:table-cell-properties>
				</style:style>
				<style:style style:name="Таблица12.B10" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:background-color="transparent" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.05pt solid #000000">
						<style:background-image/>
					</style:table-cell-properties>
				</style:style>
				<style:style style:name="Таблица12.E10" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:background-color="transparent" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt solid #000000" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.05pt solid #000000">
						<style:background-image/>
					</style:table-cell-properties>
				</style:style>
				<style:style style:name="Таблица14" style:family="table">
					<style:table-properties style:width="17.027cm" fo:margin-left="-0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица14.A" style:family="table-column">
					<style:table-column-properties style:column-width="17.027cm"/>
				</style:style>
				<style:style style:name="Таблица14.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.637cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица14.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица16" style:family="table">
					<style:table-properties style:width="17.027cm" fo:margin-left="-0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица16.A" style:family="table-column">
					<style:table-column-properties style:column-width="2.411cm"/>
				</style:style>
				<style:style style:name="Таблица16.B" style:family="table-column">
					<style:table-column-properties style:column-width="2.201cm"/>
				</style:style>
				<style:style style:name="Таблица16.C" style:family="table-column">
					<style:table-column-properties style:column-width="5.6cm"/>
				</style:style>
				<style:style style:name="Таблица16.D" style:family="table-column">
					<style:table-column-properties style:column-width="6.814cm"/>
				</style:style>
				<style:style style:name="Таблица16.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.591cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица16.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица16.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="1.261cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица16.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="1pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица16.C2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="1pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица16.D2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="1pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица16.3" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.254cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица16.A3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица16.B3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица13" style:family="table">
					<style:table-properties style:width="17.027cm" fo:margin-left="-0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица13.A" style:family="table-column">
					<style:table-column-properties style:column-width="2.411cm"/>
				</style:style>
				<style:style style:name="Таблица13.B" style:family="table-column">
					<style:table-column-properties style:column-width="2.201cm"/>
				</style:style>
				<style:style style:name="Таблица13.C" style:family="table-column">
					<style:table-column-properties style:column-width="5.6cm"/>
				</style:style>
				<style:style style:name="Таблица13.D" style:family="table-column">
					<style:table-column-properties style:column-width="6.814cm"/>
				</style:style>
				<style:style style:name="Таблица13.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.323cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица13.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица13.B1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица13.D1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица13.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица13.A5" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица13.B5" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица13.D5" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица19" style:family="table">
					<style:table-properties style:width="17.027cm" fo:margin-left="-0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица19.A" style:family="table-column">
					<style:table-column-properties style:column-width="17.027cm"/>
				</style:style>
				<style:style style:name="Таблица19.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.628cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица19.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица43" style:family="table">
					<style:table-properties style:width="17.027cm" fo:margin-left="-0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица43.A" style:family="table-column">
					<style:table-column-properties style:column-width="17.027cm"/>
				</style:style>
				<style:style style:name="Таблица43.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.587cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица43.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица53" style:family="table">
					<style:table-properties style:width="17.027cm" fo:margin-left="-0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица53.A" style:family="table-column">
					<style:table-column-properties style:column-width="3.545cm"/>
				</style:style>
				<style:style style:name="Таблица53.B" style:family="table-column">
					<style:table-column-properties style:column-width="3.246cm"/>
				</style:style>
				<style:style style:name="Таблица53.C" style:family="table-column">
					<style:table-column-properties style:column-width="3.281cm"/>
				</style:style>
				<style:style style:name="Таблица53.D" style:family="table-column">
					<style:table-column-properties style:column-width="3.951cm"/>
				</style:style>
				<style:style style:name="Таблица53.E" style:family="table-column">
					<style:table-column-properties style:column-width="3.004cm"/>
				</style:style>
				<style:style style:name="Таблица53.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.587cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица53.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица53.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="1.252cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица53.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица53.B2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица53.E2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица53.3" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.358cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица54" style:family="table">
					<style:table-properties style:width="17.027cm" fo:margin-left="-0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица54.A" style:family="table-column">
					<style:table-column-properties style:column-width="3.545cm"/>
				</style:style>
				<style:style style:name="Таблица54.B" style:family="table-column">
					<style:table-column-properties style:column-width="3.246cm"/>
				</style:style>
				<style:style style:name="Таблица54.C" style:family="table-column">
					<style:table-column-properties style:column-width="3.281cm"/>
				</style:style>
				<style:style style:name="Таблица54.D" style:family="table-column">
					<style:table-column-properties style:column-width="3.951cm"/>
				</style:style>
				<style:style style:name="Таблица54.E" style:family="table-column">
					<style:table-column-properties style:column-width="3.004cm"/>
				</style:style>
				<style:style style:name="Таблица54.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.254cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица54.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица54.B1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица54.E1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица54.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица54.3" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.323cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица54.A3" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица54.B3" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица54.C3" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица54.D3" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица54.E3" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица54.A4" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица54.A5" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица54.A6" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица54.A7" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.05pt solid #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица54.B7" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица54.C7" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.05pt solid #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица54.D7" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.05pt solid #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица54.E7" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица54.A8" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица18" style:family="table">
					<style:table-properties style:width="17.027cm" fo:margin-left="-0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left" style:may-break-between-rows="true"/>
				</style:style>
				<style:style style:name="Таблица18.A" style:family="table-column">
					<style:table-column-properties style:column-width="1.886cm"/>
				</style:style>
				<style:style style:name="Таблица18.B" style:family="table-column">
					<style:table-column-properties style:column-width="9.977cm"/>
				</style:style>
				<style:style style:name="Таблица18.C" style:family="table-column">
					<style:table-column-properties style:column-width="5.165cm"/>
				</style:style>
				<style:style style:name="Таблица18.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.635cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица18.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица18.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.404cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица18.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица18.3" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.591cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица18.4" style:family="table-row">
					<style:table-row-properties style:min-row-height="1.182cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица18.A4" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица18.B4" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица18.C4" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица18.5" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.254cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица18.6" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.626cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица18.B10" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица18.B11" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица18.13" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.453cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица55" style:family="table">
					<style:table-properties style:width="17.027cm" fo:margin-left="-0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица55.A" style:family="table-column">
					<style:table-column-properties style:column-width="17.027cm"/>
				</style:style>
				<style:style style:name="Таблица55.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.591cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица55.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица56" style:family="table">
					<style:table-properties style:width="17.027cm" fo:margin-left="-0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица56.A" style:family="table-column">
					<style:table-column-properties style:column-width="2.623cm"/>
				</style:style>
				<style:style style:name="Таблица56.B" style:family="table-column">
					<style:table-column-properties style:column-width="4.279cm"/>
				</style:style>
				<style:style style:name="Таблица56.C" style:family="table-column">
					<style:table-column-properties style:column-width="3.17cm"/>
				</style:style>
				<style:style style:name="Таблица56.D" style:family="table-column">
					<style:table-column-properties style:column-width="1.79cm"/>
				</style:style>
				<style:style style:name="Таблица56.E" style:family="table-column">
					<style:table-column-properties style:column-width="5.165cm"/>
				</style:style>
				<style:style style:name="Таблица56.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.591cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица56.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица56.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.644cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица56.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица56.B2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица56.E2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица57" style:family="table">
					<style:table-properties style:width="17.027cm" fo:margin-left="-0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица57.A" style:family="table-column">
					<style:table-column-properties style:column-width="2.623cm"/>
				</style:style>
				<style:style style:name="Таблица57.B" style:family="table-column">
					<style:table-column-properties style:column-width="4.279cm"/>
				</style:style>
				<style:style style:name="Таблица57.C" style:family="table-column">
					<style:table-column-properties style:column-width="3.17cm"/>
				</style:style>
				<style:style style:name="Таблица57.D" style:family="table-column">
					<style:table-column-properties style:column-width="1.79cm"/>
				</style:style>
				<style:style style:name="Таблица57.E" style:family="table-column">
					<style:table-column-properties style:column-width="5.165cm"/>
				</style:style>
				<style:style style:name="Таблица57.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.254cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица57.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица57.B1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица57.E1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица57.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица57.A3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица57.B3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица57.E3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица31" style:family="table" style:master-page-name="MP6">
					<style:table-properties style:width="16.992cm" fo:margin-left="0.016cm" style:page-number="auto" fo:break-before="auto" fo:break-after="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица31.A" style:family="table-column">
					<style:table-column-properties style:column-width="1.852cm"/>
				</style:style>
				<style:style style:name="Таблица31.B" style:family="table-column">
					<style:table-column-properties style:column-width="10.001cm"/>
				</style:style>
				<style:style style:name="Таблица31.C" style:family="table-column">
					<style:table-column-properties style:column-width="5.138cm"/>
				</style:style>
				<style:style style:name="Таблица31.1" style:family="table-row">
					<style:table-row-properties style:row-height="0.011cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица31.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица31.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица31.A3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица31.A4" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица31.A5" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица31.B5" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица31.C5" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица31.A8" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица31.B8" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица31.C8" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица31.B9" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица47" style:family="table">
					<style:table-properties style:width="17.041cm" fo:margin-left="-0.014cm" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица47.A" style:family="table-column">
					<style:table-column-properties style:column-width="2.658cm"/>
				</style:style>
				<style:style style:name="Таблица47.B" style:family="table-column">
					<style:table-column-properties style:column-width="2.233cm"/>
				</style:style>
				<style:style style:name="Таблица47.C" style:family="table-column">
					<style:table-column-properties style:column-width="2.117cm"/>
				</style:style>
				<style:style style:name="Таблица47.D" style:family="table-column">
					<style:table-column-properties style:column-width="2.023cm"/>
				</style:style>
				<style:style style:name="Таблица47.F" style:family="table-column">
					<style:table-column-properties style:column-width="3.233cm"/>
				</style:style>
				<style:style style:name="Таблица47.G" style:family="table-column">
					<style:table-column-properties style:column-width="2.66cm"/>
				</style:style>
				<style:style style:name="Таблица47.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.85cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица47.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="bottom" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица47.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="1.235cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица47.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица47.B2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица47.G2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица47.3" style:family="table-row">
					<style:table-row-properties style:min-row-height="1.986cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица47.B3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="none" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица48" style:family="table">
					<style:table-properties style:width="17.041cm" fo:margin-left="-0.014cm" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица48.A" style:family="table-column">
					<style:table-column-properties style:column-width="2.658cm"/>
				</style:style>
				<style:style style:name="Таблица48.B" style:family="table-column">
					<style:table-column-properties style:column-width="2.233cm"/>
				</style:style>
				<style:style style:name="Таблица48.C" style:family="table-column">
					<style:table-column-properties style:column-width="2.117cm"/>
				</style:style>
				<style:style style:name="Таблица48.D" style:family="table-column">
					<style:table-column-properties style:column-width="2.023cm"/>
				</style:style>
				<style:style style:name="Таблица48.F" style:family="table-column">
					<style:table-column-properties style:column-width="3.233cm"/>
				</style:style>
				<style:style style:name="Таблица48.G" style:family="table-column">
					<style:table-column-properties style:column-width="2.66cm"/>
				</style:style>
				<style:style style:name="Таблица48.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.305cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица48.A1" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица48.B1" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица48.G1" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица48.A2" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица48.A3" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица48.A5" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица48.B5" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица48.G5" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица48.A7" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица48.B7" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица48.C7" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица48.D7" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица48.E7" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица48.F7" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица48.G7" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица49" style:family="table">
					<style:table-properties style:width="17.041cm" fo:margin-left="-0.014cm" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица49.A" style:family="table-column">
					<style:table-column-properties style:column-width="2.117cm"/>
				</style:style>
				<style:style style:name="Таблица49.B" style:family="table-column">
					<style:table-column-properties style:column-width="2.367cm"/>
				</style:style>
				<style:style style:name="Таблица49.C" style:family="table-column">
					<style:table-column-properties style:column-width="6.92cm"/>
				</style:style>
				<style:style style:name="Таблица49.D" style:family="table-column">
					<style:table-column-properties style:column-width="5.637cm"/>
				</style:style>
				<style:style style:name="Таблица49.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.806cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица49.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="bottom" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица49.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="1.261cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица49.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица49.C2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица49.D2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица49.3" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.254cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица50" style:family="table">
					<style:table-properties style:width="17.041cm" fo:margin-left="-0.014cm" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица50.A" style:family="table-column">
					<style:table-column-properties style:column-width="2.117cm"/>
				</style:style>
				<style:style style:name="Таблица50.B" style:family="table-column">
					<style:table-column-properties style:column-width="2.364cm"/>
				</style:style>
				<style:style style:name="Таблица50.C" style:family="table-column">
					<style:table-column-properties style:column-width="6.923cm"/>
				</style:style>
				<style:style style:name="Таблица50.D" style:family="table-column">
					<style:table-column-properties style:column-width="5.637cm"/>
				</style:style>
				<style:style style:name="Таблица50.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.323cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица50.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица50.B1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица50.D1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица50.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица50.A3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица50.A5" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица50.B5" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица50.D5" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица50.A7" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица50.B7" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица50.D7" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица58" style:family="table">
					<style:table-properties style:width="16.992cm" fo:margin-left="0.016cm" fo:break-before="auto" fo:break-after="auto" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица58.A" style:family="table-column">
					<style:table-column-properties style:column-width="16.992cm"/>
				</style:style>
				<style:style style:name="Таблица58.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.591cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица58.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица59" style:family="table">
					<style:table-properties style:width="16.992cm" fo:margin-left="0.016cm" fo:break-before="auto" fo:break-after="auto" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица59.A" style:family="table-column">
					<style:table-column-properties style:column-width="2.588cm"/>
				</style:style>
				<style:style style:name="Таблица59.B" style:family="table-column">
					<style:table-column-properties style:column-width="4.281cm"/>
				</style:style>
				<style:style style:name="Таблица59.C" style:family="table-column">
					<style:table-column-properties style:column-width="3.175cm"/>
				</style:style>
				<style:style style:name="Таблица59.D" style:family="table-column">
					<style:table-column-properties style:column-width="1.81cm"/>
				</style:style>
				<style:style style:name="Таблица59.E" style:family="table-column">
					<style:table-column-properties style:column-width="5.138cm"/>
				</style:style>
				<style:style style:name="Таблица59.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.591cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица59.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица59.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.644cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица59.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица59.B2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица59.E2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица60" style:family="table">
					<style:table-properties style:width="16.992cm" fo:margin-left="0.016cm" fo:break-before="auto" fo:break-after="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица60.A" style:family="table-column">
					<style:table-column-properties style:column-width="2.588cm"/>
				</style:style>
				<style:style style:name="Таблица60.B" style:family="table-column">
					<style:table-column-properties style:column-width="4.281cm"/>
				</style:style>
				<style:style style:name="Таблица60.C" style:family="table-column">
					<style:table-column-properties style:column-width="3.175cm"/>
				</style:style>
				<style:style style:name="Таблица60.D" style:family="table-column">
					<style:table-column-properties style:column-width="1.81cm"/>
				</style:style>
				<style:style style:name="Таблица60.E" style:family="table-column">
					<style:table-column-properties style:column-width="5.138cm"/>
				</style:style>
				<style:style style:name="Таблица60.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.254cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица60.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица60.B1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица60.E1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица60.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица61" style:family="table">
					<style:table-properties style:width="16.992cm" fo:margin-left="0.016cm" fo:break-before="auto" fo:break-after="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица61.A" style:family="table-column">
					<style:table-column-properties style:column-width="16.992cm"/>
				</style:style>
				<style:style style:name="Таблица61.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.628cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица61.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица62" style:family="table">
					<style:table-properties style:width="16.992cm" fo:margin-left="0.016cm" fo:break-before="auto" fo:break-after="auto" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица62.A" style:family="table-column">
					<style:table-column-properties style:column-width="16.992cm"/>
				</style:style>
				<style:style style:name="Таблица62.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.587cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица62.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица63" style:family="table">
					<style:table-properties style:width="16.992cm" fo:margin-left="0.016cm" fo:break-before="auto" fo:break-after="auto" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица63.A" style:family="table-column">
					<style:table-column-properties style:column-width="3.418cm"/>
				</style:style>
				<style:style style:name="Таблица63.B" style:family="table-column">
					<style:table-column-properties style:column-width="3.094cm"/>
				</style:style>
				<style:style style:name="Таблица63.C" style:family="table-column">
					<style:table-column-properties style:column-width="3.344cm"/>
				</style:style>
				<style:style style:name="Таблица63.D" style:family="table-column">
					<style:table-column-properties style:column-width="4.02cm"/>
				</style:style>
				<style:style style:name="Таблица63.E" style:family="table-column">
					<style:table-column-properties style:column-width="3.115cm"/>
				</style:style>
				<style:style style:name="Таблица63.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.587cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица63.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица63.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="1.252cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица63.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица63.B2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица63.E2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица63.3" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.358cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица64" style:family="table">
					<style:table-properties style:width="16.992cm" fo:margin-left="0.016cm" fo:break-before="auto" fo:break-after="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица64.A" style:family="table-column">
					<style:table-column-properties style:column-width="3.418cm"/>
				</style:style>
				<style:style style:name="Таблица64.B" style:family="table-column">
					<style:table-column-properties style:column-width="3.094cm"/>
				</style:style>
				<style:style style:name="Таблица64.C" style:family="table-column">
					<style:table-column-properties style:column-width="3.344cm"/>
				</style:style>
				<style:style style:name="Таблица64.D" style:family="table-column">
					<style:table-column-properties style:column-width="4.02cm"/>
				</style:style>
				<style:style style:name="Таблица64.E" style:family="table-column">
					<style:table-column-properties style:column-width="3.115cm"/>
				</style:style>
				<style:style style:name="Таблица64.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.254cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица64.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица64.B1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица64.E1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица64.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица64.3" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.323cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица64.A3" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица64.B3" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица64.C3" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица64.D3" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица64.E3" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица64.A4" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица64.A5" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица64.A6" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица10" style:family="table" style:master-page-name="MP5">
					<style:table-properties style:width="17.004cm" fo:margin-left="0.034cm" style:page-number="auto" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица10.A" style:family="table-column">
					<style:table-column-properties style:column-width="4.092cm"/>
				</style:style>
				<style:style style:name="Таблица10.B" style:family="table-column">
					<style:table-column-properties style:column-width="5.939cm"/>
				</style:style>
				<style:style style:name="Таблица10.C" style:family="table-column">
					<style:table-column-properties style:column-width="6.973cm"/>
				</style:style>
				<style:style style:name="Таблица10.1" style:family="table-row">
					<style:table-row-properties style:row-height="0.011cm"/>
				</style:style>
				<style:style style:name="Таблица10.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица10.2" style:family="table-row">
					<style:table-row-properties style:row-height="3cm"/>
				</style:style>
				<style:style style:name="Таблица10.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица10.B2" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица10.C2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица65" style:family="table">
					<style:table-properties style:width="17.004cm" fo:margin-left="0.034cm" fo:break-before="auto" fo:break-after="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица65.A" style:family="table-column">
					<style:table-column-properties style:column-width="4.092cm"/>
				</style:style>
				<style:style style:name="Таблица65.B" style:family="table-column">
					<style:table-column-properties style:column-width="5.939cm"/>
				</style:style>
				<style:style style:name="Таблица65.C" style:family="table-column">
					<style:table-column-properties style:column-width="6.973cm"/>
				</style:style>
				<style:style style:name="Таблица65.1" style:family="table-row">
					<style:table-row-properties fo:keep-together="always"/>
				</style:style>
				<style:style style:name="Таблица65.A1" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица65.B1" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица65.C1" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица65.A2" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица65.A3" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица65.B3" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица65.C3" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица65.A4" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица35" style:family="table" style:master-page-name="MP7">
					<style:table-properties style:width="16.997cm" fo:margin-left="0.021cm" style:page-number="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица35.A" style:family="table-column">
					<style:table-column-properties style:column-width="16.997cm"/>
				</style:style>
				<style:style style:name="Таблица35.1" style:family="table-row">
					<style:table-row-properties style:row-height="0.011cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица35.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="bottom" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" style:border-line-width-top="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt double #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица66" style:family="table">
					<style:table-properties style:width="17.041cm" fo:margin-left="-0.014cm" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица66.A" style:family="table-column">
					<style:table-column-properties style:column-width="2.658cm"/>
				</style:style>
				<style:style style:name="Таблица66.B" style:family="table-column">
					<style:table-column-properties style:column-width="2.233cm"/>
				</style:style>
				<style:style style:name="Таблица66.C" style:family="table-column">
					<style:table-column-properties style:column-width="2.117cm"/>
				</style:style>
				<style:style style:name="Таблица66.D" style:family="table-column">
					<style:table-column-properties style:column-width="2.023cm"/>
				</style:style>
				<style:style style:name="Таблица66.F" style:family="table-column">
					<style:table-column-properties style:column-width="3.233cm"/>
				</style:style>
				<style:style style:name="Таблица66.G" style:family="table-column">
					<style:table-column-properties style:column-width="2.66cm"/>
				</style:style>
				<style:style style:name="Таблица66.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.85cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица66.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="bottom" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица66.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="1.235cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица66.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица66.B2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица66.G2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица66.3" style:family="table-row">
					<style:table-row-properties style:min-row-height="1.986cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица66.B3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="none" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица45" style:family="table">
					<style:table-properties style:width="17cm" fo:break-before="page" table:align="margins" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица45.A" style:family="table-column">
					<style:table-column-properties style:column-width="2.628cm" style:rel-column-width="10131*"/>
				</style:style>
				<style:style style:name="Таблица45.B" style:family="table-column">
					<style:table-column-properties style:column-width="2.235cm" style:rel-column-width="8615*"/>
				</style:style>
				<style:style style:name="Таблица45.C" style:family="table-column">
					<style:table-column-properties style:column-width="2.127cm" style:rel-column-width="8200*"/>
				</style:style>
				<style:style style:name="Таблица45.D" style:family="table-column">
					<style:table-column-properties style:column-width="2.02cm" style:rel-column-width="7785*"/>
				</style:style>
				<style:style style:name="Таблица45.E" style:family="table-column">
					<style:table-column-properties style:column-width="2.11cm" style:rel-column-width="8132*"/>
				</style:style>
				<style:style style:name="Таблица45.F" style:family="table-column">
					<style:table-column-properties style:column-width="3.237cm" style:rel-column-width="12477*"/>
				</style:style>
				<style:style style:name="Таблица45.G" style:family="table-column">
					<style:table-column-properties style:column-width="2.644cm" style:rel-column-width="10195*"/>
				</style:style>
				<style:style style:name="Таблица45.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding="0.097cm" fo:border-left="1.5pt solid #000000" fo:border-right="1.5pt solid #000000" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица45.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="1.169cm"/>
				</style:style>
				<style:style style:name="Таблица45.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding="0.097cm" fo:border-left="1.5pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица45.B2" style:family="table-cell">
					<style:table-cell-properties fo:padding="0.097cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица45.D2" style:family="table-cell">
					<style:table-cell-properties fo:padding="0.097cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица45.F2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding="0.097cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица45.G2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding="0.097cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt solid #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица45.3" style:family="table-row">
					<style:table-row-properties style:min-row-height="1.699cm"/>
				</style:style>
				<style:style style:name="Таблица36" style:family="table">
					<style:table-properties style:width="17.041cm" fo:margin-left="-0.014cm" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица36.A" style:family="table-column">
					<style:table-column-properties style:column-width="2.658cm"/>
				</style:style>
				<style:style style:name="Таблица36.B" style:family="table-column">
					<style:table-column-properties style:column-width="2.233cm"/>
				</style:style>
				<style:style style:name="Таблица36.C" style:family="table-column">
					<style:table-column-properties style:column-width="2.117cm"/>
				</style:style>
				<style:style style:name="Таблица36.D" style:family="table-column">
					<style:table-column-properties style:column-width="2.023cm"/>
				</style:style>
				<style:style style:name="Таблица36.F" style:family="table-column">
					<style:table-column-properties style:column-width="3.233cm"/>
				</style:style>
				<style:style style:name="Таблица36.G" style:family="table-column">
					<style:table-column-properties style:column-width="2.66cm"/>
				</style:style>
				<style:style style:name="Таблица36.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.305cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица36.A1" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица36.B1" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица36.G1" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица36.A2" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица36.A3" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица36.A5" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица36.B5" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица36.G5" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица36.A9" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица36.B9" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица36.C9" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица36.D9" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица36.E9" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица36.F9" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица36.G9" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица67" style:family="table">
					<style:table-properties style:width="17.041cm" fo:margin-left="-0.014cm" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица67.A" style:family="table-column">
					<style:table-column-properties style:column-width="2.117cm"/>
				</style:style>
				<style:style style:name="Таблица67.B" style:family="table-column">
					<style:table-column-properties style:column-width="2.367cm"/>
				</style:style>
				<style:style style:name="Таблица67.C" style:family="table-column">
					<style:table-column-properties style:column-width="6.92cm"/>
				</style:style>
				<style:style style:name="Таблица67.D" style:family="table-column">
					<style:table-column-properties style:column-width="5.637cm"/>
				</style:style>
				<style:style style:name="Таблица67.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.806cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица67.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="bottom" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица67.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="1.261cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица67.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица67.C2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица67.D2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица67.3" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.254cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица68" style:family="table">
					<style:table-properties style:width="17.041cm" fo:margin-left="-0.014cm" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица68.A" style:family="table-column">
					<style:table-column-properties style:column-width="2.117cm"/>
				</style:style>
				<style:style style:name="Таблица68.B" style:family="table-column">
					<style:table-column-properties style:column-width="2.364cm"/>
				</style:style>
				<style:style style:name="Таблица68.C" style:family="table-column">
					<style:table-column-properties style:column-width="6.923cm"/>
				</style:style>
				<style:style style:name="Таблица68.D" style:family="table-column">
					<style:table-column-properties style:column-width="5.637cm"/>
				</style:style>
				<style:style style:name="Таблица68.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.323cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица68.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица68.B1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица68.D1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица68.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица68.A3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица68.A5" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица68.B5" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица68.D5" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица68.A9" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица68.B9" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица68.D9" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.05pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица69" style:family="table">
					<style:table-properties style:width="17.041cm" fo:margin-left="-0.014cm" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица69.A" style:family="table-column">
					<style:table-column-properties style:column-width="17.041cm"/>
				</style:style>
				<style:style style:name="Таблица69.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.769cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица69.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="bottom" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица70" style:family="table">
					<style:table-properties style:width="17.041cm" fo:margin-left="-0.014cm" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица70.A" style:family="table-column">
					<style:table-column-properties style:column-width="3.517cm"/>
				</style:style>
				<style:style style:name="Таблица70.B" style:family="table-column">
					<style:table-column-properties style:column-width="3.108cm"/>
				</style:style>
				<style:style style:name="Таблица70.C" style:family="table-column">
					<style:table-column-properties style:column-width="3.343cm"/>
				</style:style>
				<style:style style:name="Таблица70.D" style:family="table-column">
					<style:table-column-properties style:column-width="4.036cm"/>
				</style:style>
				<style:style style:name="Таблица70.E" style:family="table-column">
					<style:table-column-properties style:column-width="3.037cm"/>
				</style:style>
				<style:style style:name="Таблица70.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.587cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица70.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица70.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="1.252cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица70.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица70.B2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица70.E2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица70.3" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.358cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица71" style:family="table">
					<style:table-properties style:width="17.041cm" fo:margin-left="-0.014cm" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица71.A" style:family="table-column">
					<style:table-column-properties style:column-width="3.517cm"/>
				</style:style>
				<style:style style:name="Таблица71.B" style:family="table-column">
					<style:table-column-properties style:column-width="3.108cm"/>
				</style:style>
				<style:style style:name="Таблица71.C" style:family="table-column">
					<style:table-column-properties style:column-width="3.343cm"/>
				</style:style>
				<style:style style:name="Таблица71.D" style:family="table-column">
					<style:table-column-properties style:column-width="4.036cm"/>
				</style:style>
				<style:style style:name="Таблица71.E" style:family="table-column">
					<style:table-column-properties style:column-width="3.037cm"/>
				</style:style>
				<style:style style:name="Таблица71.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.254cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица71.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица71.B1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица71.E1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица71.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.323cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица71.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица71.A3" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица71.B3" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица71.C3" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица71.D3" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица71.E3" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица71.A4" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица71.A5" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица71.A6" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица72" style:family="table">
					<style:table-properties style:width="17.041cm" fo:margin-left="-0.014cm" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица72.A" style:family="table-column">
					<style:table-column-properties style:column-width="1.847cm"/>
				</style:style>
				<style:style style:name="Таблица72.B" style:family="table-column">
					<style:table-column-properties style:column-width="9.92cm"/>
				</style:style>
				<style:style style:name="Таблица72.C" style:family="table-column">
					<style:table-column-properties style:column-width="5.274cm"/>
				</style:style>
				<style:style style:name="Таблица72.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.471cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица72.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="bottom" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица72.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="1.127cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица72.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="bottom" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.8pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица72.3" style:family="table-row">
					<style:table-row-properties style:min-row-height="1.182cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица72.A3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица72.B3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица72.C3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица72.4" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.254cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица72.5" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.626cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица72.B8" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица72.B9" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица72.A11" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="1.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица73" style:family="table">
					<style:table-properties style:width="17.041cm" fo:margin-left="-0.014cm" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица73.A" style:family="table-column">
					<style:table-column-properties style:column-width="2.658cm"/>
				</style:style>
				<style:style style:name="Таблица73.B" style:family="table-column">
					<style:table-column-properties style:column-width="4.163cm"/>
				</style:style>
				<style:style style:name="Таблица73.C" style:family="table-column">
					<style:table-column-properties style:column-width="3.147cm"/>
				</style:style>
				<style:style style:name="Таблица73.D" style:family="table-column">
					<style:table-column-properties style:column-width="1.799cm"/>
				</style:style>
				<style:style style:name="Таблица73.E" style:family="table-column">
					<style:table-column-properties style:column-width="5.274cm"/>
				</style:style>
				<style:style style:name="Таблица73.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.877cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица73.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="bottom" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица73.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.644cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица73.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица73.B2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица73.E2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица74" style:family="table">
					<style:table-properties style:width="17.041cm" fo:margin-left="-0.014cm" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица74.A" style:family="table-column">
					<style:table-column-properties style:column-width="2.658cm"/>
				</style:style>
				<style:style style:name="Таблица74.B" style:family="table-column">
					<style:table-column-properties style:column-width="4.163cm"/>
				</style:style>
				<style:style style:name="Таблица74.C" style:family="table-column">
					<style:table-column-properties style:column-width="3.147cm"/>
				</style:style>
				<style:style style:name="Таблица74.D" style:family="table-column">
					<style:table-column-properties style:column-width="1.799cm"/>
				</style:style>
				<style:style style:name="Таблица74.E" style:family="table-column">
					<style:table-column-properties style:column-width="5.274cm"/>
				</style:style>
				<style:style style:name="Таблица74.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.254cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица74.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица74.B1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица74.E1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица74.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица75" style:family="table">
					<style:table-properties style:width="17.041cm" fo:margin-left="-0.014cm" fo:break-before="auto" fo:break-after="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица75.A" style:family="table-column">
					<style:table-column-properties style:column-width="4.115cm"/>
				</style:style>
				<style:style style:name="Таблица75.B" style:family="table-column">
					<style:table-column-properties style:column-width="5.939cm"/>
				</style:style>
				<style:style style:name="Таблица75.C" style:family="table-column">
					<style:table-column-properties style:column-width="6.987cm"/>
				</style:style>
				<style:style style:name="Таблица75.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="1.002cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица75.A1" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица75.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.949cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица75.A2" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица75.B2" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица75.C2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица75.3" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.429cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица75.C3" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица75.4" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.439cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица75.C4" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица42" style:family="table" style:master-page-name="MP8">
					<style:table-properties style:width="17.02cm" fo:margin-left="0.011cm" style:page-number="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица42.A" style:family="table-column">
					<style:table-column-properties style:column-width="17.02cm"/>
				</style:style>
				<style:style style:name="Таблица42.1" style:family="table-row">
					<style:table-row-properties style:row-height="0.011cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица42.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица79" style:family="table">
					<style:table-properties style:width="17.02cm" fo:margin-left="0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица79.A" style:family="table-column">
					<style:table-column-properties style:column-width="17.02cm"/>
				</style:style>
				<style:style style:name="Таблица79.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица79.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.566cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица79.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица80" style:family="table">
					<style:table-properties style:width="17.02cm" fo:margin-left="0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left" style:may-break-between-rows="false"/>
				</style:style>
				<style:style style:name="Таблица80.A" style:family="table-column">
					<style:table-column-properties style:column-width="3.588cm"/>
				</style:style>
				<style:style style:name="Таблица80.B" style:family="table-column">
					<style:table-column-properties style:column-width="3.108cm"/>
				</style:style>
				<style:style style:name="Таблица80.C" style:family="table-column">
					<style:table-column-properties style:column-width="3.355cm"/>
				</style:style>
				<style:style style:name="Таблица80.D" style:family="table-column">
					<style:table-column-properties style:column-width="4.025cm"/>
				</style:style>
				<style:style style:name="Таблица80.E" style:family="table-column">
					<style:table-column-properties style:column-width="2.944cm"/>
				</style:style>
				<style:style style:name="Таблица80.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.587cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица80.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица80.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="1.252cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица80.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица80.B2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица80.E2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица80.3" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.358cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица78" style:family="table">
					<style:table-properties style:width="17.02cm" fo:margin-left="0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица78.A" style:family="table-column">
					<style:table-column-properties style:column-width="3.588cm"/>
				</style:style>
				<style:style style:name="Таблица78.B" style:family="table-column">
					<style:table-column-properties style:column-width="3.108cm"/>
				</style:style>
				<style:style style:name="Таблица78.C" style:family="table-column">
					<style:table-column-properties style:column-width="3.355cm"/>
				</style:style>
				<style:style style:name="Таблица78.D" style:family="table-column">
					<style:table-column-properties style:column-width="4.025cm"/>
				</style:style>
				<style:style style:name="Таблица78.E" style:family="table-column">
					<style:table-column-properties style:column-width="2.944cm"/>
				</style:style>
				<style:style style:name="Таблица78.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.254cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица78.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица78.B1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица78.E1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица78.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.323cm" fo:keep-together="always" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица78.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица78.A3" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица78.B3" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица78.C3" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица78.D3" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица78.E3" style:family="table-cell" style:data-style-name="N100">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица78.A4" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица78.A5" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица78.A6" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица77" style:family="table">
					<style:table-properties style:width="17.02cm" fo:margin-left="0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица77.A" style:family="table-column">
					<style:table-column-properties style:column-width="2.859cm"/>
				</style:style>
				<style:style style:name="Таблица77.B" style:family="table-column">
					<style:table-column-properties style:column-width="3.955cm"/>
				</style:style>
				<style:style style:name="Таблица77.C" style:family="table-column">
					<style:table-column-properties style:column-width="3.166cm"/>
				</style:style>
				<style:style style:name="Таблица77.D" style:family="table-column">
					<style:table-column-properties style:column-width="1.801cm"/>
				</style:style>
				<style:style style:name="Таблица77.E" style:family="table-column">
					<style:table-column-properties style:column-width="5.239cm"/>
				</style:style>
				<style:style style:name="Таблица77.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.69cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица77.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица77.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.644cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица77.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица77.B2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица77.E2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица76" style:family="table">
					<style:table-properties style:width="17.02cm" fo:margin-left="0.011cm" fo:break-before="auto" fo:break-after="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица76.A" style:family="table-column">
					<style:table-column-properties style:column-width="2.859cm"/>
				</style:style>
				<style:style style:name="Таблица76.B" style:family="table-column">
					<style:table-column-properties style:column-width="3.955cm"/>
				</style:style>
				<style:style style:name="Таблица76.C" style:family="table-column">
					<style:table-column-properties style:column-width="3.166cm"/>
				</style:style>
				<style:style style:name="Таблица76.D" style:family="table-column">
					<style:table-column-properties style:column-width="1.801cm"/>
				</style:style>
				<style:style style:name="Таблица76.E" style:family="table-column">
					<style:table-column-properties style:column-width="5.239cm"/>
				</style:style>
				<style:style style:name="Таблица76.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.254cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица76.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица76.B1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица76.E1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица76.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица76.A3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица76.B3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица76.E3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица76.A4" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица44" style:family="table" style:master-page-name="MP9">
					<style:table-properties style:width="17.09cm" fo:margin-left="0cm" style:page-number="auto" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица44.A" style:family="table-column">
					<style:table-column-properties style:column-width="17.02cm"/>
				</style:style>
				<style:style style:name="Таблица44.B" style:family="table-column">
					<style:table-column-properties style:column-width="0.071cm"/>
				</style:style>
				<style:style style:name="Таблица44.1" style:family="table-row">
					<style:table-row-properties style:row-height="0.011cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица44.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:background-color="transparent" style:border-line-width-left="0.026cm 0.026cm 0.026cm" style:border-line-width-top="0.018cm 0.018cm 0.018cm" fo:padding="0cm" fo:border-left="2.25pt double #000000" fo:border-right="none" fo:border-top="1.5pt double #000000" fo:border-bottom="none">
						<style:background-image/>
					</style:table-cell-properties>
				</style:style>
				<style:style style:name="Таблица44.B1" style:family="table-cell">
					<style:table-cell-properties fo:background-color="transparent" style:border-line-width-right="0.026cm 0.026cm 0.026cm" fo:padding="0cm" fo:border-left="none" fo:border-right="2.25pt double #000000" fo:border-top="none" fo:border-bottom="none">
						<style:background-image/>
					</style:table-cell-properties>
				</style:style>
				<style:style style:name="Таблица44.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.28cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица44.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:background-color="transparent" style:border-line-width-left="0.026cm 0.026cm 0.026cm" style:border-line-width-bottom="0.026cm 0.026cm 0.026cm" fo:padding="0cm" fo:border-left="2.25pt double #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="2.25pt double #000000">
						<style:background-image/>
					</style:table-cell-properties>
				</style:style>
				<style:style style:name="Таблица44.B2" style:family="table-cell">
					<style:table-cell-properties fo:background-color="transparent" style:border-line-width-right="0.026cm 0.026cm 0.026cm" style:border-line-width-bottom="0.026cm 0.026cm 0.026cm" fo:padding="0cm" fo:border-left="none" fo:border-right="2.25pt double #000000" fo:border-top="none" fo:border-bottom="2.25pt double #000000">
						<style:background-image/>
					</style:table-cell-properties>
				</style:style>
				<style:style style:name="P1" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
				</style:style>
				<style:style style:name="P2" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false" fo:keep-together="always"/>
				</style:style>
				<style:style style:name="P3" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false">
						<style:tab-stops>
							<style:tab-stop style:position="4.445cm"/>
						</style:tab-stops>
					</style:paragraph-properties>
					<style:text-properties officeooo:paragraph-rsid="001c0272"/>
				</style:style>
				<style:style style:name="P4" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties officeooo:paragraph-rsid="00a37f72"/>
				</style:style>
				<style:style style:name="P5" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties officeooo:paragraph-rsid="00ca342c"/>
				</style:style>
				<style:style style:name="P6" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties officeooo:paragraph-rsid="0149f8b9"/>
				</style:style>
				<style:style style:name="P7" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties officeooo:paragraph-rsid="01ec0418"/>
				</style:style>
				<style:style style:name="P8" style:family="paragraph" style:parent-style-name="Обычный">
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P9" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P10" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-weight="bold" officeooo:paragraph-rsid="018f5784" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P11" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false">
						<style:tab-stops>
							<style:tab-stop style:position="4.83cm"/>
						</style:tab-stops>
					</style:paragraph-properties>
					<style:text-properties fo:font-weight="bold" officeooo:paragraph-rsid="018f5784" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P12" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false">
						<style:tab-stops>
							<style:tab-stop style:position="4.83cm"/>
						</style:tab-stops>
					</style:paragraph-properties>
					<style:text-properties fo:font-weight="bold" officeooo:paragraph-rsid="01a61ee7" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P13" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false">
						<style:tab-stops>
							<style:tab-stop style:position="4.128cm"/>
						</style:tab-stops>
					</style:paragraph-properties>
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P14" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false" fo:keep-together="always"/>
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P15" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-weight="bold" officeooo:paragraph-rsid="0042cd94" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P16" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-weight="bold" officeooo:paragraph-rsid="005298f7" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P17" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-weight="bold" officeooo:paragraph-rsid="00a37f72" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P18" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-weight="bold" officeooo:paragraph-rsid="01ec0418" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P19" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-weight="bold" officeooo:paragraph-rsid="01ed0f09" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P20" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-weight="bold" officeooo:rsid="004308c8" officeooo:paragraph-rsid="004308c8" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P21" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold" style:font-weight-complex="bold"/>
				</style:style>
				<style:style style:name="P22" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="start" style:justify-single-word="false"/>
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P23" style:family="paragraph" style:parent-style-name="Обычный">
					<style:text-properties officeooo:paragraph-rsid="018f5784"/>
				</style:style>
				<style:style style:name="P24" style:family="paragraph" style:parent-style-name="Обычный">
					<style:text-properties fo:language="en" fo:country="US"/>
				</style:style>
				<style:style style:name="P25" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US"/>
				</style:style>
				<style:style style:name="P26" style:family="paragraph" style:parent-style-name="Обычный">
					<style:text-properties fo:language="en" fo:country="US" fo:font-weight="bold" officeooo:rsid="002f9dc8" officeooo:paragraph-rsid="002f9dc8" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P27" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" fo:font-weight="bold" officeooo:rsid="004308c8" officeooo:paragraph-rsid="004308c8" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P28" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" fo:font-weight="bold" officeooo:rsid="0035807c" officeooo:paragraph-rsid="0035807c" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P29" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" fo:font-weight="bold" officeooo:rsid="0124a375" officeooo:paragraph-rsid="0124a375" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P30" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" fo:font-weight="normal" officeooo:rsid="0057529e" officeooo:paragraph-rsid="0057529e" style:font-weight-asian="normal" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="P31" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" fo:font-weight="normal" officeooo:rsid="00580f6a" officeooo:paragraph-rsid="00580f6a" style:font-weight-asian="normal" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="P32" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" fo:font-weight="normal" officeooo:rsid="0124a375" officeooo:paragraph-rsid="0124a375" style:font-weight-asian="normal" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="P33" style:family="paragraph" style:parent-style-name="Обычный">
					<style:text-properties fo:language="en" fo:country="US" style:text-underline-style="solid" style:text-underline-type="double" style:text-underline-width="auto" style:text-underline-color="font-color"/>
				</style:style>
				<style:style style:name="P34" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" officeooo:rsid="00532b2a" officeooo:paragraph-rsid="00532b2a"/>
				</style:style>
				<style:style style:name="P35" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" officeooo:rsid="00570822" officeooo:paragraph-rsid="00570822"/>
				</style:style>
				<style:style style:name="P36" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" officeooo:rsid="00a5ec8c" officeooo:paragraph-rsid="00a5ec8c"/>
				</style:style>
				<style:style style:name="P37" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" officeooo:rsid="0124a375" officeooo:paragraph-rsid="0124a375"/>
				</style:style>
				<style:style style:name="P38" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" style:text-underline-style="solid" style:text-underline-width="auto" style:text-underline-color="font-color" officeooo:rsid="01a5ad5c" style:text-underline-mode="continuous" style:text-overline-mode="continuous" style:text-line-through-mode="continuous"/>
				</style:style>
				<style:style style:name="P39" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties style:text-underline-style="solid" style:text-underline-width="auto" style:text-underline-color="font-color" style:text-underline-mode="continuous" style:text-overline-mode="continuous" style:text-line-through-mode="continuous"/>
				</style:style>
				<style:style style:name="P40" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:color="#4f81bd" fo:language="en" fo:country="US" fo:font-style="italic" style:text-underline-style="solid" style:text-underline-width="auto" style:text-underline-color="font-color" style:text-underline-mode="continuous" style:text-overline-mode="continuous" style:text-line-through-mode="continuous" style:font-style-asian="italic"/>
				</style:style>
				<style:style style:name="P41" style:family="paragraph" style:parent-style-name="Обычный">
					<style:text-properties fo:color="#4f81bd" fo:font-style="italic" style:text-underline-style="solid" style:text-underline-width="auto" style:text-underline-color="font-color" style:text-underline-mode="continuous" style:text-overline-mode="continuous" style:text-line-through-mode="continuous" style:font-style-asian="italic"/>
				</style:style>
				<style:style style:name="P42" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:color="#4f81bd" fo:font-style="italic" style:text-underline-style="solid" style:text-underline-width="auto" style:text-underline-color="font-color" style:text-underline-mode="continuous" style:text-overline-mode="continuous" style:text-line-through-mode="continuous" style:font-style-asian="italic"/>
				</style:style>
				<style:style style:name="P43" style:family="paragraph" style:parent-style-name="Обычный">
					<style:text-properties text:display="none"/>
				</style:style>
				<style:style style:name="P44" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties>
						<style:tab-stops>
							<style:tab-stop style:position="4.83cm"/>
						</style:tab-stops>
					</style:paragraph-properties>
					<style:text-properties officeooo:paragraph-rsid="0191777e"/>
				</style:style>
				<style:style style:name="P45" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties>
						<style:tab-stops>
							<style:tab-stop style:position="4.83cm"/>
						</style:tab-stops>
					</style:paragraph-properties>
					<style:text-properties officeooo:paragraph-rsid="0192546a"/>
				</style:style>
				<style:style style:name="P46" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-style="italic" style:text-underline-style="solid" style:text-underline-width="auto" style:text-underline-color="font-color" fo:font-weight="normal" style:font-style-asian="italic" style:font-weight-asian="normal" style:font-style-complex="italic" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="P47" style:family="paragraph" style:parent-style-name="Обычный">
					<style:text-properties fo:font-weight="normal" style:font-weight-asian="normal" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="P48" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-weight="normal" style:font-weight-asian="normal" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="P49" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-weight="normal" officeooo:paragraph-rsid="007a7038" style:font-weight-asian="normal" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="P50" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-weight="normal" officeooo:paragraph-rsid="0120506d" style:font-weight-asian="normal" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="P51" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-weight="normal" officeooo:paragraph-rsid="0176ec16" style:font-weight-asian="normal" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="P52" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-style="normal" fo:font-weight="normal" style:font-style-asian="normal" style:font-weight-asian="normal" style:font-style-complex="normal" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="P53" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="end" style:justify-single-word="false"/>
				</style:style>
				<style:style style:name="P54" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="end" style:justify-single-word="false"/>
					<style:text-properties officeooo:paragraph-rsid="01ec0418"/>
				</style:style>
				<style:style style:name="P55" style:family="paragraph" style:parent-style-name="Обычный">
					<style:text-properties officeooo:paragraph-rsid="00a5ec8c"/>
				</style:style>
				<style:style style:name="P56" style:family="paragraph" style:parent-style-name="Обычный">
					<style:text-properties officeooo:paragraph-rsid="012d7da6"/>
				</style:style>
				<style:style style:name="P57" style:family="paragraph" style:parent-style-name="Standard">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold" style:font-weight-complex="bold"/>
				</style:style>
				<style:style style:name="P58" style:family="paragraph" style:parent-style-name="Standard">
					<style:text-properties officeooo:paragraph-rsid="018f5784"/>
				</style:style>
				<style:style style:name="P59" style:family="paragraph" style:parent-style-name="Standard">
					<style:text-properties officeooo:paragraph-rsid="00a37f72"/>
				</style:style>
				<style:style style:name="P60" style:family="paragraph" style:parent-style-name="Standard">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" officeooo:rsid="015ba078" officeooo:paragraph-rsid="015ba078"/>
				</style:style>
				<style:style style:name="P61" style:family="paragraph" style:parent-style-name="Standard">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" officeooo:rsid="015ba078" officeooo:paragraph-rsid="01ec0418"/>
				</style:style>
				<style:style style:name="P62" style:family="paragraph" style:parent-style-name="Standard">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" officeooo:rsid="015ba078" officeooo:paragraph-rsid="01ed0f09"/>
				</style:style>
				<style:style style:name="P63" style:family="paragraph" style:parent-style-name="Standard">
					<style:text-properties officeooo:paragraph-rsid="01ec0418"/>
				</style:style>
				<style:style style:name="P64" style:family="paragraph" style:parent-style-name="Standard">
					<style:text-properties officeooo:paragraph-rsid="01ed0f09"/>
				</style:style>
				<style:style style:name="P65" style:family="paragraph" style:parent-style-name="Header">
					<style:text-properties fo:font-size="1pt" style:font-size-asian="1pt" style:font-size-complex="1pt"/>
				</style:style>
				<style:style style:name="P66" style:family="paragraph" style:parent-style-name="Header">
					<style:text-properties style:font-size-complex="1pt"/>
				</style:style>
				<style:style style:name="P67" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0cm" fo:margin-right="-0.365cm" fo:text-indent="0cm" style:auto-text-indent="false"/>
				</style:style>
				<style:style style:name="P68" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0cm" fo:margin-right="-1.191cm" fo:text-indent="0cm" style:auto-text-indent="false"/>
				</style:style>
				<style:style style:name="P69" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0.191cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P70" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0.191cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
					<style:text-properties fo:font-weight="bold" officeooo:paragraph-rsid="01ec0418" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P71" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0.191cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
					<style:text-properties fo:font-weight="bold" officeooo:paragraph-rsid="01ed0f09" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P72" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0.191cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
				</style:style>
				<style:style style:name="P73" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0.191cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
					<style:text-properties officeooo:paragraph-rsid="007aa256"/>
				</style:style>
				<style:style style:name="P74" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0.191cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
					<style:text-properties officeooo:paragraph-rsid="01312073"/>
				</style:style>
				<style:style style:name="P75" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0.191cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
					<style:text-properties officeooo:paragraph-rsid="01ec0418"/>
				</style:style>
				<style:style style:name="P76" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0.191cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
					<style:text-properties fo:language="en" fo:country="US" fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P77" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0.191cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
					<style:text-properties fo:language="en" fo:country="US" fo:font-weight="bold" officeooo:paragraph-rsid="01ec0418" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P78" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0.191cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
					<style:text-properties fo:language="en" fo:country="US" fo:font-weight="normal" officeooo:rsid="008535e8" officeooo:paragraph-rsid="008535e8" style:font-weight-asian="normal" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="P79" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0.191cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
					<style:text-properties fo:language="en" fo:country="US" fo:font-style="normal" style:text-underline-style="none" fo:font-weight="normal" officeooo:rsid="008535e8" officeooo:paragraph-rsid="008535e8" style:font-style-asian="normal" style:font-weight-asian="normal" style:font-style-complex="normal" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="P80" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0.191cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
					<style:text-properties fo:language="en" fo:country="US" officeooo:rsid="01312073" officeooo:paragraph-rsid="01312073"/>
				</style:style>
				<style:style style:name="P81" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0.191cm" fo:margin-right="0cm" fo:text-align="start" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
				</style:style>
				<style:style style:name="P82" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0.191cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false" fo:break-before="page">
						<style:tab-stops/>
					</style:paragraph-properties>
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P83" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:break-before="page"/>
				</style:style>
				<style:style style:name="P84" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:break-before="page"/>
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P85" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false" fo:break-before="page"/>
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P86" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false" fo:break-before="page"/>
					<style:text-properties fo:font-weight="bold" officeooo:paragraph-rsid="00a37f72" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P87" style:family="paragraph" style:parent-style-name="Text_20_body">
					<style:paragraph-properties fo:break-before="page"/>
					<style:text-properties officeooo:paragraph-rsid="0163f546"/>
				</style:style>
				<style:style style:name="P88" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="1.199cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
				</style:style>
				<style:style style:name="P89" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="1.199cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P90" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="1.199cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
					<style:text-properties fo:font-weight="bold" officeooo:paragraph-rsid="01ed0f09" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P91" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0cm" fo:margin-right="-0.191cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false"/>
				</style:style>
				<style:style style:name="P92" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="1cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
					<style:text-properties officeooo:paragraph-rsid="0024d619"/>
				</style:style>
				<style:style style:name="P93" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0.185cm" fo:margin-right="-0.213cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
				</style:style>
				<style:style style:name="P94" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="-0.284cm" fo:margin-right="-0.002cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false"/>
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold" style:font-weight-complex="bold"/>
				</style:style>
				<style:style style:name="P95" style:family="paragraph" style:parent-style-name="Ввод_20_кода">
					<style:text-properties officeooo:paragraph-rsid="00a37f72"/>
				</style:style>
				<style:style style:name="P96" style:family="paragraph" style:parent-style-name="Ввод_20_кода">
					<style:text-properties officeooo:paragraph-rsid="01ec0418"/>
				</style:style>
				<style:style style:name="P97" style:family="paragraph" style:parent-style-name="Ввод_20_кода">
					<style:text-properties officeooo:paragraph-rsid="01ed0f09"/>
				</style:style>
				<style:style style:name="P98" style:family="paragraph" style:parent-style-name="Standard" style:master-page-name="">
					<style:paragraph-properties style:page-number="auto" fo:break-before="auto" fo:break-after="auto"/>
					<style:text-properties officeooo:paragraph-rsid="00aa1879" text:display="none"/>
				</style:style>
				<style:style style:name="P99" style:family="paragraph" style:parent-style-name="Text_20_body" style:master-page-name="">
					<style:paragraph-properties style:page-number="auto" fo:break-before="auto" fo:break-after="auto"/>
				</style:style>
				<style:style style:name="P100" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:break-before="auto" fo:break-after="auto"/>
					<style:text-properties text:display="none"/>
				</style:style>
				<style:style style:name="P101" style:family="paragraph" style:parent-style-name="Text_20_body">
					<style:paragraph-properties fo:break-before="auto" fo:break-after="auto"/>
				</style:style>
				<style:style style:name="P102" style:family="paragraph" style:parent-style-name="Ввод_20_кода">
					<style:paragraph-properties text:number-lines="false" text:line-number="0"/>
				</style:style>
				<style:style style:name="P103" style:family="paragraph" style:parent-style-name="Text_20_body">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" officeooo:paragraph-rsid="0155535c"/>
				</style:style>
				<style:style style:name="P104" style:family="paragraph" style:parent-style-name="Text_20_body">
					<style:text-properties officeooo:paragraph-rsid="0163f546"/>
				</style:style>
				<style:style style:name="P105" style:family="paragraph" style:parent-style-name="Ввод_20_кода">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false" fo:background-color="transparent">
						<style:background-image/>
					</style:paragraph-properties>
					<style:text-properties fo:language="en" fo:country="US" officeooo:rsid="01329608" officeooo:paragraph-rsid="01329608"/>
				</style:style>
				<style:style style:name="P106" style:family="paragraph" style:parent-style-name="Обычный" style:list-style-name="Numbering_20_1">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
				</style:style>
				<style:style style:name="P107" style:family="paragraph" style:parent-style-name="Обычный" style:list-style-name="Numbering_20_1">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" officeooo:paragraph-rsid="01036e49"/>
				</style:style>
				<style:style style:name="P108" style:family="paragraph" style:parent-style-name="Обычный" style:list-style-name="Numbering_20_1">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" officeooo:paragraph-rsid="0113a807"/>
				</style:style>
				<style:style style:name="P109" style:family="paragraph" style:parent-style-name="Обычный" style:list-style-name="Numbering_20_1">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" officeooo:paragraph-rsid="01148832"/>
				</style:style>
				<style:style style:name="P110" style:family="paragraph" style:parent-style-name="Обычный" style:list-style-name="Numbering_20_1">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false">
						<style:tab-stops/>
					</style:paragraph-properties>
					<style:text-properties fo:language="en" fo:country="US" officeooo:paragraph-rsid="0113a807"/>
				</style:style>
				<style:style style:name="P111" style:family="paragraph" style:parent-style-name="Обычный" style:master-page-name="MP0">
					<style:paragraph-properties fo:margin-left="0cm" fo:margin-right="-0.252cm" fo:text-indent="0cm" style:auto-text-indent="false" style:page-number="auto" fo:break-before="page"/>
				</style:style>
				<style:style style:name="T1" style:family="text">
					<style:text-properties style:text-underline-style="solid" style:text-underline-width="auto" style:text-underline-color="font-color" style:text-underline-mode="continuous" style:text-overline-mode="continuous" style:text-line-through-mode="continuous"/>
				</style:style>
				<style:style style:name="T2" style:family="text">
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="T3" style:family="text">
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold" style:font-weight-complex="bold"/>
				</style:style>
				<style:style style:name="T4" style:family="text">
					<style:text-properties fo:font-weight="bold" style:text-underline-mode="continuous" style:text-overline-mode="continuous" style:text-line-through-mode="continuous" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="T5" style:family="text">
					<style:text-properties fo:language="en" fo:country="US"/>
				</style:style>
				<style:style style:name="T6" style:family="text">
					<style:text-properties fo:language="en" fo:country="US" fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="T7" style:family="text">
					<style:text-properties fo:language="en" fo:country="US" fo:font-weight="bold" officeooo:rsid="00ca342c" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="T8" style:family="text">
					<style:text-properties fo:language="en" fo:country="US" fo:font-weight="bold" officeooo:rsid="01ec0418" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="T9" style:family="text">
					<style:text-properties fo:language="en" fo:country="US" style:text-underline-style="none" style:text-underline-mode="continuous" style:text-overline-mode="continuous" style:text-line-through-mode="continuous"/>
				</style:style>
				<style:style style:name="T10" style:family="text">
					<style:text-properties fo:language="en" fo:country="US" style:text-underline-mode="continuous" style:text-overline-mode="continuous" style:text-line-through-mode="continuous"/>
				</style:style>
				<style:style style:name="T11" style:family="text">
					<style:text-properties fo:language="en" fo:country="US" officeooo:rsid="00a3567a"/>
				</style:style>
				<style:style style:name="T12" style:family="text">
					<style:text-properties fo:language="en" fo:country="US" officeooo:rsid="00c2cb5e"/>
				</style:style>
				<style:style style:name="T13" style:family="text">
					<style:text-properties fo:language="en" fo:country="US" officeooo:rsid="00ca342c"/>
				</style:style>
				<style:style style:name="T14" style:family="text">
					<style:text-properties fo:language="en" fo:country="US" officeooo:rsid="01036e49"/>
				</style:style>
				<style:style style:name="T15" style:family="text">
					<style:text-properties fo:language="en" fo:country="US" officeooo:rsid="01312073"/>
				</style:style>
				<style:style style:name="T16" style:family="text">
					<style:text-properties fo:language="en" fo:country="US" fo:font-weight="normal" style:font-weight-asian="normal" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="T17" style:family="text">
					<style:text-properties fo:language="en" fo:country="US" officeooo:rsid="01ec0418"/>
				</style:style>
				<style:style style:name="T18" style:family="text">
					<style:text-properties fo:font-style="italic" style:font-style-asian="italic"/>
				</style:style>
				<style:style style:name="T19" style:family="text">
					<style:text-properties style:font-name="Times New Roman CYR" fo:font-weight="bold" style:font-weight-asian="bold" style:font-name-complex="Times New Roman CYR" style:font-weight-complex="bold"/>
				</style:style>
				<style:style style:name="T20" style:family="text">
					<style:text-properties style:font-name="Times New Roman CYR" style:font-name-complex="Times New Roman CYR" style:font-weight-complex="bold"/>
				</style:style>
				<style:style style:name="T21" style:family="text">
					<style:text-properties style:text-position="sub 65%" fo:language="en" fo:country="US" fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="T22" style:family="text">
					<style:text-properties style:text-position="super 65%" fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="T23" style:family="text">
					<style:text-properties style:text-underline-style="none" style:text-underline-mode="continuous" style:text-overline-mode="continuous" style:text-line-through-mode="continuous"/>
				</style:style>
				<style:style style:name="T24" style:family="text">
					<style:text-properties fo:font-weight="normal" style:font-weight-asian="normal" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="T25" style:family="text">
					<style:text-properties fo:font-weight="normal" officeooo:rsid="0057529e" style:font-weight-asian="normal" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="T26" style:family="text">
					<style:text-properties fo:font-weight="normal" style:font-style-asian="italic" style:font-weight-asian="normal" style:font-style-complex="italic" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="T27" style:family="text">
					<style:text-properties fo:font-weight="normal" style:text-underline-mode="continuous" style:text-overline-mode="continuous" style:text-line-through-mode="continuous" style:font-weight-asian="normal" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="T28" style:family="text">
					<style:text-properties style:font-style-asian="italic" style:font-style-complex="italic"/>
				</style:style>
				<style:style style:name="T29" style:family="text">
					<style:text-properties style:text-underline-mode="continuous" style:text-overline-mode="continuous" style:text-line-through-mode="continuous"/>
				</style:style>
				<style:style style:name="T30" style:family="text">
					<style:text-properties style:text-underline-mode="continuous" style:text-overline-mode="continuous" style:text-line-through-mode="continuous" style:font-style-asian="italic"/>
				</style:style>
				<style:style style:name="T31" style:family="text">
					<style:text-properties officeooo:rsid="012d7da6" style:text-underline-mode="continuous" style:text-overline-mode="continuous" style:text-line-through-mode="continuous" style:font-style-asian="italic"/>
				</style:style>
				<style:style style:name="T32" style:family="text">
					<style:text-properties officeooo:rsid="00a5ec8c"/>
				</style:style>
				<style:style style:name="T33" style:family="text">
					<style:text-properties fo:language="ru" fo:country="RU"/>
				</style:style>
				<style:style style:name="T34" style:family="text">
					<style:text-properties fo:language="ru" fo:country="RU" officeooo:rsid="00f339d2"/>
				</style:style>
				<style:style style:name="T35" style:family="text">
					<style:text-properties fo:language="ru" fo:country="RU" officeooo:rsid="012d7da6" style:text-underline-mode="continuous" style:text-overline-mode="continuous" style:text-line-through-mode="continuous" style:font-style-asian="italic"/>
				</style:style>
				<style:style style:name="T36" style:family="text">
					<style:text-properties fo:language="ru" fo:country="RU" officeooo:rsid="01ed0f09"/>
				</style:style>
				<style:style style:name="T37" style:family="text">
					<style:text-properties fo:font-size="10pt" fo:font-weight="normal" officeooo:rsid="0057529e" style:font-size-asian="10pt" style:font-weight-asian="normal" style:font-size-complex="10pt" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="T38" style:family="text">
					<style:text-properties fo:font-size="10pt" fo:language="en" fo:country="US" fo:font-weight="normal" officeooo:rsid="0149f8b9" style:font-size-asian="10pt" style:font-weight-asian="normal" style:font-size-complex="10pt" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="T39" style:family="text">
					<style:text-properties fo:font-size="10pt" fo:language="en" fo:country="US" officeooo:rsid="0149f8b9" style:font-size-asian="10pt" style:font-size-complex="10pt"/>
				</style:style>
				<style:style style:name="T40" style:family="text">
					<style:text-properties fo:font-size="10pt" officeooo:rsid="0057529e" style:font-size-asian="10pt" style:font-size-complex="10pt"/>
				</style:style>
				<style:style style:name="T41" style:family="text">
					<style:text-properties fo:font-size="9pt" officeooo:rsid="0057529e" style:font-size-asian="9pt" style:font-size-complex="9pt"/>
				</style:style>
				<style:style style:name="T42" style:family="text">
					<style:text-properties officeooo:rsid="012d7da6"/>
				</style:style>
				<style:style style:name="T43" style:family="text">
					<style:text-properties style:text-position="sub 58%"/>
				</style:style>
				<style:style style:name="T44" style:family="text">
					<style:text-properties style:text-position="super 80%"/>
				</style:style>
				<style:style style:name="T45" style:family="text">
					<style:text-properties style:text-position="0% 100%" fo:font-size="10pt" fo:language="en" fo:country="US" fo:font-weight="normal" officeooo:rsid="00532b2a" style:font-size-asian="10pt" style:font-weight-asian="normal" style:font-size-complex="10pt" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="T46" style:family="text">
					<style:text-properties style:text-position="0% 100%" fo:font-size="10pt" fo:language="en" fo:country="US" fo:font-weight="normal" officeooo:rsid="0149f8b9" style:font-size-asian="10pt" style:font-weight-asian="normal" style:font-size-complex="10pt" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="T47" style:family="text">
					<style:text-properties style:text-position="0% 100%" fo:font-size="10pt" fo:language="en" fo:country="US" officeooo:rsid="00532b2a" style:font-size-asian="10pt" style:font-size-complex="10pt"/>
				</style:style>
				<style:style style:name="T48" style:family="text">
					<style:text-properties style:text-position="0% 100%" fo:font-size="10pt" fo:language="en" fo:country="US" officeooo:rsid="0149f8b9" style:font-size-asian="10pt" style:font-size-complex="10pt"/>
				</style:style>
				<style:style style:name="T49" style:family="text">
					<style:text-properties officeooo:rsid="015f8065"/>
				</style:style>
				<style:style style:name="T50" style:family="text"/>
				<style:style style:name="Sect1" style:family="section">
					<style:section-properties style:writing-mode="lr-tb" fo:margin-left="0cm" fo:margin-right="0.252cm" style:editable="false">
						<style:columns fo:column-count="1" fo:column-gap="0cm"/>
					</style:section-properties>
				</style:style>
				<number:number-style style:name="N0">
					<number:number number:min-integer-digits="1"/>
				</number:number-style>
				<number:text-style style:name="N100">
					<number:text-content/>
				</number:text-style>
			</office:automatic-styles>
			<office:body>
				<office:text text:use-soft-page-breaks="true"><text:variable-decls>
						<text:variable-decl office:value-type="string" text:name="ССС"/>
					</text:variable-decls><text:sequence-decls>
						<text:sequence-decl text:display-outline-level="0" text:name="Illustration"/>
						<text:sequence-decl text:display-outline-level="0" text:name="Table"/>
						<text:sequence-decl text:display-outline-level="0" text:name="Text"/>
						<text:sequence-decl text:display-outline-level="0" text:name="Drawing"/>
					</text:sequence-decls><text:p text:style-name="P111"/><table:table table:name="Таблица8" table:style-name="Таблица8">
						<table:table-column table:style-name="Таблица8.A"/>
						<table:table-column table:style-name="Таблица8.B"/>
						<table:table-column table:style-name="Таблица8.C"/>
						<table:table-column table:style-name="Таблица8.D"/>
						<table:table-column table:style-name="Таблица8.E"/>
						<table:table-row table:style-name="Таблица8.1">
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="Обычный"/>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="Обычный"/>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="Обычный"/>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица8.D1" office:value-type="string">
								<text:p text:style-name="P68">Всего листов <text:s/></text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="Обычный"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица8.2">
							<table:table-cell table:style-name="Таблица8.A2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P69">МЕЖЕВОЙ ПЛАН</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица8.B2" table:number-columns-spanned="3" office:value-type="string">
								<text:p text:style-name="Обычный">Заполняется специалистом органа кадастрового учета</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="Обычный"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица8.3">
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.B3" table:number-columns-spanned="3" office:value-type="string">
								<text:p text:style-name="Обычный">регистрационный №______________________________________</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="Обычный"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица8.4">
							<table:table-cell table:style-name="Таблица8.A4" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P69">Титульный лист</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица8.B4" table:number-columns-spanned="2" office:value-type="string">
								<text:p text:style-name="P25">
									<text:s/>
								</text:p>
								<text:p text:style-name="P25"/>
								<text:p text:style-name="P1">__________________________(подпись)</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.D4" office:value-type="string">
								<text:p text:style-name="P1"/>
								<text:p text:style-name="P1">___________________________</text:p>
								<text:p text:style-name="P1">(инициалы, фамилия)</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="P1"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.B5" table:number-columns-spanned="3" office:value-type="string">
								<text:p text:style-name="Обычный">«_____»________________ ________г.</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="Обычный"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица8.6">
							<table:table-cell table:style-name="Таблица8.A6" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="P9"><text:bookmark-start text:name="Оглавление_ТитульныйЛист"/>Титульный лист<text:bookmark-end text:name="Оглавление_ТитульныйЛист"/></text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="P9"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row>
							<table:table-cell table:style-name="Таблица8.A7" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">1. Межевой план подготовлен в результате выполнения кадастровых работ в связи с:</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="P1"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row>
							<table:table-cell table:style-name="Таблица8.A8" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="P3">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T5">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T5"><xsl:call-template name="mp_type"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T5"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="P25"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row>
							<table:table-cell table:style-name="Таблица8.A9" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="P9">2. Цель кадастровых работ:</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="P9"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row>
							<table:table-cell table:style-name="Таблица8.A10" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T5">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T5"><xsl:call-template name="mp_target"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T5"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="P25"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row>
							<table:table-cell table:style-name="Таблица8.A11" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="P9">3. Сведения о заказчике кадастровых работ:</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="P9"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row>
							<table:table-cell table:style-name="Таблица8.A12" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T5">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T5"><xsl:call-template name="mp_client"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T5"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="P25"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row>
							<table:table-cell table:style-name="Таблица8.A13" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="P1">(фамилия, имя, отчество (при наличии отчества) физического лица, полное наименование юридического лица, органа государственной власти, органа местного самоуправления, иностранного юридического лица с указанием страны его регистрации (инкорпорации)</text:p>
								<text:p text:style-name="P1"/>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="P1"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица8.14">
							<table:table-cell table:style-name="Таблица8.A14" table:number-columns-spanned="3" office:value-type="string">
								<text:p text:style-name="Обычный">Подпись ______________________________________________</text:p>
								<text:p text:style-name="P38"/>
								<text:p text:style-name="P38"><xsl:if test="/.//Person">
<xsl:call-template name="mp_client"/>
</xsl:if>
<xsl:if test="not(/.//Person)">
<xsl:call-template name="mp_client_agent"/>
</xsl:if></text:p>
								<text:p text:style-name="P39"/>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.D14" office:value-type="string">
								<text:p text:style-name="P24"/>
								<text:p text:style-name="P24"/>
								<text:p text:style-name="P24"/>
								<text:p text:style-name="Обычный">Дата <text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T10">
											<text:s text:c="2"/>
										</text:span>
									</text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T9"><xsl:call-template name="mp_client_date"/></text:span>
									</text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T9"> </text:span>
									</text:span></text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="P24"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица8.15">
							<table:table-cell table:style-name="Таблица8.A15" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T18">Место для оттиска печати заказчика кадастровых работ</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="Обычный"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row>
							<table:table-cell table:style-name="Таблица8.A16" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">4. Сведения о кадастровом инженере:</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="P1"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row>
							<table:table-cell table:style-name="Таблица8.A17" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="T24">Фамилия, имя, отчество (при наличии отчества</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T24">) </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T26">
											<text:s text:c="2"/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T26"><xsl:apply-templates select="//Contractor/FIO"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T26">
											<text:s text:c="2"/>
										</text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="P47"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row>
							<table:table-cell table:style-name="Таблица8.A18" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="Обычный">№ квалификационного аттестата кадастрового инженера <text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T28">
											<text:s text:c="2"/>
										</text:span>
									</text:span><text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T28"><xsl:apply-templates select="//Contractor/N_Certificate"/></text:span>
									</text:span><text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T28">
											<text:s/>
										</text:span>
									</text:span></text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="Обычный"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row>
							<table:table-cell table:style-name="Таблица8.A19" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="Обычный">Контактный <text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:s/>
									</text:span>телефон<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T9">
											<text:s/>
										</text:span>
									</text:span><text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T10">
											<text:s text:c="2"/>
										</text:span>
									</text:span><text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T10"><xsl:apply-templates select="//Contractor/Telephone"/></text:span>
									</text:span><text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T10">
											<text:s/>
										</text:span>
									</text:span></text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="P24"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row>
							<table:table-cell table:style-name="Таблица8.A20" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="Обычный">Почтовый адрес и адрес электронной почты, по которым осуществляется связь с кадастровым инженером</text:p>
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T29">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T29"><xsl:apply-templates select="//Contractor"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T29"> </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T10">
											<text:s/>
										</text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="P24"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row>
							<table:table-cell table:style-name="Таблица8.A21" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="Обычный">Сокращенное наименование юридического лица, если кадастровый инженер является работником юридического лица<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T23">
											<text:s/>
										</text:span>
									</text:span><text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T29">
											<text:s/>
										</text:span>
									</text:span><text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T29"><xsl:apply-templates select="//Contractor/Organization"/></text:span>
									</text:span><text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T29">
											<text:s/>
										</text:span>
									</text:span></text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="Обычный"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица8.22">
							<table:table-cell table:style-name="Таблица8.A22" table:number-columns-spanned="2" office:value-type="string">
								<text:p text:style-name="Обычный">Подпись</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.C22" table:number-columns-spanned="2" office:value-type="string">
								<text:p text:style-name="Обычный">Дата<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span><text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T10">
											<text:s text:c="2"/>
										</text:span>
									</text:span><text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T10"><xsl:call-template name="mp_cad_date"/></text:span>
									</text:span><text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T10">
											<text:s/>
										</text:span>
									</text:span></text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="P24"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица8.23">
							<table:table-cell table:style-name="Таблица8.A23" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T18">Место для оттиска печати кадастрового инженера</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="Обычный"/>
							</table:table-cell>
						</table:table-row>
					</table:table><text:p text:style-name="Обычный"/><text:p text:style-name="Обычный"/><text:section text:style-name="Sect1" text:name="Sect1">
						<text:p text:style-name="P83"/>
						<table:table table:name="Таблица9" table:style-name="Таблица9"><table:table-column table:style-name="Таблица9.A"/><table:table-column table:style-name="Таблица9.B"/><table:table-column table:style-name="Таблица9.C"/><table:table-row table:style-name="Таблица9.1">
								<table:table-cell table:style-name="Таблица9.A1" office:value-type="string">
									<text:p text:style-name="Обычный"/>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.A1" office:value-type="string">
									<text:p text:style-name="Обычный"/>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.C1" office:value-type="string">
									<text:p text:style-name="Обычный">Лист №__<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span><text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T4">2</text:span>
										</text:span><text:span text:style-name="User_20_Entry"> </text:span>__</text:p>
								</table:table-cell>
							</table:table-row><table:table-row table:style-name="Таблица9.2">
								<table:table-cell table:style-name="Таблица9.A2" table:number-columns-spanned="3" office:value-type="string">
									<text:p text:style-name="P21">МЕЖЕВОЙ ПЛАН</text:p>
								</table:table-cell>
								<table:covered-table-cell/>
								<table:covered-table-cell/>
							</table:table-row><table:table-row table:style-name="Таблица9.3">
								<table:table-cell table:style-name="Таблица9.A3" table:number-columns-spanned="3" office:value-type="string">
									<text:p text:style-name="P9"><text:bookmark-start text:name="Оглавление_Содержание"/>Содержание<text:bookmark-end text:name="Оглавление_Содержание"/></text:p>
								</table:table-cell>
								<table:covered-table-cell/>
								<table:covered-table-cell/>
							</table:table-row><table:table-row>
								<table:table-cell table:style-name="Таблица9.A4" office:value-type="string">
									<text:p text:style-name="P21">№ п/п</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.B4" office:value-type="string">
									<text:p text:style-name="P21">Разделы межевого плана</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.C4" office:value-type="string">
									<text:p text:style-name="P21">Номера листов</text:p>
								</table:table-cell>
							</table:table-row><table:table-row table:style-name="Таблица9.5">
								<table:table-cell table:style-name="Таблица9.A5" office:value-type="string">
									<text:p text:style-name="P21">1</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.B5" office:value-type="string">
									<text:p text:style-name="P21">2</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.C5" office:value-type="string">
									<text:p text:style-name="P94">3</text:p>
								</table:table-cell>
							</table:table-row><table:table-row>
								<table:table-cell table:style-name="Таблица9.A19" office:value-type="string">
									<text:list xml:id="list2755943877183364547" text:style-name="Numbering_20_1">
										<text:list-item>
											<text:p text:style-name="P106">
												<text:span text:style-name="User_20_Entry"/>
											</text:p>
										</text:list-item>
									</text:list>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.B6" office:value-type="string">
									<text:p text:style-name="Обычный">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30">
												<text:bookmark-ref text:reference-format="text" text:ref-name="Оглавление_ИсходныеДанные">Исходные данные</text:bookmark-ref>
											</text:span>
										</text:span>
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30"> </text:span>
										</text:span>
									</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.C6" office:value-type="string">
									<text:p text:style-name="P40">
										<text:span text:style-name="User_20_Entry">3</text:span>
									</text:p>
								</table:table-cell>
							</table:table-row><table:table-row>
								<table:table-cell table:style-name="Таблица9.A19" office:value-type="string">
									<text:list xml:id="list195730975147293" text:continue-numbering="true" text:style-name="Numbering_20_1">
										<text:list-item>
											<text:p text:style-name="P107">
												<text:span text:style-name="User_20_Entry"/>
											</text:p>
										</text:list-item>
									</text:list>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.B7" office:value-type="string">
									<text:p text:style-name="Обычный">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30">
												<text:bookmark-ref text:reference-format="text" text:ref-name="Оглавление_Сведения">Сведения о выполненных измерениях и расчетах</text:bookmark-ref>
											</text:span>
										</text:span>
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30"> </text:span>
										</text:span>
									</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.C7" office:value-type="string">
									<text:p text:style-name="P1">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30">
												<text:bookmark-ref text:reference-format="page" text:ref-name="Оглавление_Сведения">4</text:bookmark-ref>
											</text:span>
										</text:span>
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30"> </text:span>
										</text:span>
									</text:p>
								</table:table-cell>
							</table:table-row><!--row-code-->
<xsl:if test="/.//NewParcel"><table:table-row>
								<table:table-cell table:style-name="Таблица9.A9" office:value-type="string">
									<text:list xml:id="list195730975167758" text:continue-numbering="true" text:style-name="Numbering_20_1">
										<text:list-item>
											<text:p text:style-name="P110">
												<text:span text:style-name="User_20_Entry"/>
											</text:p>
										</text:list-item>
									</text:list>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.B9" office:value-type="string">
									<text:p text:style-name="Обычный">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30">
												<text:bookmark-ref text:reference-format="text" text:ref-name="Оглавление_ОбразуемыеУчастки">Сведения об образуемых земельных участках и их частях</text:bookmark-ref>
											</text:span>
										</text:span>
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30"> </text:span>
										</text:span>
									</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.C9" office:value-type="string">
									<text:p text:style-name="P1">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30">
												<text:bookmark-ref text:reference-format="page" text:ref-name="Оглавление_ОбразуемыеУчастки">6</text:bookmark-ref>
											</text:span>
										</text:span>
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30"> </text:span>
										</text:span>
									</text:p>
								</table:table-cell>
							</table:table-row><!--row-code-->
</xsl:if>
<xsl:if test="/.//ExistEZParcels"><table:table-row>
								<table:table-cell table:style-name="Таблица9.A19" office:value-type="string">
									<text:list xml:id="list195730975160275" text:continue-numbering="true" text:style-name="Numbering_20_1">
										<text:list-item>
											<text:p text:style-name="P108">
												<text:span text:style-name="User_20_Entry"/>
											</text:p>
										</text:list-item>
									</text:list>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.B11" office:value-type="string">
									<text:p text:style-name="Обычный">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30">
												<text:bookmark-ref text:reference-format="text" text:ref-name="Оглавление_ИзмененныеУчастки">Сведения об измененных земельных участках</text:bookmark-ref>
											</text:span>
										</text:span>
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30"> </text:span>
										</text:span>
									</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.C11" office:value-type="string">
									<text:p text:style-name="P1">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30">
												<text:bookmark-ref text:reference-format="page" text:ref-name="Оглавление_ИзмененныеУчастки">9</text:bookmark-ref>
											</text:span>
										</text:span>
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30"> </text:span>
										</text:span>
									</text:p>
								</table:table-cell>
							</table:table-row><!--row-code-->
</xsl:if>
<xsl:if test="/.//NewParcel/Providing_Pass_CadastralNumbers"><table:table-row>
								<table:table-cell table:style-name="Таблица9.A19" office:value-type="string">
									<text:list xml:id="list195730975161258" text:continue-numbering="true" text:style-name="Numbering_20_1">
										<text:list-item>
											<text:p text:style-name="P108">
												<text:span text:style-name="User_20_Entry"/>
											</text:p>
										</text:list-item>
									</text:list>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.B13" office:value-type="string">
									<text:p text:style-name="Обычный">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30">
												<text:bookmark-ref text:reference-format="text" text:ref-name="Оглавление_Доступ">Сведения о земельных участках, посредством которых обеспечивается доступ к образуемым или изменяемым земельным участкам</text:bookmark-ref>
											</text:span>
										</text:span>
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30"> </text:span>
										</text:span>
									</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.C13" office:value-type="string">
									<text:p text:style-name="P1">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30">
												<text:bookmark-ref text:reference-format="page" text:ref-name="Оглавление_Доступ">11</text:bookmark-ref>
											</text:span>
										</text:span>
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30"> </text:span>
										</text:span>
									</text:p>
								</table:table-cell>
							</table:table-row><!--row-code-->
</xsl:if>
<xsl:if test="/.//ExistParcel[not(Composition_EZ)]"><table:table-row>
								<table:table-cell table:style-name="Таблица9.A19" office:value-type="string">
									<text:list xml:id="list195730975145951" text:continue-numbering="true" text:style-name="Numbering_20_1">
										<text:list-item>
											<text:p text:style-name="P108">
												<text:span text:style-name="User_20_Entry">
													<text:span text:style-name="T14"/>
												</text:span>
											</text:p>
										</text:list-item>
									</text:list>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.B15" office:value-type="string">
									<text:p text:style-name="Обычный">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30">
												<text:bookmark-ref text:reference-format="text" text:ref-name="Оглавление_УточняемыеУчастки">Сведения об уточняемых земельных участках и их частях</text:bookmark-ref>
											</text:span>
										</text:span>
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30"> </text:span>
										</text:span>
									</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.C15" office:value-type="string">
									<text:p text:style-name="P1">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30">
												<text:bookmark-ref text:reference-format="page" text:ref-name="Оглавление_УточняемыеУчастки">12</text:bookmark-ref>
											</text:span>
										</text:span>
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30"> </text:span>
										</text:span>
									</text:p>
								</table:table-cell>
							</table:table-row><!--row-code-->
</xsl:if>
<xsl:if test="/.//NewSubParcel"><table:table-row>
								<table:table-cell table:style-name="Таблица9.A19" office:value-type="string">
									<text:list xml:id="list195730975147906" text:continue-numbering="true" text:style-name="Numbering_20_1">
										<text:list-item>
											<text:p text:style-name="P108">
												<text:span text:style-name="User_20_Entry"/>
											</text:p>
										</text:list-item>
									</text:list>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.B17" office:value-type="string">
									<text:p text:style-name="Обычный">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30">
												<text:bookmark-ref text:reference-format="text" text:ref-name="Оглавление_ОбразуемыеЧасти">Сведения об образуемых частях земельного участка</text:bookmark-ref>
											</text:span>
										</text:span>
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30"> </text:span>
										</text:span>
									</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.C17" office:value-type="string">
									<text:p text:style-name="P1">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30">
												<text:bookmark-ref text:reference-format="page" text:ref-name="Оглавление_ОбразуемыеЧасти">15</text:bookmark-ref>
											</text:span>
										</text:span>
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30"> </text:span>
										</text:span>
									</text:p>
								</table:table-cell>
							</table:table-row><!--row-code-->
</xsl:if>
<xsl:if test="/.//Conclusion"><table:table-row>
								<table:table-cell table:style-name="Таблица9.A19" office:value-type="string">
									<text:list xml:id="list195730975172996" text:continue-numbering="true" text:style-name="Numbering_20_1">
										<text:list-item>
											<text:p text:style-name="P109">
												<text:span text:style-name="User_20_Entry"/>
											</text:p>
										</text:list-item>
									</text:list>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.B19" office:value-type="string">
									<text:p text:style-name="Обычный">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30">
												<text:bookmark-ref text:reference-format="text" text:ref-name="Оглавление_ЗаключениеКадастровогоИнженера">Заключение кадастрового инженера</text:bookmark-ref>
											</text:span>
										</text:span>
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30"> </text:span>
										</text:span>
									</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.C19" office:value-type="string">
									<text:p text:style-name="P1">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30">
												<text:bookmark-ref text:reference-format="page" text:ref-name="Оглавление_ЗаключениеКадастровогоИнженера">16</text:bookmark-ref>
											</text:span>
										</text:span>
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30"> </text:span>
										</text:span>
									</text:p>
								</table:table-cell>
							</table:table-row><!--row-code-->
</xsl:if>
<xsl:if test="/.//Scheme_Geodesic_Plotting">
<table:table-row>
								<table:table-cell table:style-name="Таблица9.A21">
									<text:list xml:id="list195730975160236" text:continue-numbering="true" text:style-name="Numbering_20_1">
										<text:list-item>
											<text:p text:style-name="P108"/>
										</text:list-item>
									</text:list>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.B21" office:value-type="string">
									<text:p text:style-name="P56">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T35">Схема геодезических построений</text:span>
										</text:span>
										<text:span text:style-name="User_20_Entry"> </text:span>
									</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.C21" office:value-type="string">
									<text:p text:style-name="P1">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30">
												<text:s text:c="7"/>
											</text:span>
										</text:span>
									</text:p>
								</table:table-cell>
							</table:table-row><!--row-code-->
</xsl:if>
<xsl:if test="/.//Scheme_Disposition_Parcels"><table:table-row>
								<table:table-cell table:style-name="Таблица9.A23" office:value-type="string">
									<text:list xml:id="list195730991151063" text:continue-numbering="true" text:style-name="Numbering_20_1">
										<text:list-item>
											<text:p text:style-name="P108">
												<text:span text:style-name="User_20_Entry">
													<text:span text:style-name="T14"/>
												</text:span>
											</text:p>
										</text:list-item>
									</text:list>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.B23" office:value-type="string">
									<text:p text:style-name="P56">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T31">Схема расположения земельных участков</text:span>
										</text:span>
										<text:span text:style-name="User_20_Entry"> </text:span>
									</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.C23" office:value-type="string">
									<text:p text:style-name="P1">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30">
												<text:s text:c="5"/>
											</text:span>
										</text:span>
									</text:p>
								</table:table-cell>
							</table:table-row><!--row-code-->
</xsl:if>
<xsl:if test="/.//Diagram_Parcels_SubParcels"><table:table-row>
								<table:table-cell table:style-name="Таблица9.A25" office:value-type="string">
									<text:list xml:id="list195730991146463" text:continue-numbering="true" text:style-name="Numbering_20_1">
										<text:list-item>
											<text:p text:style-name="P108">
												<text:span text:style-name="User_20_Entry">
													<text:span text:style-name="T14"/>
												</text:span>
											</text:p>
										</text:list-item>
									</text:list>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.B25" office:value-type="string">
									<text:p text:style-name="P56">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T31">Чертеж земельных участков и их частей</text:span>
										</text:span>
										<text:span text:style-name="User_20_Entry"> </text:span>
									</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.C25" office:value-type="string">
									<text:p text:style-name="P1">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30">
												<text:s text:c="4"/>
											</text:span>
										</text:span>
									</text:p>
								</table:table-cell>
							</table:table-row><!--row-code-->
</xsl:if>
<xsl:if test="/.//Agreement_Document"><table:table-row>
								<table:table-cell table:style-name="Таблица9.A27" office:value-type="string">
									<text:list xml:id="list195730991141087" text:continue-numbering="true" text:style-name="Numbering_20_1">
										<text:list-item>
											<text:p text:style-name="P108">
												<text:span text:style-name="User_20_Entry">
													<text:span text:style-name="T14"/>
												</text:span>
											</text:p>
										</text:list-item>
									</text:list>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.B27" office:value-type="string">
									<text:p text:style-name="P41">
										<text:span text:style-name="User_20_Entry">Акт согласования местоположения границ земельного участка</text:span>
									</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.C27" office:value-type="string">
									<text:p text:style-name="P42">
										<text:span text:style-name="User_20_Entry">, стр.2</text:span>
									</text:p>
								</table:table-cell>
							</table:table-row><!--row-code-->
</xsl:if>
<xsl:if test="/.//Appendix"><table:table-row>
								<table:table-cell table:style-name="Таблица9.A29" office:value-type="string">
									<text:list xml:id="list195730991151746" text:continue-numbering="true" text:style-name="Numbering_20_1">
										<text:list-item>
											<text:p text:style-name="P108">
												<text:span text:style-name="User_20_Entry">
													<text:span text:style-name="T14"/>
												</text:span>
											</text:p>
										</text:list-item>
									</text:list>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.B29" office:value-type="string">
									<text:p text:style-name="P41">
										<text:span text:style-name="User_20_Entry">Приложени</text:span>
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T42">е</text:span>
										</text:span>
										<text:span text:style-name="User_20_Entry"> </text:span>
									</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.C29" office:value-type="string">
									<text:p text:style-name="P1">
										<text:span text:style-name="User_20_Entry"/>
									</text:p>
								</table:table-cell>
							</table:table-row><!--row-code-->
</xsl:if></table:table>
						<text:p text:style-name="Обычный"/>
						<text:p text:style-name="P33"/>
					</text:section><table:table table:name="Таблица11" table:style-name="Таблица11">
						<table:table-column table:style-name="Таблица11.A"/>
						<table:table-column table:style-name="Таблица11.B"/>
						<table:table-column table:style-name="Таблица11.C"/>
						<table:table-header-rows>
							<table:table-row table:style-name="Таблица11.1">
								<table:table-cell table:style-name="Таблица11.A1" table:number-columns-spanned="3" office:value-type="string">
									<text:p text:style-name="P82"><text:bookmark-start text:name="Оглавление_ИсходныеДанные"/>Исходные данные<text:bookmark-end text:name="Оглавление_ИсходныеДанные"/></text:p>
								</table:table-cell>
								<table:covered-table-cell/>
								<table:covered-table-cell/>
							</table:table-row>
						</table:table-header-rows>
						<table:table-row>
							<table:table-cell table:style-name="Таблица11.A2" table:number-columns-spanned="3" office:value-type="string">
								<text:p text:style-name="P93">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">1. Перечень документов, использованных при подготовке межевого плана</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row>
							<table:table-cell table:style-name="Таблица11.A3" office:value-type="string">
								<text:p text:style-name="P69">№ п/п</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица11.B3" office:value-type="string">
								<text:p text:style-name="P69">Наименование документа</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица11.C3" office:value-type="string">
								<text:p text:style-name="P69">Реквизиты документа</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table><table:table table:name="Таблица20" table:style-name="Таблица20"><table:table-column table:style-name="Таблица20.A"/><table:table-column table:style-name="Таблица20.B"/><table:table-column table:style-name="Таблица20.C"/><table:table-header-rows>
							<table:table-row table:style-name="Таблица20.1">
								<table:table-cell table:style-name="Таблица20.A1" office:value-type="string">
									<text:p text:style-name="P69">1</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица20.B1" office:value-type="string">
									<text:p text:style-name="P69">2</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица20.C1" office:value-type="string">
									<text:p text:style-name="P69">3</text:p>
								</table:table-cell>
							</table:table-row>
						</table:table-header-rows><!--row-code-->
	<xsl:for-each select="/.//Input_Data/Documents/Document | /STD_MP[not(/.//Input_Data/Documents/Document)]">
<table:table-row table:style-name="Таблица20.1">
							<table:table-cell table:style-name="Таблица20.A3" office:value-type="string">
								<text:p text:style-name="P69">
									<text:span text:style-name="User_20_Entry">		<xsl:if test="ancestor-or-self::Document">
			<xsl:value-of select="position()"/>
		</xsl:if>
		<xsl:if test="not(ancestor-or-self::Document)">
			<xsl:value-of select="'-'"/>
		</xsl:if>
</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица20.B3" office:value-type="string">
								<text:p text:style-name="Standard">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_namedoc"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица20.C3" office:value-type="string">
								<text:p text:style-name="Standard">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_value">
	<xsl:with-param name="p_name">Number</xsl:with-param>
</xsl:call-template>
<xsl:text> от </xsl:text>
<xsl:call-template name="get_value">
	<xsl:with-param name="p_name">Date</xsl:with-param>
</xsl:call-template>


</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:for-each></table:table><table:table table:name="Таблица21" table:style-name="Таблица21">
						<table:table-column table:style-name="Таблица21.A"/>
						<table:table-column table:style-name="Таблица21.B"/>
						<table:table-column table:style-name="Таблица21.C" table:number-columns-repeated="2"/>
						<table:table-column table:style-name="Таблица21.E"/>
						<table:table-row table:style-name="Таблица21.1">
							<table:table-cell table:style-name="Таблица21.A1" table:number-columns-spanned="5" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">2. Сведения о геодезической основе, использованной при подготовке межевого плана </text:span>
									</text:span>
								</text:p>
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">Система координат <text:s text:c="3"/></text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3"><xsl:value-of select="/STD_MP/Coord_Systems/Coord_System[1]/@Name"/></text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица21.2">
							<table:table-cell table:style-name="Таблица21.A2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P9">№ п/п</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица21.B2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P9">Название пункта и тип знака геодезической сети</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица21.B2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P9">Класс геодезической сети</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица21.D2" table:number-columns-spanned="2" office:value-type="string">
								<text:p text:style-name="P9">Координаты, м</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица21.2">
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица21.B2" office:value-type="string">
								<text:p text:style-name="P9">Х</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица21.D2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T6">Y</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table><table:table table:name="Таблица23" table:style-name="Таблица23"><table:table-column table:style-name="Таблица23.A"/><table:table-column table:style-name="Таблица23.B"/><table:table-column table:style-name="Таблица23.C" table:number-columns-repeated="2"/><table:table-column table:style-name="Таблица23.E"/><table:table-header-rows>
							<table:table-row table:style-name="Таблица23.1">
								<table:table-cell table:style-name="Таблица23.A1" office:value-type="string">
									<text:p text:style-name="P9">1</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица23.B1" office:value-type="string">
									<text:p text:style-name="P9">2</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица23.B1" office:value-type="string">
									<text:p text:style-name="P9">3</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица23.B1" office:value-type="string">
									<text:p text:style-name="P9">4</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица23.E1" office:value-type="string">
									<text:p text:style-name="P9">5</text:p>
								</table:table-cell>
							</table:table-row>
						</table:table-header-rows><!--row-code-->
<xsl:for-each select="STD_MP/Input_Data/Geodesic_Bases/Geodesic_Base | STD_MP[not(/.//Geodesic_Base)]">
<table:table-row table:style-name="Таблица23.3">
							<table:table-cell table:style-name="Таблица23.A3" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry">		<xsl:if test="ancestor-or-self::Geodesic_Base">
			<xsl:value-of select="position()"/>
		</xsl:if>
		<xsl:if test="not(ancestor-or-self::Geodesic_Base)">
			<xsl:value-of select="'-'"/>
		</xsl:if>
</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица23.B3" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry"><xsl:if test="ancestor-or-self::Geodesic_Base">
	<xsl:value-of select="PName"/>
	<xsl:text> </xsl:text> 
	<xsl:value-of select="PKind"/> 
</xsl:if>
<xsl:if test="not(ancestor-or-self::Geodesic_Base)">
	<xsl:value-of select="'-'"/>
</xsl:if>
</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица23.C3" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry">

		<xsl:if test="ancestor-or-self::Geodesic_Base">
<xsl:value-of select="PKlass"/>
		</xsl:if>
		<xsl:if test="not(ancestor-or-self::Geodesic_Base)">
			<xsl:value-of select="'-'"/>
		</xsl:if>
</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица23.D3" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry">		<xsl:if test="ancestor-or-self::Geodesic_Base">
<xsl:value-of select="OrdX"/>
		</xsl:if>
		<xsl:if test="not(ancestor-or-self::Geodesic_Base)">
			<xsl:value-of select="'-'"/>
		</xsl:if>
</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица23.E3" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry">

		<xsl:if test="ancestor-or-self::Geodesic_Base">
<xsl:value-of select="OrdY"/>
		</xsl:if>
		<xsl:if test="not(ancestor-or-self::Geodesic_Base)">
			<xsl:value-of select="'-'"/>
		</xsl:if>
</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:for-each>
</table:table><table:table table:name="Таблица24" table:style-name="Таблица24">
						<table:table-column table:style-name="Таблица24.A"/>
						<table:table-column table:style-name="Таблица24.B"/>
						<table:table-column table:style-name="Таблица24.C"/>
						<table:table-column table:style-name="Таблица24.D"/>
						<table:table-row table:style-name="Таблица24.1">
							<table:table-cell table:style-name="Таблица24.A1" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="P16">3. Сведения о средствах измерений</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица24.2">
							<table:table-cell table:style-name="Таблица24.A2" office:value-type="string">
								<text:p text:style-name="P9">№ п/п</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица24.B2" office:value-type="string">
								<text:p text:style-name="P9">Наименование прибора</text:p>
								<text:p text:style-name="P9">(инструмента, аппаратуры)</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица24.B2" office:value-type="string">
								<text:p text:style-name="P9">Реквизиты сертификата прибора</text:p>
								<text:p text:style-name="P9">(инструмента, аппаратуры), при наличии такого сертификата</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица24.D2" office:value-type="string">
								<text:p text:style-name="P9">Реквизиты свидетельства о поверке прибора</text:p>
								<text:p text:style-name="P9">(инструмента, аппаратуры)</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table><table:table table:name="Таблица25" table:style-name="Таблица25"><table:table-column table:style-name="Таблица25.A"/><table:table-column table:style-name="Таблица25.B"/><table:table-column table:style-name="Таблица25.C"/><table:table-column table:style-name="Таблица25.D"/><table:table-header-rows>
							<table:table-row table:style-name="Таблица25.1">
								<table:table-cell table:style-name="Таблица25.A1" office:value-type="string">
									<text:p text:style-name="P9">1</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица25.B1" office:value-type="string">
									<text:p text:style-name="P9">2</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица25.B1" office:value-type="string">
									<text:p text:style-name="P9">3</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица25.D1" office:value-type="string">
									<text:p text:style-name="P9">4</text:p>
								</table:table-cell>
							</table:table-row>
						</table:table-header-rows><!--row-code-->
<xsl:for-each select="/.//Input_Data/Means_Survey/Means_Survey | STD_MP[not(/.//Input_Data/Means_Survey/Means_Survey)]"><table:table-row table:style-name="Таблица25.1">
							<table:table-cell table:style-name="Таблица25.A3" office:value-type="string">
								<text:p text:style-name="P48">
									<text:span text:style-name="User_20_Entry">	<xsl:if test="ancestor-or-self::Means_Survey">
			<xsl:value-of select="position()"/>
		</xsl:if>
		<xsl:if test="not(ancestor-or-self::Means_Survey)">
			<xsl:value-of select="'-'"/>
		</xsl:if></text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица25.B3" office:value-type="string">
								<text:p text:style-name="P48">
									<text:span text:style-name="User_20_Entry">	<xsl:if test="ancestor-or-self::Means_Survey">
<xsl:value-of select="Name"/>
		</xsl:if>
		<xsl:if test="not(ancestor-or-self::Means_Survey)">
			<xsl:value-of select="'-'"/>
		</xsl:if></text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица25.B3" office:value-type="string">
								<text:p text:style-name="P48">
									<text:span text:style-name="User_20_Entry">

	<xsl:if test="ancestor-or-self::Means_Survey">
<xsl:value-of select="Certificate"/>
		</xsl:if>
		<xsl:if test="not(ancestor-or-self::Means_Survey)">
			<xsl:value-of select="'-'"/>
		</xsl:if></text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица25.D3" office:value-type="string">
								<text:p text:style-name="P48">
									<text:span text:style-name="User_20_Entry">
	<xsl:if test="ancestor-or-self::Means_Survey">
<xsl:value-of select="Certificate_Verification"/>
		</xsl:if>
		<xsl:if test="not(ancestor-or-self::Means_Survey)">
			<xsl:value-of select="'-'"/>
		</xsl:if></text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:for-each>
</table:table><table:table table:name="Таблица26" table:style-name="Таблица26">
						<table:table-column table:style-name="Таблица26.A"/>
						<table:table-column table:style-name="Таблица26.B"/>
						<table:table-column table:style-name="Таблица26.C"/>
						<table:table-row table:style-name="Таблица26.1">
							<table:table-cell table:style-name="Таблица26.A1" table:number-columns-spanned="3" office:value-type="string">
								<text:p text:style-name="P9">4. Сведения о наличии зданий, сооружений, объектов незавершенного строительства на исходных или измененных земельных участках</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица26.2">
							<table:table-cell table:style-name="Таблица26.A2" office:value-type="string">
								<text:p text:style-name="P9">№ п/п</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица26.B2" office:value-type="string">
								<text:p text:style-name="P9">Кадастровый номер</text:p>
								<text:p text:style-name="P9">земельного участка</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица26.C2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T19">Кадастровые или иные номера зданий, сооружений, объектов незавершенного строительства, расположенных на земельном участке</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table><table:table table:name="Таблица27" table:style-name="Таблица27"><table:table-column table:style-name="Таблица27.A"/><table:table-column table:style-name="Таблица27.B"/><table:table-column table:style-name="Таблица27.C"/><table:table-header-rows>
							<table:table-row table:style-name="Таблица27.1">
								<table:table-cell table:style-name="Таблица27.A1" office:value-type="string">
									<text:p text:style-name="P9">1</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица27.B1" office:value-type="string">
									<text:p text:style-name="P9">2</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица27.C1" office:value-type="string">
									<text:p text:style-name="P9">3</text:p>
								</table:table-cell>
							</table:table-row>
						</table:table-header-rows><!--row-code-->
<xsl:for-each select="/.//Input_Data/Realty/OKS | STD_MP[not(/.//Input_Data/Realty/OKS)]"><table:table-row table:style-name="Таблица27.1">
							<table:table-cell table:style-name="Таблица27.A3" office:value-type="string">
								<text:p text:style-name="P48">
									<text:span text:style-name="User_20_Entry">	<xsl:if test="CadastralNumber">
			<xsl:value-of select="position()"/>
		</xsl:if>
		<xsl:if test="not(CadastralNumber)">
			<xsl:value-of select="'-'"/>
		</xsl:if></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица27.B3" office:value-type="string">
								<text:p text:style-name="P48">
									<text:span text:style-name="User_20_Entry"><xsl:if test="CadastralNumber">
<xsl:value-of select="CadastralNumber"/>
</xsl:if>
<xsl:if test="not(CadastralNumber)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица27.C3" office:value-type="string">
								<text:p text:style-name="P48">
									<text:span text:style-name="User_20_Entry"><xsl:if test="CadastralNumber">
    <xsl:value-of select="CadastralNumber_OtherNumber"/>
</xsl:if>
<xsl:if test="not(CadastralNumber)">
	<xsl:value-of select="'-'"/>
</xsl:if></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:for-each>
</table:table><table:table table:name="Таблица28" table:style-name="Таблица28">
						<table:table-column table:style-name="Таблица28.A"/>
						<table:table-column table:style-name="Таблица28.B"/>
						<table:table-column table:style-name="Таблица28.C"/>
						<table:table-row table:style-name="Таблица28.1">
							<table:table-cell table:style-name="Таблица28.A1" table:number-columns-spanned="3" office:value-type="string">
								<text:p text:style-name="P9">5. Сведения о частях исходных, измененных или уточняемых земельных участков</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица28.2">
							<table:table-cell table:style-name="Таблица28.A2" office:value-type="string">
								<text:p text:style-name="P9">№ п/п</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица28.B2" office:value-type="string">
								<text:p text:style-name="P9">Кадастровый номер</text:p>
								<text:p text:style-name="P9">земельного участка</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица28.C2" office:value-type="string">
								<text:p text:style-name="P9">Учетные номера частей земельного участка</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table><table:table table:name="Таблица29" table:style-name="Таблица29"><table:table-column table:style-name="Таблица29.A"/><table:table-column table:style-name="Таблица29.B"/><table:table-column table:style-name="Таблица29.C"/><table:table-header-rows>
							<table:table-row table:style-name="Таблица29.1">
								<table:table-cell table:style-name="Таблица29.A1" office:value-type="string">
									<text:p text:style-name="P9">1</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица29.B1" office:value-type="string">
									<text:p text:style-name="P9">2</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица29.C1" office:value-type="string">
									<text:p text:style-name="P9">3</text:p>
								</table:table-cell>
							</table:table-row>
						</table:table-header-rows><!--row-code-->
<xsl:for-each select="/.//NewParcel[SubParcels] | ChangeParcel[SubParcels] | /STD_MP[not(/.//NewParcel[SubParcels] | ChangeParcel[SubParcels])]"><table:table-row table:style-name="Таблица29.3">
							<table:table-cell table:style-name="Таблица29.A3" office:value-type="string">
								<text:p text:style-name="P48">	<xsl:if test="SubParcels">
			<xsl:value-of select="position()"/>
		</xsl:if>
		<xsl:if test="not(SubParcels)">
			<xsl:value-of select="'-'"/>
		</xsl:if></text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица29.B3" office:value-type="string">
								<text:p text:style-name="P48">
									<text:span text:style-name="User_20_Entry">	<xsl:if test="SubParcels">
			<xsl:value-of select="@CadastralNumber | @Definition"/>
		</xsl:if>
		<xsl:if test="not(SubParcels)">
			<xsl:value-of select="'-'"/>
		</xsl:if></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица29.C3" office:value-type="string">
								<text:p text:style-name="P48">
									<text:span text:style-name="User_20_Entry"><xsl:if test="SubParcels">
  <xsl:for-each select="SubParcels/FormSubParcel">
    <xsl:value-of select="@Definition"/>  
  </xsl:for-each>   
</xsl:if>
<xsl:if test="not(SubParcels/FormSubParcel)">
	<xsl:value-of select="'-'"/>
</xsl:if></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:for-each>

</table:table><table:table table:name="Таблица17" table:style-name="Таблица17">
						<table:table-column table:style-name="Таблица17.A"/>
						<table:table-column table:style-name="Таблица17.B"/>
						<table:table-column table:style-name="Таблица17.C"/>
						<table:table-row table:style-name="Таблица17.1">
							<table:table-cell table:style-name="Таблица17.A1" table:number-columns-spanned="3" office:value-type="string">
								<text:p text:style-name="P84"><text:bookmark-start text:name="Оглавление_Сведения"/>Сведения о выполненных измерениях и расчетах<text:bookmark-end text:name="Оглавление_Сведения"/></text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица17.2">
							<table:table-cell table:style-name="Таблица17.A2" table:number-columns-spanned="3" office:value-type="string">
								<text:p text:style-name="P92">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">1. Метод определения координат <text:s/>характерных точек границ земельных участков и их частей</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица17.2">
							<table:table-cell table:style-name="Таблица17.A3" office:value-type="string">
								<text:p text:style-name="P69">№ п/п</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица17.B3" office:value-type="string">
								<text:p text:style-name="P9">Кадастровый номер или обозначение</text:p>
								<text:p text:style-name="P69">земельного участка</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица17.C3" office:value-type="string">
								<text:p text:style-name="P69">Метод определения координат</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table><table:table table:name="Таблица30" table:style-name="Таблица30"><table:table-column table:style-name="Таблица30.A"/><table:table-column table:style-name="Таблица30.B"/><table:table-column table:style-name="Таблица30.C"/><table:table-header-rows>
							<table:table-row table:style-name="Таблица30.1">
								<table:table-cell table:style-name="Таблица30.A1" office:value-type="string">
									<text:p text:style-name="P69">1</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица30.B1" office:value-type="string">
									<text:p text:style-name="P13">2</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица30.C1" office:value-type="string">
									<text:p text:style-name="P69">3</text:p>
								</table:table-cell>
							</table:table-row>
						</table:table-header-rows><!--row-code-->
<xsl:for-each select="STD_MP/Package/FormParcels/NewParcel | STD_MP/Package/FormParcels/ChangeParcel | STD_MP/Package/SpecifyParcel/ExistParcel |
STD_MP/Package/SpecifyParcel/ExistEZ/ExistEZParcels |
STD_MP/Package/SpecifyParcel/ExistEZ/ExistEZParcels/Composition_EZ/InsertEntryParcels/InsertEntryParcel/ExistEntryParcel |
STD_MP/Package/SpecifyParcel/ExistEZ/ExistEZParcels/Composition_EZ/InsertEntryParcels/InsertEntryParcel/NewEntryParcel |
STD_MP/Package/SpecifyParcel/ExistEZ/ExistEZEntryParcels/ExistEZEntryParcel |
STD_MP/Package/SpecifyParcelsApproximal/ExistParcel |
STD_MP/Package/SpecifyParcelsApproximal/ExistEZ/ExistEZParcels |
STD_MP/Package/SpecifyParcelsApproximal/ExistEZ/ExistEZEntryParcels/ExistEZEntryParcel"><table:table-row table:style-name="Таблица30.3">
							<table:table-cell table:style-name="Таблица30.A3" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="position()"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица30.B3" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry">
										<text:s text:c="4"/>
									</text:span>
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="@CadastralNumber | @Definition"/>
</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:s/>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица30.C3" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry">геодезический метод</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:for-each>
<xsl:if test="not(STD_MP/Package/FormParcels/NewParcel | STD_MP/Package/FormParcels/ChangeParcel | STD_MP/Package/SpecifyParcel/ExistParcel |
STD_MP/Package/SpecifyParcel/ExistEZ/ExistEZParcels |
STD_MP/Package/SpecifyParcel/ExistEZ/ExistEZParcels/Composition_EZ/InsertEntryParcels/InsertEntryParcel/ExistEntryParcel |
STD_MP/Package/SpecifyParcel/ExistEZ/ExistEZParcels/Composition_EZ/InsertEntryParcels/InsertEntryParcel/NewEntryParcel |
STD_MP/Package/SpecifyParcel/ExistEZ/ExistEZEntryParcels/ExistEZEntryParcel |
STD_MP/Package/SpecifyParcelsApproximal/ExistParcel |
STD_MP/Package/SpecifyParcelsApproximal/ExistEZ/ExistEZParcels |
STD_MP/Package/SpecifyParcelsApproximal/ExistEZ/ExistEZEntryParcels/ExistEZEntryParcel)"><table:table-row table:style-name="Таблица30.3">
							<table:table-cell table:style-name="Таблица30.A3" office:value-type="string">
								<text:p text:style-name="P78">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица30.B3" office:value-type="string">
								<text:p text:style-name="P79">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица30.C3" office:value-type="string">
								<text:p text:style-name="P78">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:if></table:table><table:table table:name="Таблица32" table:style-name="Таблица32">
						<table:table-column table:style-name="Таблица32.A"/>
						<table:table-column table:style-name="Таблица32.B"/>
						<table:table-column table:style-name="Таблица32.C"/>
						<table:table-row table:style-name="Таблица32.1">
							<table:table-cell table:style-name="Таблица32.A1" table:number-columns-spanned="3" office:value-type="string">
								<text:p text:style-name="P9">2. Точность положения характерных точек границ земельных участков</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица32.2">
							<table:table-cell table:style-name="Таблица32.A2" office:value-type="string">
								<text:p text:style-name="P9">№ п/п</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица32.B2" office:value-type="string">
								<text:p text:style-name="P9">Кадастровый номер или обозначение</text:p>
								<text:p text:style-name="P9">земельного участка</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица32.C2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Формулы, примененные для расчета средней квадратической погрешности положения характерных точек границ (М</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">t</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">), м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table><table:table table:name="Таблица33" table:style-name="Таблица33"><table:table-column table:style-name="Таблица33.A"/><table:table-column table:style-name="Таблица33.B"/><table:table-column table:style-name="Таблица33.C"/><table:table-header-rows>
							<table:table-row table:style-name="Таблица33.1">
								<table:table-cell table:style-name="Таблица33.A1" office:value-type="string">
									<text:p text:style-name="P9">1</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица33.B1" office:value-type="string">
									<text:p text:style-name="P9">2</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица33.C1" office:value-type="string">
									<text:p text:style-name="P9">3</text:p>
								</table:table-cell>
							</table:table-row>
						</table:table-header-rows><!--row-code-->
<xsl:for-each select="STD_MP/Package/FormParcels/NewParcel | STD_MP/Package/FormParcels/ChangeParcel | STD_MP/Package/SpecifyParcel/ExistParcel |
STD_MP/Package/SpecifyParcel/ExistEZ/ExistEZParcels |
STD_MP/Package/SpecifyParcel/ExistEZ/ExistEZParcels/Composition_EZ/InsertEntryParcels/InsertEntryParcel/ExistEntryParcel |
STD_MP/Package/SpecifyParcel/ExistEZ/ExistEZParcels/Composition_EZ/InsertEntryParcels/InsertEntryParcel/NewEntryParcel |
STD_MP/Package/SpecifyParcel/ExistEZ/ExistEZEntryParcels/ExistEZEntryParcel |
STD_MP/Package/SpecifyParcelsApproximal/ExistParcel |
STD_MP/Package/SpecifyParcelsApproximal/ExistEZ/ExistEZParcels |
STD_MP/Package/SpecifyParcelsApproximal/ExistEZ/ExistEZEntryParcels/ExistEZEntryParcel">
<table:table-row table:style-name="Таблица33.3">
							<table:table-cell table:style-name="Таблица33.A3" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="position()"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица33.B3" office:value-type="string">
								<text:p text:style-name="P46">
									<text:span text:style-name="User_20_Entry">
										<text:s/>
									</text:span>
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="@CadastralNumber | @Definition"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица33.C3" office:value-type="string">
								<text:p text:style-name="P103">
									<text:span text:style-name="User_20_Entry">Mt=√ (m</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T43">0</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T44">2</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry"> + m</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T43">1</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T44">2</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry"> )</text:span>
								</text:p>
								<text:p text:style-name="P103">
									<text:span text:style-name="User_20_Entry">Mt=√ (</text:span>
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_m"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T44">2</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry"> + </text:span>
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_m"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T44">2</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry"> ) = </text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T49"><xsl:value-of select="format-number( number(/.//*[1]/*/@Delta_Geopoint),'#0.00')"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T49"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:for-each>
<xsl:if test="not(STD_MP/Package/FormParcels/NewParcel | STD_MP/Package/FormParcels/ChangeParcel | STD_MP/Package/SpecifyParcel/ExistParcel |
STD_MP/Package/SpecifyParcel/ExistEZ/ExistEZParcels |
STD_MP/Package/SpecifyParcel/ExistEZ/ExistEZParcels/Composition_EZ/InsertEntryParcels/InsertEntryParcel/ExistEntryParcel |
STD_MP/Package/SpecifyParcel/ExistEZ/ExistEZParcels/Composition_EZ/InsertEntryParcels/InsertEntryParcel/NewEntryParcel |
STD_MP/Package/SpecifyParcel/ExistEZ/ExistEZEntryParcels/ExistEZEntryParcel |
STD_MP/Package/SpecifyParcelsApproximal/ExistParcel |
STD_MP/Package/SpecifyParcelsApproximal/ExistEZ/ExistEZParcels |
STD_MP/Package/SpecifyParcelsApproximal/ExistEZ/ExistEZEntryParcels/ExistEZEntryParcel)"><table:table-row table:style-name="Таблица33.3">
							<table:table-cell table:style-name="Таблица33.A5" office:value-type="string">
								<text:p text:style-name="P34">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица33.B5" office:value-type="string">
								<text:p text:style-name="P34">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица33.C5" office:value-type="string">
								<text:p text:style-name="P34">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code--></xsl:if></table:table><table:table table:name="Таблица34" table:style-name="Таблица34">
						<table:table-column table:style-name="Таблица34.A"/>
						<table:table-column table:style-name="Таблица34.B"/>
						<table:table-column table:style-name="Таблица34.C"/>
						<table:table-column table:style-name="Таблица34.D"/>
						<table:table-row table:style-name="Таблица34.1">
							<table:table-cell table:style-name="Таблица34.A1" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="P9">3. Точность положения характерных точек границ частей земельных участков</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица34.2">
							<table:table-cell table:style-name="Таблица34.A2" office:value-type="string">
								<text:p text:style-name="P9">№ п/п</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица34.B2" office:value-type="string">
								<text:p text:style-name="P9">Кадастровый номер или обозначение</text:p>
								<text:p text:style-name="P9">земельного участка</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица34.B2" office:value-type="string">
								<text:p text:style-name="P9">Учетный номер или обозначение части</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица34.D2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Формулы, примененные для расчета средней квадратической погрешности положения характерных точек границ (М</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">t</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">), м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table><table:table table:name="Таблица37" table:style-name="Таблица37"><table:table-column table:style-name="Таблица37.A"/><table:table-column table:style-name="Таблица37.B"/><table:table-column table:style-name="Таблица37.C"/><table:table-column table:style-name="Таблица37.D"/><table:table-header-rows>
							<table:table-row table:style-name="Таблица37.1">
								<table:table-cell table:style-name="Таблица37.A1" office:value-type="string">
									<text:p text:style-name="P9">1</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица37.B1" office:value-type="string">
									<text:p text:style-name="P9">2</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица37.B1" office:value-type="string">
									<text:p text:style-name="P9">3</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица37.D1" office:value-type="string">
									<text:p text:style-name="P9">4</text:p>
								</table:table-cell>
							</table:table-row>
						</table:table-header-rows><!--row-code-->
<xsl:for-each select="/.//SubParcels/FormSubParcel | /.//NewSubParcel"><table:table-row table:style-name="Таблица37.3">
							<table:table-cell table:style-name="Таблица37.A3" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="position()"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица37.B3" office:value-type="string">
								<text:p text:style-name="P48">
									<text:span text:style-name="User_20_Entry">
										<text:s text:c="4"/>
									</text:span>
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="../../CadastralNumber | ../../@Definition | CadastralNumber_Parcel"/>
</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица37.C3" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="@Definition"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица37.D3" office:value-type="string">
								<text:p text:style-name="P103">
									<text:span text:style-name="User_20_Entry">Mt=√ (m</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T43">0</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T44">2</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry"> + m</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T43">1</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T44">2</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry"> )</text:span>
								</text:p>
								<text:p text:style-name="P103">
									<text:span text:style-name="User_20_Entry">Mt=√ (</text:span>
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_m"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T44">2</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry"> + </text:span>
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_m"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T44">2</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry"> ) = </text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T49"><xsl:value-of select="format-number( number(/.//*[1]/*/@Delta_Geopoint),'#0.00')"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T49"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:for-each>
<xsl:if test="not(/.//SubParcels/FormSubParcel | /.//NewSubParcel)"><table:table-row table:style-name="Таблица37.3">
							<table:table-cell table:style-name="Таблица37.A5" office:value-type="string">
								<text:p text:style-name="P35">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица37.B5" office:value-type="string">
								<text:p text:style-name="P35">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица37.C5" office:value-type="string">
								<text:p text:style-name="P35">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица37.D5" office:value-type="string">
								<text:p text:style-name="P35">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code--></xsl:if></table:table><table:table table:name="Таблица38" table:style-name="Таблица38">
						<table:table-column table:style-name="Таблица38.A"/>
						<table:table-column table:style-name="Таблица38.B"/>
						<table:table-column table:style-name="Таблица38.C"/>
						<table:table-column table:style-name="Таблица38.D"/>
						<table:table-row table:style-name="Таблица38.1">
							<table:table-cell table:style-name="Таблица38.A1" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="P9">4. Точность определения площади земельных участков</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица38.2">
							<table:table-cell table:style-name="Таблица38.A2" office:value-type="string">
								<text:p text:style-name="P9">№ п/п</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица38.B2" office:value-type="string">
								<text:p text:style-name="P9">Кадастровый номер или обозначение</text:p>
								<text:p text:style-name="P9">земельного участка</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица38.B2" office:value-type="string">
								<text:p text:style-name="P8"/>
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Площадь (Р), м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T22">2</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
								<text:p text:style-name="P9"/>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица38.D2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Формулы, примененные для расчета предельно допустимой погрешности определения площади земельного участка (∆Р), <text:s/>м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T22">2</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table><table:table table:name="Таблица39" table:style-name="Таблица39"><table:table-column table:style-name="Таблица39.A"/><table:table-column table:style-name="Таблица39.B"/><table:table-column table:style-name="Таблица39.C"/><table:table-column table:style-name="Таблица39.D"/><table:table-header-rows>
							<table:table-row table:style-name="Таблица39.1">
								<table:table-cell table:style-name="Таблица39.A1" office:value-type="string">
									<text:p text:style-name="P9">1</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица39.B1" office:value-type="string">
									<text:p text:style-name="P9">2</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица39.B1" office:value-type="string">
									<text:p text:style-name="P9">3</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица39.D1" office:value-type="string">
									<text:p text:style-name="P9">4</text:p>
								</table:table-cell>
							</table:table-row>
						</table:table-header-rows><!--row-code-->
<xsl:for-each select="STD_MP/Package/FormParcels/NewParcel | STD_MP/Package/FormParcels/ChangeParcel | STD_MP/Package/SpecifyParcel/ExistParcel |
STD_MP/Package/SpecifyParcel/ExistEZ/ExistEZParcels |
STD_MP/Package/SpecifyParcel/ExistEZ/ExistEZParcels/Composition_EZ/InsertEntryParcels/InsertEntryParcel/ExistEntryParcel |
STD_MP/Package/SpecifyParcel/ExistEZ/ExistEZParcels/Composition_EZ/InsertEntryParcels/InsertEntryParcel/NewEntryParcel |
STD_MP/Package/SpecifyParcel/ExistEZ/ExistEZEntryParcels/ExistEZEntryParcel |
STD_MP/Package/SpecifyParcelsApproximal/ExistParcel |
STD_MP/Package/SpecifyParcelsApproximal/ExistEZ/ExistEZParcels"><table:table-row table:style-name="Таблица39.1">
							<table:table-cell table:style-name="Таблица39.A3" office:value-type="string">
								<text:p text:style-name="P48">
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="position()"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица39.B3" office:value-type="string">
								<text:p text:style-name="P52">
									<text:span text:style-name="User_20_Entry">
										<text:s text:c="4"/>
									</text:span>
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="@CadastralNumber | @Definition"/></text:span>
									<text:span text:style-name="User_20_Entry">
										<text:s/>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица39.B3" office:value-type="string">
								<text:p text:style-name="P48">
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="Area/Area"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица39.D3" office:value-type="string">
								<text:p text:style-name="P6">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T37">∆Р </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T38">= 3.5 * </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T38"><xsl:value-of select="format-number(/.//*[1]/*/@Delta_Geopoint,'#0.00')"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T38"><text:s/>* </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T45">√ <text:s/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T45"><xsl:value-of select="Area/Area"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T45">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T46">=</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T25">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T25"><xsl:value-of select="Area/Innccuracy"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T25">
											<text:s/>
										</text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:for-each>
<xsl:if test="not(STD_MP/Package/FormParcels/NewParcel | STD_MP/Package/FormParcels/ChangeParcel | STD_MP/Package/SpecifyParcel/ExistParcel |
STD_MP/Package/SpecifyParcel/ExistEZ/ExistEZParcels |
STD_MP/Package/SpecifyParcel/ExistEZ/ExistEZParcels/Composition_EZ/InsertEntryParcels/InsertEntryParcel/ExistEntryParcel |
STD_MP/Package/SpecifyParcel/ExistEZ/ExistEZParcels/Composition_EZ/InsertEntryParcels/InsertEntryParcel/NewEntryParcel |
STD_MP/Package/SpecifyParcel/ExistEZ/ExistEZEntryParcels/ExistEZEntryParcel |
STD_MP/Package/SpecifyParcelsApproximal/ExistParcel |
STD_MP/Package/SpecifyParcelsApproximal/ExistEZ/ExistEZParcels)"><table:table-row table:style-name="Таблица39.1">
							<table:table-cell table:style-name="Таблица39.A5" office:value-type="string">
								<text:p text:style-name="P30">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица39.B5" office:value-type="string">
								<text:p text:style-name="P30">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица39.B5" office:value-type="string">
								<text:p text:style-name="P30">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица39.D5" office:value-type="string">
								<text:p text:style-name="P30">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code--></xsl:if></table:table><table:table table:name="Таблица40" table:style-name="Таблица40">
						<table:table-column table:style-name="Таблица40.A"/>
						<table:table-column table:style-name="Таблица40.B"/>
						<table:table-column table:style-name="Таблица40.C"/>
						<table:table-column table:style-name="Таблица40.D"/>
						<table:table-column table:style-name="Таблица40.E"/>
						<table:table-row table:style-name="Таблица40.1">
							<table:table-cell table:style-name="Таблица40.A1" table:number-columns-spanned="5" office:value-type="string">
								<text:p text:style-name="P9">5. Точность определения площади частей земельных участков</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица40.2">
							<table:table-cell table:style-name="Таблица40.A2" office:value-type="string">
								<text:p text:style-name="P9">№ п/п</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица40.B2" office:value-type="string">
								<text:p text:style-name="P9">Кадастровый номер или обозначение</text:p>
								<text:p text:style-name="P9">земельного участка</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица40.B2" office:value-type="string">
								<text:p text:style-name="P9">Учетный номер или обозначение части</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица40.B2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Площадь (Р), м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T22">2</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
								<text:p text:style-name="P9"/>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица40.E2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Формулы, примененные для расчета предельно допустимой погрешности определения площади части <text:s/>земельного участка (∆Р), <text:s/>м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T22">2</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table><table:table table:name="Таблица41" table:style-name="Таблица41"><table:table-column table:style-name="Таблица41.A"/><table:table-column table:style-name="Таблица41.B"/><table:table-column table:style-name="Таблица41.C"/><table:table-column table:style-name="Таблица41.D"/><table:table-column table:style-name="Таблица41.E"/><table:table-header-rows>
							<table:table-row table:style-name="Таблица41.1">
								<table:table-cell table:style-name="Таблица41.A1" office:value-type="string">
									<text:p text:style-name="P9">1</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица41.B1" office:value-type="string">
									<text:p text:style-name="P9">2</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица41.B1" office:value-type="string">
									<text:p text:style-name="P9">3</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица41.B1" office:value-type="string">
									<text:p text:style-name="P9">4</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица41.E1" office:value-type="string">
									<text:p text:style-name="P9">5</text:p>
								</table:table-cell>
							</table:table-row>
						</table:table-header-rows><!--row-code-->
<xsl:for-each select="/.//SubParcels/FormSubParcel | /.//NewSubParcel"><table:table-row table:style-name="Таблица41.1">
							<table:table-cell table:style-name="Таблица41.A3" office:value-type="string">
								<text:p text:style-name="P48">
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="position()"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица41.B3" office:value-type="string">
								<text:p text:style-name="P50">
									<text:span text:style-name="User_20_Entry">
										<text:s text:c="4"/>
									</text:span>
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="../../@CadastralNumber | ../../@Definition | CadastralNumber_Parcel"/></text:span>
									<text:span text:style-name="User_20_Entry">
										<text:s/>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица41.B3" office:value-type="string">
								<text:p text:style-name="P48">
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="@Definition"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица41.B3" office:value-type="string">
								<text:p text:style-name="P48">
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="Area/Area"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица41.E3" office:value-type="string">
								<text:p text:style-name="P51">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T40">∆Р </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T39">= 3.5 * </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T39"><xsl:value-of select="format-number(/.//*[1]/*/@Delta_Geopoint,'#0.00')"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T39"><text:s/>* </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T47">√ <text:s/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T47"><xsl:value-of select="Area/Area"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T47">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T48">=</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T41">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T41"><xsl:value-of select="Area/Innccuracy"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T41">
											<text:s/>
										</text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:for-each>
<xsl:if test="not(/.//SubParcels/FormSubParcel | /.//NewSubParcel)"><table:table-row table:style-name="Таблица41.1">
							<table:table-cell table:style-name="Таблица41.A5" office:value-type="string">
								<text:p text:style-name="P31">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица41.B5" office:value-type="string">
								<text:p text:style-name="P31">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица41.B5" office:value-type="string">
								<text:p text:style-name="P31">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица41.B5" office:value-type="string">
								<text:p text:style-name="P31">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица41.E5" office:value-type="string">
								<text:p text:style-name="P31">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:if></table:table><xsl:if test="/.//NewParcel"><table:table table:name="Таблица22" table:style-name="Таблица22">
						<table:table-column table:style-name="Таблица22.A"/>
						<table:table-row table:style-name="Таблица22.1">
							<table:table-cell table:style-name="Таблица22.A1" office:value-type="string">
								<text:p text:style-name="P85"><text:bookmark-start text:name="Оглавление_ОбразуемыеУчастки"/>Сведения об образуемых земельных участках и их частях<text:bookmark-end text:name="Оглавление_ОбразуемыеУчастки"/></text:p>
							</table:table-cell>
						</table:table-row>
					</table:table>	<!--row-code-->
		<xsl:for-each select="/.//NewParcel | /STD_MP[not(/.//NewParcel)]">
<table:table table:name="Таблица15" table:style-name="Таблица15">
						<table:table-column table:style-name="Таблица15.A"/>
						<table:table-column table:style-name="Таблица15.B"/>
						<table:table-column table:style-name="Таблица15.C"/>
						<table:table-column table:style-name="Таблица15.D"/>
						<table:table-column table:style-name="Таблица15.E"/>
						<table:table-row table:style-name="Таблица15.1">
							<table:table-cell table:style-name="Таблица15.A1" table:number-columns-spanned="5" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">1. Сведения о характерных точках границ образуемых земельных участков</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица15.1">
							<table:table-cell table:style-name="Таблица15.A2" table:number-columns-spanned="5" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Обозначение земельного участка </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T2">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2"><xsl:call-template name="get_value"><xsl:with-param name="p_name">Definition</xsl:with-param></xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица15.3">
							<table:table-cell table:style-name="Таблица15.A3" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P9">Обозначение характерных точек границы</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица15.B3" table:number-columns-spanned="2" office:value-type="string">
								<text:p text:style-name="P15">Координаты, м</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица15.B3" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Средняя квадратическая погрешность положения характерной точки (М</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">t</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">), м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица15.E3" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P9">Описание закрепления точки</text:p>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица15.4">
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица15.B3" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T6">X</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица15.B3" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T6">Y</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
					</table:table><table:table table:name="Таблица12" table:style-name="Таблица12"><table:table-column table:style-name="Таблица12.A"/><table:table-column table:style-name="Таблица12.B"/><table:table-column table:style-name="Таблица12.C"/><table:table-column table:style-name="Таблица12.D"/><table:table-column table:style-name="Таблица12.E"/><table:table-header-rows>
							<table:table-row table:style-name="Таблица12.1">
								<table:table-cell table:style-name="Таблица12.A1" office:value-type="string">
									<text:p text:style-name="P9">1</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица12.B1" office:value-type="string">
									<text:p text:style-name="P9">2</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица12.B1" office:value-type="string">
									<text:p text:style-name="P9">3</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица12.B1" office:value-type="string">
									<text:p text:style-name="P9">4</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица12.E1" office:value-type="string">
									<text:p text:style-name="P9">5</text:p>
								</table:table-cell>
							</table:table-row>
						</table:table-header-rows><!--row-code-->
			<xsl:for-each select="Contours/NewContour/Entity_Spatial | Entity_Spatial">
				<xsl:if test="(ancestor::NewContour)"><table:table-row table:style-name="Таблица12.1">
							<table:table-cell table:style-name="Таблица12.A2" table:number-columns-spanned="5" office:value-type="string">
								<text:p text:style-name="P26">
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="ancestor::NewContour/@Definition"/> </text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row><!--row-code-->
				</xsl:if>
				<xsl:for-each select="Spatial_Element | /STD_MP[not(/.//NewParcel)]">
<xsl:variable name="v_element_pos" select="number(1.5 - position())"/>
					<xsl:for-each select="Spelement_Unit/NewOrdinate  | /STD_MP[not(/.//NewParcel)]">
<xsl:sort select="$v_element_pos*position()" data-type="number" order="descending"/>
<table:table-row table:style-name="Таблица12.5">
							<table:table-cell table:style-name="Таблица12.A5" office:value-type="float" office:value="0">
								<text:p text:style-name="P72">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="point_name"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица12.B5" office:value-type="float" office:value="0">
								<text:p text:style-name="P53">
									<text:span text:style-name="User_20_Entry"><xsl:if test="@X">
<xsl:value-of select="format-number(@X,'#0.00')"/>
</xsl:if>
<xsl:if test="not(@X)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица12.C5" office:value-type="float" office:value="0">
								<text:p text:style-name="P53">
									<text:span text:style-name="User_20_Entry"><xsl:if test="@Y">
<xsl:value-of select="format-number(@Y,'#0.00')"/>
</xsl:if>
<xsl:if test="not(@Y)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица12.D5" office:value-type="float" office:value="0">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_value"><xsl:with-param name="p_name">Delta_Geopoint</xsl:with-param></xsl:call-template></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица12.E5" office:value-type="float" office:value="0">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_dict">
<xsl:with-param name="p_code">
<xsl:value-of select="@Geopoint_Zacrep"/>
</xsl:with-param>
</xsl:call-template></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:for-each>	
<xsl:if test="position() != last()"><table:table-row table:style-name="Таблица12.5">
							<table:table-cell table:style-name="Таблица12.A2" table:number-columns-spanned="5" office:value-type="string">
								<text:p text:style-name="P72">
									<text:span text:style-name="User_20_Entry"/>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row><!--row-code-->						
					</xsl:if>
				</xsl:for-each>
			</xsl:for-each>
	
<!--row-code-->
<xsl:if test="not(/.//NewParcel)"><table:table-row table:style-name="Таблица12.5">
							<table:table-cell table:style-name="Таблица12.A10" office:value-type="string">
								<text:p text:style-name="P74">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T15">-</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица12.B10" office:value-type="string">
								<text:p text:style-name="P80">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица12.B10" office:value-type="string">
								<text:p text:style-name="P80">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица12.B10" office:value-type="string">
								<text:p text:style-name="P80">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица12.E10" office:value-type="string">
								<text:p text:style-name="P80">-</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:if></table:table><!--/xsl:for-each-->				<table:table table:name="Таблица14" table:style-name="Таблица14">
						<table:table-column table:style-name="Таблица14.A"/>
						<table:table-row table:style-name="Таблица14.1">
							<table:table-cell table:style-name="Таблица14.A1" office:value-type="string">
								<text:p text:style-name="P88">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">2. Сведения о частях границ образуемых земельных участков</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table><!--row-code-->
	<!--xsl:for-each select="/.//NewParcel | /STD_MP[not(/.//NewParcel)]"--><table:table table:name="Таблица16" table:style-name="Таблица16">
						<table:table-column table:style-name="Таблица16.A"/>
						<table:table-column table:style-name="Таблица16.B"/>
						<table:table-column table:style-name="Таблица16.C"/>
						<table:table-column table:style-name="Таблица16.D"/>
						<table:table-row table:style-name="Таблица16.1">
							<table:table-cell table:style-name="Таблица16.A1" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Обозначение земельного участка </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2"><xsl:if test="@Definition">
<xsl:value-of select="@Definition"/>
</xsl:if>
<xsl:if test="not(@Definition)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица16.2">
							<table:table-cell table:style-name="Таблица16.A2" table:number-columns-spanned="2" office:value-type="string">
								<text:p text:style-name="P9">Обозначение части границы</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица16.C2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Горизонтальное проложение <text:s text:c="5"/>( <text:s/></text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T6">S</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2"><text:s/>) , м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица16.D2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P9">Описание прохождения части границы</text:p>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица16.3">
							<table:table-cell table:style-name="Таблица16.A3" office:value-type="string">
								<text:p text:style-name="P9">от т.</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица16.B3" office:value-type="string">
								<text:p text:style-name="P9">до т.</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
					</table:table><table:table table:name="Таблица13" table:style-name="Таблица13"><table:table-column table:style-name="Таблица13.A"/><table:table-column table:style-name="Таблица13.B"/><table:table-column table:style-name="Таблица13.C"/><table:table-column table:style-name="Таблица13.D"/><table:table-header-rows>
							<table:table-row table:style-name="Таблица13.1">
								<table:table-cell table:style-name="Таблица13.A1" office:value-type="string">
									<text:p text:style-name="P9">1</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица13.B1" office:value-type="string">
									<text:p text:style-name="P9">2</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица13.B1" office:value-type="string">
									<text:p text:style-name="P9">3</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица13.D1" office:value-type="string">
									<text:p text:style-name="P9">4</text:p>
								</table:table-cell>
							</table:table-row>
						</table:table-header-rows><!--row-code-->
		<xsl:for-each select="Contours/NewContour/Entity_Spatial | Entity_Spatial  | /STD_MP[not(/.//NewParcel)]">
			<xsl:if test="(ancestor::NewContour)"><table:table-row table:style-name="Таблица13.1">
							<table:table-cell table:style-name="Таблица13.A2" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="P8">
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="ancestor::NewContour/@Definition"/> </text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row><!--row-code-->
</xsl:if>
<xsl:for-each select="Borders/Border | /STD_MP[not(/.//NewParcel)]">
<xsl:sort select="(1.5 - @Spatial)*position()" data-type="number" order="descending"/>
<xsl:variable name="curr_spatial" select="./@Spatial"/>
<table:table-row table:style-name="Таблица13.1">
							<table:table-cell table:style-name="Таблица13.A5" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="border_point_name"><xsl:with-param name="p1">1</xsl:with-param></xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица13.B5" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="border_point_name"><xsl:with-param name="p2">1</xsl:with-param></xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица13.B5" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:for-each select="Edge | /STD_MP[not(/.//NewParcel)]">
<xsl:call-template name="get_value"><xsl:with-param name="p_name">Length</xsl:with-param></xsl:call-template>	
</xsl:for-each>		</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s/>
										</text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица13.D5" office:value-type="string">
								<text:p text:style-name="P28">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:for-each select="Edge | /STD_MP[not(/.//NewParcel)]">
<xsl:call-template name="get_value"><xsl:with-param name="p_name">Definition</xsl:with-param></xsl:call-template>									
</xsl:for-each>					</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->		
<xsl:if test="(((($curr_spatial=1) and (count(preceding-sibling::*[@Spatial=$curr_spatial]) = 0)) or (($curr_spatial!=1) and (count(following-sibling::*[@Spatial=$curr_spatial]) = 0)))) and 
((count(preceding-sibling::*[@Spatial = $curr_spatial+1]) +
count(following-sibling::*[@Spatial = $curr_spatial+1]) ) >0)
">

<table:table-row table:style-name="Таблица13.1">
							<table:table-cell table:style-name="Таблица13.A2" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="P49">
									<text:span text:style-name="User_20_Entry"/>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row><!--row-code-->
	</xsl:if>
		</xsl:for-each>
	</xsl:for-each></table:table>	<!--/xsl:for-each-->			<table:table table:name="Таблица19" table:style-name="Таблица19">
						<table:table-column table:style-name="Таблица19.A"/>
						<table:table-row table:style-name="Таблица19.1">
							<table:table-cell table:style-name="Таблица19.A1" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">3. Сведения о местоположении границ частей образуемых земельных участков</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table><!--xsl:for-each select="/.//NewParcel[SubParcels] | /STD_MP[not(/.//NewParcel[SubParcels])]"--><table:table table:name="Таблица43" table:style-name="Таблица43">
						<table:table-column table:style-name="Таблица43.A"/>
						<table:table-row table:style-name="Таблица43.1">
							<table:table-cell table:style-name="Таблица43.A1" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Обозначение земельного участка</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:value-of select="@Definition"/>
<xsl:if test="not(@Definition)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T27">
											<text:s text:c="2"/>
										</text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table><xsl:for-each select="SubParcels/FormSubParcel | /STD_MP[not(/.//NewParcel[SubParcels])]"><table:table table:name="Таблица53" table:style-name="Таблица53">
						<table:table-column table:style-name="Таблица53.A"/>
						<table:table-column table:style-name="Таблица53.B"/>
						<table:table-column table:style-name="Таблица53.C"/>
						<table:table-column table:style-name="Таблица53.D"/>
						<table:table-column table:style-name="Таблица53.E"/>
						<table:table-row table:style-name="Таблица53.1">
							<table:table-cell table:style-name="Таблица53.A1" table:number-columns-spanned="5" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Учетный номер или обозначение части</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2"><xsl:value-of select="@Definition"/>
<xsl:if test="not(@Definition)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица53.2">
							<table:table-cell table:style-name="Таблица53.A2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P9">Обозначение характерных точек границы</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица53.B2" table:number-columns-spanned="2" office:value-type="string">
								<text:p text:style-name="P9">Координаты, м</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица53.B2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Средняя квадратическая погрешность положения характерной точки <text:s/>(М</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">t</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">), м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица53.E2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P9">Описание закрепления точки</text:p>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица53.3">
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица53.B2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T6">X</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица53.B2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T6">Y</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
					</table:table><table:table table:name="Таблица54" table:style-name="Таблица54"><table:table-column table:style-name="Таблица54.A"/><table:table-column table:style-name="Таблица54.B"/><table:table-column table:style-name="Таблица54.C"/><table:table-column table:style-name="Таблица54.D"/><table:table-column table:style-name="Таблица54.E"/><table:table-header-rows>
							<table:table-row table:style-name="Таблица54.1">
								<table:table-cell table:style-name="Таблица54.A1" office:value-type="string">
									<text:p text:style-name="P9">1</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица54.B1" office:value-type="string">
									<text:p text:style-name="P9">2</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица54.B1" office:value-type="string">
									<text:p text:style-name="P9">3</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица54.B1" office:value-type="string">
									<text:p text:style-name="P9">4</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица54.E1" office:value-type="string">
									<text:p text:style-name="P9">5</text:p>
								</table:table-cell>
							</table:table-row>
						</table:table-header-rows><!--row-code-->
<xsl:for-each select="Entity_Spatial/Spatial_Element">
<xsl:for-each select="Spelement_Unit/NewOrdinate | /STD_MP[not(/.//NewParcel[SubParcels])]"><table:table-row table:style-name="Таблица54.3">
							<table:table-cell table:style-name="Таблица54.A3" office:value-type="float" office:value="0">
								<text:p text:style-name="P72">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="point_name"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица54.B3" office:value-type="float" office:value="0">
								<text:p text:style-name="P53">
									<text:span text:style-name="User_20_Entry"><xsl:if test="@X">
<xsl:value-of select="format-number(@X,'#0.00')"/>
</xsl:if>
<xsl:if test="not(@X)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица54.C3" office:value-type="float" office:value="0">
								<text:p text:style-name="P53">
									<text:span text:style-name="User_20_Entry"><xsl:if test="@Y">
<xsl:value-of select="format-number(@Y,'#0.00')"/>
</xsl:if>
<xsl:if test="not(@Y)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица54.D3" office:value-type="float" office:value="0">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="@Delta_Geopoint"/>
<xsl:if test="not(@Delta_Geopoint)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица54.E3" office:value-type="float" office:value="0">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_dict">
<xsl:with-param name="p_code">
<xsl:value-of select="@Geopoint_Zacrep"/>
</xsl:with-param>
</xsl:call-template></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:for-each>
<xsl:if test="position() != last()">
<table:table-row table:style-name="Таблица54.3">
							<table:table-cell table:style-name="Таблица54.A5" table:number-columns-spanned="5" office:value-type="string">
								<text:p text:style-name="P73">
									<text:span text:style-name="User_20_Entry"/>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row><!--row-code-->
</xsl:if>
</xsl:for-each>
<xsl:if test=" /STD_MP[not(/.//NewParcel[SubParcels])]">


<text:soft-page-break/><table:table-row table:style-name="Таблица54.3">
							<table:table-cell table:style-name="Таблица54.A7" office:value-type="string">
								<text:p text:style-name="P105">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица54.B7" office:value-type="string">
								<text:p text:style-name="P105">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица54.C7" office:value-type="string">
								<text:p text:style-name="P105">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица54.D7" office:value-type="string">
								<text:p text:style-name="P105">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица54.E7" office:value-type="string">
								<text:p text:style-name="P105">-</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:if></table:table>	</xsl:for-each>
	<!--/xsl:for-each--><table:table table:name="Таблица18" table:style-name="Таблица18"><table:table-column table:style-name="Таблица18.A"/><table:table-column table:style-name="Таблица18.B"/><table:table-column table:style-name="Таблица18.C"/><table:table-row table:style-name="Таблица18.1">
							<table:table-cell table:style-name="Таблица18.A1" table:number-columns-spanned="3" office:value-type="string">
								<text:p text:style-name="P9">4. Общие сведения об образуемых земельных участках</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row><!--row-code-->
<!--xsl:for-each select="/.//NewParcel | /STD_MP[not(/.//NewParcel)]"--><table:table-row table:style-name="Таблица18.3">
							<table:table-cell table:style-name="Таблица18.A2" table:number-columns-spanned="3" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Обозначение земельного участка</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s text:c="3"/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:value-of select="@Definition"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s/>
										</text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row><table:table-row table:style-name="Таблица18.4">
							<table:table-cell table:style-name="Таблица18.A4" office:value-type="string">
								<text:p text:style-name="P9">№ п/п</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица18.B4" office:value-type="string">
								<text:p text:style-name="P9">Наименование характеристик земельного участка</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица18.C4" office:value-type="string">
								<text:p text:style-name="P9">Значение характеристики</text:p>
							</table:table-cell>
						</table:table-row><table:table-row table:style-name="Таблица18.5">
							<table:table-cell table:style-name="Таблица18.A4" office:value-type="string">
								<text:p text:style-name="P9">1</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица18.B4" office:value-type="string">
								<text:p text:style-name="P9">2</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица18.C4" office:value-type="string">
								<text:p text:style-name="P9">3</text:p>
							</table:table-cell>
						</table:table-row><table:table-row table:style-name="Таблица18.6">
							<table:table-cell table:style-name="Таблица18.A4" office:value-type="string">
								<text:p text:style-name="P1">1</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица18.B4" office:value-type="string">
								<text:p text:style-name="Обычный">Адрес земельного участка или его местоположение</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица18.C4" office:value-type="string">
								<text:p text:style-name="P1"><xsl:for-each select="Location">
	<xsl:call-template name="mp_address"/>
</xsl:for-each></text:p>
							</table:table-cell>
						</table:table-row><table:table-row table:style-name="Таблица18.6">
							<table:table-cell table:style-name="Таблица18.A4" office:value-type="string">
								<text:p text:style-name="P1">2</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица18.B4" office:value-type="string">
								<text:p text:style-name="Обычный">Категория земель</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица18.C4" office:value-type="string">
								<text:p text:style-name="P1"><xsl:call-template name="get_dict">
<xsl:with-param name="p_code">
<xsl:value-of select="Category/@Category"/>
</xsl:with-param>
</xsl:call-template></text:p>
							</table:table-cell>
						</table:table-row><table:table-row table:style-name="Таблица18.6">
							<table:table-cell table:style-name="Таблица18.A4" office:value-type="string">
								<text:p text:style-name="P1">3</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица18.B4" office:value-type="string">
								<text:p text:style-name="Обычный">Вид разрешенного использования</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица18.C4" office:value-type="string">
								<text:p text:style-name="P1"><xsl:value-of select="Utilization/@ByDoc"/></text:p>
							</table:table-cell>
						</table:table-row><table:table-row table:style-name="Таблица18.6">
							<table:table-cell table:style-name="Таблица18.A4" office:value-type="string">
								<text:p text:style-name="P1">4</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица18.B4" office:value-type="string">
								<text:p text:style-name="Обычный">Площадь земельного <text:s/>участка ± величина погрешности определения площади <text:s text:c="2"/><text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">(Р±∆Р), м</text:span>
									</text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span><text:s text:c="2"/><text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T22">2</text:span>
									</text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span></text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица18.C4" office:value-type="string">
								<text:p text:style-name="P1"><xsl:value-of select="Area/Area"/>
<xsl:value-of select="'±'"/>
<xsl:value-of select="Area/Innccuracy"/>
<xsl:value-of select="'м2'"/>
<xsl:for-each select="SubParcels/SubParcel">
<xsl:value-of select="@Definition"/>
<xsl:value-of select="Area/Area"/>
<xsl:value-of select="'±'"/>
<xsl:value-of select="Area/Innccuracy"/>
<xsl:value-of select="'м2'"/>
<xsl:value-of select="$crlf"/>
</xsl:for-each>
<xsl:for-each select="Contours/NewContour">
<xsl:value-of select="@Definition"/>
<xsl:value-of select="Area/Area"/>
<xsl:value-of select="'±'"/>
<xsl:value-of select="Area/Innccuracy"/>
<xsl:value-of select="'м2'"/>
<xsl:value-of select="$crlf"/>
</xsl:for-each></text:p>
							</table:table-cell>
						</table:table-row><table:table-row table:style-name="Таблица18.6">
							<table:table-cell table:style-name="Таблица18.A4" office:value-type="string">
								<text:p text:style-name="P1">5</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица18.B10" office:value-type="string">
								<text:p text:style-name="Обычный">Предельный минимальный и максимальный размер земельного участка<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2"><text:s text:c="2"/>(Рмин и Рмакс), м</text:span>
									</text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span><text:s text:c="2"/><text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T22">2</text:span>
									</text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span></text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица18.C4" office:value-type="string">
								<text:p text:style-name="P20"><xsl:if test="Min_Area">
<xsl:value-of select="Min_Area/Area"/>
<xsl:text> </xsl:text>
<!--xsl:value-of select="'м2'"/-->
<xsl:text>    </xsl:text>
<xsl:if test="not(Min_Area)">-</xsl:if>
<xsl:value-of select="Max_Area/Area"/>
<xsl:text> </xsl:text>
<!--xsl:value-of select="'м2'"/-->
</xsl:if>
<xsl:if test="not(Max_Area)">-</xsl:if>


</text:p>
							</table:table-cell>
						</table:table-row><table:table-row table:style-name="Таблица18.6">
							<table:table-cell table:style-name="Таблица18.A4" office:value-type="string">
								<text:p text:style-name="P1">6</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица18.B11" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T20">Кадастровые или иные номера зданий, сооружений, объектов незавершенного строительства, расположенных на земельном участке</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица18.C4" office:value-type="string">
								<text:p text:style-name="P9"><xsl:for-each select="Inner_CadastralNumbers/CadastralNumber">
<xsl:value-of select="."/>
<xsl:value-of select="' '"/>
</xsl:for-each>
<xsl:if test="not(Inner_CadastralNumbers/CadastralNumber)">
<xsl:value-of select="'-'"/>
</xsl:if>
</text:p>
							</table:table-cell>
						</table:table-row><table:table-row table:style-name="Таблица18.6">
							<table:table-cell table:style-name="Таблица18.A4" office:value-type="string">
								<text:p text:style-name="P1">7</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица18.B4" office:value-type="string">
								<text:p text:style-name="Обычный">Иные сведения</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица18.C4" office:value-type="string">
								<text:p text:style-name="P27">-</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
<!--/xsl:for-each-->
</table:table><table:table table:name="Таблица55" table:style-name="Таблица55">
						<table:table-column table:style-name="Таблица55.A"/>
						<table:table-row table:style-name="Таблица55.1">
							<table:table-cell table:style-name="Таблица55.A1" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">5. Общие сведения о частях образуемых земельных участков</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table><!--xsl:for-each select="/.//NewParcel | /STD_MP[not(/.//NewParcel)]"--><table:table table:name="Таблица56" table:style-name="Таблица56">
						<table:table-column table:style-name="Таблица56.A"/>
						<table:table-column table:style-name="Таблица56.B"/>
						<table:table-column table:style-name="Таблица56.C"/>
						<table:table-column table:style-name="Таблица56.D"/>
						<table:table-column table:style-name="Таблица56.E"/>
						<table:table-row table:style-name="Таблица56.1">
							<table:table-cell table:style-name="Таблица56.A1" table:number-columns-spanned="5" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Обозначение земельного участка <text:s text:c="2"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T27">
											<text:s text:c="3"/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T27"><xsl:value-of select="@Definition"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T27"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица56.2">
							<table:table-cell table:style-name="Таблица56.A2" office:value-type="string">
								<text:p text:style-name="P9">№ п/п</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица56.B2" office:value-type="string">
								<text:p text:style-name="P9">Учетный номер или обозначение части</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица56.B2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Площадь (Р), м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T22">2</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
								<text:p text:style-name="P9"/>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица56.B2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">±∆Р, м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T22">2</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица56.E2" office:value-type="string">
								<text:p text:style-name="P9">Характеристика части</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table><table:table table:name="Таблица57" table:style-name="Таблица57"><table:table-column table:style-name="Таблица57.A"/><table:table-column table:style-name="Таблица57.B"/><table:table-column table:style-name="Таблица57.C"/><table:table-column table:style-name="Таблица57.D"/><table:table-column table:style-name="Таблица57.E"/><table:table-row table:style-name="Таблица57.1">
							<table:table-cell table:style-name="Таблица57.A1" office:value-type="string">
								<text:p text:style-name="P9">1</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица57.B1" office:value-type="string">
								<text:p text:style-name="P9">2</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица57.B1" office:value-type="string">
								<text:p text:style-name="P9">3</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица57.B1" office:value-type="string">
								<text:p text:style-name="P9">4</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица57.E1" office:value-type="string">
								<text:p text:style-name="P9">5</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
<xsl:for-each select="SubParcels/FormSubParcel | /STD_MP[not(/.//NewParcel[SubParcels])]"><table:table-row table:style-name="Таблица57.1">
							<table:table-cell table:style-name="Таблица57.A3" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:if test="../FormSubParcel">
<xsl:value-of select="position()"/>
</xsl:if>
<xsl:if test="not(../FormSubParcel)">
<xsl:value-of select="'-'"/>
</xsl:if>
</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица57.B3" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:if test="../FormSubParcel">
<xsl:value-of select="@Definition"/>
</xsl:if>
<xsl:if test="not(../FormSubParcel)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица57.B3" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:value-of select="Area/Area"/>
<xsl:if test="not(Area/Area)">
  <xsl:value-of select="'-'"/>
</xsl:if></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица57.B3" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:if test="../FormSubParcel">
<xsl:value-of select="Area/Innccuracy"/>
</xsl:if>
<xsl:if test="not(../FormSubParcel)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица57.E3" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:if test="../FormSubParcel">
<xsl:value-of select="Encumbrance/Name"/>
</xsl:if>
<xsl:if test="not(../FormSubParcel)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:for-each>


</table:table><xsl:if test="following-sibling::NewParcel"><text:p text:style-name="P104"/><text:p text:style-name="P87"/></xsl:if>
</xsl:for-each></xsl:if><xsl:if test="/.//ExistEZParcels/Composition_EZ"><table:table table:name="Таблица31" table:style-name="Таблица31"><table:table-column table:style-name="Таблица31.A"/><table:table-column table:style-name="Таблица31.B"/><table:table-column table:style-name="Таблица31.C"/><table:table-row table:style-name="Таблица31.1">
							<table:table-cell table:style-name="Таблица31.A1" table:number-columns-spanned="3" office:value-type="string">
								<text:p text:style-name="P85"><text:bookmark-start text:name="Оглавление_ИзмененныеУчастки"/>Сведения об измененных земельных участках<text:bookmark-end text:name="Оглавление_ИзмененныеУчастки"/></text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row><table:table-row>
							<table:table-cell table:style-name="Таблица31.A2" table:number-columns-spanned="3" office:value-type="string">
								<text:p text:style-name="P9">1. Общие сведения об измененных земельных участках</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row><!--row-code-->
<xsl:for-each select="/.//ExistEZParcels">

<table:table-row>
							<table:table-cell table:style-name="Таблица31.A4" table:number-columns-spanned="3" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Кадастровый номер земельного участка </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s text:c="2"/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:value-of select="@CadastralNumber"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T27">
											<text:s/>
										</text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row><table:table-row>
							<table:table-cell table:style-name="Таблица31.A5" office:value-type="string">
								<text:p text:style-name="P9">№ п/п</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица31.B5" office:value-type="string">
								<text:p text:style-name="P9">Наименование характеристик земельного участка</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица31.C5" office:value-type="string">
								<text:p text:style-name="P9">Значение характеристики</text:p>
							</table:table-cell>
						</table:table-row><table:table-row>
							<table:table-cell table:style-name="Таблица31.A5" office:value-type="string">
								<text:p text:style-name="P9">1</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица31.B5" office:value-type="string">
								<text:p text:style-name="P9">2</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица31.C5" office:value-type="string">
								<text:p text:style-name="P9">3</text:p>
							</table:table-cell>
						</table:table-row><table:table-row>
							<table:table-cell table:style-name="Таблица31.A5" office:value-type="string">
								<text:p text:style-name="P1">1</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица31.B5" office:value-type="string">
								<text:p text:style-name="Обычный">Кадастровые номера земельных участков, исключаемых из состава измененного земельного участка, представляющего собой единое землепользование</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица31.C5" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry">	<xsl:for-each select="Composition_EZ/DeleteEntryParcels/DeleteEntryParcel/@CadastralNumber">
	<xsl:value-of select="."/>
	<xsl:if test="position() != last()">
		<xsl:value-of select="','"/><xsl:value-of select="$crlf"/>
	</xsl:if>
</xsl:for-each> 

</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><table:table-row>
							<table:table-cell table:style-name="Таблица31.A8" office:value-type="string">
								<text:p text:style-name="P36">2</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица31.B8" office:value-type="string">
								<text:p text:style-name="P55">Кадастровые номера земельных участков, <text:span text:style-name="T32">вкл</text:span>ючаемых <text:span text:style-name="T32">в</text:span> состав измененного земельного участка, представляющего собой единое землепользование</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица31.C8" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry"><xsl:for-each select="Composition_EZ/InsertEntryParcels/InsertEntryParcel/ExistEntryParcel/@CadastralNumber">
	<xsl:value-of select="."/>
	<xsl:if test="position() != last()">
		<xsl:value-of select="','"/><xsl:value-of select="$crlf"/>
	</xsl:if>
</xsl:for-each> 
</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><table:table-row>
							<table:table-cell table:style-name="Таблица31.A5" office:value-type="string">
								<text:p text:style-name="P36">3</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица31.B9" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T20">Кадастровые или иные номера зданий, сооружений, объектов незавершенного строительства, расположенных на земельном участке</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица31.C5" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">	<xsl:for-each select="Inner_CadastralNumbers/CadastralNumber">
	<xsl:value-of select="."/>
	<xsl:if test="position() != last()">
		<xsl:value-of select="','"/><xsl:value-of select="$crlf"/>
	</xsl:if>
</xsl:for-each> 
</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><table:table-row>
							<table:table-cell table:style-name="Таблица31.A5" office:value-type="string">
								<text:p text:style-name="P36">4</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица31.B5" office:value-type="string">
								<text:p text:style-name="Обычный">Иные сведения</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица31.C5" office:value-type="string">
								<text:p text:style-name="P9"/>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:for-each></table:table><text:p text:style-name="Text_20_body"/><!--row-code-->
<xsl:for-each select="STD_MP/Package/SpecifyParcel/ExistEZ/ExistEZParcels">

<table:table table:name="Таблица47" table:style-name="Таблица47">
						<table:table-column table:style-name="Таблица47.A"/>
						<table:table-column table:style-name="Таблица47.B"/>
						<table:table-column table:style-name="Таблица47.C"/>
						<table:table-column table:style-name="Таблица47.D"/>
						<table:table-column table:style-name="Таблица47.C"/>
						<table:table-column table:style-name="Таблица47.F"/>
						<table:table-column table:style-name="Таблица47.G"/>
						<table:table-row table:style-name="Таблица47.1">
							<table:table-cell table:style-name="Таблица47.A1" table:number-columns-spanned="7" office:value-type="string">
								<text:p text:style-name="P71"><text:span text:style-name="T17">2</text:span>. Сведения о характерных точках границы измененн<text:span text:style-name="T36">ого</text:span> земельного участка</text:p>
								<text:p text:style-name="P75">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">с кадастровым номером </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="get_value">
<xsl:with-param name="p_name">CadastralNumber</xsl:with-param> 
</xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s/>
										</text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица47.2">
							<table:table-cell table:style-name="Таблица47.A2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P70">Обозначение характерных точек границы</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица47.B2" table:number-columns-spanned="2" office:value-type="string">
								<text:p text:style-name="P70">Существующие координаты, м</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица47.B2" table:number-columns-spanned="2" office:value-type="string">
								<text:p text:style-name="P70">Уточненные координаты, м</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица47.B2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P75">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Средняя квадратическая погрешность положения характерной точки (М</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">t</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">), м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица47.G2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P70">Описание закрепления точки</text:p>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица47.3">
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица47.B3" office:value-type="string">
								<text:p text:style-name="P77">X</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица47.B3" office:value-type="string">
								<text:p text:style-name="P77">Y</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица47.B3" office:value-type="string">
								<text:p text:style-name="P77">X</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица47.B3" office:value-type="string">
								<text:p text:style-name="P77">Y</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
					</table:table><table:table table:name="Таблица48" table:style-name="Таблица48"><table:table-column table:style-name="Таблица48.A"/><table:table-column table:style-name="Таблица48.B"/><table:table-column table:style-name="Таблица48.C"/><table:table-column table:style-name="Таблица48.D"/><table:table-column table:style-name="Таблица48.C"/><table:table-column table:style-name="Таблица48.F"/><table:table-column table:style-name="Таблица48.G"/><table:table-row table:style-name="Таблица48.1">
							<table:table-cell table:style-name="Таблица48.A1" office:value-type="string">
								<text:p text:style-name="P70">1</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица48.B1" office:value-type="string">
								<text:p text:style-name="P18">2</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица48.B1" office:value-type="string">
								<text:p text:style-name="P18">3</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица48.B1" office:value-type="string">
								<text:p text:style-name="P18">4</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица48.B1" office:value-type="string">
								<text:p text:style-name="P18">5</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица48.B1" office:value-type="string">
								<text:p text:style-name="P18">6</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица48.G1" office:value-type="string">
								<text:p text:style-name="P70">7</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
<xsl:for-each select="Composition_EZ/InsertEntryParcels/InsertEntryParcel/NewEntryParcel"><table:table-row table:style-name="Таблица48.1">
							<table:table-cell table:style-name="Таблица48.A3" table:number-columns-spanned="7" office:value-type="string">
								<text:p text:style-name="P75">
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="@Definition "/>
</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row><!--row-code-->
<xsl:for-each select="Entity_Spatial/Spatial_Element">
<xsl:variable name="v_element_pos" select="number(1.5 - position())"/>
<xsl:for-each select="Spelement_Unit/NewOrdinate">
<xsl:sort select="$v_element_pos*position()" data-type="number" order="descending"/>
<table:table-row table:style-name="Таблица48.1">
							<table:table-cell table:style-name="Таблица48.A5" office:value-type="float" office:value="0">
								<text:p text:style-name="P75">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="point_name"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица48.B5" office:value-type="float" office:value="0">
								<text:p text:style-name="P7">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="point_coord">
	<xsl:with-param name="o">1</xsl:with-param>
    <xsl:with-param name="x">1</xsl:with-param>
</xsl:call-template></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица48.B5" office:value-type="float" office:value="0">
								<text:p text:style-name="P7">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="point_coord">
	<xsl:with-param name="o">1</xsl:with-param>
	<xsl:with-param name="y">1</xsl:with-param>
</xsl:call-template></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица48.B5" office:value-type="float" office:value="0">
								<text:p text:style-name="P54">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="point_coord">
	<xsl:with-param name="n">1</xsl:with-param>
	<xsl:with-param name="x">1</xsl:with-param>
</xsl:call-template></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица48.B5" office:value-type="float" office:value="0">
								<text:p text:style-name="P54">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="point_coord">
	<xsl:with-param name="n">1</xsl:with-param>
	<xsl:with-param name="y">1</xsl:with-param>
</xsl:call-template></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица48.B5" office:value-type="float" office:value="0">
								<text:p text:style-name="P7">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_value">
  <xsl:with-param name="p_name">Delta_Geopoint</xsl:with-param>
</xsl:call-template>	</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица48.G5" office:value-type="float" office:value="0">
								<text:p text:style-name="P75">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_dict">
<xsl:with-param name="p_code">
<xsl:value-of select="@Geopoint_Zacrep"/>
</xsl:with-param>
</xsl:call-template></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->								
</xsl:for-each>
</xsl:for-each>
</xsl:for-each>
<xsl:if test="not(/.//NewEntryParcel)">

<table:table-row table:style-name="Таблица48.1">
							<table:table-cell table:style-name="Таблица48.A7" office:value-type="string">
								<text:p text:style-name="P61">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица48.B7" office:value-type="string">
								<text:p text:style-name="P61">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица48.C7" office:value-type="string">
								<text:p text:style-name="P61">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица48.D7" office:value-type="string">
								<text:p text:style-name="P61">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица48.E7" office:value-type="string">
								<text:p text:style-name="P61">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица48.F7" office:value-type="string">
								<text:p text:style-name="P61">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица48.G7" office:value-type="string">
								<text:p text:style-name="P61">-</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:if></table:table><!--row-code-->
</xsl:for-each>
<xsl:for-each select="STD_MP/Package/SpecifyParcel/ExistEZ/ExistEZParcels"><table:table table:name="Таблица49" table:style-name="Таблица49">
						<table:table-column table:style-name="Таблица49.A"/>
						<table:table-column table:style-name="Таблица49.B"/>
						<table:table-column table:style-name="Таблица49.C"/>
						<table:table-column table:style-name="Таблица49.D"/>
						<table:table-row table:style-name="Таблица49.1">
							<table:table-cell table:style-name="Таблица49.A1" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="P90"><text:span text:style-name="T17">3</text:span>. Сведения о частях границы измененн<text:span text:style-name="T36">ого</text:span> земельного участка</text:p>
								<text:p text:style-name="P7">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">с кадастровым номером </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s text:c="2"/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="get_value"><xsl:with-param name="p_name">CadastralNumber</xsl:with-param></xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица49.2">
							<table:table-cell table:style-name="Таблица49.A2" table:number-columns-spanned="2" office:value-type="string">
								<text:p text:style-name="P18">Обозначение части границы</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица49.C2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P7">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Горизонтальное проложение (</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T6">S</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">), м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица49.D2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P18">Описание прохождения части границы</text:p>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица49.3">
							<table:table-cell table:style-name="Таблица49.A2" office:value-type="string">
								<text:p text:style-name="P18">от т.</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица49.C2" office:value-type="string">
								<text:p text:style-name="P18">до т.</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
					</table:table><table:table table:name="Таблица50" table:style-name="Таблица50"><table:table-column table:style-name="Таблица50.A"/><table:table-column table:style-name="Таблица50.B"/><table:table-column table:style-name="Таблица50.C"/><table:table-column table:style-name="Таблица50.D"/><table:table-row table:style-name="Таблица50.1">
							<table:table-cell table:style-name="Таблица50.A1" office:value-type="string">
								<text:p text:style-name="P19">1</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица50.B1" office:value-type="string">
								<text:p text:style-name="P19">2</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица50.B1" office:value-type="string">
								<text:p text:style-name="P19">3</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица50.D1" office:value-type="string">
								<text:p text:style-name="P19">4</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
<xsl:for-each select="Composition_EZ/InsertEntryParcels/InsertEntryParcel/NewEntryParcel"><table:table-row table:style-name="Таблица50.1">
							<table:table-cell table:style-name="Таблица50.A3" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="P19">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:value-of select="@Definition"/> 
</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row><!--row-code-->

<xsl:for-each select="Entity_Spatial/Borders/Border">
<xsl:sort select="(1.5 - @Spatial)*position()" data-type="number" order="descending"/>
<xsl:variable name="curr_spatial" select="./@Spatial"/>
<table:table-row table:style-name="Таблица50.1">
							<table:table-cell table:style-name="Таблица50.A5" office:value-type="string">
								<text:p text:style-name="P19">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="border_point_name"><xsl:with-param name="p1">1</xsl:with-param></xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица50.B5" office:value-type="string">
								<text:p text:style-name="P19">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="border_point_name"><xsl:with-param name="p2">1</xsl:with-param></xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица50.B5" office:value-type="string">
								<text:p text:style-name="P19">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:for-each select="Edge | /STD_MP[not(/.//ExistEZParcels | /.//ExistEZEntryParcels/ExistEZEntryParcel | /.//ExistParcel)]">
<xsl:call-template name="get_value"><xsl:with-param name="p_name">Length</xsl:with-param></xsl:call-template>	
							</xsl:for-each>			</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица50.D5" office:value-type="string">
								<text:p text:style-name="P19">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:for-each select="Edge | /STD_MP[not(/.//ExistEZParcels | /.//ExistEZEntryParcels/ExistEZEntryParcel | /.//ExistParcel)]">
							<xsl:call-template name="get_value"><xsl:with-param name="p_name">Definition</xsl:with-param></xsl:call-template>									
							</xsl:for-each>				</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:for-each>
</xsl:for-each>		
<xsl:if test="not(Composition_EZ/InsertEntryParcels/InsertEntryParcel/NewEntryParcel)">

<table:table-row table:style-name="Таблица50.1">
							<table:table-cell table:style-name="Таблица50.A7" office:value-type="string">
								<text:p text:style-name="P62">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица50.B7" office:value-type="string">
								<text:p text:style-name="P62">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица50.B7" office:value-type="string">
								<text:p text:style-name="P62">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица50.D7" office:value-type="string">
								<text:p text:style-name="P62">-</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:if></table:table><!--row-code-->
</xsl:for-each><text:p text:style-name="P63"/><table:table table:name="Таблица58" table:style-name="Таблица58">
						<table:table-column table:style-name="Таблица58.A"/>
						<table:table-row table:style-name="Таблица58.1">
							<table:table-cell table:style-name="Таблица58.A1" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T8">4</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">. Общие сведения о частях измененных земельных участков</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table>	<xsl:for-each select="/.//ExistEZParcels | /.//ExistEZEntryParcel"><table:table table:name="Таблица59" table:style-name="Таблица59">
						<table:table-column table:style-name="Таблица59.A"/>
						<table:table-column table:style-name="Таблица59.B"/>
						<table:table-column table:style-name="Таблица59.C"/>
						<table:table-column table:style-name="Таблица59.D"/>
						<table:table-column table:style-name="Таблица59.E"/>
						<text:soft-page-break/>
						<table:table-row table:style-name="Таблица59.1">
							<table:table-cell table:style-name="Таблица59.A1" table:number-columns-spanned="5" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Кадастровый номер земельного участка <text:s text:c="2"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T27">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T4"><xsl:call-template name="get_value"><xsl:with-param name="p_name">CadastralNumber</xsl:with-param></xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T4"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица59.2">
							<table:table-cell table:style-name="Таблица59.A2" office:value-type="string">
								<text:p text:style-name="P9">№ п/п</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица59.B2" office:value-type="string">
								<text:p text:style-name="P9">Учетный номер или обозначение части</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица59.B2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Площадь (Р), м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T22">2</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
								<text:p text:style-name="P9"/>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица59.B2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">±∆Р, м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T22">2</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица59.E2" office:value-type="string">
								<text:p text:style-name="P9">Характеристика части</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table><table:table table:name="Таблица60" table:style-name="Таблица60"><table:table-column table:style-name="Таблица60.A"/><table:table-column table:style-name="Таблица60.B"/><table:table-column table:style-name="Таблица60.C"/><table:table-column table:style-name="Таблица60.D"/><table:table-column table:style-name="Таблица60.E"/><table:table-header-rows>
							<table:table-row table:style-name="Таблица60.1">
								<table:table-cell table:style-name="Таблица60.A1" office:value-type="string">
									<text:p text:style-name="P9">1</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица60.B1" office:value-type="string">
									<text:p text:style-name="P9">2</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица60.B1" office:value-type="string">
									<text:p text:style-name="P9">3</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица60.B1" office:value-type="string">
									<text:p text:style-name="P9">4</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица60.E1" office:value-type="string">
									<text:p text:style-name="P9">5</text:p>
								</table:table-cell>
							</table:table-row>
						</table:table-header-rows><!--row-code-->				
<xsl:for-each select="SubParcels/FormSubParcel | SubParcels/ExistSubParcel | 
SubParcels/InvariableSubParcel |
/STD_MP[not(/.//ExistEZParcels[SubParcels])]"><table:table-row table:style-name="Таблица60.1">
							<table:table-cell table:style-name="Таблица60.A1" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:if test="../SubParcels"><xsl:value-of select="position()"/> </xsl:if>
					<xsl:if test="not(../SubParcels)"><xsl:value-of select="'-'"/> </xsl:if></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица60.B1" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:if test="not(../SubParcels)"><xsl:value-of select="'-'"/></xsl:if>
<xsl:value-of select="@Definition"/>
<xsl:value-of select="@Number_Record"/>
</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица60.B1" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:for-each select="Area ">
	<xsl:call-template name="get_value">
	<xsl:with-param name="p_name">Area</xsl:with-param>
	</xsl:call-template>
</xsl:for-each>
<xsl:if test="not(Area)"><xsl:value-of select="'-'"/></xsl:if></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица60.B1" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:for-each select="Area">
	<xsl:call-template name="get_value">
	<xsl:with-param name="p_name">Innccuracy</xsl:with-param>
	</xsl:call-template>
</xsl:for-each>
<xsl:if test="not(Area)"><xsl:value-of select="'-'"/></xsl:if></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица60.E1" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">	<xsl:for-each select="Encumbrance">
											<xsl:call-template name="get_value"><xsl:with-param name="p_name">Type</xsl:with-param></xsl:call-template>
					</xsl:for-each>
<xsl:if test="not(Encumbrance)"><xsl:value-of select="'-'"/></xsl:if></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->	
	</xsl:for-each>
</table:table></xsl:for-each><table:table table:name="Таблица61" table:style-name="Таблица61">
						<table:table-column table:style-name="Таблица61.A"/>
						<table:table-row table:style-name="Таблица61.1">
							<table:table-cell table:style-name="Таблица61.A1" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T8">5</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">. Сведения о местоположении границ <text:s/>частей измененных земельных участков</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table>	<xsl:for-each select="/.//ExistEZParcels |
/.//ExistEZEntryParcels"><table:table table:name="Таблица62" table:style-name="Таблица62">
						<table:table-column table:style-name="Таблица62.A"/>
						<table:table-row table:style-name="Таблица62.1">
							<table:table-cell table:style-name="Таблица62.A1" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Кадастровый номер земельного участка </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s text:c="2"/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T4"><xsl:call-template name="get_value"><xsl:with-param name="p_name">CadastralNumber</xsl:with-param></xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T4"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table>			<xsl:for-each select="SubParcels/FormSubParcel  |
SubParcels/ExistSubParcel | SubParcels/InvariableSubParcel |
/STD_MP[not(/.//SubParcels)]">

<table:table table:name="Таблица63" table:style-name="Таблица63">
						<table:table-column table:style-name="Таблица63.A"/>
						<table:table-column table:style-name="Таблица63.B"/>
						<table:table-column table:style-name="Таблица63.C"/>
						<table:table-column table:style-name="Таблица63.D"/>
						<table:table-column table:style-name="Таблица63.E"/>
						<table:table-row table:style-name="Таблица63.1">
							<table:table-cell table:style-name="Таблица63.A1" table:number-columns-spanned="5" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Учетный номер или обозначение части <text:s text:c="2"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T27">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T4"><xsl:call-template name="get_value"><xsl:with-param name="p_name">Definition</xsl:with-param></xsl:call-template>
<xsl:call-template name="get_value"><xsl:with-param name="p_name">Number_Record</xsl:with-param></xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T4"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица63.2">
							<table:table-cell table:style-name="Таблица63.A2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P9">Обозначение характерных точек границы</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица63.B2" table:number-columns-spanned="2" office:value-type="string">
								<text:p text:style-name="P9">Координаты, м</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица63.B2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Средняя квадратическая погрешность положения характерной точки (М</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">t</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">), м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица63.E2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P9">Описание закрепления точки</text:p>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица63.3">
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица63.B2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T6">X</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица63.B2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T6">Y</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
					</table:table><table:table table:name="Таблица64" table:style-name="Таблица64"><table:table-column table:style-name="Таблица64.A"/><table:table-column table:style-name="Таблица64.B"/><table:table-column table:style-name="Таблица64.C"/><table:table-column table:style-name="Таблица64.D"/><table:table-column table:style-name="Таблица64.E"/><table:table-header-rows>
							<table:table-row table:style-name="Таблица64.1">
								<table:table-cell table:style-name="Таблица64.A1" office:value-type="string">
									<text:p text:style-name="P9">1</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица64.B1" office:value-type="string">
									<text:p text:style-name="P9">2</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица64.B1" office:value-type="string">
									<text:p text:style-name="P9">3</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица64.B1" office:value-type="string">
									<text:p text:style-name="P9">4</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица64.E1" office:value-type="string">
									<text:p text:style-name="P9">5</text:p>
								</table:table-cell>
							</table:table-row>
						</table:table-header-rows><!--row-code-->				
<xsl:for-each select="Entity_Spatial/Spatial_Element |
Contours/Contour/Entity_Spatial/Spatial_Element |
/STD_MP[not(/.//ExistParcel[Composition_EZ][SubParcels])]">
							<xsl:for-each select="Spelement_Unit/Ordinate | /STD_MP[not(/.//ExistParcel[Composition_EZ][SubParcels])]">
<table:table-row table:style-name="Таблица64.3">
							<table:table-cell table:style-name="Таблица64.A3" office:value-type="float" office:value="0">
								<text:p text:style-name="P72">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="point_name"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица64.B3" office:value-type="float" office:value="0">
								<text:p text:style-name="P53">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:if test="@X">
<xsl:value-of select="format-number(@X,'#0.00')"/>
</xsl:if>
<xsl:if test="not(@X)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица64.C3" office:value-type="float" office:value="0">
								<text:p text:style-name="P53">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:if test="@Y">
<xsl:value-of select="format-number(@Y,'#0.00')"/>
</xsl:if>
<xsl:if test="not(@Y)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица64.D3" office:value-type="float" office:value="0">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="get_value"><xsl:with-param name="p_name">Delta_Geopoint</xsl:with-param></xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица64.E3" office:value-type="float" office:value="0">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="get_value"><xsl:with-param name="p_name">Geopoint_Zacrep</xsl:with-param></xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:for-each>
<xsl:if test="position() != last()">
<table:table-row table:style-name="Таблица64.3">
							<table:table-cell table:style-name="Таблица64.A6" table:number-columns-spanned="5" office:value-type="string">
								<text:p text:style-name="P72">
									<text:span text:style-name="User_20_Entry"/>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row><!--row-code-->						
</xsl:if>
</xsl:for-each>


</table:table></xsl:for-each>
</xsl:for-each></xsl:if><xsl:if test="/.//NewParcel/Providing_Pass_CadastralNumbers"><text:p text:style-name="P98"/><table:table table:name="Таблица10" table:style-name="Таблица10">
						<table:table-column table:style-name="Таблица10.A"/>
						<table:table-column table:style-name="Таблица10.B"/>
						<table:table-column table:style-name="Таблица10.C"/>
						<table:table-row table:style-name="Таблица10.1">
							<table:table-cell table:style-name="Таблица10.A1" table:number-columns-spanned="3" office:value-type="string">
								<text:p text:style-name="P86"><text:bookmark-start text:name="Оглавление_Доступ"/><text:span text:style-name="T34">Св</text:span><text:span text:style-name="T33">едения</text:span> о земельных участках, посредством которых обеспечивается доступ к образуемым или изменяемым земельным участкам<text:bookmark-end text:name="Оглавление_Доступ"/></text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица10.2">
							<table:table-cell table:style-name="Таблица10.A2" office:value-type="string">
								<text:p text:style-name="P17">№ п/п</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица10.B2" office:value-type="string">
								<text:p text:style-name="P17">Кадастровый номер или обозначение земельного участка, для которого обеспечивается доступ</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица10.C2" office:value-type="string">
								<text:p text:style-name="P17">Кадастровый номер или обозначение земельного участка, посредством которого обеспечивается доступ</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table><table:table table:name="Таблица65" table:style-name="Таблица65"><table:table-column table:style-name="Таблица65.A"/><table:table-column table:style-name="Таблица65.B"/><table:table-column table:style-name="Таблица65.C"/><table:table-header-rows>
							<table:table-row table:style-name="Таблица65.1">
								<table:table-cell table:style-name="Таблица65.A1" office:value-type="string">
									<text:p text:style-name="P17">1</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица65.B1" office:value-type="string">
									<text:p text:style-name="P17">2</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица65.C1" office:value-type="string">
									<text:p text:style-name="P17">3</text:p>
								</table:table-cell>
							</table:table-row>
						</table:table-header-rows><!--row-code-->
<xsl:for-each select="STD_MP/Package/FormParcels/*/Providing_Pass_CadastralNumbers/CadastralNumber"><table:table-row table:style-name="Таблица65.1">
							<table:table-cell table:style-name="Таблица65.A3" office:value-type="string">
								<text:p text:style-name="P4">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:value-of select="position()"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица65.B3" office:value-type="string">
								<text:p text:style-name="P4">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:value-of select="./../../@Definition"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица65.C3" office:value-type="string">
								<text:p text:style-name="P4">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:value-of select="."/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:for-each>
<xsl:if test="not(STD_MP/Package/FormParcels/*/Providing_Pass_CadastralNumbers/CadastralNumber)"><table:table-row table:style-name="Таблица65.1">
							<table:table-cell table:style-name="Таблица65.A3" office:value-type="string">
								<text:p text:style-name="P4">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T11">-</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица65.B3" office:value-type="string">
								<text:p text:style-name="P4">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T11">-</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица65.C3" office:value-type="string">
								<text:p text:style-name="P4">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T11">-</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:if></table:table><text:p text:style-name="P59"/></xsl:if><xsl:if test="/.//ExistEZEntryParcel | /.//ExistParcel "><table:table table:name="Таблица35" table:style-name="Таблица35">
						<table:table-column table:style-name="Таблица35.A"/>
						<table:table-row table:style-name="Таблица35.1">
							<table:table-cell table:style-name="Таблица35.A1" office:value-type="string">
								<text:p text:style-name="P82"><text:bookmark-start text:name="Оглавление_УточняемыеУчастки"/>Сведения об уточняемых земельных участках и их частях<text:bookmark-end text:name="Оглавление_УточняемыеУчастки"/></text:p>
							</table:table-cell>
						</table:table-row>
					</table:table><xsl:for-each select="/.//ExistEZParcels | /.//ExistEZEntryParcels/ExistEZEntryParcel | /.//ExistParcel">
<xsl:if test="position() = 1"><table:table table:name="Таблица66" table:style-name="Таблица66">
						<table:table-column table:style-name="Таблица66.A"/>
						<table:table-column table:style-name="Таблица66.B"/>
						<table:table-column table:style-name="Таблица66.C"/>
						<table:table-column table:style-name="Таблица66.D"/>
						<table:table-column table:style-name="Таблица66.C"/>
						<table:table-column table:style-name="Таблица66.F"/>
						<table:table-column table:style-name="Таблица66.G"/>
						<table:table-row table:style-name="Таблица66.1">
							<table:table-cell table:style-name="Таблица66.A1" table:number-columns-spanned="7" office:value-type="string">
								<text:p text:style-name="P69">1. Сведения о характерных точках границы уточняемого земельного участка</text:p>
								<text:p text:style-name="P72">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">с кадастровым номером </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="get_value">
<xsl:with-param name="p_name">CadastralNumber</xsl:with-param> 
</xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s/>
										</text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица66.2">
							<table:table-cell table:style-name="Таблица66.A2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P69">Обозначение характерных точек границы</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица66.B2" table:number-columns-spanned="2" office:value-type="string">
								<text:p text:style-name="P69">Существующие координаты, м</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица66.B2" table:number-columns-spanned="2" office:value-type="string">
								<text:p text:style-name="P69">Уточненные координаты, м</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица66.B2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P72">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Средняя квадратическая погрешность положения характерной точки (М</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">t</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">), м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица66.G2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P69">Описание закрепления точки</text:p>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица66.3">
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица66.B3" office:value-type="string">
								<text:p text:style-name="P76">X</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица66.B3" office:value-type="string">
								<text:p text:style-name="P76">Y</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица66.B3" office:value-type="string">
								<text:p text:style-name="P76">X</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица66.B3" office:value-type="string">
								<text:p text:style-name="P76">Y</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
					</table:table><!--row-code-->
</xsl:if>
<xsl:if test="not(position() = 1)"><table:table table:name="Таблица45" table:style-name="Таблица45">
						<table:table-column table:style-name="Таблица45.A"/>
						<table:table-column table:style-name="Таблица45.B"/>
						<table:table-column table:style-name="Таблица45.C"/>
						<table:table-column table:style-name="Таблица45.D"/>
						<table:table-column table:style-name="Таблица45.E"/>
						<table:table-column table:style-name="Таблица45.F"/>
						<table:table-column table:style-name="Таблица45.G"/>
						<table:table-row>
							<table:table-cell table:style-name="Таблица45.A1" table:number-columns-spanned="7" office:value-type="string">
								<text:p text:style-name="P69">1. Сведения о характерных точках границы уточняемого земельного участка</text:p>
								<text:p text:style-name="P72">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">с кадастровым номером </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="get_value">
<xsl:with-param name="p_name">CadastralNumber</xsl:with-param> 
</xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s/>
										</text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица45.2">
							<table:table-cell table:style-name="Таблица45.A2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P69">Обозначение характерных точек границы</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица45.B2" table:number-columns-spanned="2" office:value-type="string">
								<text:p text:style-name="P69">Существующие координаты, м</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица45.D2" table:number-columns-spanned="2" office:value-type="string">
								<text:p text:style-name="P69">Уточненные координаты, м</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица45.F2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P72">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Средняя квадратическая погрешность положения характерной точки (М</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">t</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">), м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица45.G2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P69">Описание закрепления точки</text:p>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица45.3">
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица45.F2" office:value-type="string">
								<text:p text:style-name="P76">X</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица45.F2" office:value-type="string">
								<text:p text:style-name="P76">Y</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица45.F2" office:value-type="string">
								<text:p text:style-name="P76">X</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица45.F2" office:value-type="string">
								<text:p text:style-name="P76">Y</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
					</table:table><!--row-code-->
</xsl:if><table:table table:name="Таблица36" table:style-name="Таблица36"><table:table-column table:style-name="Таблица36.A"/><table:table-column table:style-name="Таблица36.B"/><table:table-column table:style-name="Таблица36.C"/><table:table-column table:style-name="Таблица36.D"/><table:table-column table:style-name="Таблица36.C"/><table:table-column table:style-name="Таблица36.F"/><table:table-column table:style-name="Таблица36.G"/><table:table-row table:style-name="Таблица36.1">
							<table:table-cell table:style-name="Таблица36.A1" office:value-type="string">
								<text:p text:style-name="P69">1</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.B1" office:value-type="string">
								<text:p text:style-name="P9">2</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.B1" office:value-type="string">
								<text:p text:style-name="P9">3</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.B1" office:value-type="string">
								<text:p text:style-name="P9">4</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.B1" office:value-type="string">
								<text:p text:style-name="P9">5</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.B1" office:value-type="string">
								<text:p text:style-name="P9">6</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.G1" office:value-type="string">
								<text:p text:style-name="P69">7</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
			<xsl:for-each select="Contours/NewContour/Entity_Spatial | Contours/ExistContour/Entity_Spatial | Entity_Spatial">
				<xsl:if test="ancestor::NewContour | ancestor::ExistContour"><table:table-row table:style-name="Таблица36.1">
							<table:table-cell table:style-name="Таблица36.A3" table:number-columns-spanned="7" office:value-type="string">
								<text:p text:style-name="P81">
									<text:span text:style-name="User_20_Entry">(<xsl:value-of select="ancestor::NewContour/@Definition | ancestor::ExistContour/@Number_Record"/>)
</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row><!--row-code-->
				</xsl:if>
				<xsl:for-each select="Spatial_Element">
<xsl:variable name="v_element_pos" select="number(1.5 - position())"/>
					<xsl:for-each select="Spelement_Unit/NewOrdinate">
<xsl:sort select="$v_element_pos*position()" data-type="number" order="descending"/>
<table:table-row table:style-name="Таблица36.1">
							<table:table-cell table:style-name="Таблица36.A5" office:value-type="float" office:value="0">
								<text:p text:style-name="P72">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="point_name"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.B5" office:value-type="float" office:value="0">
								<text:p text:style-name="P53">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="point_coord">
	<xsl:with-param name="o">1</xsl:with-param>
    <xsl:with-param name="x">1</xsl:with-param>
</xsl:call-template></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.B5" office:value-type="float" office:value="0">
								<text:p text:style-name="P53">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="point_coord">
	<xsl:with-param name="o">1</xsl:with-param>
	<xsl:with-param name="y">1</xsl:with-param>
</xsl:call-template></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.B5" office:value-type="float" office:value="0">
								<text:p text:style-name="P53">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="point_coord">
	<xsl:with-param name="n">1</xsl:with-param>
	<xsl:with-param name="x">1</xsl:with-param>
</xsl:call-template></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.B5" office:value-type="float" office:value="0">
								<text:p text:style-name="P53">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="point_coord">
	<xsl:with-param name="n">1</xsl:with-param>
	<xsl:with-param name="y">1</xsl:with-param>
</xsl:call-template></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.B5" office:value-type="float" office:value="0">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_value">
  <xsl:with-param name="p_name">Delta_Geopoint</xsl:with-param>
</xsl:call-template>	</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.G5" office:value-type="float" office:value="0">
								<text:p text:style-name="P72">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_dict">
<xsl:with-param name="p_code">
<xsl:value-of select="@Geopoint_Zacrep"/>
</xsl:with-param>
</xsl:call-template></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->								
</xsl:for-each>
<xsl:if test="position() != last()">
<table:table-row table:style-name="Таблица36.1">
							<table:table-cell table:style-name="Таблица36.A3" table:number-columns-spanned="7" office:value-type="string">
								<text:p text:style-name="P81">
									<text:span text:style-name="User_20_Entry"/>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row><!--row-code-->
</xsl:if>
</xsl:for-each>
</xsl:for-each>
<!--xsl:if test="descendant::Composition_EZ"-->
<xsl:if test="not(Contours/NewContour/Entity_Spatial | Contours/ExistContour/Entity_Spatial | Entity_Spatial)">

<table:table-row table:style-name="Таблица36.1">
							<table:table-cell table:style-name="Таблица36.A9" office:value-type="string">
								<text:p text:style-name="P60">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.B9" office:value-type="string">
								<text:p text:style-name="P60">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.C9" office:value-type="string">
								<text:p text:style-name="P60">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.D9" office:value-type="string">
								<text:p text:style-name="P60">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.E9" office:value-type="string">
								<text:p text:style-name="P60">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.F9" office:value-type="string">
								<text:p text:style-name="P60">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.G9" office:value-type="string">
								<text:p text:style-name="P60">-</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:if></table:table><table:table table:name="Таблица67" table:style-name="Таблица67">
						<table:table-column table:style-name="Таблица67.A"/>
						<table:table-column table:style-name="Таблица67.B"/>
						<table:table-column table:style-name="Таблица67.C"/>
						<table:table-column table:style-name="Таблица67.D"/>
						<table:table-row table:style-name="Таблица67.1">
							<table:table-cell table:style-name="Таблица67.A1" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="P89">2. Сведения о частях границы уточняемого земельного участка</text:p>
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">с кадастровым номером </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s text:c="2"/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="get_value"><xsl:with-param name="p_name">CadastralNumber</xsl:with-param></xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица67.2">
							<table:table-cell table:style-name="Таблица67.A2" table:number-columns-spanned="2" office:value-type="string">
								<text:p text:style-name="P9">Обозначение части границы</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица67.C2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Горизонтальное проложение (</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T6">S</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">), м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица67.D2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P9">Описание прохождения части границы</text:p>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица67.3">
							<table:table-cell table:style-name="Таблица67.A2" office:value-type="string">
								<text:p text:style-name="P9">от т.</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица67.C2" office:value-type="string">
								<text:p text:style-name="P9">до т.</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
					</table:table><table:table table:name="Таблица68" table:style-name="Таблица68"><table:table-column table:style-name="Таблица68.A"/><table:table-column table:style-name="Таблица68.B"/><table:table-column table:style-name="Таблица68.C"/><table:table-column table:style-name="Таблица68.D"/><table:table-row table:style-name="Таблица68.1">
							<table:table-cell table:style-name="Таблица68.A1" office:value-type="string">
								<text:p text:style-name="P9">1</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица68.B1" office:value-type="string">
								<text:p text:style-name="P9">2</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица68.B1" office:value-type="string">
								<text:p text:style-name="P9">3</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица68.D1" office:value-type="string">
								<text:p text:style-name="P9">4</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
		<xsl:for-each select="Contours/NewContour/Entity_Spatial | Contours/ExistContour/Entity_Spatial | Entity_Spatial">
			<xsl:if test="(ancestor::NewContour) or (ancestor::ExistContourContour)"><table:table-row table:style-name="Таблица68.1">
							<table:table-cell table:style-name="Таблица68.A3" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="P22">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:value-of select="ancestor::Contour/@Definition"/> 
</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row><!--row-code-->
</xsl:if>
<xsl:for-each select="Borders/Border">
<xsl:sort select="(1.5 - @Spatial)*position()" data-type="number" order="descending"/>
<xsl:variable name="curr_spatial" select="./@Spatial"/>
<table:table-row table:style-name="Таблица68.1">
							<table:table-cell table:style-name="Таблица68.A5" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="border_point_name"><xsl:with-param name="p1">1</xsl:with-param></xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица68.B5" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="border_point_name"><xsl:with-param name="p2">1</xsl:with-param></xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица68.B5" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:for-each select="Edge | /STD_MP[not(/.//ExistEZParcels | /.//ExistEZEntryParcels/ExistEZEntryParcel | /.//ExistParcel)]">
<xsl:call-template name="get_value"><xsl:with-param name="p_name">Length</xsl:with-param></xsl:call-template>	
							</xsl:for-each>			</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица68.D5" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:for-each select="Edge | /STD_MP[not(/.//ExistEZParcels | /.//ExistEZEntryParcels/ExistEZEntryParcel | /.//ExistParcel)]">
							<xsl:call-template name="get_value"><xsl:with-param name="p_name">Definition</xsl:with-param></xsl:call-template>									
							</xsl:for-each>				</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->		
<xsl:if test="(((($curr_spatial=1) and (count(preceding-sibling::*[@Spatial=$curr_spatial]) = 0)) or (($curr_spatial!=1) and (count(following-sibling::*[@Spatial=$curr_spatial]) = 0)))) and 
((count(preceding-sibling::*[@Spatial = $curr_spatial+1]) +
count(following-sibling::*[@Spatial = $curr_spatial+1]) ) >0)
">
<table:table-row table:style-name="Таблица68.1">
							<table:table-cell table:style-name="Таблица68.A3" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="P22">
									<text:span text:style-name="User_20_Entry"/>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row><!--row-code-->						
			</xsl:if>
		</xsl:for-each>
			</xsl:for-each>
<!--xsl:if test="descendant::Composition_EZ"-->
<xsl:if test="not(Contours/NewContour/Entity_Spatial | Contours/ExistContour/Entity_Spatial | Entity_Spatial)"><table:table-row table:style-name="Таблица68.1">
							<table:table-cell table:style-name="Таблица68.A9" office:value-type="string">
								<text:p text:style-name="P60">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица68.B9" office:value-type="string">
								<text:p text:style-name="P60">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица68.B9" office:value-type="string">
								<text:p text:style-name="P60">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица68.D9" office:value-type="string">
								<text:p text:style-name="P60">-</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:if></table:table><!--/xsl:for-each>			
<xsl:for-each select="/.//ExistParcel[not(Composition_EZ)][SubParcels] | /STD_MP[not(/.//ExistParcel[not(Composition_EZ)][SubParcels])]"--><table:table table:name="Таблица69" table:style-name="Таблица69">
						<table:table-column table:style-name="Таблица69.A"/>
						<table:table-row table:style-name="Таблица69.1">
							<table:table-cell table:style-name="Таблица69.A1" office:value-type="string">
								<text:p text:style-name="P9">3. Сведения о местоположении границы части уточняемого земельного участка</text:p>
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">с кадастровым номером </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="get_value"><xsl:with-param name="p_name">CadastralNumber</xsl:with-param></xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table>		<xsl:for-each select="SubParcels/SubParcel  | /STD_MP[not(/.//ExistParcel[SubParcels])]">
				<xsl:sort select="Number_PP" data-type="number"/>
<table:table table:name="Таблица70" table:style-name="Таблица70">
						<table:table-column table:style-name="Таблица70.A"/>
						<table:table-column table:style-name="Таблица70.B"/>
						<table:table-column table:style-name="Таблица70.C"/>
						<table:table-column table:style-name="Таблица70.D"/>
						<table:table-column table:style-name="Таблица70.E"/>
						<table:table-row table:style-name="Таблица70.1">
							<table:table-cell table:style-name="Таблица70.A1" table:number-columns-spanned="5" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Учетный номер или обозначение <text:s/>части <text:s/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T27">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T4"><xsl:call-template name="get_value"><xsl:with-param name="p_name">Definition</xsl:with-param></xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T4"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица70.2">
							<table:table-cell table:style-name="Таблица70.A2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P9">Обозначение характерных точек границы</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица70.B2" table:number-columns-spanned="2" office:value-type="string">
								<text:p text:style-name="P9">Координаты, м</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица70.B2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Средняя квадратическая погрешность положения характерной точки (М</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">t</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">), м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица70.E2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P9">Описание закрепления точки</text:p>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица70.3">
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица70.B2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T6">X</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица70.B2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T6">Y</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
					</table:table><table:table table:name="Таблица71" table:style-name="Таблица71"><table:table-column table:style-name="Таблица71.A"/><table:table-column table:style-name="Таблица71.B"/><table:table-column table:style-name="Таблица71.C"/><table:table-column table:style-name="Таблица71.D"/><table:table-column table:style-name="Таблица71.E"/><table:table-row table:style-name="Таблица71.1">
							<table:table-cell table:style-name="Таблица71.A1" office:value-type="string">
								<text:p text:style-name="P9">1</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица71.B1" office:value-type="string">
								<text:p text:style-name="P9">2</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица71.B1" office:value-type="string">
								<text:p text:style-name="P9">3</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица71.B1" office:value-type="string">
								<text:p text:style-name="P9">4</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица71.E1" office:value-type="string">
								<text:p text:style-name="P9">5</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
			<xsl:for-each select="Spatial_Element | /STD_MP[not(/.//ExistParcel[SubParcels])]">
				<xsl:for-each select="Spelement_Unit/Ordinate  | /STD_MP[not(/.//ExistParcel[SubParcels])]">
							<xsl:sort select="@Ord_Nmb" data-type="number"/>			
<table:table-row table:style-name="Таблица71.2">
							<table:table-cell table:style-name="Таблица71.A3" office:value-type="float" office:value="0">
								<text:p text:style-name="P72">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="point_name"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица71.B3" office:value-type="float" office:value="0">
								<text:p text:style-name="P53">
									<text:span text:style-name="User_20_Entry"><xsl:if test="@X">
<xsl:value-of select="format-number(@X,'#0.00')"/>
</xsl:if>
<xsl:if test="not(@X)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица71.C3" office:value-type="float" office:value="0">
								<text:p text:style-name="P53">
									<text:span text:style-name="User_20_Entry"><xsl:if test="@Y">
<xsl:value-of select="format-number(@Y,'#0.00')"/>
</xsl:if>
<xsl:if test="not(@Y)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица71.D3" office:value-type="float" office:value="0">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_value"><xsl:with-param name="p_name">Delta_Geopoint</xsl:with-param></xsl:call-template></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица71.E3" office:value-type="float" office:value="0">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_value"><xsl:with-param name="p_name">Geopoint_Zacrep</xsl:with-param></xsl:call-template></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->								
					</xsl:for-each>
					<xsl:if test="position() != last()"><table:table-row table:style-name="Таблица71.2">
							<table:table-cell table:style-name="Таблица71.A6" table:number-columns-spanned="5" office:value-type="string">
								<text:p text:style-name="P72"/>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row><!--row-code-->						
					</xsl:if>
				</xsl:for-each>
</table:table>		</xsl:for-each>
<table:table table:name="Таблица72" table:style-name="Таблица72"><table:table-column table:style-name="Таблица72.A"/><table:table-column table:style-name="Таблица72.B"/><table:table-column table:style-name="Таблица72.C"/><!--row-code-->
<!--xsl:for-each select="/.//ExistParcel[not(Composition_EZ)] | /STD_MP[not(/.//ExistParcel[not(Composition_EZ)])]"--><text:soft-page-break/><table:table-row table:style-name="Таблица72.2">
							<table:table-cell table:style-name="Таблица72.A2" table:number-columns-spanned="3" office:value-type="string">
								<text:p text:style-name="P9"><text:span text:style-name="T12">4</text:span>. Общие сведения об уточняемом земельном участке</text:p>
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">с кадастровым номером </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T2">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T16">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T16"><xsl:call-template name="get_value"><xsl:with-param name="p_name">CadastralNumber</xsl:with-param></xsl:call-template>		</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T16"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row><table:table-row table:style-name="Таблица72.3">
							<table:table-cell table:style-name="Таблица72.A3" office:value-type="string">
								<text:p text:style-name="P9">№ п/п</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица72.B3" office:value-type="string">
								<text:p text:style-name="P9">Наименование характеристик земельного участка</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица72.C3" office:value-type="string">
								<text:p text:style-name="P9">Значение характеристики</text:p>
							</table:table-cell>
						</table:table-row><table:table-row table:style-name="Таблица72.4">
							<table:table-cell table:style-name="Таблица72.A3" office:value-type="string">
								<text:p text:style-name="P9">1</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица72.B3" office:value-type="string">
								<text:p text:style-name="P9">2</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица72.C3" office:value-type="string">
								<text:p text:style-name="P9">3</text:p>
							</table:table-cell>
						</table:table-row><table:table-row table:style-name="Таблица72.5">
							<table:table-cell table:style-name="Таблица72.A3" office:value-type="string">
								<text:p text:style-name="P1">1</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица72.B3" office:value-type="string">
								<text:p text:style-name="Обычный">Площадь земельного <text:s/>участка ± величина погрешности определения площади <text:s text:c="2"/><text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">(Р±∆Р), м</text:span>
									</text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span><text:s text:c="2"/><text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T22">2</text:span>
									</text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span></text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица72.C3" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry"><xsl:for-each select="Area">
<xsl:call-template name="get_value"><xsl:with-param name="p_name">Area</xsl:with-param></xsl:call-template>±<xsl:call-template name="get_value"><xsl:with-param name="p_name">Innccuracy</xsl:with-param></xsl:call-template>
<xsl:value-of select="$crlf"/>
</xsl:for-each>
<xsl:for-each select="SubParcels/SubParcel">
<xsl:value-of select="@Definition"/><xsl:text> </xsl:text>
<xsl:text> </xsl:text>
<xsl:value-of select="Area/Area"/>
<xsl:value-of select="'±'"/>
<xsl:value-of select="Area/Innccuracy"/><xsl:text> </xsl:text>
<xsl:value-of select="'м2'"/>
<xsl:value-of select="$crlf"/>
</xsl:for-each>
<xsl:for-each select="Contours/Contour">
<xsl:value-of select="@Definition"/><xsl:text> </xsl:text>
<xsl:value-of select="Area/Area"/>
<xsl:value-of select="'±'"/>
<xsl:value-of select="Area/Innccuracy"/><xsl:text> </xsl:text>
<xsl:value-of select="'м2'"/>
<xsl:value-of select="$crlf"/>
</xsl:for-each></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><table:table-row table:style-name="Таблица72.5">
							<table:table-cell table:style-name="Таблица72.A3" office:value-type="string">
								<text:p text:style-name="P1">2</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица72.B3" office:value-type="string">
								<text:p text:style-name="Обычный">Площадь земельного участка по сведениям государственного кадастра недвижимости <text:s text:c="2"/><text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">(Ркад), м</text:span>
									</text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span><text:s text:c="2"/><text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T22">2</text:span>
									</text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span></text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица72.C3" office:value-type="string">
								<text:p text:style-name="P37"><xsl:call-template name="get_value"><xsl:with-param name="p_name">Area_In_GKN</xsl:with-param></xsl:call-template>
<xsl:if test="not(Area_In_GKN)">-</xsl:if>

</text:p>
							</table:table-cell>
						</table:table-row><table:table-row table:style-name="Таблица72.5">
							<table:table-cell table:style-name="Таблица72.A3" office:value-type="string">
								<text:p text:style-name="P1">3</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица72.B3" office:value-type="string">
								<text:p text:style-name="Обычный">Оценка расхождения<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2"><text:s text:c="2"/>Р и Р кад (Р-Ркад), м</text:span>
									</text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span><text:s text:c="2"/><text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T22">2</text:span>
									</text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span></text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица72.C3" office:value-type="string">
								<text:p text:style-name="P37"><xsl:call-template name="get_value"><xsl:with-param name="p_name">Delta_Area</xsl:with-param></xsl:call-template>


</text:p>
							</table:table-cell>
						</table:table-row><table:table-row table:style-name="Таблица72.5">
							<table:table-cell table:style-name="Таблица72.A3" office:value-type="string">
								<text:p text:style-name="P1">4</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица72.B8" office:value-type="string">
								<text:p text:style-name="Обычный">Предельный минимальный и максимальный размер земельного участка<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2"><text:s text:c="2"/>(Рмин и Рмакс), м</text:span>
									</text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span><text:s text:c="2"/><text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T22">2</text:span>
									</text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span></text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица72.C3" office:value-type="string">
								<text:p text:style-name="P29"><xsl:if test="Min_Area">
<xsl:value-of select="Min_Area/Area"/>
<xsl:if test="not(Min_Area)">-</xsl:if>
<xsl:text> </xsl:text>
<!--xsl:value-of select="'м2'"/-->
<xsl:text>    </xsl:text>
<xsl:value-of select="$crlf"/>
<xsl:value-of select="Max_Area/Area"/>
<xsl:text> </xsl:text>
<!--xsl:value-of select="'м2'"/-->
</xsl:if>
<xsl:if test="not(Max_Area)">-</xsl:if>
</text:p>
							</table:table-cell>
						</table:table-row><table:table-row table:style-name="Таблица72.5">
							<table:table-cell table:style-name="Таблица72.A3" office:value-type="string">
								<text:p text:style-name="P1">5</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица72.B9" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T20">Кадастровые или иные номера зданий, сооружений, объектов незавершенного строительства, <text:s/>расположенных на земельном участке</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица72.C3" office:value-type="string">
								<text:p text:style-name="P48">
									<text:span text:style-name="User_20_Entry"><xsl:for-each select="Inner_CadastralNumbers">
				<xsl:call-template name="get_value"><xsl:with-param name="p_name">CadastralNumber</xsl:with-param></xsl:call-template>
				<xsl:if test="position() != last()">
					<xsl:value-of select="','"/>
				</xsl:if>
</xsl:for-each>
<xsl:if test="not(Inner_CadastralNumbers)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><table:table-row table:style-name="Таблица72.5">
							<table:table-cell table:style-name="Таблица72.A3" office:value-type="string">
								<text:p text:style-name="P1">6</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица72.B3" office:value-type="string">
								<text:p text:style-name="Обычный">Иные сведения</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица72.C3" office:value-type="string">
								<text:p text:style-name="P32"><xsl:call-template name="get_value"><xsl:with-param name="p_name">Note</xsl:with-param></xsl:call-template>
<xsl:if test="not(Note)">-</xsl:if>
</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->			
	<!--/xsl:for-each--></table:table><!--xsl:for-each select="/.//ExistParcel[not(Composition_EZ)][SubParcels] | /STD_MP[not(/.//ExistParcel[not(Composition_EZ)][SubParcel])]"-->
<!--xsl:for-each select="SubParcels | /STD_MP[not(/.//ExistParcel[not(Composition_EZ)][SubParcel])]"--><table:table table:name="Таблица73" table:style-name="Таблица73">
						<table:table-column table:style-name="Таблица73.A"/>
						<table:table-column table:style-name="Таблица73.B"/>
						<table:table-column table:style-name="Таблица73.C"/>
						<table:table-column table:style-name="Таблица73.D"/>
						<table:table-column table:style-name="Таблица73.E"/>
						<table:table-row table:style-name="Таблица73.1">
							<table:table-cell table:style-name="Таблица73.A1" table:number-columns-spanned="5" office:value-type="string">
								<text:p text:style-name="P14">5. Общие сведения о частях уточняемого земельного участка</text:p>
								<text:p text:style-name="P2">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">с кадастровым номером</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="get_value"><xsl:with-param name="p_name">CadastralNumber</xsl:with-param></xsl:call-template>		</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица73.2">
							<table:table-cell table:style-name="Таблица73.A2" office:value-type="string">
								<text:p text:style-name="P14">№ п/п</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица73.B2" office:value-type="string">
								<text:p text:style-name="P14">Учетный номер или обозначение части</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица73.B2" office:value-type="string">
								<text:p text:style-name="P2">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Площадь (Р), м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T22">2</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
								<text:p text:style-name="P14"/>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица73.B2" office:value-type="string">
								<text:p text:style-name="P2">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">±∆Р, м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T22">2</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица73.E2" office:value-type="string">
								<text:p text:style-name="P14">Характеристика части</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table><table:table table:name="Таблица74" table:style-name="Таблица74"><table:table-column table:style-name="Таблица74.A"/><table:table-column table:style-name="Таблица74.B"/><table:table-column table:style-name="Таблица74.C"/><table:table-column table:style-name="Таблица74.D"/><table:table-column table:style-name="Таблица74.E"/><table:table-header-rows>
							<table:table-row table:style-name="Таблица74.1">
								<table:table-cell table:style-name="Таблица74.A1" office:value-type="string">
									<text:p text:style-name="P14">1</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица74.B1" office:value-type="string">
									<text:p text:style-name="P14">2</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица74.B1" office:value-type="string">
									<text:p text:style-name="P14">3</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица74.B1" office:value-type="string">
									<text:p text:style-name="P14">4</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица74.E1" office:value-type="string">
									<text:p text:style-name="P14">5</text:p>
								</table:table-cell>
							</table:table-row>
						</table:table-header-rows><!--row-code-->
<xsl:for-each select="SubParcels/SubParcel | /STD_MP[not(/.//ExistParcel[not(Composition_EZ)][SubParcels])]"><table:table-row table:style-name="Таблица74.1">
							<table:table-cell table:style-name="Таблица74.A1" office:value-type="string">
								<text:p text:style-name="P14">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">	<xsl:if test="self::SubParcel"><xsl:value-of select="position()"/></xsl:if>
	<xsl:if test="not(self::SubParcel)"><xsl:value-of select="'-'"/></xsl:if>
</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица74.B1" office:value-type="string">
								<text:p text:style-name="P14">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">	<xsl:call-template name="get_value"><xsl:with-param name="p_name">Definition</xsl:with-param></xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица74.B1" office:value-type="string">
								<text:p text:style-name="P14">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:for-each select="Area  | /STD_MP[not(/.//ExistParcel[SubParcels])]">
				<xsl:call-template name="get_value"><xsl:with-param name="p_name">Area</xsl:with-param></xsl:call-template>
		</xsl:for-each></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица74.B1" office:value-type="string">
								<text:p text:style-name="P14">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:for-each select="Area  | /STD_MP[not(/.//ExistParcel[SubParcels])]">				
				<xsl:call-template name="get_value"><xsl:with-param name="p_name">Innccuracy</xsl:with-param></xsl:call-template>
		</xsl:for-each>
</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица74.E1" office:value-type="string">
								<text:p text:style-name="P14">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:for-each select="Encumbrance  | /STD_MP[not(/.//ExistParcel[SubParcels])]">				
				<xsl:call-template name="get_value"><xsl:with-param name="p_name">Type</xsl:with-param></xsl:call-template>
		</xsl:for-each>
</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:for-each></table:table><!--/xsl:for-each--><table:table table:name="Таблица75" table:style-name="Таблица75">
						<table:table-column table:style-name="Таблица75.A"/>
						<table:table-column table:style-name="Таблица75.B"/>
						<table:table-column table:style-name="Таблица75.C"/>
						<table:table-row table:style-name="Таблица75.1">
							<table:table-cell table:style-name="Таблица75.A1" table:number-columns-spanned="3" office:value-type="string">
								<text:p text:style-name="P9">6. Сведения о земельных участках, смежных с уточняемым земельным участком</text:p>
								<text:p text:style-name="P72">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">с кадастровым номером (обозначением) <text:s text:c="2"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T2">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T7"><xsl:call-template name="get_value"><xsl:with-param name="p_name">CadastralNumber</xsl:with-param></xsl:call-template>		</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T7"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица75.2">
							<table:table-cell table:style-name="Таблица75.A2" office:value-type="string">
								<text:p text:style-name="P9">Обозначение характерной точки или части границы</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица75.B2" office:value-type="string">
								<text:p text:style-name="P9">Кадастровые номера земельных участков, смежных с уточняемым (образуемым) земельным участком</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица75.C2" office:value-type="string">
								<text:p text:style-name="P9">Сведения о правообладателях смежных земельных участков</text:p>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица75.3">
							<table:table-cell table:style-name="Таблица75.A2" office:value-type="string">
								<text:p text:style-name="P9">1</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица75.B2" office:value-type="string">
								<text:p text:style-name="P9">2</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица75.C3" office:value-type="string">
								<text:p text:style-name="P9">3</text:p>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица75.4">
							<table:table-cell table:style-name="Таблица75.A2" office:value-type="string">
								<text:p text:style-name="P5">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T13">-</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица75.B2" office:value-type="string">
								<text:p text:style-name="P5">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T13">-</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица75.C4" office:value-type="string">
								<text:p text:style-name="P5">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T13">-</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table>		</xsl:for-each>		
</xsl:if>
<xsl:if test="/.//NewSubParcel"><text:p text:style-name="Text_20_body">
						<text:s/>
					</text:p><text:p text:style-name="P43"/><text:p text:style-name="P43"/><table:table table:name="Таблица42" table:style-name="Таблица42">
						<table:table-column table:style-name="Таблица42.A"/>
						<table:table-row table:style-name="Таблица42.1">
							<table:table-cell table:style-name="Таблица42.A1" office:value-type="string">
								<text:p text:style-name="P84"><text:bookmark-start text:name="Оглавление_ОбразуемыеЧасти"/>Сведения об образуемых частях земельного участка<text:bookmark-end text:name="Оглавление_ОбразуемыеЧасти"/></text:p>
							</table:table-cell>
						</table:table-row>
					</table:table>	<xsl:for-each select="/.//NewSubParcel[not(CadastralNumber_Parcel = preceding::CadastralNumber_Parcel)] | /STD_MP[not(/.//NewSubParcel)]"><table:table table:name="Таблица79" table:style-name="Таблица79">
						<table:table-column table:style-name="Таблица79.A"/>
						<table:table-row>
							<table:table-cell table:style-name="Таблица79.A1" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Кадастровый номер земельного участка <text:s/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T27">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T4"><xsl:call-template name="get_value"><xsl:with-param name="p_name">CadastralNumber_Parcel</xsl:with-param></xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T4"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица79.2">
							<table:table-cell table:style-name="Таблица79.A2" office:value-type="string">
								<text:p text:style-name="P9">1. Сведения о местоположении границы образуемой части земельного участка</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table>		<xsl:for-each select="/.//NewSubParcel[CadastralNumber_Parcel = ./CadastralNumber_Parcel] | /STD_MP[not(/.//NewSubParcel)]"><table:table table:name="Таблица80" table:style-name="Таблица80">
						<table:table-column table:style-name="Таблица80.A"/>
						<table:table-column table:style-name="Таблица80.B"/>
						<table:table-column table:style-name="Таблица80.C"/>
						<table:table-column table:style-name="Таблица80.D"/>
						<table:table-column table:style-name="Таблица80.E"/>
						<table:table-row table:style-name="Таблица80.1">
							<table:table-cell table:style-name="Таблица80.A1" table:number-columns-spanned="5" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Обозначение части <text:s/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T27">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T4"><xsl:call-template name="get_value"><xsl:with-param name="p_name">Definition</xsl:with-param></xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T4"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица80.2">
							<table:table-cell table:style-name="Таблица80.A2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P9">Обозначение характерных точек границы</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица80.B2" table:number-columns-spanned="2" office:value-type="string">
								<text:p text:style-name="P9">Координаты, м</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица80.B2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Средняя квадратическая погрешность положения характерной точки (М</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">t</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">), м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица80.E2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P9">Описание закрепления точки</text:p>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица80.3">
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица80.B2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T6">X</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица80.B2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T6">Y</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
					</table:table><table:table table:name="Таблица78" table:style-name="Таблица78"><table:table-column table:style-name="Таблица78.A"/><table:table-column table:style-name="Таблица78.B"/><table:table-column table:style-name="Таблица78.C"/><table:table-column table:style-name="Таблица78.D"/><table:table-column table:style-name="Таблица78.E"/><table:table-header-rows>
							<table:table-row table:style-name="Таблица78.1">
								<table:table-cell table:style-name="Таблица78.A1" office:value-type="string">
									<text:p text:style-name="P9">1</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица78.B1" office:value-type="string">
									<text:p text:style-name="P9">2</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица78.B1" office:value-type="string">
									<text:p text:style-name="P9">3</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица78.B1" office:value-type="string">
									<text:p text:style-name="P9">4</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица78.E1" office:value-type="string">
									<text:p text:style-name="P9">5</text:p>
								</table:table-cell>
							</table:table-row>
						</table:table-header-rows><!--row-code-->
			<xsl:for-each select="Entity_Spatial/Spatial_Element | /STD_MP[not(/.//NewSubParcel)]">
<xsl:variable name="v_element_pos" select="number(1.5 - position())"/>
				<xsl:for-each select="Spelement_Unit/NewOrdinate | /STD_MP[not(/.//NewSubParcel)]">
<xsl:sort select="$v_element_pos*position()" data-type="number" order="descending"/>
<table:table-row table:style-name="Таблица78.2">
							<table:table-cell table:style-name="Таблица78.A3" office:value-type="float" office:value="0">
								<text:p text:style-name="P72">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="point_name"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица78.B3" office:value-type="float" office:value="0">
								<text:p text:style-name="P53">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:if test="@X">
<xsl:value-of select="format-number(@X,'#0.00')"/>
</xsl:if>
<xsl:if test="not(@X)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица78.C3" office:value-type="float" office:value="0">
								<text:p text:style-name="P53">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:if test="@Y">
<xsl:value-of select="format-number(@Y,'#0.00')"/>
</xsl:if>
<xsl:if test="not(@Y)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица78.D3" office:value-type="float" office:value="0">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="get_value"><xsl:with-param name="p_name">Delta_Geopoint</xsl:with-param></xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица78.E3" office:value-type="float" office:value="0">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><!--xsl:call-template name="get_value"><xsl:with-param name="p_name">Geopoint_Zacrep</xsl:with-param></xsl:call-template-->

<xsl:call-template name="get_dict">
<xsl:with-param name="p_code">
<xsl:value-of select="@Geopoint_Zacrep"/>
</xsl:with-param>
</xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->			
				</xsl:for-each>
		<xsl:if test="position() != last()"><table:table-row table:style-name="Таблица78.2">
							<table:table-cell table:style-name="Таблица78.A6" table:number-columns-spanned="5" office:value-type="string">
								<text:p text:style-name="P72"/>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row><!--row-code-->							
</xsl:if>
			</xsl:for-each>	
</table:table></xsl:for-each>
</xsl:for-each><table:table table:name="Таблица77" table:style-name="Таблица77">
						<table:table-column table:style-name="Таблица77.A"/>
						<table:table-column table:style-name="Таблица77.B"/>
						<table:table-column table:style-name="Таблица77.C"/>
						<table:table-column table:style-name="Таблица77.D"/>
						<table:table-column table:style-name="Таблица77.E"/>
						<table:table-row table:style-name="Таблица77.1">
							<table:table-cell table:style-name="Таблица77.A1" table:number-columns-spanned="5" office:value-type="string">
								<text:p text:style-name="P91">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">2. Общие сведения о частях земельного участка</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица77.2">
							<table:table-cell table:style-name="Таблица77.A2" office:value-type="string">
								<text:p text:style-name="P9">№ п/п</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица77.B2" office:value-type="string">
								<text:p text:style-name="P9">Учетный номер или обозначение части</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица77.B2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">Площадь (Р), м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T22">2</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
								<text:p text:style-name="P9"/>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица77.B2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">±∆Р, м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T22">2</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица77.E2" office:value-type="string">
								<text:p text:style-name="P9">Характеристика части</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table><table:table table:name="Таблица76" table:style-name="Таблица76"><table:table-column table:style-name="Таблица76.A"/><table:table-column table:style-name="Таблица76.B"/><table:table-column table:style-name="Таблица76.C"/><table:table-column table:style-name="Таблица76.D"/><table:table-column table:style-name="Таблица76.E"/><table:table-row table:style-name="Таблица76.1">
							<table:table-cell table:style-name="Таблица76.A1" office:value-type="string">
								<text:p text:style-name="P9">1</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица76.B1" office:value-type="string">
								<text:p text:style-name="P9">2</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица76.B1" office:value-type="string">
								<text:p text:style-name="P9">3</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица76.B1" office:value-type="string">
								<text:p text:style-name="P9">4</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица76.E1" office:value-type="string">
								<text:p text:style-name="P9">5</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
	<xsl:for-each select="STD_MP/Package/NewSubParcel | /STD_MP[not(/.//NewSubParcel)]"><table:table-row table:style-name="Таблица76.1">
							<table:table-cell table:style-name="Таблица76.A3" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:if test="self::NewSubParcel">
<xsl:value-of select="position()"/>
</xsl:if>
<xsl:if test="not(self::NewSubParcel)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица76.B3" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="get_value"><xsl:with-param name="p_name">Definition</xsl:with-param></xsl:call-template>	</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица76.B3" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:for-each select="Area">
<xsl:call-template name="get_value"><xsl:with-param name="p_name">Area</xsl:with-param></xsl:call-template>	
</xsl:for-each></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица76.B3" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:for-each select="Area">
<xsl:call-template name="get_value"><xsl:with-param name="p_name">Innccuracy</xsl:with-param></xsl:call-template>	
</xsl:for-each></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица76.E3" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:for-each select="Encumbrance">
<xsl:call-template name="get_dict">
<xsl:with-param name="p_code">
<xsl:value-of select="Type"/>
</xsl:with-param>
</xsl:call-template>
</xsl:for-each></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->	
	</xsl:for-each>
</table:table></xsl:if><text:p text:style-name="Text_20_body"/><text:p text:style-name="P100"/><text:p text:style-name="P43"/><table:table table:name="Таблица44" table:style-name="Таблица44">
						<table:table-column table:style-name="Таблица44.A"/>
						<table:table-column table:style-name="Таблица44.B"/>
						<table:table-row table:style-name="Таблица44.1">
							<table:table-cell table:style-name="Таблица44.A1" office:value-type="string">
								<text:p text:style-name="P12"><text:bookmark-start text:name="Оглавление_ЗаключениеКадастровогоИнженера"/>Заключение кадастрового инженера<text:bookmark-end text:name="Оглавление_ЗаключениеКадастровогоИнженера"/></text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица44.B1" office:value-type="string">
								<text:p text:style-name="P44"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица44.2">
							<table:table-cell table:style-name="Таблица44.A2" office:value-type="string">
								<text:p text:style-name="P45"><xsl:value-of select="STD_MP/Conclusion"/></text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица44.B2" office:value-type="string">
								<text:p text:style-name="P44"/>
							</table:table-cell>
						</table:table-row>
					</table:table><text:p text:style-name="Text_20_body"/></office:text>
			</office:body>
		</office:document-content>
	</xsl:template></xsl:stylesheet>