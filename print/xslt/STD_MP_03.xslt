<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:anim="urn:oasis:names:tc:opendocument:xmlns:animation:1.0" xmlns:calcext="urn:org:documentfoundation:names:experimental:calc:xmlns:calcext:1.0" xmlns:chart="urn:oasis:names:tc:opendocument:xmlns:chart:1.0" xmlns:config="urn:oasis:names:tc:opendocument:xmlns:config:1.0" xmlns:css3t="http://www.w3.org/TR/css3-text/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dom="http://www.w3.org/2001/xml-events" xmlns:dr3d="urn:oasis:names:tc:opendocument:xmlns:dr3d:1.0" xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0" xmlns:drawooo="http://openoffice.org/2010/draw" xmlns:ext="http://exslt.org/common" xmlns:field="urn:openoffice:names:experimental:ooo-ms-interop:xmlns:field:1.0" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0" xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0" xmlns:formx="urn:openoffice:names:experimental:ooxml-odf-interop:xmlns:form:1.0" xmlns:grddl="http://www.w3.org/2003/g/data-view#" xmlns:math="http://www.w3.org/1998/Math/MathML" xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0" xmlns:number="urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0" xmlns:of="urn:oasis:names:tc:opendocument:xmlns:of:1.2" xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" xmlns:officeooo="http://openoffice.org/2009/office" xmlns:ooo="http://openoffice.org/2004/office" xmlns:oooc="http://openoffice.org/2004/calc" xmlns:ooow="http://openoffice.org/2004/writer" xmlns:presentation="urn:oasis:names:tc:opendocument:xmlns:presentation:1.0" xmlns:rpt="http://openoffice.org/2005/report" xmlns:script="urn:oasis:names:tc:opendocument:xmlns:script:1.0" xmlns:smil="urn:oasis:names:tc:opendocument:xmlns:smil-compatible:1.0" xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0" xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0" xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" xmlns:tableooo="http://openoffice.org/2009/table" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" xmlns:xforms="http://www.w3.org/2002/xforms" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"><xsl:output method="xml" version="1.0" encoding="UTF-8"/> 	<xsl:variable name="crlf"><xsl:text>&#13;&#10;</xsl:text></xsl:variable>
		<xsl:variable name="v_dict">
		<!--Закрепление точки-->
				<xs:enumeration value="626001000000">
				<xs:annotation>
					<xs:documentation>Долговременный межевой знак</xs:documentation>
				</xs:annotation>
			</xs:enumeration>
			<xs:enumeration value="626002000000">
				<xs:annotation>
					<xs:documentation>Временный межевой знак</xs:documentation>
				</xs:annotation>
			</xs:enumeration>
			<xs:enumeration value="626003000000">
				<xs:annotation>
					<xs:documentation>-</xs:documentation>
				</xs:annotation>
			</xs:enumeration>
<!--Категории земель-->
			<xs:enumeration value="003001000000">
				<xs:annotation>
					<xs:documentation>Земли сельскохозяйственного назначения</xs:documentation>
				</xs:annotation>
			</xs:enumeration>
			<xs:enumeration value="003002000000">
				<xs:annotation>
					<xs:documentation>Земли населенных пунктов</xs:documentation>
				</xs:annotation>
			</xs:enumeration>
			<xs:enumeration value="003003000000">
				<xs:annotation>
					<xs:documentation>Земли промышленности, энергетики, транспорта, связи, радиовещания, телевидения, информатики, земли для обеспечения космической деятельности, земли обороны, безопасности и земли иного специального назначения</xs:documentation>
				</xs:annotation>
			</xs:enumeration>
			<xs:enumeration value="003004000000">
				<xs:annotation>
					<xs:documentation>Земли особо охраняемых территорий и объектов</xs:documentation>
				</xs:annotation>
			</xs:enumeration>
			<xs:enumeration value="003005000000">
				<xs:annotation>
					<xs:documentation>Земли лесного фонда</xs:documentation>
				</xs:annotation>
			</xs:enumeration>
			<xs:enumeration value="003006000000">
				<xs:annotation>
					<xs:documentation>Земли водного фонда</xs:documentation>
				</xs:annotation>
			</xs:enumeration>
			<xs:enumeration value="003007000000">
				<xs:annotation>
					<xs:documentation>Земли запаса</xs:documentation>
				</xs:annotation>
			</xs:enumeration>
			<xs:enumeration value="003008000000">
				<xs:annotation>
					<xs:documentation>Категория не установлена</xs:documentation>
				</xs:annotation>
			</xs:enumeration>

				
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
		<xsl:variable name="p_point">
			<xsl:if test="$p1">
				<xsl:value-of select="number(./@Point1)"/>
			</xsl:if>
			<xsl:if test="$p2">
				<xsl:value-of select="number(./@Point2)"/>
			</xsl:if>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="not($p_spatial)">
				<xsl:value-of select="'-'"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="./ancestor::*/Spatial_Element[$p_spatial]/.//Ordinate[@Ord_Nmb = $p_point]/@Point_Pref"/>
				<xsl:value-of select="./ancestor::*/Spatial_Element[$p_spatial]/.//Ordinate[@Ord_Nmb = $p_point]/@Num_Geopoint"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template><xsl:template name="tpl_border_point1">
		<xsl:variable name="p_point" select="./@Point1"/>
		<xsl:variable name="p_spatial" select="./@Spatial"/>
		<xsl:value-of select="./../../Spatial_Element[$p_spatial]/Spelement_Unit/Ordinate[@Ord_Nmb = $p_point]/@Point_Pref"/>
		<xsl:value-of select="./../../Spatial_Element[$p_spatial]/Spelement_Unit/Ordinate[@Ord_Nmb = $p_point]/@Num_Geopoint"/>
	</xsl:template><xsl:template name="tpl_border_point2">
		<xsl:variable name="p_point" select="./@Point2"/>
		<xsl:variable name="p_spatial" select="./@Spatial"/>
		<xsl:value-of select="./../../Spatial_Element[$p_spatial]/Spelement_Unit/Ordinate[@Ord_Nmb = $p_point]/@Point_Pref"/>
		<xsl:value-of select="./../../Spatial_Element[$p_spatial]/Spelement_Unit/Ordinate[@Ord_Nmb = $p_point]/@Num_Geopoint"/>
	</xsl:template><xsl:template name="mp_type">
		<xsl:choose>
			<xsl:when test="document('STD_MP_ADD.xml')//title/mp_type">
				<xsl:value-of select="document('STD_MP_ADD.xml')//title/mp_type"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'—'"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template><xsl:template name="mp_target">
		<xsl:choose>
			<xsl:when test="document('STD_MP_ADD.xml')//title/mp_target">
				<xsl:value-of select="document('STD_MP_ADD.xml')//title/mp_target"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'—'"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template><xsl:template match="//eDocument/Sender" name="mp_client"><xsl:value-of select="@Name"/>,<xsl:value-of select="@Appointment"/>,<xsl:value-of select="@FIO"/>,e-mail:<xsl:value-of select="@E_Mail"/>,тел:<xsl:value-of select="@Telephone"/></xsl:template><xsl:template name="mp_client_date">
		<xsl:call-template name="format_date">
			<xsl:with-param name="p_date" select="//eDocument/Sender/@Date_Upload"/>
		</xsl:call-template>
	</xsl:template><xsl:template match="//Contractor/Cadastral_Engineer/FIO" name="mp_cad_fio"><xsl:value-of select="Surname"/> <xsl:value-of select="First"/> <xsl:value-of select="Patronymic"/></xsl:template><xsl:template match="//Contractor/Cadastral_Engineer/N_Certificate" name="mp_cad_cert">
		<xsl:value-of select="text()"/>
	</xsl:template><xsl:template match="//Contractor/Cadastral_Engineer/Telephone" name="mp_cad_phone">
		<xsl:value-of select="text()"/>
	</xsl:template><xsl:template match="//Contractor/Cadastral_Engineer" name="mp_cad_address"><xsl:value-of select="Address"/> <xsl:value-of select="E_mail"/></xsl:template><xsl:template match="//Contractor/Cadastral_Engineer/Organization/Name" name="mp_cad_org">
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
					<xsl:value-of select="'-'"/>
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
	</xsl:template><xsl:template match="/"><xsl:variable name="vPass1"><office:document-content>
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
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.B20" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.C20" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A21" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.B21" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.C21" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A22" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.B22" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.C22" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A23" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.B23" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.C23" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.25pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица9.A24" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-bottom="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="1.5pt double #000000"/>
				</style:style>
				<style:style style:name="Таблица9.B24" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-bottom="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="0.25pt solid #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="1.5pt double #000000"/>
				</style:style>
				<style:style style:name="Таблица9.C24" style:family="table-cell">
					<style:table-cell-properties style:border-line-width-right="0.018cm 0.018cm 0.018cm" style:border-line-width-bottom="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="0.25pt solid #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="1.5pt double #000000"/>
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
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
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
				<style:style style:name="Таблица54.A5" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.25pt solid #000000" fo:border-bottom="0.05pt solid #000000"/>
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
					<style:table-cell-properties style:vertical-align="bottom" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="none" fo:border-bottom="0.25pt solid #000000"/>
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
					<style:table-column-properties style:column-width="14.106cm"/>
				</style:style>
				<style:style style:name="Таблица44.B" style:family="table-column">
					<style:table-column-properties style:column-width="2.914cm"/>
				</style:style>
				<style:style style:name="Таблица44.C" style:family="table-column">
					<style:table-column-properties style:column-width="0.071cm"/>
				</style:style>
				<style:style style:name="Таблица44.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.896cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица44.A1" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.018cm" fo:padding-right="0.018cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="none"/>
				</style:style>
				<style:style style:name="Таблица44.B1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="1.5pt double #000000"/>
				</style:style>
				<style:style style:name="Таблица44.2" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.769cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица44.A2" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" style:border-line-width-top="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="1.5pt double #000000" fo:border-bottom="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица44.3" style:family="table-row">
					<style:table-row-properties style:min-row-height="1.058cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица44.A3" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width-left="0.018cm 0.018cm 0.018cm" style:border-line-width-right="0.018cm 0.018cm 0.018cm" style:border-line-width-bottom="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border-left="1.5pt double #000000" fo:border-right="1.5pt double #000000" fo:border-top="0.5pt solid #000000" fo:border-bottom="1.5pt double #000000"/>
				</style:style>
				<style:style style:name="Таблица44.4" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.28cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица49" style:family="table">
					<style:table-properties style:width="4.157cm" fo:margin-left="12.573cm" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица49.A" style:family="table-column">
					<style:table-column-properties style:column-width="4.157cm"/>
				</style:style>
				<style:style style:name="Таблица49.1" style:family="table-row">
					<style:table-row-properties style:min-row-height="0.661cm" style:use-optimal-row-height="false"/>
				</style:style>
				<style:style style:name="Таблица49.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" style:border-line-width="0.018cm 0.018cm 0.018cm" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="1.5pt double #000000"/>
				</style:style>
				<style:style style:name="Таблица50" style:family="table">
					<style:table-properties style:width="17.392cm" fo:margin-left="-0.199cm" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица50.A" style:family="table-column">
					<style:table-column-properties style:column-width="2.863cm"/>
				</style:style>
				<style:style style:name="Таблица50.B" style:family="table-column">
					<style:table-column-properties style:column-width="3.17cm"/>
				</style:style>
				<style:style style:name="Таблица50.C" style:family="table-column">
					<style:table-column-properties style:column-width="4.445cm"/>
				</style:style>
				<style:style style:name="Таблица50.D" style:family="table-column">
					<style:table-column-properties style:column-width="2.54cm"/>
				</style:style>
				<style:style style:name="Таблица50.E" style:family="table-column">
					<style:table-column-properties style:column-width="1.905cm"/>
				</style:style>
				<style:style style:name="Таблица50.F" style:family="table-column">
					<style:table-column-properties style:column-width="2.469cm"/>
				</style:style>
				<style:style style:name="Таблица50.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица50.A2" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица50.B2" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица50.C2" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица50.D2" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица50.E2" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица50.F2" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица51" style:family="table">
					<style:table-properties style:width="17.392cm" fo:margin-left="-0.199cm" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица51.A" style:family="table-column">
					<style:table-column-properties style:column-width="5.78cm"/>
				</style:style>
				<style:style style:name="Таблица51.C" style:family="table-column">
					<style:table-column-properties style:column-width="5.831cm"/>
				</style:style>
				<style:style style:name="Таблица51.A1" style:family="table-cell">
					<style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица51.A3" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица51.B3" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица51.C3" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.5pt solid #000000"/>
				</style:style>
				<style:style style:name="Таблица52" style:family="table">
					<style:table-properties style:width="17.392cm" fo:margin-left="-0.199cm" table:align="left"/>
				</style:style>
				<style:style style:name="Таблица52.A" style:family="table-column">
					<style:table-column-properties style:column-width="3.782cm"/>
				</style:style>
				<style:style style:name="Таблица52.B" style:family="table-column">
					<style:table-column-properties style:column-width="3.787cm"/>
				</style:style>
				<style:style style:name="Таблица52.C" style:family="table-column">
					<style:table-column-properties style:column-width="5.045cm"/>
				</style:style>
				<style:style style:name="Таблица52.D" style:family="table-column">
					<style:table-column-properties style:column-width="4.778cm"/>
				</style:style>
				<style:style style:name="Таблица52.A1" style:family="table-cell">
					<style:table-cell-properties fo:padding-left="0.191cm" fo:padding-right="0.191cm" fo:padding-top="0cm" fo:padding-bottom="0cm" fo:border="0.5pt solid #000000"/>
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
							<style:tab-stop style:position="4.83cm"/>
						</style:tab-stops>
					</style:paragraph-properties>
				</style:style>
				<style:style style:name="P4" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false">
						<style:tab-stops>
							<style:tab-stop style:position="4.445cm"/>
						</style:tab-stops>
					</style:paragraph-properties>
					<style:text-properties officeooo:paragraph-rsid="001c0272"/>
				</style:style>
				<style:style style:name="P5" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties officeooo:paragraph-rsid="00a37f72"/>
				</style:style>
				<style:style style:name="P6" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties officeooo:paragraph-rsid="00ca342c"/>
				</style:style>
				<style:style style:name="P7" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties officeooo:paragraph-rsid="0149f8b9"/>
				</style:style>
				<style:style style:name="P8" style:family="paragraph" style:parent-style-name="Обычный">
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P9" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P10" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false">
						<style:tab-stops>
							<style:tab-stop style:position="4.128cm"/>
						</style:tab-stops>
					</style:paragraph-properties>
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P11" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false" fo:keep-together="always"/>
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P12" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false">
						<style:tab-stops>
							<style:tab-stop style:position="4.83cm"/>
						</style:tab-stops>
					</style:paragraph-properties>
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P13" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-weight="bold" officeooo:paragraph-rsid="0042cd94" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P14" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-weight="bold" officeooo:paragraph-rsid="005298f7" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P15" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-weight="bold" officeooo:paragraph-rsid="00a37f72" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P16" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties>
						<style:tab-stops>
							<style:tab-stop style:position="4.83cm"/>
						</style:tab-stops>
					</style:paragraph-properties>
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P17" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-weight="bold" officeooo:rsid="004308c8" officeooo:paragraph-rsid="004308c8" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P18" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold" style:font-weight-complex="bold"/>
				</style:style>
				<style:style style:name="P19" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="start" style:justify-single-word="false"/>
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P20" style:family="paragraph" style:parent-style-name="Обычный">
					<style:text-properties fo:language="en" fo:country="US"/>
				</style:style>
				<style:style style:name="P21" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US"/>
				</style:style>
				<style:style style:name="P22" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" style:text-underline-style="solid" style:text-underline-width="auto" style:text-underline-color="font-color" style:text-underline-mode="continuous" style:text-overline-mode="continuous" style:text-line-through-mode="continuous"/>
				</style:style>
				<style:style style:name="P23" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false">
						<style:tab-stops>
							<style:tab-stop style:position="4.83cm"/>
						</style:tab-stops>
					</style:paragraph-properties>
					<style:text-properties fo:language="en" fo:country="US" fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P24" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties>
						<style:tab-stops>
							<style:tab-stop style:position="4.83cm"/>
						</style:tab-stops>
					</style:paragraph-properties>
					<style:text-properties fo:language="en" fo:country="US" fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P25" style:family="paragraph" style:parent-style-name="Обычный">
					<style:text-properties fo:language="en" fo:country="US" fo:font-weight="bold" officeooo:rsid="002f9dc8" officeooo:paragraph-rsid="002f9dc8" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P26" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" fo:font-weight="bold" officeooo:rsid="004308c8" officeooo:paragraph-rsid="004308c8" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P27" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" fo:font-weight="bold" officeooo:rsid="0035807c" officeooo:paragraph-rsid="0035807c" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P28" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" fo:font-weight="bold" officeooo:rsid="0124a375" officeooo:paragraph-rsid="0124a375" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P29" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" fo:font-weight="normal" officeooo:rsid="0057529e" officeooo:paragraph-rsid="0057529e" style:font-weight-asian="normal" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="P30" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" fo:font-weight="normal" officeooo:rsid="00580f6a" officeooo:paragraph-rsid="00580f6a" style:font-weight-asian="normal" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="P31" style:family="paragraph" style:parent-style-name="Обычный">
					<style:text-properties fo:language="en" fo:country="US" style:text-underline-style="solid" style:text-underline-type="double" style:text-underline-width="auto" style:text-underline-color="font-color"/>
				</style:style>
				<style:style style:name="P32" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" officeooo:rsid="00532b2a" officeooo:paragraph-rsid="00532b2a"/>
				</style:style>
				<style:style style:name="P33" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" officeooo:rsid="00570822" officeooo:paragraph-rsid="00570822"/>
				</style:style>
				<style:style style:name="P34" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" officeooo:rsid="00a5ec8c" officeooo:paragraph-rsid="00a5ec8c"/>
				</style:style>
				<style:style style:name="P35" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" officeooo:rsid="0124a375" officeooo:paragraph-rsid="0124a375"/>
				</style:style>
				<style:style style:name="P36" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties style:text-underline-style="solid" style:text-underline-width="auto" style:text-underline-color="font-color" style:text-underline-mode="continuous" style:text-overline-mode="continuous" style:text-line-through-mode="continuous"/>
				</style:style>
				<style:style style:name="P37" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:color="#4f81bd" fo:language="en" fo:country="US" fo:font-style="italic" style:text-underline-style="solid" style:text-underline-width="auto" style:text-underline-color="font-color" style:text-underline-mode="continuous" style:text-overline-mode="continuous" style:text-line-through-mode="continuous" style:font-style-asian="italic"/>
				</style:style>
				<style:style style:name="P38" style:family="paragraph" style:parent-style-name="Обычный">
					<style:text-properties fo:color="#4f81bd" fo:font-style="italic" style:text-underline-style="solid" style:text-underline-width="auto" style:text-underline-color="font-color" style:text-underline-mode="continuous" style:text-overline-mode="continuous" style:text-line-through-mode="continuous" style:font-style-asian="italic"/>
				</style:style>
				<style:style style:name="P39" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:color="#4f81bd" fo:font-style="italic" style:text-underline-style="solid" style:text-underline-width="auto" style:text-underline-color="font-color" style:text-underline-mode="continuous" style:text-overline-mode="continuous" style:text-line-through-mode="continuous" style:font-style-asian="italic"/>
				</style:style>
				<style:style style:name="P40" style:family="paragraph" style:parent-style-name="Обычный">
					<style:text-properties text:display="none"/>
				</style:style>
				<style:style style:name="P41" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties>
						<style:tab-stops>
							<style:tab-stop style:position="4.83cm"/>
						</style:tab-stops>
					</style:paragraph-properties>
				</style:style>
				<style:style style:name="P42" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-style="italic" style:text-underline-style="solid" style:text-underline-width="auto" style:text-underline-color="font-color" fo:font-weight="normal" style:font-style-asian="italic" style:font-weight-asian="normal" style:font-style-complex="italic" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="P43" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="justify" style:justify-single-word="false">
						<style:tab-stops>
							<style:tab-stop style:position="4.83cm"/>
						</style:tab-stops>
					</style:paragraph-properties>
				</style:style>
				<style:style style:name="P44" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="end" style:justify-single-word="false"/>
					<style:text-properties fo:font-size="12pt" style:font-size-asian="12pt" style:font-size-complex="12pt"/>
				</style:style>
				<style:style style:name="P45" style:family="paragraph" style:parent-style-name="Обычный">
					<style:text-properties fo:font-weight="normal" style:font-weight-asian="normal" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="P46" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-weight="normal" style:font-weight-asian="normal" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="P47" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-weight="normal" officeooo:paragraph-rsid="007a7038" style:font-weight-asian="normal" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="P48" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-weight="normal" officeooo:paragraph-rsid="0120506d" style:font-weight-asian="normal" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="P49" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="start" style:justify-single-word="false"/>
					<style:text-properties fo:font-weight="normal" style:font-weight-asian="normal" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="P50" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-style="normal" fo:font-weight="normal" style:font-style-asian="normal" style:font-weight-asian="normal" style:font-style-complex="normal" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="P51" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="end" style:justify-single-word="false"/>
				</style:style>
				<style:style style:name="P52" style:family="paragraph" style:parent-style-name="Обычный">
					<style:text-properties officeooo:paragraph-rsid="00a5ec8c"/>
				</style:style>
				<style:style style:name="P53" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="start" style:justify-single-word="false"/>
				</style:style>
				<style:style style:name="P54" style:family="paragraph" style:parent-style-name="Обычный">
					<style:text-properties style:use-window-font-color="true"/>
				</style:style>
				<style:style style:name="P55" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties style:use-window-font-color="true" fo:font-size="14pt" fo:font-weight="bold" style:font-size-asian="14pt" style:font-weight-asian="bold" style:font-size-complex="14pt"/>
				</style:style>
				<style:style style:name="P56" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="justify" style:justify-single-word="false"/>
					<style:text-properties style:use-window-font-color="true"/>
				</style:style>
				<style:style style:name="P57" style:family="paragraph" style:parent-style-name="Обычный">
					<style:text-properties officeooo:paragraph-rsid="012d7da6"/>
				</style:style>
				<style:style style:name="P58" style:family="paragraph" style:parent-style-name="Header">
					<style:text-properties fo:font-size="1pt" style:font-size-asian="1pt" style:font-size-complex="1pt"/>
				</style:style>
				<style:style style:name="P59" style:family="paragraph" style:parent-style-name="Header">
					<style:text-properties style:font-size-complex="1pt"/>
				</style:style>
				<style:style style:name="P60" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0cm" fo:margin-right="-0.365cm" fo:text-indent="0cm" style:auto-text-indent="false"/>
				</style:style>
				<style:style style:name="P61" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0cm" fo:margin-right="-1.191cm" fo:text-indent="0cm" style:auto-text-indent="false"/>
				</style:style>
				<style:style style:name="P62" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0.191cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P63" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0.191cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
				</style:style>
				<style:style style:name="P64" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0.191cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
					<style:text-properties officeooo:paragraph-rsid="007aa256"/>
				</style:style>
				<style:style style:name="P65" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0.191cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
					<style:text-properties officeooo:paragraph-rsid="01312073"/>
				</style:style>
				<style:style style:name="P66" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0.191cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
					<style:text-properties fo:language="en" fo:country="US" fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P67" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0.191cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
					<style:text-properties fo:language="en" fo:country="US" fo:font-weight="normal" officeooo:rsid="008535e8" officeooo:paragraph-rsid="008535e8" style:font-weight-asian="normal" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="P68" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0.191cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
					<style:text-properties fo:language="en" fo:country="US" fo:font-style="normal" style:text-underline-style="none" fo:font-weight="normal" officeooo:rsid="008535e8" officeooo:paragraph-rsid="008535e8" style:font-style-asian="normal" style:font-weight-asian="normal" style:font-style-complex="normal" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="P69" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0.191cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
					<style:text-properties fo:language="en" fo:country="US" officeooo:rsid="01312073" officeooo:paragraph-rsid="01312073"/>
				</style:style>
				<style:style style:name="P70" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0.191cm" fo:margin-right="0cm" fo:text-align="start" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
				</style:style>
				<style:style style:name="P71" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0.191cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false" fo:break-before="page">
						<style:tab-stops/>
					</style:paragraph-properties>
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P72" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:break-before="page"/>
				</style:style>
				<style:style style:name="P73" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:break-before="page"/>
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P74" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false" fo:break-before="page"/>
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P75" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false" fo:break-before="page"/>
					<style:text-properties fo:font-weight="bold" officeooo:paragraph-rsid="00a37f72" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P76" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:break-before="page">
						<style:tab-stops>
							<style:tab-stop style:position="4.83cm"/>
						</style:tab-stops>
					</style:paragraph-properties>
				</style:style>
				<style:style style:name="P77" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false" fo:break-before="page"/>
				</style:style>
				<style:style style:name="P78" style:family="paragraph" style:parent-style-name="Text_20_body">
					<style:paragraph-properties fo:break-before="page"/>
					<style:text-properties officeooo:paragraph-rsid="0163f546"/>
				</style:style>
				<style:style style:name="P79" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="1.199cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
				</style:style>
				<style:style style:name="P80" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="1.199cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P81" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0cm" fo:margin-right="-0.191cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false"/>
				</style:style>
				<style:style style:name="P82" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0cm" fo:margin-right="-0.261cm" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops>
							<style:tab-stop style:position="4.83cm"/>
						</style:tab-stops>
					</style:paragraph-properties>
				</style:style>
				<style:style style:name="P83" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="-0.318cm" fo:margin-right="0cm" fo:text-indent="0.318cm" style:auto-text-indent="false">
						<style:tab-stops>
							<style:tab-stop style:position="5.147cm"/>
						</style:tab-stops>
					</style:paragraph-properties>
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P84" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="-0.318cm" fo:margin-right="0cm" fo:text-indent="0.318cm" style:auto-text-indent="false">
						<style:tab-stops>
							<style:tab-stop style:position="5.147cm"/>
						</style:tab-stops>
					</style:paragraph-properties>
					<style:text-properties fo:language="en" fo:country="US" fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="P85" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="1cm" fo:margin-right="0cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
					<style:text-properties officeooo:paragraph-rsid="0024d619"/>
				</style:style>
				<style:style style:name="P86" style:family="paragraph" style:parent-style-name="Standard">
					<style:text-properties officeooo:paragraph-rsid="00a37f72"/>
				</style:style>
				<style:style style:name="P87" style:family="paragraph" style:parent-style-name="Standard">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" officeooo:rsid="015ba078" officeooo:paragraph-rsid="015ba078"/>
				</style:style>
				<style:style style:name="P88" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="0.185cm" fo:margin-right="-0.213cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
						<style:tab-stops/>
					</style:paragraph-properties>
				</style:style>
				<style:style style:name="P89" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:margin-left="-0.284cm" fo:margin-right="-0.002cm" fo:text-align="center" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false"/>
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold" style:font-weight-complex="bold"/>
				</style:style>
				<style:style style:name="P90" style:family="paragraph" style:parent-style-name="Ввод_20_кода">
					<style:text-properties officeooo:paragraph-rsid="00a37f72"/>
				</style:style>
				<style:style style:name="P91" style:family="paragraph" style:parent-style-name="Standard" style:master-page-name="">
					<style:paragraph-properties style:page-number="auto" fo:break-before="auto" fo:break-after="auto"/>
					<style:text-properties officeooo:paragraph-rsid="00aa1879" text:display="none"/>
				</style:style>
				<style:style style:name="P92" style:family="paragraph" style:parent-style-name="Text_20_body" style:master-page-name="">
					<style:paragraph-properties style:page-number="auto" fo:break-before="auto" fo:break-after="auto"/>
				</style:style>
				<style:style style:name="P93" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:break-before="auto" fo:break-after="auto"/>
					<style:text-properties text:display="none"/>
				</style:style>
				<style:style style:name="P94" style:family="paragraph" style:parent-style-name="Text_20_body">
					<style:paragraph-properties fo:break-before="auto" fo:break-after="auto"/>
				</style:style>
				<style:style style:name="P95" style:family="paragraph" style:parent-style-name="Ввод_20_кода">
					<style:paragraph-properties text:number-lines="false" text:line-number="0"/>
				</style:style>
				<style:style style:name="P96" style:family="paragraph" style:parent-style-name="Text_20_body">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" officeooo:paragraph-rsid="0155535c"/>
				</style:style>
				<style:style style:name="P97" style:family="paragraph" style:parent-style-name="Text_20_body">
					<style:text-properties officeooo:paragraph-rsid="0163f546"/>
				</style:style>
				<style:style style:name="P98" style:family="paragraph" style:parent-style-name="Ввод_20_кода">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false" fo:background-color="transparent">
						<style:background-image/>
					</style:paragraph-properties>
					<style:text-properties fo:language="en" fo:country="US" officeooo:rsid="01329608" officeooo:paragraph-rsid="01329608"/>
				</style:style>
				<style:style style:name="P99" style:family="paragraph" style:parent-style-name="Обычный" style:list-style-name="Numbering_20_1">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
				</style:style>
				<style:style style:name="P100" style:family="paragraph" style:parent-style-name="Обычный" style:list-style-name="Numbering_20_1">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" officeooo:paragraph-rsid="01036e49"/>
				</style:style>
				<style:style style:name="P101" style:family="paragraph" style:parent-style-name="Обычный" style:list-style-name="Numbering_20_1">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" officeooo:paragraph-rsid="0113a807"/>
				</style:style>
				<style:style style:name="P102" style:family="paragraph" style:parent-style-name="Обычный" style:list-style-name="Numbering_20_1">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:language="en" fo:country="US" officeooo:paragraph-rsid="01148832"/>
				</style:style>
				<style:style style:name="P103" style:family="paragraph" style:parent-style-name="Обычный" style:list-style-name="Numbering_20_1">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false">
						<style:tab-stops/>
					</style:paragraph-properties>
					<style:text-properties fo:language="en" fo:country="US" officeooo:paragraph-rsid="0113a807"/>
				</style:style>
				<style:style style:name="P104" style:family="paragraph" style:parent-style-name="Обычный">
					<style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
					<style:text-properties fo:font-weight="normal" officeooo:paragraph-rsid="0176ec16" style:font-weight-asian="normal" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="P105" style:family="paragraph" style:parent-style-name="Обычный" style:master-page-name="MP0">
					<style:paragraph-properties fo:margin-left="0cm" fo:margin-right="-0.252cm" fo:text-indent="0cm" style:auto-text-indent="false" style:page-number="auto" fo:break-before="page"/>
				</style:style>
				<style:style style:name="P106" style:family="paragraph" style:parent-style-name="Обычный" style:master-page-name="MP13">
					<style:paragraph-properties fo:text-align="justify" style:justify-single-word="false" style:page-number="auto" fo:break-before="page"/>
				</style:style>
				<style:style style:name="T1" style:family="text">
					<style:text-properties style:text-underline-style="solid" style:text-underline-width="auto" style:text-underline-color="font-color" style:text-underline-mode="continuous" style:text-overline-mode="continuous" style:text-line-through-mode="continuous"/>
				</style:style>
				<style:style style:name="T2" style:family="text">
					<style:text-properties style:text-underline-style="solid" style:text-underline-width="auto" style:text-underline-color="font-color" fo:font-weight="bold" style:text-underline-mode="continuous" style:text-overline-mode="continuous" style:text-line-through-mode="continuous" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="T3" style:family="text">
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="T4" style:family="text">
					<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold" style:font-weight-complex="bold"/>
				</style:style>
				<style:style style:name="T5" style:family="text">
					<style:text-properties fo:font-weight="bold" style:text-underline-mode="continuous" style:text-overline-mode="continuous" style:text-line-through-mode="continuous" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="T6" style:family="text">
					<style:text-properties fo:language="en" fo:country="US"/>
				</style:style>
				<style:style style:name="T7" style:family="text">
					<style:text-properties fo:language="en" fo:country="US" fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="T8" style:family="text">
					<style:text-properties fo:language="en" fo:country="US" fo:font-weight="bold" officeooo:rsid="00ca342c" style:font-weight-asian="bold"/>
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
					<style:text-properties fo:font-style="italic" style:font-style-asian="italic"/>
				</style:style>
				<style:style style:name="T18" style:family="text">
					<style:text-properties style:font-name="Times New Roman CYR" fo:font-weight="bold" style:font-weight-asian="bold" style:font-name-complex="Times New Roman CYR" style:font-weight-complex="bold"/>
				</style:style>
				<style:style style:name="T19" style:family="text">
					<style:text-properties style:font-name="Times New Roman CYR" style:font-name-complex="Times New Roman CYR" style:font-weight-complex="bold"/>
				</style:style>
				<style:style style:name="T20" style:family="text">
					<style:text-properties style:text-position="sub 65%" fo:language="en" fo:country="US" fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="T21" style:family="text">
					<style:text-properties style:text-position="super 65%" fo:font-weight="bold" style:font-weight-asian="bold"/>
				</style:style>
				<style:style style:name="T22" style:family="text">
					<style:text-properties fo:font-size="14pt" fo:font-style="italic" fo:font-weight="bold" style:font-size-asian="14pt" style:font-style-asian="italic" style:font-weight-asian="bold" style:font-size-complex="14pt"/>
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
					<style:text-properties officeooo:rsid="01036e49"/>
				</style:style>
				<style:style style:name="T37" style:family="text">
					<style:text-properties style:use-window-font-color="true"/>
				</style:style>
				<style:style style:name="T38" style:family="text">
					<style:text-properties fo:font-size="10pt" fo:font-weight="normal" officeooo:rsid="0057529e" style:font-size-asian="10pt" style:font-weight-asian="normal" style:font-size-complex="10pt" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="T39" style:family="text">
					<style:text-properties fo:font-size="10pt" fo:language="en" fo:country="US" fo:font-weight="normal" officeooo:rsid="0149f8b9" style:font-size-asian="10pt" style:font-weight-asian="normal" style:font-size-complex="10pt" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="T40" style:family="text">
					<style:text-properties fo:font-size="10pt" fo:language="en" fo:country="US" officeooo:rsid="0149f8b9" style:font-size-asian="10pt" style:font-size-complex="10pt"/>
				</style:style>
				<style:style style:name="T41" style:family="text">
					<style:text-properties fo:font-size="10pt" officeooo:rsid="0057529e" style:font-size-asian="10pt" style:font-size-complex="10pt"/>
				</style:style>
				<style:style style:name="T42" style:family="text">
					<style:text-properties fo:font-size="9pt" officeooo:rsid="0057529e" style:font-size-asian="9pt" style:font-size-complex="9pt"/>
				</style:style>
				<style:style style:name="T43" style:family="text">
					<style:text-properties officeooo:rsid="01148832"/>
				</style:style>
				<style:style style:name="T44" style:family="text">
					<style:text-properties officeooo:rsid="012d7da6"/>
				</style:style>
				<style:style style:name="T45" style:family="text">
					<style:text-properties style:text-position="sub 58%"/>
				</style:style>
				<style:style style:name="T46" style:family="text">
					<style:text-properties style:text-position="super 80%"/>
				</style:style>
				<style:style style:name="T47" style:family="text">
					<style:text-properties style:text-position="0% 100%" fo:font-size="10pt" fo:language="en" fo:country="US" fo:font-weight="normal" officeooo:rsid="00532b2a" style:font-size-asian="10pt" style:font-weight-asian="normal" style:font-size-complex="10pt" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="T48" style:family="text">
					<style:text-properties style:text-position="0% 100%" fo:font-size="10pt" fo:language="en" fo:country="US" fo:font-weight="normal" officeooo:rsid="0149f8b9" style:font-size-asian="10pt" style:font-weight-asian="normal" style:font-size-complex="10pt" style:font-weight-complex="normal"/>
				</style:style>
				<style:style style:name="T49" style:family="text">
					<style:text-properties style:text-position="0% 100%" fo:font-size="10pt" fo:language="en" fo:country="US" officeooo:rsid="00532b2a" style:font-size-asian="10pt" style:font-size-complex="10pt"/>
				</style:style>
				<style:style style:name="T50" style:family="text">
					<style:text-properties style:text-position="0% 100%" fo:font-size="10pt" fo:language="en" fo:country="US" officeooo:rsid="0149f8b9" style:font-size-asian="10pt" style:font-size-complex="10pt"/>
				</style:style>
				<style:style style:name="T51" style:family="text">
					<style:text-properties officeooo:rsid="015f8065"/>
				</style:style>
				<style:style style:name="T52" style:family="text"/>
				<style:style style:name="Sect1" style:family="section">
					<style:section-properties style:writing-mode="lr-tb" fo:margin-left="0cm" fo:margin-right="0.252cm" style:editable="false">
						<style:columns fo:column-count="1" fo:column-gap="0cm"/>
					</style:section-properties>
				</style:style>
				<style:style style:name="Sect2" style:family="section">
					<style:section-properties style:writing-mode="lr-tb" fo:margin-left="0cm" fo:margin-right="0cm" style:editable="false">
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
					</text:sequence-decls><text:p text:style-name="P105"/><table:table table:name="Таблица8" table:style-name="Таблица8">
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
								<text:p text:style-name="P61">Всего листов <text:s/></text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="Обычный"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица8.2">
							<table:table-cell table:style-name="Таблица8.A2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P62">МЕЖЕВОЙ ПЛАН</text:p>
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
								<text:p text:style-name="P62">Титульный лист</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица8.B4" table:number-columns-spanned="2" office:value-type="string">
								<text:p text:style-name="P21">
									<text:s/>
								</text:p>
								<text:p text:style-name="P21"/>
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
										<text:span text:style-name="T3">1. Межевой план подготовлен в результате выполнения кадастровых работ в связи с:</text:span>
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
								<text:p text:style-name="P4">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T6">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T6"><xsl:call-template name="mp_type"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T6"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="P21"/>
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
										<text:span text:style-name="T6">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T6"><xsl:call-template name="mp_target"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T6"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="P21"/>
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
										<text:span text:style-name="T6">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T6"><xsl:apply-templates select="//eDocument/Sender"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T6"> </text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.A1" office:value-type="string">
								<text:p text:style-name="P21"/>
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
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T1"/>
									</text:span>
								</text:p>
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T1"/>
									</text:span>
								</text:p>
								<text:p text:style-name="P22"/>
								<text:p text:style-name="P36"/>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица8.D14" office:value-type="string">
								<text:p text:style-name="P20"/>
								<text:p text:style-name="P20"/>
								<text:p text:style-name="P20"/>
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
								<text:p text:style-name="P20"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица8.15">
							<table:table-cell table:style-name="Таблица8.A15" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T17">Место для оттиска печати заказчика кадастровых работ</text:span>
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
										<text:span text:style-name="T3">4. Сведения о кадастровом инженере:</text:span>
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
										<text:span text:style-name="T26"><xsl:apply-templates select="//Contractor/Cadastral_Engineer/FIO"/></text:span>
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
								<text:p text:style-name="P45"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row>
							<table:table-cell table:style-name="Таблица8.A18" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="Обычный">№ квалификационного аттестата кадастрового инженера <text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T28">
											<text:s text:c="2"/>
										</text:span>
									</text:span><text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T28"><xsl:apply-templates select="//Contractor/Cadastral_Engineer/N_Certificate"/></text:span>
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
										<text:span text:style-name="T10"><xsl:apply-templates select="//Contractor/Cadastral_Engineer/Telephone"/></text:span>
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
								<text:p text:style-name="P20"/>
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
										<text:span text:style-name="T29"><xsl:apply-templates select="//Contractor/Cadastral_Engineer"/></text:span>
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
								<text:p text:style-name="P20"/>
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
										<text:span text:style-name="T29"><xsl:apply-templates select="//Contractor/Cadastral_Engineer/Organization/Name"/></text:span>
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
								<text:p text:style-name="P20"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица8.23">
							<table:table-cell table:style-name="Таблица8.A23" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T17">Место для оттиска печати кадастрового инженера</text:span>
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
						<text:p text:style-name="P72"/>
						<table:table table:name="Таблица9" table:style-name="Таблица9"><table:table-column table:style-name="Таблица9.A"/><table:table-column table:style-name="Таблица9.B"/><table:table-column table:style-name="Таблица9.C"/><table:table-row table:style-name="Таблица9.1">
								<table:table-cell table:style-name="Таблица9.A1" office:value-type="string">
									<text:p text:style-name="Обычный"/>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.A1" office:value-type="string">
									<text:p text:style-name="Обычный"/>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.C1" office:value-type="string">
									<text:p text:style-name="Обычный">Лист №__<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span><text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T5">2</text:span>
										</text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>__</text:p>
								</table:table-cell>
							</table:table-row><table:table-row table:style-name="Таблица9.2">
								<table:table-cell table:style-name="Таблица9.A2" table:number-columns-spanned="3" office:value-type="string">
									<text:p text:style-name="P18">МЕЖЕВОЙ ПЛАН</text:p>
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
									<text:p text:style-name="P18">№ п/п</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.B4" office:value-type="string">
									<text:p text:style-name="P18">Разделы межевого плана</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.C4" office:value-type="string">
									<text:p text:style-name="P18">Номера листов</text:p>
								</table:table-cell>
							</table:table-row><table:table-row table:style-name="Таблица9.5">
								<table:table-cell table:style-name="Таблица9.A5" office:value-type="string">
									<text:p text:style-name="P18">1</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.B5" office:value-type="string">
									<text:p text:style-name="P18">2</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.C5" office:value-type="string">
									<text:p text:style-name="P89">3</text:p>
								</table:table-cell>
							</table:table-row><table:table-row>
								<table:table-cell table:style-name="Таблица9.A19" office:value-type="string">
									<text:list xml:id="list31731652" text:style-name="Numbering_20_1">
										<text:list-item>
											<text:p text:style-name="P99">
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
									<text:p text:style-name="P37">
										<text:span text:style-name="User_20_Entry">3</text:span>
									</text:p>
								</table:table-cell>
							</table:table-row><table:table-row>
								<table:table-cell table:style-name="Таблица9.A19" office:value-type="string">
									<text:list xml:id="list32256317" text:continue-numbering="true" text:style-name="Numbering_20_1">
										<text:list-item>
											<text:p text:style-name="P100">
												<text:span text:style-name="User_20_Entry">
													<text:span text:style-name="T36"/>
												</text:span>
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
									<text:list xml:id="list32264068" text:continue-numbering="true" text:style-name="Numbering_20_1">
										<text:list-item>
											<text:p text:style-name="P103">
												<text:span text:style-name="User_20_Entry">
													<text:span text:style-name="T36"/>
												</text:span>
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
												<text:bookmark-ref text:reference-format="page" text:ref-name="Оглавление_ОбразуемыеУчастки">5</text:bookmark-ref>
											</text:span>
										</text:span>
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30"> </text:span>
										</text:span>
									</text:p>
								</table:table-cell>
							</table:table-row><!--row-code-->
</xsl:if>
<xsl:if test="/.//ExistParcel/Composition_EZ/InsertEntryParcels | /.//ExistParcel/Composition_EZ/DeleteEntryParcels"><table:table-row>
								<table:table-cell table:style-name="Таблица9.A19" office:value-type="string">
									<text:list xml:id="list32260719" text:continue-numbering="true" text:style-name="Numbering_20_1">
										<text:list-item>
											<text:p text:style-name="P101">
												<text:span text:style-name="User_20_Entry">
													<text:span text:style-name="T43"/>
												</text:span>
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
												<text:bookmark-ref text:reference-format="page" text:ref-name="Оглавление_ИзмененныеУчастки">8</text:bookmark-ref>
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
									<text:list xml:id="list32241823" text:continue-numbering="true" text:style-name="Numbering_20_1">
										<text:list-item>
											<text:p text:style-name="P101">
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
												<text:bookmark-ref text:reference-format="page" text:ref-name="Оглавление_Доступ">9</text:bookmark-ref>
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
									<text:list xml:id="list32243899" text:continue-numbering="true" text:style-name="Numbering_20_1">
										<text:list-item>
											<text:p text:style-name="P101">
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
												<text:bookmark-ref text:reference-format="page" text:ref-name="Оглавление_УточняемыеУчастки">10</text:bookmark-ref>
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
									<text:list xml:id="list32252464" text:continue-numbering="true" text:style-name="Numbering_20_1">
										<text:list-item>
											<text:p text:style-name="P101">
												<text:span text:style-name="User_20_Entry">
													<text:span text:style-name="T43"/>
												</text:span>
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
												<text:bookmark-ref text:reference-format="page" text:ref-name="Оглавление_ОбразуемыеЧасти">13</text:bookmark-ref>
											</text:span>
										</text:span>
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30"> </text:span>
										</text:span>
									</text:p>
								</table:table-cell>
							</table:table-row><!--row-code-->
</xsl:if><table:table-row>
								<table:table-cell table:style-name="Таблица9.A19" office:value-type="string">
									<text:list xml:id="list32252776" text:continue-numbering="true" text:style-name="Numbering_20_1">
										<text:list-item>
											<text:p text:style-name="P102">
												<text:span text:style-name="User_20_Entry">
													<text:span text:style-name="T43"/>
												</text:span>
											</text:p>
										</text:list-item>
									</text:list>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.B19" office:value-type="string">
									<text:p text:style-name="Обычный">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30">
												<text:bookmark-ref text:reference-format="text" text:ref-name="Оглавление_ЗаключениеКадастровогоИнженер">Заключение кадастрового инженера</text:bookmark-ref>
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
												<text:bookmark-ref text:reference-format="page" text:ref-name="Оглавление_ЗаключениеКадастровогоИнженер">14</text:bookmark-ref>
											</text:span>
										</text:span>
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30"> </text:span>
										</text:span>
									</text:p>
								</table:table-cell>
							</table:table-row><table:table-row>
								<table:table-cell table:style-name="Таблица9.A20">
									<text:list xml:id="list32241194" text:continue-numbering="true" text:style-name="Numbering_20_1">
										<text:list-item>
											<text:p text:style-name="P101"/>
										</text:list-item>
									</text:list>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.B20" office:value-type="string">
									<text:p text:style-name="P57">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T35">Схема геодезических построений</text:span>
										</text:span>
									</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.C20" office:value-type="string">
									<text:p text:style-name="P1">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30">
												<text:s text:c="7"/>
											</text:span>
										</text:span>
									</text:p>
								</table:table-cell>
							</table:table-row><table:table-row>
								<table:table-cell table:style-name="Таблица9.A23" office:value-type="string">
									<text:list xml:id="list32253213" text:continue-numbering="true" text:style-name="Numbering_20_1">
										<text:list-item>
											<text:p text:style-name="P101">
												<text:span text:style-name="User_20_Entry">
													<text:span text:style-name="T14"/>
												</text:span>
											</text:p>
										</text:list-item>
									</text:list>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.B21" office:value-type="string">
									<text:p text:style-name="P57">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T31">Схема расположения земельных участков</text:span>
										</text:span>
									</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.C21" office:value-type="string">
									<text:p text:style-name="P1">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30">
												<text:s text:c="5"/>
											</text:span>
										</text:span>
									</text:p>
								</table:table-cell>
							</table:table-row><table:table-row>
								<table:table-cell table:style-name="Таблица9.A23" office:value-type="string">
									<text:list xml:id="list32236363" text:continue-numbering="true" text:style-name="Numbering_20_1">
										<text:list-item>
											<text:p text:style-name="P101">
												<text:span text:style-name="User_20_Entry">
													<text:span text:style-name="T14"/>
												</text:span>
											</text:p>
										</text:list-item>
									</text:list>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.B22" office:value-type="string">
									<text:p text:style-name="P57">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T31">Чертеж земельных участков и их частей</text:span>
										</text:span>
									</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.C22" office:value-type="string">
									<text:p text:style-name="P1">
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T30">
												<text:s text:c="4"/>
											</text:span>
										</text:span>
									</text:p>
								</table:table-cell>
							</table:table-row><table:table-row>
								<table:table-cell table:style-name="Таблица9.A23" office:value-type="string">
									<text:list xml:id="list32261535" text:continue-numbering="true" text:style-name="Numbering_20_1">
										<text:list-item>
											<text:p text:style-name="P101">
												<text:span text:style-name="User_20_Entry">
													<text:span text:style-name="T14"/>
												</text:span>
											</text:p>
										</text:list-item>
									</text:list>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.B23" office:value-type="string">
									<text:p text:style-name="P38">
										<text:span text:style-name="User_20_Entry">Акт согласования местоположения границ земельного участка</text:span>
									</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.C23" office:value-type="string">
									<text:p text:style-name="P39">
										<text:span text:style-name="User_20_Entry">, стр.2</text:span>
									</text:p>
								</table:table-cell>
							</table:table-row><table:table-row>
								<table:table-cell table:style-name="Таблица9.A24" office:value-type="string">
									<text:list xml:id="list32247358" text:continue-numbering="true" text:style-name="Numbering_20_1">
										<text:list-item>
											<text:p text:style-name="P101">
												<text:span text:style-name="User_20_Entry">
													<text:span text:style-name="T14"/>
												</text:span>
											</text:p>
										</text:list-item>
									</text:list>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.B24" office:value-type="string">
									<text:p text:style-name="P38">
										<text:span text:style-name="User_20_Entry">Приложени</text:span>
										<text:span text:style-name="User_20_Entry">
											<text:span text:style-name="T44">е</text:span>
										</text:span>
									</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица9.C24" office:value-type="string">
									<text:p text:style-name="P1">
										<text:span text:style-name="User_20_Entry"/>
									</text:p>
								</table:table-cell>
							</table:table-row></table:table>
						<text:p text:style-name="Обычный"/>
						<text:p text:style-name="P31"/>
					</text:section><table:table table:name="Таблица11" table:style-name="Таблица11">
						<table:table-column table:style-name="Таблица11.A"/>
						<table:table-column table:style-name="Таблица11.B"/>
						<table:table-column table:style-name="Таблица11.C"/>
						<table:table-header-rows>
							<table:table-row table:style-name="Таблица11.1">
								<table:table-cell table:style-name="Таблица11.A1" table:number-columns-spanned="3" office:value-type="string">
									<text:p text:style-name="P71"><text:bookmark-start text:name="Оглавление_ИсходныеДанные"/>Исходные данные<text:bookmark-end text:name="Оглавление_ИсходныеДанные"/></text:p>
								</table:table-cell>
								<table:covered-table-cell/>
								<table:covered-table-cell/>
							</table:table-row>
						</table:table-header-rows>
						<table:table-row>
							<table:table-cell table:style-name="Таблица11.A2" table:number-columns-spanned="3" office:value-type="string">
								<text:p text:style-name="P88">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">1. Перечень документов, использованных при подготовке межевого плана</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row>
							<table:table-cell table:style-name="Таблица11.A3" office:value-type="string">
								<text:p text:style-name="P62">№ п/п</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица11.B3" office:value-type="string">
								<text:p text:style-name="P62">Наименование документа</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица11.C3" office:value-type="string">
								<text:p text:style-name="P62">Реквизиты документа</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table><table:table table:name="Таблица20" table:style-name="Таблица20"><table:table-column table:style-name="Таблица20.A"/><table:table-column table:style-name="Таблица20.B"/><table:table-column table:style-name="Таблица20.C"/><table:table-header-rows>
							<table:table-row table:style-name="Таблица20.1">
								<table:table-cell table:style-name="Таблица20.A1" office:value-type="string">
									<text:p text:style-name="P62">1</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица20.B1" office:value-type="string">
									<text:p text:style-name="P62">2</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица20.C1" office:value-type="string">
									<text:p text:style-name="P62">3</text:p>
								</table:table-cell>
							</table:table-row>
						</table:table-header-rows><!--row-code-->
	<xsl:for-each select="document('STD_MP_ADD.xml')/.//document | /STD_MP[not(document('STD_MP_ADD.xml')/.//document)]"><table:table-row table:style-name="Таблица20.1">
							<table:table-cell table:style-name="Таблица20.A3" office:value-type="string">
								<text:p text:style-name="P62">
									<text:span text:style-name="User_20_Entry">		<xsl:if test="ancestor-or-self::document">
			<xsl:value-of select="position()"/>
		</xsl:if>
		<xsl:if test="not(ancestor-or-self::document)">
			<xsl:value-of select="'-'"/>
		</xsl:if>
</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица20.B3" office:value-type="string">
								<text:p text:style-name="Standard">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_value"><xsl:with-param name="p_name">name</xsl:with-param></xsl:call-template></text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица20.C3" office:value-type="string">
								<text:p text:style-name="Standard">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_value"><xsl:with-param name="p_name">number</xsl:with-param></xsl:call-template> от
		<xsl:call-template name="get_value"><xsl:with-param name="p_name">date</xsl:with-param></xsl:call-template></text:span>
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
										<text:span text:style-name="T4">2. Сведения о геодезической основе, использованной при подготовке межевого плана </text:span>
									</text:span>
								</text:p>
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T4">Система координат <text:s text:c="3"/></text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T4"><xsl:value-of select="/STD_MP/Coord_Systems/Coord_System[1]/@Name"/></text:span>
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
										<text:span text:style-name="T7">Y</text:span>
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
<xsl:for-each select="document('STD_MP_ADD.xml')/.//geopoint | /STD_MP[not(document('STD_MP_ADD.xml')/.//geopoint)]"><table:table-row table:style-name="Таблица23.3">
							<table:table-cell table:style-name="Таблица23.A3" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry">		<xsl:if test="ancestor-or-self::geopoint">
			<xsl:value-of select="position()"/>
		</xsl:if>
		<xsl:if test="not(ancestor-or-self::geopoint)">
			<xsl:value-of select="'-'"/>
		</xsl:if>
</text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица23.B3" office:value-type="string">
								<text:p text:style-name="P53">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_value"><xsl:with-param name="p_name">name</xsl:with-param></xsl:call-template></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица23.C3" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_value"><xsl:with-param name="p_name">net_class</xsl:with-param></xsl:call-template></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица23.D3" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry"><xsl:for-each select="ordinate  | /STD_MP[not(document('STD_MP_ADD.xml')/.//geopoint)]">
<xsl:call-template name="get_value"><xsl:with-param name="p_name">x</xsl:with-param></xsl:call-template>
</xsl:for-each></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица23.E3" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry"><xsl:for-each select="ordinate  | /STD_MP[not(document('STD_MP_ADD.xml')/.//geopoint)]">
<xsl:call-template name="get_value"><xsl:with-param name="p_name">y</xsl:with-param></xsl:call-template>
</xsl:for-each></text:span>
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
								<text:p text:style-name="P14">3. Сведения о средствах измерений</text:p>
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
<xsl:for-each select="document('STD_MP_ADD.xml')/.//measurement_devices/item | /STD_MP[not(document('STD_MP_ADD.xml')/.//measurement_devices/item)]"><table:table-row table:style-name="Таблица25.1">
							<table:table-cell table:style-name="Таблица25.A3" office:value-type="string">
								<text:p text:style-name="P46">
									<text:span text:style-name="User_20_Entry">	<xsl:if test="ancestor-or-self::measurement_devices">
			<xsl:value-of select="position()"/>
		</xsl:if>
		<xsl:if test="not(ancestor-or-self::measurement_devices)">
			<xsl:value-of select="'-'"/>
		</xsl:if></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица25.B3" office:value-type="string">
								<text:p text:style-name="P49">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_value"><xsl:with-param name="p_name">name</xsl:with-param></xsl:call-template></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица25.B3" office:value-type="string">
								<text:p text:style-name="P49">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_value"><xsl:with-param name="p_name">cert</xsl:with-param></xsl:call-template></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица25.D3" office:value-type="string">
								<text:p text:style-name="P46">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_value"><xsl:with-param name="p_name">svid</xsl:with-param></xsl:call-template></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
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
										<text:span text:style-name="T18">Кадастровые или иные номера зданий, сооружений, объектов незавершенного строительства, расположенных на земельном участке</text:span>
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
<xsl:for-each select="/.//*[Inner_CadastralNumbers] | STD_MP[not(/.//Inner_CadastralNumbers)]"><table:table-row table:style-name="Таблица27.1">
							<table:table-cell table:style-name="Таблица27.A3" office:value-type="string">
								<text:p text:style-name="P46">
									<text:span text:style-name="User_20_Entry">	<xsl:if test="Inner_CadastralNumbers">
			<xsl:value-of select="position()"/>
		</xsl:if>
		<xsl:if test="not(Inner_CadastralNumbers)">
			<xsl:value-of select="'-'"/>
		</xsl:if></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица27.B3" office:value-type="string">
								<text:p text:style-name="P46">
									<text:span text:style-name="User_20_Entry">	<xsl:if test="Inner_CadastralNumbers">
			<xsl:value-of select="@CadastralNumber | @Definition"/>
		</xsl:if>
		<xsl:if test="not(Inner_CadastralNumbers)">
			<xsl:value-of select="'-'"/>
		</xsl:if></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица27.C3" office:value-type="string">
								<text:p text:style-name="P46">
									<text:span text:style-name="User_20_Entry"><xsl:if test="Inner_CadastralNumbers">
  <xsl:for-each select="CadastralNumber">
    <xsl:value-of select="."/>,
  </xsl:for-each>
</xsl:if>
<xsl:if test="not(Inner_CadastralNumbers)">
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
<xsl:for-each select="/.//*[SubParcels] | /STD_MP[not(/.//SubParcels)]"><table:table-row table:style-name="Таблица29.3">
							<table:table-cell table:style-name="Таблица29.A3" office:value-type="string">
								<text:p text:style-name="P46">	<xsl:if test="SubParcels">
			<xsl:value-of select="position()"/>
		</xsl:if>
		<xsl:if test="not(SubParcels)">
			<xsl:value-of select="'-'"/>
		</xsl:if></text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица29.B3" office:value-type="string">
								<text:p text:style-name="P46">
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
								<text:p text:style-name="P46">
									<text:span text:style-name="User_20_Entry"><xsl:if test="SubParcels">
  <xsl:for-each select="SubParcels/SubParcel">
    <xsl:value-of select="@Definition"/>  ,
  </xsl:for-each>   
</xsl:if>
<xsl:if test="not(SubParcels)">
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
								<text:p text:style-name="P73"><text:bookmark-start text:name="Оглавление_Сведения"/>Сведения о выполненных измерениях и расчетах<text:bookmark-end text:name="Оглавление_Сведения"/></text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица17.2">
							<table:table-cell table:style-name="Таблица17.A2" table:number-columns-spanned="3" office:value-type="string">
								<text:p text:style-name="P85">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">1. Метод определения координат <text:s/>характерных точек границ земельных участков и их частей</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row table:style-name="Таблица17.2">
							<table:table-cell table:style-name="Таблица17.A3" office:value-type="string">
								<text:p text:style-name="P62">№ п/п</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица17.B3" office:value-type="string">
								<text:p text:style-name="P9">Кадастровый номер или обозначение</text:p>
								<text:p text:style-name="P62">земельного участка</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица17.C3" office:value-type="string">
								<text:p text:style-name="P62">Метод определения координат</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table><table:table table:name="Таблица30" table:style-name="Таблица30"><table:table-column table:style-name="Таблица30.A"/><table:table-column table:style-name="Таблица30.B"/><table:table-column table:style-name="Таблица30.C"/><table:table-header-rows>
							<table:table-row table:style-name="Таблица30.1">
								<table:table-cell table:style-name="Таблица30.A1" office:value-type="string">
									<text:p text:style-name="P62">1</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица30.B1" office:value-type="string">
									<text:p text:style-name="P10">2</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица30.C1" office:value-type="string">
									<text:p text:style-name="P62">3</text:p>
								</table:table-cell>
							</table:table-row>
						</table:table-header-rows><!--row-code-->
<xsl:for-each select="STD_MP/Package/FormParcels/NewParcel | STD_MP/Package/FormParcels/ChangeParcel | STD_MP/Package/SpecifyParcels/ExistParcel"><table:table-row table:style-name="Таблица30.3">
							<table:table-cell table:style-name="Таблица30.A3" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="position()"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица30.B3" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry">
										<text:s text:c="3"/>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:s/>
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
<xsl:if test="not(STD_MP/Package/FormParcels/NewParcel | STD_MP/Package/FormParcels/ChangeParcel | STD_MP/Package/SpecifyParcels/ExistParcel)"><table:table-row table:style-name="Таблица30.3">
							<table:table-cell table:style-name="Таблица30.A3" office:value-type="string">
								<text:p text:style-name="P67">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица30.B3" office:value-type="string">
								<text:p text:style-name="P68">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица30.C3" office:value-type="string">
								<text:p text:style-name="P67">
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
										<text:span text:style-name="T3">Формулы, примененные для расчета средней квадратической погрешности положения характерных точек границ (М</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T20">t</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">), м</text:span>
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
<xsl:for-each select="STD_MP/Package/FormParcels/NewParcel | STD_MP/Package/FormParcels/ChangeParcel | STD_MP/Package/SpecifyParcels/ExistParcel">
<table:table-row table:style-name="Таблица33.3">
							<table:table-cell table:style-name="Таблица33.A3" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="position()"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица33.B3" office:value-type="string">
								<text:p text:style-name="P42">
									<text:span text:style-name="User_20_Entry">
										<text:s text:c="3"/>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:s/>
									</text:span>
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="@CadastralNumber | @Definition"/></text:span>
									<text:span text:style-name="User_20_Entry">
										<text:s/>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица33.C3" office:value-type="string">
								<text:p text:style-name="P96">
									<text:span text:style-name="User_20_Entry">Mt=√ (m</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T45">0</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T46">2</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry"> + m</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T45">1</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T46">2</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">)</text:span>
								</text:p>
								<text:p text:style-name="P96">
									<text:span text:style-name="User_20_Entry">Mt=√ (</text:span>
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_m"/></text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T46">2</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry"> + </text:span>
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_m"/></text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T46">2</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">) = </text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T51"><xsl:value-of select="format-number( number(/.//*[1]/*/@Delta_Geopoint),'#0.00')"/></text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:for-each>
<xsl:if test="not(STD_MP/Package/FormParcels/NewParcel | STD_MP/Package/FormParcels/ChangeParcel | STD_MP/Package/SpecifyParcels/ExistParcel)"><table:table-row table:style-name="Таблица33.3">
							<table:table-cell table:style-name="Таблица33.A5" office:value-type="string">
								<text:p text:style-name="P32">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица33.B5" office:value-type="string">
								<text:p text:style-name="P32">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица33.C5" office:value-type="string">
								<text:p text:style-name="P32">
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
										<text:span text:style-name="T3">Формулы, примененные для расчета средней квадратической погрешности положения характерных точек границ (М</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T20">t</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">), м</text:span>
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
<xsl:for-each select="STD_MP/Package/FormParcels/NewParcel/SubParcels/SubParcel | STD_MP/Package/SpecifyParcels/ExistParcel/SubParcels/SubParcel | STD_MP/Package/NewSubParcel"><table:table-row table:style-name="Таблица37.3">
							<table:table-cell table:style-name="Таблица37.A3" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="position()"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица37.B3" office:value-type="string">
								<text:p text:style-name="P46">
									<text:span text:style-name="User_20_Entry">
										<text:s text:c="2"/>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:s text:c="2"/>
									</text:span>
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="../../@CadastralNumber | ../../@Definition"/>
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
								<text:p text:style-name="P32">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:for-each>
<xsl:if test="not(STD_MP/Package/FormParcels/NewParcel/SubParcels/SubParcel | STD_MP/Package/SpecifyParcels/ExistParcel/SubParcels/SubParcel | STD_MP/Package/NewSubParcel)"><table:table-row table:style-name="Таблица37.3">
							<table:table-cell table:style-name="Таблица37.A5" office:value-type="string">
								<text:p text:style-name="P33">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица37.B5" office:value-type="string">
								<text:p text:style-name="P33">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица37.C5" office:value-type="string">
								<text:p text:style-name="P33">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица37.D5" office:value-type="string">
								<text:p text:style-name="P33">
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
										<text:span text:style-name="T3">Площадь (Р), м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">2</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
								<text:p text:style-name="P9"/>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица38.D2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">Формулы, примененные для расчета предельно допустимой погрешности определения площади земельного участка (∆Р), <text:s/>м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">2</text:span>
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
<xsl:for-each select="STD_MP/Package/FormParcels/NewParcel | STD_MP/Package/FormParcels/ChangeParcel | STD_MP/Package/SpecifyParcels/ExistParcel"><table:table-row table:style-name="Таблица39.1">
							<table:table-cell table:style-name="Таблица39.A3" office:value-type="string">
								<text:p text:style-name="P46">
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="position()"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица39.B3" office:value-type="string">
								<text:p text:style-name="P50">
									<text:span text:style-name="User_20_Entry">
										<text:s text:c="2"/>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:s text:c="2"/>
									</text:span>
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="@CadastralNumber | @Definition"/></text:span>
									<text:span text:style-name="User_20_Entry">
										<text:s/>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица39.B3" office:value-type="string">
								<text:p text:style-name="P46">
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="Area/Area"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица39.D3" office:value-type="string">
								<text:p text:style-name="P7">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T38">∆Р </text:span>
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
<xsl:if test="not(STD_MP/Package/FormParcels/NewParcel | STD_MP/Package/FormParcels/ChangeParcel | STD_MP/Package/SpecifyParcels/ExistParcel)"><table:table-row table:style-name="Таблица39.1">
							<table:table-cell table:style-name="Таблица39.A5" office:value-type="string">
								<text:p text:style-name="P29">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица39.B5" office:value-type="string">
								<text:p text:style-name="P29">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица39.B5" office:value-type="string">
								<text:p text:style-name="P29">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица39.D5" office:value-type="string">
								<text:p text:style-name="P29">
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
										<text:span text:style-name="T3">Площадь (Р), м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">2</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
								<text:p text:style-name="P9"/>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица40.E2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">Формулы, примененные для расчета предельно допустимой погрешности определения площади части <text:s/>земельного участка (∆Р), <text:s/>м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">2</text:span>
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
<xsl:for-each select="STD_MP/Package/FormParcels/NewParcel/SubParcels/SubParcel | STD_MP/Package/SpecifyParcels/ExistParcel/SubParcels/SubParcel | STD_MP/Package/NewSubParcel"><table:table-row table:style-name="Таблица41.1">
							<table:table-cell table:style-name="Таблица41.A3" office:value-type="string">
								<text:p text:style-name="P46">
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="position()"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица41.B3" office:value-type="string">
								<text:p text:style-name="P48">
									<text:span text:style-name="User_20_Entry">
										<text:s text:c="2"/>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:s text:c="2"/>
									</text:span>
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="../../@CadastralNumber | ../../@Definition | CadastralNumber_Parcel"/></text:span>
									<text:span text:style-name="User_20_Entry">
										<text:s/>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица41.B3" office:value-type="string">
								<text:p text:style-name="P46">
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="@Definition"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица41.B3" office:value-type="string">
								<text:p text:style-name="P46">
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="Area/Area"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица41.E3" office:value-type="string">
								<text:p text:style-name="P104">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T41">∆Р </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T40">= 3.5 * </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T40"><xsl:value-of select="format-number(/.//*[1]/*/@Delta_Geopoint,'#0.00')"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T40"><text:s/>* </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T49">√ <text:s/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T49"><xsl:value-of select="Area/Area"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T49">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T50">=</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T42">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T42"><xsl:value-of select="Area/Innccuracy"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T42">
											<text:s/>
										</text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:for-each>
<xsl:if test="not(STD_MP/Package/FormParcels/NewParcel/SubParcels/SubParcel | STD_MP/Package/SpecifyParcels/ExistParcel/SubParcels/SubParcel | STD_MP/Package/NewSubParcel)"><table:table-row table:style-name="Таблица41.1">
							<table:table-cell table:style-name="Таблица41.A5" office:value-type="string">
								<text:p text:style-name="P30">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица41.B5" office:value-type="string">
								<text:p text:style-name="P30">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица41.B5" office:value-type="string">
								<text:p text:style-name="P30">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица41.B5" office:value-type="string">
								<text:p text:style-name="P30">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица41.E5" office:value-type="string">
								<text:p text:style-name="P30">
									<text:span text:style-name="User_20_Entry">-</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:if></table:table><xsl:if test="/.//NewParcel"><table:table table:name="Таблица22" table:style-name="Таблица22">
						<table:table-column table:style-name="Таблица22.A"/>
						<table:table-row table:style-name="Таблица22.1">
							<table:table-cell table:style-name="Таблица22.A1" office:value-type="string">
								<text:p text:style-name="P74"><text:bookmark-start text:name="Оглавление_ОбразуемыеУчастки"/>Сведения об образуемых земельных участках и их частях<text:bookmark-end text:name="Оглавление_ОбразуемыеУчастки"/></text:p>
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
										<text:span text:style-name="T3">1. Сведения о характерных точках границ образуемых земельных участков</text:span>
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
										<text:span text:style-name="T3">Обозначение земельного участка </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T3">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3"><xsl:call-template name="get_value"><xsl:with-param name="p_name">Definition</xsl:with-param></xsl:call-template></text:span>
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
						<table:table-row table:style-name="Таблица15.3">
							<table:table-cell table:style-name="Таблица15.A3" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P9">Обозначение характерных точек границы</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица15.B3" table:number-columns-spanned="2" office:value-type="string">
								<text:p text:style-name="P13">Координаты, м</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица15.B3" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">Средняя квадратическая погрешность положения характерной точки (М</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T20">t</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">), м</text:span>
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
										<text:span text:style-name="T7">X</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица15.B3" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T7">Y</text:span>
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
			<xsl:for-each select="Contours/Contour/Entity_Spatial | Entity_Spatial">
				<xsl:if test="(ancestor::Contour)"><table:table-row table:style-name="Таблица12.1">
							<table:table-cell table:style-name="Таблица12.A2" table:number-columns-spanned="5" office:value-type="string">
								<text:p text:style-name="P25">
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="ancestor::Contour/@Definition"/> </text:span>
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
					<xsl:for-each select="Spelement_Unit/Ordinate  | /STD_MP[not(/.//NewParcel)]">
						<xsl:sort select="@Ord_Nmb" data-type="number"/>
<table:table-row table:style-name="Таблица12.5">
							<table:table-cell table:style-name="Таблица12.A5" office:value-type="float" office:value="0">
								<text:p text:style-name="P63">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="point_name"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица12.B5" office:value-type="float" office:value="0">
								<text:p text:style-name="P51">
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
								<text:p text:style-name="P51">
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
								<text:p text:style-name="P63">
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
								<text:p text:style-name="P65">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T15">-</text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица12.B10" office:value-type="string">
								<text:p text:style-name="P69">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица12.B10" office:value-type="string">
								<text:p text:style-name="P69">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица12.B10" office:value-type="string">
								<text:p text:style-name="P69">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица12.E10" office:value-type="string">
								<text:p text:style-name="P69">-</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:if></table:table><!--/xsl:for-each-->				<table:table table:name="Таблица14" table:style-name="Таблица14">
						<table:table-column table:style-name="Таблица14.A"/>
						<table:table-row table:style-name="Таблица14.1">
							<table:table-cell table:style-name="Таблица14.A1" office:value-type="string">
								<text:p text:style-name="P79">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">2. Сведения о частях границ образуемых земельных участков</text:span>
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
										<text:span text:style-name="T3">Обозначение земельного участка </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3"><xsl:if test="@Definition">
<xsl:value-of select="@Definition"/>
</xsl:if>
<xsl:if test="not(@Definition)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3"> </text:span>
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
										<text:span text:style-name="T3">Горизонтальное проложение <text:s text:c="5"/>( <text:s/></text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T7">S</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3"><text:s/>) , м</text:span>
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
		<xsl:for-each select="Contours/Contour/Entity_Spatial | Entity_Spatial  | /STD_MP[not(/.//NewParcel)]">
			<xsl:if test="(ancestor::Contour)"><table:table-row table:style-name="Таблица13.1">
							<table:table-cell table:style-name="Таблица13.A2" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="P8">
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="ancestor::Contour/@Definition"/> </text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row><!--row-code-->
			</xsl:if>
			<xsl:for-each select="Borders/Border | /STD_MP[not(/.//NewParcel)]"><table:table-row table:style-name="Таблица13.1">
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
								<text:p text:style-name="P27">
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
		
			<xsl:if test="./@Spatial != following-sibling::*[1]/@Spatial">
<table:table-row table:style-name="Таблица13.1">
							<table:table-cell table:style-name="Таблица13.A2" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="P47">
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
										<text:span text:style-name="T3">3. Сведения о местоположении границ частей образуемых земельных участков</text:span>
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
										<text:span text:style-name="T3">Обозначение земельного участка</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
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
					</table:table><xsl:for-each select="SubParcels/SubParcel | /STD_MP[not(/.//NewParcel[SubParcels])]"><table:table table:name="Таблица53" table:style-name="Таблица53">
						<table:table-column table:style-name="Таблица53.A"/>
						<table:table-column table:style-name="Таблица53.B"/>
						<table:table-column table:style-name="Таблица53.C"/>
						<table:table-column table:style-name="Таблица53.D"/>
						<table:table-column table:style-name="Таблица53.E"/>
						<table:table-row table:style-name="Таблица53.1">
							<table:table-cell table:style-name="Таблица53.A1" table:number-columns-spanned="5" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">Учетный номер или обозначение части</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T24"> </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3"><xsl:value-of select="@Definition"/>
<xsl:if test="not(@Definition)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
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
										<text:span text:style-name="T3">Средняя квадратическая погрешность </text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">положения характерной точки <text:s/>(М</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T20">t</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">), м</text:span>
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
										<text:span text:style-name="T7">X</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица53.B2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T7">Y</text:span>
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
<xsl:for-each select="Spelement_Unit/Ordinate | /STD_MP[not(/.//NewParcel[SubParcels])]"><table:table-row table:style-name="Таблица54.3">
							<table:table-cell table:style-name="Таблица54.A3" office:value-type="float" office:value="0">
								<text:p text:style-name="P63">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="point_name"/></text:span>
									<text:span text:style-name="User_20_Entry"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица54.B3" office:value-type="float" office:value="0">
								<text:p text:style-name="P51">
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
								<text:p text:style-name="P51">
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
								<text:p text:style-name="P64">
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
								<text:p text:style-name="P98">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица54.B7" office:value-type="string">
								<text:p text:style-name="P98">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица54.C7" office:value-type="string">
								<text:p text:style-name="P98">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица54.D7" office:value-type="string">
								<text:p text:style-name="P98">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица54.E7" office:value-type="string">
								<text:p text:style-name="P98">-</text:p>
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
										<text:span text:style-name="T3">Обозначение земельного участка</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T3"> </text:span>
									</text:span>
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
								<text:p text:style-name="P1"><xsl:value-of select="Location/Note | Location/Address/Note"/></text:p>
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
										<text:span text:style-name="T3">(Р±∆Р), м</text:span>
									</text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span><text:s text:c="2"/><text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">2</text:span>
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
<xsl:for-each select="Contours/Contour">
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
										<text:span text:style-name="T3"><text:s text:c="2"/>(Рмин и Рмакс), м</text:span>
									</text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span><text:s text:c="2"/><text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">2</text:span>
									</text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span></text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица18.C4" office:value-type="string">
								<text:p text:style-name="P17">-</text:p>
							</table:table-cell>
						</table:table-row><table:table-row table:style-name="Таблица18.6">
							<table:table-cell table:style-name="Таблица18.A4" office:value-type="string">
								<text:p text:style-name="P1">6</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица18.B11" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T19">Кадастровые или иные номера зданий, сооружений, объектов незавершенного строительства, расположенных на земельном участке</text:span>
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
								<text:p text:style-name="P26">-</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
<!--/xsl:for-each-->
</table:table><table:table table:name="Таблица55" table:style-name="Таблица55">
						<table:table-column table:style-name="Таблица55.A"/>
						<table:table-row table:style-name="Таблица55.1">
							<table:table-cell table:style-name="Таблица55.A1" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">5. Общие сведения о частях образуемых земельных участков</text:span>
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
										<text:span text:style-name="T3">Обозначение земельного участка <text:s text:c="2"/></text:span>
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
										<text:span text:style-name="T3">Площадь (Р), м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">2</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
								<text:p text:style-name="P9"/>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица56.B2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">±∆Р, м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">2</text:span>
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
<xsl:for-each select="Subparcels/SubParcel | /STD_MP[not(/.//NewParcel[SubParcels])]"><table:table-row table:style-name="Таблица57.1">
							<table:table-cell table:style-name="Таблица57.A3" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:if test="Subparcels/SubParcel">
<xsl:value-of select="position()"/>
</xsl:if>
<xsl:if test="not(Subparcels/SubParcel)">
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
										<text:span text:style-name="T24"><xsl:if test="Subparcels/SubParcel">
<xsl:value-of select="@Definition"/>
</xsl:if>
<xsl:if test="not(Subparcels/SubParcel)">
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
										<text:span text:style-name="T24"><xsl:if test="Subparcels/SubParcel">
<xsl:value-of select="Area/Inncuracy"/>
</xsl:if>
<xsl:if test="not(Subparcels/SubParcel)">
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
										<text:span text:style-name="T24"><xsl:if test="Subparcels/SubParcel">
<xsl:value-of select="Encumbance/Name"/>
</xsl:if>
<xsl:if test="not(Subparcels/SubParcel)">
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


</table:table><xsl:if test="following-sibling::NewParcel"><text:p text:style-name="P97"/><text:p text:style-name="P78"/></xsl:if>
</xsl:for-each></xsl:if><xsl:if test="/.//ExistParcel/Composition_EZ/InsertEntryParcels |  /.//ExistParcel/Composition_EZ/DeleteEntryParcels"><table:table table:name="Таблица31" table:style-name="Таблица31"><table:table-column table:style-name="Таблица31.A"/><table:table-column table:style-name="Таблица31.B"/><table:table-column table:style-name="Таблица31.C"/><table:table-row table:style-name="Таблица31.1">
							<table:table-cell table:style-name="Таблица31.A1" table:number-columns-spanned="3" office:value-type="string">
								<text:p text:style-name="P74"><text:bookmark-start text:name="Оглавление_ИзмененныеУчастки"/>Сведения об измененных земельных участках<text:bookmark-end text:name="Оглавление_ИзмененныеУчастки"/></text:p>
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
<xsl:for-each select="/.//ExistParcel[Composition_EZ] | /STD_MP[not(/.//ExistParcel[Composition_EZ])]"><table:table-row>
							<table:table-cell table:style-name="Таблица31.A4" table:number-columns-spanned="3" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">Кадастровый номер земельного участка </text:span>
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
								</text:p>
							</table:table-cell>
						</table:table-row><table:table-row>
							<table:table-cell table:style-name="Таблица31.A8" office:value-type="string">
								<text:p text:style-name="P34">2</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица31.B8" office:value-type="string">
								<text:p text:style-name="P52">Кадастровые номера земельных участков, <text:span text:style-name="T32">вкл</text:span>ючаемых <text:span text:style-name="T32">в</text:span> состав измененного земельного участка, представляющего собой единое землепользование</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица31.C8" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry"><xsl:for-each select="Composition_EZ/InsertEntryParcels/.//ExistEntryParcel/@CadastralNumber | Composition_EZ/InsertEntryParcels/.//NewEntryParcel/@Definition">
	<xsl:value-of select="."/>
	<xsl:if test="position() != last()">
		<xsl:value-of select="','"/><xsl:value-of select="$crlf"/>
	</xsl:if>
</xsl:for-each> 
</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><table:table-row>
							<table:table-cell table:style-name="Таблица31.A5" office:value-type="string">
								<text:p text:style-name="P34">3</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица31.B9" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T19">Кадастровые или иные номера зданий, сооружений, объектов незавершенного строительства, расположенных на земельном участке</text:span>
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
								</text:p>
							</table:table-cell>
						</table:table-row><table:table-row>
							<table:table-cell table:style-name="Таблица31.A5" office:value-type="string">
								<text:p text:style-name="P34">4</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица31.B5" office:value-type="string">
								<text:p text:style-name="Обычный">Иные сведения</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица31.C5" office:value-type="string">
								<text:p text:style-name="P9"/>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:for-each></table:table><text:p text:style-name="Text_20_body"/><table:table table:name="Таблица58" table:style-name="Таблица58">
						<table:table-column table:style-name="Таблица58.A"/>
						<table:table-row table:style-name="Таблица58.1">
							<table:table-cell table:style-name="Таблица58.A1" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">2. Общие сведения о частях измененных земельных участков</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table>	<xsl:for-each select="/.//ExistParcel[Composition_EZ] | /STD_MP[not(/.//ExistParcel[Composition_EZ])]"><table:table table:name="Таблица59" table:style-name="Таблица59">
						<table:table-column table:style-name="Таблица59.A"/>
						<table:table-column table:style-name="Таблица59.B"/>
						<table:table-column table:style-name="Таблица59.C"/>
						<table:table-column table:style-name="Таблица59.D"/>
						<table:table-column table:style-name="Таблица59.E"/>
						<table:table-row table:style-name="Таблица59.1">
							<table:table-cell table:style-name="Таблица59.A1" table:number-columns-spanned="5" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">Кадастровый номер земельного участка <text:s text:c="2"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T27">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T5"><xsl:call-template name="get_value"><xsl:with-param name="p_name">CadastralNumber</xsl:with-param></xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T5"> </text:span>
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
										<text:span text:style-name="T3">Площадь (Р), м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">2</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
								<text:p text:style-name="P9"/>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица59.B2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">±∆Р, м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">2</text:span>
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
				<xsl:for-each select="SubParcels/SubParcel  | /STD_MP[not(/.//ExistParcel[Composition_EZ][SubParcels])]">
					<xsl:sort select="@Number_PP" data-type="number"/>
<table:table-row table:style-name="Таблица60.1">
							<table:table-cell table:style-name="Таблица60.A1" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:if test="SubParcel"><xsl:value-of select="position()"/> </xsl:if>
					<xsl:if test="not(SubParcel)"><xsl:value-of select="'-'"/> </xsl:if></text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица60.B1" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="get_value"><xsl:with-param name="p_name">Definition</xsl:with-param></xsl:call-template></text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица60.B1" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">	<xsl:for-each select="Area | /STD_MP[not(/.//ExistParcel[Composition_EZ][SubParcels])]">
											<xsl:call-template name="get_value"><xsl:with-param name="p_name">Area</xsl:with-param></xsl:call-template>
					</xsl:for-each></text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица60.B1" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">	<xsl:for-each select="Area | /STD_MP[not(/.//ExistParcel[Composition_EZ][SubParcels])]">
											<xsl:call-template name="get_value"><xsl:with-param name="p_name">Innccuracy</xsl:with-param></xsl:call-template>
					</xsl:for-each></text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица60.E1" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">	<xsl:for-each select="Encumbrance | /STD_MP[not(/.//ExistParcel[Composition_EZ][SubParcels])]">
											<xsl:call-template name="get_value"><xsl:with-param name="p_name">Type</xsl:with-param></xsl:call-template>
					</xsl:for-each></text:span>
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
										<text:span text:style-name="T3">3. Сведения о местоположении границ <text:s/>частей измененных земельных участков</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table>	<xsl:for-each select="/.//ExistParcel[Composition_EZ] | /STD_MP[not(/.//ExistParcel[Composition_EZ])]"><table:table table:name="Таблица62" table:style-name="Таблица62">
						<table:table-column table:style-name="Таблица62.A"/>
						<table:table-row table:style-name="Таблица62.1">
							<table:table-cell table:style-name="Таблица62.A1" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">Кадастровый номер земельного участка </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s text:c="2"/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T5"><xsl:call-template name="get_value"><xsl:with-param name="p_name">CadastralNumber</xsl:with-param></xsl:call-template></text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table>			<xsl:for-each select="SubParcels/SubParcel  | /STD_MP[not(/.//ExistParcel[Composition_EZ][SubParcels])]">
					<xsl:sort select="@Number_PP" data-type="number"/>
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
										<text:span text:style-name="T3">Учетный номер или обозначение части <text:s text:c="2"/></text:span>
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
										<text:span text:style-name="T5"><xsl:call-template name="get_value"><xsl:with-param name="p_name">Definition</xsl:with-param></xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T5"> </text:span>
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
										<text:span text:style-name="T3">Средняя квадратическая погрешность положения характерной точки (М</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T20">t</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">), м</text:span>
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
										<text:span text:style-name="T7">X</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица63.B2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T7">Y</text:span>
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
						<xsl:for-each select="Entity_Spatial/Spatial_Element | /STD_MP[not(/.//ExistParcel[Composition_EZ][SubParcels])]">
							<xsl:for-each select="Spelement_Unit/Ordinate | /STD_MP[not(/.//ExistParcel[Composition_EZ][SubParcels])]">
<table:table-row table:style-name="Таблица64.3">
							<table:table-cell table:style-name="Таблица64.A3">
								<text:p text:style-name="P63">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="point_name"/></text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица64.B3">
								<text:p text:style-name="P51">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:if test="@X">
<xsl:value-of select="format-number(@X,'#0.00')"/>
</xsl:if>
<xsl:if test="not(@X)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица64.C3">
								<text:p text:style-name="P51">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:if test="@Y">
<xsl:value-of select="format-number(@Y,'#0.00')"/>
</xsl:if>
<xsl:if test="not(@Y)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица64.D3">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="get_value"><xsl:with-param name="p_name">Delta_Geopoint</xsl:with-param></xsl:call-template></text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица64.E3">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="get_value"><xsl:with-param name="p_name">Geopoint_Zacrep</xsl:with-param></xsl:call-template></text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:for-each>
<xsl:if test="position() != last()">
<table:table-row table:style-name="Таблица64.3">
							<table:table-cell table:style-name="Таблица64.A6" table:number-columns-spanned="5" office:value-type="string">
								<text:p text:style-name="P63">
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
</xsl:for-each></xsl:if><xsl:if test="/.//NewParcel/Providing_Pass_CadastralNumbers"><text:p text:style-name="P91"/><table:table table:name="Таблица10" table:style-name="Таблица10">
						<table:table-column table:style-name="Таблица10.A"/>
						<table:table-column table:style-name="Таблица10.B"/>
						<table:table-column table:style-name="Таблица10.C"/>
						<table:table-row table:style-name="Таблица10.1">
							<table:table-cell table:style-name="Таблица10.A1" table:number-columns-spanned="3" office:value-type="string">
								<text:p text:style-name="P75"><text:bookmark-start text:name="Оглавление_Доступ"/><text:span text:style-name="T34">Св</text:span><text:span text:style-name="T33">едения</text:span> о земельных участках, посредством которых обеспечивается доступ к образуемым или изменяемым земельным участкам<text:bookmark-end text:name="Оглавление_Доступ"/></text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
						<table:table-row>
							<table:table-cell table:style-name="Таблица10.A2" office:value-type="string">
								<text:p text:style-name="P15">№ п/п</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица10.B2" office:value-type="string">
								<text:p text:style-name="P15">Кадастровый номер или обозначение земельного участка, для которого обеспечивается доступ</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица10.C2" office:value-type="string">
								<text:p text:style-name="P15">Кадастровый номер или обозначение земельного участка, посредством которого обеспечивается доступ</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table><table:table table:name="Таблица65" table:style-name="Таблица65"><table:table-column table:style-name="Таблица65.A"/><table:table-column table:style-name="Таблица65.B"/><table:table-column table:style-name="Таблица65.C"/><table:table-header-rows>
							<table:table-row table:style-name="Таблица65.1">
								<table:table-cell table:style-name="Таблица65.A1" office:value-type="string">
									<text:p text:style-name="P15">1</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица65.B1" office:value-type="string">
									<text:p text:style-name="P15">2</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица65.C1" office:value-type="string">
									<text:p text:style-name="P15">3</text:p>
								</table:table-cell>
							</table:table-row>
						</table:table-header-rows><!--row-code-->
<xsl:for-each select="STD_MP/Package/FormParcels/*/Providing_Pass_CadastralNumbers/CadastralNumber"><table:table-row table:style-name="Таблица65.1">
							<table:table-cell table:style-name="Таблица65.A3" office:value-type="string">
								<text:p text:style-name="P5">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:value-of select="position()"/></text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица65.B3" office:value-type="string">
								<text:p text:style-name="P5">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:value-of select="./../../@Definition"/></text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица65.C3" office:value-type="string">
								<text:p text:style-name="P5">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:value-of select="."/></text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:for-each>
<xsl:if test="not(STD_MP/Package/FormParcels/*/Providing_Pass_CadastralNumbers/CadastralNumber)"><table:table-row table:style-name="Таблица65.1">
							<table:table-cell table:style-name="Таблица65.A3" office:value-type="string">
								<text:p text:style-name="P5">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T11">-</text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица65.B3" office:value-type="string">
								<text:p text:style-name="P5">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T11">-</text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица65.C3" office:value-type="string">
								<text:p text:style-name="P5">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T11">-</text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:if></table:table><text:p text:style-name="P86"/></xsl:if><xsl:if test="/.//ExistParcel[not(Composition_EZ)]"><table:table table:name="Таблица35" table:style-name="Таблица35">
						<table:table-column table:style-name="Таблица35.A"/>
						<table:table-row table:style-name="Таблица35.1">
							<table:table-cell table:style-name="Таблица35.A1" office:value-type="string">
								<text:p text:style-name="P71"><text:bookmark-start text:name="Оглавление_УточняемыеУчастки"/>Сведения об уточняемых земельных участках и их частях<text:bookmark-end text:name="Оглавление_УточняемыеУчастки"/></text:p>
							</table:table-cell>
						</table:table-row>
					</table:table><xsl:for-each select="/.//ExistParcel">
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
								<text:p text:style-name="P62">1. Сведения о характерных точках границы уточняемого земельного участка</text:p>
								<text:p text:style-name="P63">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">с кадастровым номером </text:span>
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
								<text:p text:style-name="P62">Обозначение характерных точек границы</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица66.B2" table:number-columns-spanned="2" office:value-type="string">
								<text:p text:style-name="P62">Существующие координаты, м</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица66.B2" table:number-columns-spanned="2" office:value-type="string">
								<text:p text:style-name="P62">Уточненные координаты, м</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица66.B2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P63">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">Средняя квадратическая погрешность положения характерной точки (М</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T20">t</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">), м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица66.G2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P62">Описание закрепления точки</text:p>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица66.3">
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица66.B3" office:value-type="string">
								<text:p text:style-name="P66">X</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица66.B3" office:value-type="string">
								<text:p text:style-name="P66">Y</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица66.B3" office:value-type="string">
								<text:p text:style-name="P66">X</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица66.B3" office:value-type="string">
								<text:p text:style-name="P66">Y</text:p>
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
								<text:p text:style-name="P62">1. Сведения о характерных точках границы уточняемого земельного участка</text:p>
								<text:p text:style-name="P63">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">с кадастровым номером </text:span>
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
								<text:p text:style-name="P62">Обозначение характерных точек границы</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица45.B2" table:number-columns-spanned="2" office:value-type="string">
								<text:p text:style-name="P62">Существующие координаты, м</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица45.D2" table:number-columns-spanned="2" office:value-type="string">
								<text:p text:style-name="P62">Уточненные координаты, м</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица45.F2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P63">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">Средняя квадратическая погрешность положения характерной точки (М</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T20">t</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">), м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица45.G2" table:number-rows-spanned="2" office:value-type="string">
								<text:p text:style-name="P62">Описание закрепления точки</text:p>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица45.3">
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица45.F2" office:value-type="string">
								<text:p text:style-name="P66">X</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица45.F2" office:value-type="string">
								<text:p text:style-name="P66">Y</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица45.F2" office:value-type="string">
								<text:p text:style-name="P66">X</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица45.F2" office:value-type="string">
								<text:p text:style-name="P66">Y</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row>
					</table:table><!--row-code-->
</xsl:if><table:table table:name="Таблица36" table:style-name="Таблица36"><table:table-column table:style-name="Таблица36.A"/><table:table-column table:style-name="Таблица36.B"/><table:table-column table:style-name="Таблица36.C"/><table:table-column table:style-name="Таблица36.D"/><table:table-column table:style-name="Таблица36.C"/><table:table-column table:style-name="Таблица36.F"/><table:table-column table:style-name="Таблица36.G"/><table:table-row table:style-name="Таблица36.1">
							<table:table-cell table:style-name="Таблица36.A1" office:value-type="string">
								<text:p text:style-name="P62">1</text:p>
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
								<text:p text:style-name="P62">7</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
			<xsl:for-each select="Contours/Contour/Entity_Spatial | Entity_Spatial">
				<xsl:if test="(ancestor::Contour)"><table:table-row table:style-name="Таблица36.1">
							<table:table-cell table:style-name="Таблица36.A3" table:number-columns-spanned="7" office:value-type="string">
								<text:p text:style-name="P70">
									<text:span text:style-name="User_20_Entry"><xsl:value-of select="ancestor::Contour/@Definition"/> 
</text:span>
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
					<xsl:for-each select="Spelement_Unit/Ordinate">
<xsl:sort select="@Ord_Nmb" data-type="number"/><table:table-row table:style-name="Таблица36.1">
							<table:table-cell table:style-name="Таблица36.A5">
								<text:p text:style-name="P63">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="point_name"/></text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.B5">
								<text:p text:style-name="P51">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="point_coord">
	<xsl:with-param name="o">1</xsl:with-param>
    <xsl:with-param name="x">1</xsl:with-param>
</xsl:call-template></text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.B5">
								<text:p text:style-name="P51">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="point_coord">
	<xsl:with-param name="o">1</xsl:with-param>
	<xsl:with-param name="y">1</xsl:with-param>
</xsl:call-template></text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.B5">
								<text:p text:style-name="P51">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="point_coord">
	<xsl:with-param name="n">1</xsl:with-param>
	<xsl:with-param name="x">1</xsl:with-param>
</xsl:call-template></text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.B5">
								<text:p text:style-name="P51">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="point_coord">
	<xsl:with-param name="n">1</xsl:with-param>
	<xsl:with-param name="y">1</xsl:with-param>
</xsl:call-template></text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.B5">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_value">
  <xsl:with-param name="p_name">Delta_Geopoint</xsl:with-param>
</xsl:call-template>	</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.G5">
								<text:p text:style-name="P63">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_dict">
<xsl:with-param name="p_code">
<xsl:value-of select="@Geopoint_Zacrep"/>
</xsl:with-param>
</xsl:call-template></text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->								
</xsl:for-each>
<xsl:if test="position() != last()">
<table:table-row table:style-name="Таблица36.1">
							<table:table-cell table:style-name="Таблица36.A3" table:number-columns-spanned="7" office:value-type="string">
								<text:p text:style-name="P70">
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
<xsl:if test="descendant::Composition_EZ">

<table:table-row table:style-name="Таблица36.1">
							<table:table-cell table:style-name="Таблица36.A9" office:value-type="string">
								<text:p text:style-name="P87">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.B9" office:value-type="string">
								<text:p text:style-name="P87">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.C9" office:value-type="string">
								<text:p text:style-name="P87">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.D9" office:value-type="string">
								<text:p text:style-name="P87">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.E9" office:value-type="string">
								<text:p text:style-name="P87">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.F9" office:value-type="string">
								<text:p text:style-name="P87">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица36.G9" office:value-type="string">
								<text:p text:style-name="P87">-</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->
</xsl:if></table:table><table:table table:name="Таблица67" table:style-name="Таблица67">
						<table:table-column table:style-name="Таблица67.A"/>
						<table:table-column table:style-name="Таблица67.B"/>
						<table:table-column table:style-name="Таблица67.C"/>
						<table:table-column table:style-name="Таблица67.D"/>
						<table:table-row table:style-name="Таблица67.1">
							<table:table-cell table:style-name="Таблица67.A1" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="P80">2. Сведения о частях границы уточняемого земельного участка</text:p>
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">с кадастровым номером </text:span>
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
										<text:span text:style-name="T3">Горизонтальное проложение (</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T7">S</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">), м</text:span>
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
		<xsl:for-each select="Contours/Contour/Entity_Spatial | Entity_Spatial">
			<xsl:if test="(ancestor::Contour)"><table:table-row table:style-name="Таблица68.1">
							<table:table-cell table:style-name="Таблица68.A3" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="P19">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:value-of select="ancestor::Contour/@Definition"/> 
</text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
							<table:covered-table-cell/>
						</table:table-row><!--row-code-->
			</xsl:if>
			<xsl:for-each select="Borders/Border">
<table:table-row table:style-name="Таблица68.1">
							<table:table-cell table:style-name="Таблица68.A5" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="border_point_name"><xsl:with-param name="p1">1</xsl:with-param></xsl:call-template></text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица68.B5" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="border_point_name"><xsl:with-param name="p2">1</xsl:with-param></xsl:call-template></text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица68.B5" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:for-each select="Edge | /STD_MP[not(/.//ExistParcel)]">
<xsl:call-template name="get_value"><xsl:with-param name="p_name">Length</xsl:with-param></xsl:call-template>	
							</xsl:for-each>			</text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица68.D5" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">	<xsl:for-each select="Edge | /STD_MP[not(/.//ExistParcel)]">
							<xsl:call-template name="get_value"><xsl:with-param name="p_name">Definition</xsl:with-param></xsl:call-template>									
							</xsl:for-each>				</text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->								

			<xsl:if test="./@Spatial != following-sibling::*[1]/@Spatial"><table:table-row table:style-name="Таблица68.1">
							<table:table-cell table:style-name="Таблица68.A3" table:number-columns-spanned="4" office:value-type="string">
								<text:p text:style-name="P19">
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
<xsl:if test="descendant::Composition_EZ"><table:table-row table:style-name="Таблица68.1">
							<table:table-cell table:style-name="Таблица68.A9" office:value-type="string">
								<text:p text:style-name="P87">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица68.B9" office:value-type="string">
								<text:p text:style-name="P87">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица68.B9" office:value-type="string">
								<text:p text:style-name="P87">-</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица68.D9" office:value-type="string">
								<text:p text:style-name="P87">-</text:p>
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
										<text:span text:style-name="T3">с кадастровым номером </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="get_value"><xsl:with-param name="p_name">CadastralNumber</xsl:with-param></xsl:call-template></text:span>
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
										<text:span text:style-name="T3">Учетный номер или обозначение <text:s/>части <text:s/></text:span>
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
										<text:span text:style-name="T5"><xsl:call-template name="get_value"><xsl:with-param name="p_name">Definition</xsl:with-param></xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T5"> </text:span>
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
										<text:span text:style-name="T3">Средняя квадратическая погрешность положения характерной точки (М</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T20">t</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">), м</text:span>
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
										<text:span text:style-name="T7">X</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица70.B2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T7">Y</text:span>
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
							<table:table-cell table:style-name="Таблица71.A3">
								<text:p text:style-name="P63">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="point_name"/></text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица71.B3">
								<text:p text:style-name="P51">
									<text:span text:style-name="User_20_Entry"><xsl:if test="@X">
<xsl:value-of select="format-number(@X,'#0.00')"/>
</xsl:if>
<xsl:if test="not(@X)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица71.C3">
								<text:p text:style-name="P51">
									<text:span text:style-name="User_20_Entry"><xsl:if test="@Y">
<xsl:value-of select="format-number(@Y,'#0.00')"/>
</xsl:if>
<xsl:if test="not(@Y)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица71.D3">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_value"><xsl:with-param name="p_name">Delta_Geopoint</xsl:with-param></xsl:call-template></text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица71.E3">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry"><xsl:call-template name="get_value"><xsl:with-param name="p_name">Geopoint_Zacrep</xsl:with-param></xsl:call-template></text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->								
					</xsl:for-each>
					<xsl:if test="position() != last()"><table:table-row table:style-name="Таблица71.2">
							<table:table-cell table:style-name="Таблица71.A6" table:number-columns-spanned="5" office:value-type="string">
								<text:p text:style-name="P63"/>
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
										<text:span text:style-name="T3">с кадастровым номером </text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T3">
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
										<text:span text:style-name="T3">(Р±∆Р), м</text:span>
									</text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span><text:s text:c="2"/><text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">2</text:span>
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
								</text:p>
							</table:table-cell>
						</table:table-row><table:table-row table:style-name="Таблица72.5">
							<table:table-cell table:style-name="Таблица72.A3" office:value-type="string">
								<text:p text:style-name="P1">2</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица72.B3" office:value-type="string">
								<text:p text:style-name="Обычный">Площадь земельного участка по сведениям государственного кадастра недвижимости <text:s text:c="2"/><text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">(Ркад), м</text:span>
									</text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span><text:s text:c="2"/><text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">2</text:span>
									</text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span></text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица72.C3" office:value-type="string">
								<text:p text:style-name="P35">-</text:p>
							</table:table-cell>
						</table:table-row><table:table-row table:style-name="Таблица72.5">
							<table:table-cell table:style-name="Таблица72.A3" office:value-type="string">
								<text:p text:style-name="P1">3</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица72.B3" office:value-type="string">
								<text:p text:style-name="Обычный">Оценка расхождения<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3"><text:s text:c="2"/>Р и Р кад (Р-Ркад), м</text:span>
									</text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span><text:s text:c="2"/><text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">2</text:span>
									</text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span></text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица72.C3" office:value-type="string">
								<text:p text:style-name="P35">-</text:p>
							</table:table-cell>
						</table:table-row><table:table-row table:style-name="Таблица72.5">
							<table:table-cell table:style-name="Таблица72.A3" office:value-type="string">
								<text:p text:style-name="P1">4</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица72.B8" office:value-type="string">
								<text:p text:style-name="Обычный">Предельный минимальный и максимальный размер земельного участка<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3"><text:s text:c="2"/>(Рмин и Рмакс), м</text:span>
									</text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span><text:s text:c="2"/><text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">2</text:span>
									</text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span></text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица72.C3" office:value-type="string">
								<text:p text:style-name="P28">-</text:p>
							</table:table-cell>
						</table:table-row><table:table-row table:style-name="Таблица72.5">
							<table:table-cell table:style-name="Таблица72.A3" office:value-type="string">
								<text:p text:style-name="P1">5</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица72.B9" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T19">Кадастровые или иные номера зданий, сооружений, объектов незавершенного строительства, <text:s/>расположенных на земельном участке</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица72.C3" office:value-type="string">
								<text:p text:style-name="P46">
									<text:span text:style-name="User_20_Entry"><xsl:for-each select="Inner_CadastralNumbers">
				<xsl:call-template name="get_value"><xsl:with-param name="p_name">CadastralNumber</xsl:with-param></xsl:call-template>
				<xsl:if test="position() != last()">
					<xsl:value-of select="','"/>
				</xsl:if>
</xsl:for-each>
<xsl:if test="not(Inner_CadastralNumbers)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
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
								<text:p text:style-name="P28">-</text:p>
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
								<text:p text:style-name="P11">5. Общие сведения о частях уточняемого земельного участка</text:p>
								<text:p text:style-name="P2">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">с кадастровым номером</text:span>
									</text:span>
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
								<text:p text:style-name="P11">№ п/п</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица73.B2" office:value-type="string">
								<text:p text:style-name="P11">Учетный номер или обозначение части</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица73.B2" office:value-type="string">
								<text:p text:style-name="P2">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">Площадь (Р), м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">2</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
								<text:p text:style-name="P11"/>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица73.B2" office:value-type="string">
								<text:p text:style-name="P2">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">±∆Р, м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">2</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица73.E2" office:value-type="string">
								<text:p text:style-name="P11">Характеристика части</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table><table:table table:name="Таблица74" table:style-name="Таблица74"><table:table-column table:style-name="Таблица74.A"/><table:table-column table:style-name="Таблица74.B"/><table:table-column table:style-name="Таблица74.C"/><table:table-column table:style-name="Таблица74.D"/><table:table-column table:style-name="Таблица74.E"/><table:table-header-rows>
							<table:table-row table:style-name="Таблица74.1">
								<table:table-cell table:style-name="Таблица74.A1" office:value-type="string">
									<text:p text:style-name="P11">1</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица74.B1" office:value-type="string">
									<text:p text:style-name="P11">2</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица74.B1" office:value-type="string">
									<text:p text:style-name="P11">3</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица74.B1" office:value-type="string">
									<text:p text:style-name="P11">4</text:p>
								</table:table-cell>
								<table:table-cell table:style-name="Таблица74.E1" office:value-type="string">
									<text:p text:style-name="P11">5</text:p>
								</table:table-cell>
							</table:table-row>
						</table:table-header-rows><!--row-code-->
<xsl:for-each select="SubParcels/SubParcel | /STD_MP[not(/.//ExistParcel[not(Composition_EZ)][SubParcels])]"><table:table-row table:style-name="Таблица74.1">
							<table:table-cell table:style-name="Таблица74.A1" office:value-type="string">
								<text:p text:style-name="P11">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">	<xsl:if test="self::SubParcel"><xsl:value-of select="position()"/></xsl:if>
	<xsl:if test="not(self::SubParcel)"><xsl:value-of select="'-'"/></xsl:if>
</text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица74.B1" office:value-type="string">
								<text:p text:style-name="P11">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24">	<xsl:call-template name="get_value"><xsl:with-param name="p_name">Definition</xsl:with-param></xsl:call-template></text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица74.B1" office:value-type="string">
								<text:p text:style-name="P11">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:for-each select="Area  | /STD_MP[not(/.//ExistParcel[SubParcels])]">
				<xsl:call-template name="get_value"><xsl:with-param name="p_name">Area</xsl:with-param></xsl:call-template>
		</xsl:for-each></text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица74.B1" office:value-type="string">
								<text:p text:style-name="P11">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:for-each select="Area  | /STD_MP[not(/.//ExistParcel[SubParcels])]">				
				<xsl:call-template name="get_value"><xsl:with-param name="p_name">Innccuracy</xsl:with-param></xsl:call-template>
		</xsl:for-each>
</text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица74.E1" office:value-type="string">
								<text:p text:style-name="P11">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:for-each select="Encumbrance  | /STD_MP[not(/.//ExistParcel[SubParcels])]">				
				<xsl:call-template name="get_value"><xsl:with-param name="p_name">Type</xsl:with-param></xsl:call-template>
		</xsl:for-each>
</text:span>
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
								<text:p text:style-name="P63">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">с кадастровым номером (обозначением) <text:s text:c="2"/></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T3">
											<text:s/>
										</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T8"><xsl:call-template name="get_value"><xsl:with-param name="p_name">CadastralNumber</xsl:with-param></xsl:call-template>		</text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T3"> </text:span>
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
								<text:p text:style-name="P6">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T13">-</text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица75.B2" office:value-type="string">
								<text:p text:style-name="P6">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T13">-</text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица75.C4" office:value-type="string">
								<text:p text:style-name="P6">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T13">-</text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row>
					</table:table>		</xsl:for-each>		
</xsl:if>
<xsl:if test="/.//NewSubParcel"><text:p text:style-name="Text_20_body"/><text:p text:style-name="P40"/><text:p text:style-name="P40"/><table:table table:name="Таблица42" table:style-name="Таблица42">
						<table:table-column table:style-name="Таблица42.A"/>
						<table:table-row table:style-name="Таблица42.1">
							<table:table-cell table:style-name="Таблица42.A1" office:value-type="string">
								<text:p text:style-name="P73"><text:bookmark-start text:name="Оглавление_ОбразуемыеЧасти"/>Сведения об образуемых частях земельного участка<text:bookmark-end text:name="Оглавление_ОбразуемыеЧасти"/></text:p>
							</table:table-cell>
						</table:table-row>
					</table:table>	<xsl:for-each select="/.//NewSubParcel[not(CadastralNumber_Parcel = preceding::CadastralNumber_Parcel)] | /STD_MP[not(/.//NewSubParcel)]"><table:table table:name="Таблица79" table:style-name="Таблица79">
						<table:table-column table:style-name="Таблица79.A"/>
						<table:table-row>
							<table:table-cell table:style-name="Таблица79.A1" office:value-type="string">
								<text:p text:style-name="Обычный">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">Кадастровый номер земельного участка <text:s/></text:span>
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
										<text:span text:style-name="T5"><xsl:call-template name="get_value"><xsl:with-param name="p_name">CadastralNumber_Parcel</xsl:with-param></xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T5"> </text:span>
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
										<text:span text:style-name="T3">Обозначение части <text:s/></text:span>
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
										<text:span text:style-name="T5"><xsl:call-template name="get_value"><xsl:with-param name="p_name">Definition</xsl:with-param></xsl:call-template></text:span>
									</text:span>
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T5"> </text:span>
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
										<text:span text:style-name="T3">Средняя квадратическая погрешность </text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">положения характерной точки (М</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T20">t</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">), м</text:span>
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
										<text:span text:style-name="T7">X</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица80.B2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T7">Y</text:span>
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
				<xsl:for-each select="Spelement_Unit/Ordinate | /STD_MP[not(/.//NewSubParcel)]">
							<xsl:sort select="@Ord_Nmb" data-type="number"/>	<table:table-row table:style-name="Таблица78.2">
							<table:table-cell table:style-name="Таблица78.A3">
								<text:p text:style-name="P63">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="point_name"/></text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица78.B3">
								<text:p text:style-name="P51">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:if test="@X">
<xsl:value-of select="format-number(@X,'#0.00')"/>
</xsl:if>
<xsl:if test="not(@X)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица78.C3">
								<text:p text:style-name="P51">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:if test="@Y">
<xsl:value-of select="format-number(@Y,'#0.00')"/>
</xsl:if>
<xsl:if test="not(@Y)">
<xsl:value-of select="'-'"/>
</xsl:if></text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица78.D3">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="get_value"><xsl:with-param name="p_name">Delta_Geopoint</xsl:with-param></xsl:call-template></text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица78.E3">
								<text:p text:style-name="P1">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="get_value"><xsl:with-param name="p_name">Geopoint_Zacrep</xsl:with-param></xsl:call-template></text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->			
				</xsl:for-each>
		<xsl:if test="position() != last()"><table:table-row table:style-name="Таблица78.2">
							<table:table-cell table:style-name="Таблица78.A6" table:number-columns-spanned="5" office:value-type="string">
								<text:p text:style-name="P63"/>
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
								<text:p text:style-name="P81">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">2. Общие сведения о частях земельного участка</text:span>
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
										<text:span text:style-name="T3">Площадь (Р), м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">2</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
								</text:p>
								<text:p text:style-name="P9"/>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица77.B2" office:value-type="string">
								<text:p text:style-name="P1">
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T3">±∆Р, м</text:span>
									</text:span>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
									<text:s text:c="2"/>
									<text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T21">2</text:span>
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
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица76.B3" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:call-template name="get_value"><xsl:with-param name="p_name">Definition</xsl:with-param></xsl:call-template>	</text:span>
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
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица76.B3" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:for-each select="Area">
<xsl:call-template name="get_value"><xsl:with-param name="p_name">Innccuracy</xsl:with-param></xsl:call-template>	
</xsl:for-each></text:span>
									</text:span>
								</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица76.E3" office:value-type="string">
								<text:p text:style-name="P9">
									<text:span text:style-name="User_20_Entry">
										<text:span text:style-name="T24"><xsl:for-each select="Encumbrance">
<xsl:call-template name="get_value"><xsl:with-param name="p_name">Type</xsl:with-param></xsl:call-template>	
</xsl:for-each></text:span>
									</text:span>
								</text:p>
							</table:table-cell>
						</table:table-row><!--row-code-->	
	</xsl:for-each>
</table:table></xsl:if><text:p text:style-name="Text_20_body"/><text:p text:style-name="P93"/><text:p text:style-name="P40"/><table:table table:name="Таблица44" table:style-name="Таблица44">
						<table:table-column table:style-name="Таблица44.A"/>
						<table:table-column table:style-name="Таблица44.B"/>
						<table:table-column table:style-name="Таблица44.C"/>
						<table:table-row table:style-name="Таблица44.1">
							<table:table-cell table:style-name="Таблица44.A1" office:value-type="string">
								<text:p text:style-name="P76"/>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица44.B1" office:value-type="string">
								<text:p text:style-name="P82">Лист№ </text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица44.A1" office:value-type="string">
								<text:p text:style-name="P41"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица44.2">
							<table:table-cell table:style-name="Таблица44.A2" table:number-columns-spanned="2" office:value-type="string">
								<text:p text:style-name="P12">МЕЖЕВОЙ ПЛАН</text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица44.A1" office:value-type="string">
								<text:p text:style-name="P12"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица44.3">
							<table:table-cell table:style-name="Таблица44.A3" table:number-columns-spanned="2" office:value-type="string">
								<text:p text:style-name="P12"><text:bookmark-start text:name="Оглавление_ЗаключениеКадастровогоИнженер"/>Заключение кадастрового инженера<text:bookmark-end text:name="Оглавление_ЗаключениеКадастровогоИнженер"/></text:p>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица44.A1" office:value-type="string">
								<text:p text:style-name="P12"/>
							</table:table-cell>
						</table:table-row>
						<table:table-row table:style-name="Таблица44.4">
							<table:table-cell table:style-name="Таблица44.B1" table:number-columns-spanned="2" office:value-type="string">
								<text:p text:style-name="P41"/>
							</table:table-cell>
							<table:covered-table-cell/>
							<table:table-cell table:style-name="Таблица44.A1" office:value-type="string">
								<text:p text:style-name="P41"/>
							</table:table-cell>
						</table:table-row>
					</table:table><text:p text:style-name="P106"/><table:table table:name="Таблица49" table:style-name="Таблица49">
						<table:table-column table:style-name="Таблица49.A"/>
						<table:table-row table:style-name="Таблица49.1">
							<table:table-cell table:style-name="Таблица49.A1" office:value-type="string">
								<text:p text:style-name="P43">Лист № <text:s text:c="2"/><text:span text:style-name="Основной_20_шрифт_20_абзаца">
										<text:span text:style-name="T2">, стр. 2</text:span>
									</text:span><text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span></text:p>
							</table:table-cell>
						</table:table-row>
					</table:table><text:p text:style-name="P12"/><text:p text:style-name="P12">АКТ СОГЛАСОВАНИЯ МЕСТОПОЛОЖЕНИЯ ГРАНИЦЫ</text:p><text:p text:style-name="P12">ЗЕМЕЛЬНОГО УЧАСТКА</text:p><text:p text:style-name="P16"/><text:p text:style-name="P41">
						<text:span text:style-name="Основной_20_шрифт_20_абзаца">
							<text:span text:style-name="T3">Кадастровый номер или обозначение земельного участка <text:s/></text:span>
						</text:span>
					</text:p><text:p text:style-name="P41">
						<text:span text:style-name="Основной_20_шрифт_20_абзаца">
							<text:span text:style-name="T3">Площадь земельного участка <text:s text:c="5"/></text:span>
						</text:span>
						<text:span text:style-name="Основной_20_шрифт_20_абзаца">
							<text:span text:style-name="T2"><text:s/>кв.м.</text:span>
						</text:span>
						<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
					</text:p><text:p text:style-name="P16"/><text:p text:style-name="P12">Местоположение границы земельного участка согласовано:</text:p><text:p text:style-name="P12"/><table:table table:name="Таблица50" table:style-name="Таблица50">
						<table:table-column table:style-name="Таблица50.A"/>
						<table:table-column table:style-name="Таблица50.B"/>
						<table:table-column table:style-name="Таблица50.C"/>
						<table:table-column table:style-name="Таблица50.D"/>
						<table:table-column table:style-name="Таблица50.E"/>
						<table:table-column table:style-name="Таблица50.F"/>
						<table:table-row>
							<table:table-cell table:style-name="Таблица50.A1" office:value-type="string">
								<text:p text:style-name="P12">Обозначение характерной точки или части границы</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица50.A1" office:value-type="string">
								<text:p text:style-name="P12">Кадастровый номер смежного земельного участка</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица50.A1" office:value-type="string">
								<text:p text:style-name="P12">Фамилия и инициалы правообладателя или его представителя, реквизиты документа, удостоверяющего личность</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица50.A1" office:value-type="string">
								<text:p text:style-name="P12">Реквизиты доверен-</text:p>
								<text:p text:style-name="P12">ности</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица50.A1" office:value-type="string">
								<text:p text:style-name="P12">Подпись</text:p>
								<text:p text:style-name="P12">и дата</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица50.A1" office:value-type="string">
								<text:p text:style-name="P12">Способ и дата извещения</text:p>
							</table:table-cell>
						</table:table-row>
						<table:table-row>
							<table:table-cell table:style-name="Таблица50.A2" office:value-type="string">
								<text:p text:style-name="P12">1</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица50.B2" office:value-type="string">
								<text:p text:style-name="P12">2</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица50.C2" office:value-type="string">
								<text:p text:style-name="P12">3</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица50.D2" office:value-type="string">
								<text:p text:style-name="P12">4</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица50.E2" office:value-type="string">
								<text:p text:style-name="P12">5</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица50.F2" office:value-type="string">
								<text:p text:style-name="P12">6</text:p>
							</table:table-cell>
						</table:table-row>
						<table:table-row>
							<table:table-cell table:style-name="Таблица50.A1" office:value-type="string">
								<text:p text:style-name="P3"/>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица50.A1" office:value-type="string">
								<text:p text:style-name="P3"/>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица50.A1" office:value-type="string">
								<text:p text:style-name="P3"/>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица50.A1" office:value-type="string">
								<text:p text:style-name="P3"/>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица50.A1" office:value-type="string">
								<text:p text:style-name="P3"/>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица50.A1" office:value-type="string">
								<text:p text:style-name="P3"/>
							</table:table-cell>
						</table:table-row>
					</table:table><text:p text:style-name="P23"/><text:p text:style-name="P83">Наличие разногласий при согласовании местоположения границы земельного участка:</text:p><text:p text:style-name="P83"/><table:table table:name="Таблица51" table:style-name="Таблица51">
						<table:table-column table:style-name="Таблица51.A" table:number-columns-repeated="2"/>
						<table:table-column table:style-name="Таблица51.C"/>
						<table:table-row>
							<table:table-cell table:style-name="Таблица51.A1" office:value-type="string">
								<text:p text:style-name="P12">Обозначение характерной точки или части границы</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица51.A1" office:value-type="string">
								<text:p text:style-name="P12">Кадастровый номер смежного земельного участка</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица51.A1" office:value-type="string">
								<text:p text:style-name="P12">Содержание возражений о местоположении границы</text:p>
							</table:table-cell>
						</table:table-row>
						<table:table-row>
							<table:table-cell table:style-name="Таблица51.A1" office:value-type="string">
								<text:p text:style-name="P12">1</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица51.A1" office:value-type="string">
								<text:p text:style-name="P12">2</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица51.A1" office:value-type="string">
								<text:p text:style-name="P12">3</text:p>
							</table:table-cell>
						</table:table-row>
						<table:table-row>
							<table:table-cell table:style-name="Таблица51.A3" office:value-type="string">
								<text:p text:style-name="P3"/>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица51.B3" office:value-type="string">
								<text:p text:style-name="P3"/>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица51.C3" office:value-type="string">
								<text:p text:style-name="P3"/>
							</table:table-cell>
						</table:table-row>
					</table:table><text:p text:style-name="P84"/><text:p text:style-name="P16">Сведения о снятии возражений о местоположении границы земельного участка:</text:p><table:table table:name="Таблица52" table:style-name="Таблица52">
						<table:table-column table:style-name="Таблица52.A"/>
						<table:table-column table:style-name="Таблица52.B"/>
						<table:table-column table:style-name="Таблица52.C"/>
						<table:table-column table:style-name="Таблица52.D"/>
						<table:table-row>
							<table:table-cell table:style-name="Таблица52.A1" office:value-type="string">
								<text:p text:style-name="P12">Обозначение характерной точки или части границы</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица52.A1" office:value-type="string">
								<text:p text:style-name="P12">Кадастровый номер смежного земельного участка</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица52.A1" office:value-type="string">
								<text:p text:style-name="P12">Фамилия и инициалы правообладателя, реквизиты документа, удостоверяющего личность, дата снятия возражений, подпись</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица52.A1" office:value-type="string">
								<text:p text:style-name="P12">Способ снятий о местоположении границы (изменение местоположения границы, рассмотрение земельного спора в суде, третейском суде)</text:p>
							</table:table-cell>
						</table:table-row>
						<table:table-row>
							<table:table-cell table:style-name="Таблица52.A1" office:value-type="string">
								<text:p text:style-name="P12">1</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица52.A1" office:value-type="string">
								<text:p text:style-name="P12">2</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица52.A1" office:value-type="string">
								<text:p text:style-name="P12">3</text:p>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица52.A1" office:value-type="string">
								<text:p text:style-name="P12">4</text:p>
							</table:table-cell>
						</table:table-row>
						<table:table-row>
							<table:table-cell table:style-name="Таблица52.A1" office:value-type="string">
								<text:p text:style-name="P3"/>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица52.A1" office:value-type="string">
								<text:p text:style-name="P3"/>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица52.A1" office:value-type="string">
								<text:p text:style-name="P3"/>
							</table:table-cell>
							<table:table-cell table:style-name="Таблица52.A1" office:value-type="string">
								<text:p text:style-name="P3"/>
							</table:table-cell>
						</table:table-row>
					</table:table><text:p text:style-name="P24"/><text:p text:style-name="P41">
						<text:span text:style-name="Основной_20_шрифт_20_абзаца">
							<text:span text:style-name="T3">Кадастровый <text:s/>инженер: ___________________ <text:s/></text:span>
						</text:span>
					</text:p><text:p text:style-name="P41"><text:s text:c="68"/>М.П. <text:s text:c="6"/>подпись <text:s text:c="35"/>фамилия, инициалы</text:p><text:section text:style-name="Sect2" text:name="Sect15">
						<text:p text:style-name="P1"/>
						<text:p text:style-name="P77">
							<text:span text:style-name="Основной_20_шрифт_20_абзаца">
								<text:span text:style-name="T22">Приложение к межевому плану</text:span>
							</text:span>
							<text:span text:style-name="Основной_20_шрифт_20_абзаца"> </text:span>
						</text:p>
						<text:p text:style-name="P44"/>
						<text:p text:style-name="P55">Копия</text:p>
						<text:p text:style-name="P55"/>
						<text:p text:style-name="P55">Приказ </text:p>
						<text:p text:style-name="P1">
							<text:span text:style-name="Основной_20_шрифт_20_абзаца">
								<text:span text:style-name="T37">№ _____ <text:s text:c="3"/><text:tab/><text:s text:c="2"/><text:tab/>«____» ________ 20___ г. </text:span>
							</text:span>
						</text:p>
						<text:p text:style-name="P56">о наделении полномочиями представлять интересы <text:s/>… при … Зам. руководителя администрации </text:p>
						<text:p text:style-name="P54">…</text:p>
						<text:p text:style-name="P54">… </text:p>
						<text:p text:style-name="P54"/>
						<text:p text:style-name="P54"/>
						<text:p text:style-name="P54">«Копия верна»</text:p>
						<text:p text:style-name="P54">Кадастровый инженер <text:s/>(Фамилия, инициалы) <text:s text:c="3"/></text:p>
						<text:p text:style-name="P54"><text:s text:c="12"/><text:tab/><text:s text:c="2"/><text:tab/><text:s text:c="2"/><text:tab/><text:s text:c="2"/><text:tab/>_______________ (подпись) «____» ____________ 20___ г.</text:p>
						<text:p text:style-name="Обычный">
							<text:span text:style-name="Основной_20_шрифт_20_абзаца">
								<text:span text:style-name="T37"><text:s/>оттиск печати кадастрового инженера </text:span>
							</text:span>
						</text:p>
						<text:p text:style-name="P54"/>
					</text:section></office:text>
			</office:body>
		</office:document-content></xsl:variable>	
				<xsl:apply-templates select="ext:node-set($vPass1)/*" mode="pass2"/>
				</xsl:template></xsl:stylesheet>