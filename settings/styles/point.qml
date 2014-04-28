<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="2.2.0-Valmiera" minimumScale="0" maximumScale="1e+08" simplifyDrawingHints="0" minLabelScale="1" maxLabelScale="1e+08" simplifyDrawingTol="1" simplifyMaxScale="1" hasScaleBasedVisibilityFlag="0" simplifyLocal="1" scaleBasedLabelVisibilityFlag="0">
  <renderer-v2 symbollevels="0" type="RuleRenderer">
    <rules>
      <rule scalemaxdenom="10000" description="окружность диаметром 1.5 мм" filter="&quot;uslovnyy_znak&quot; = 0" symbol="0" scalemindenom="1" label="характерная точка границы, сведения о которой не позволяют однозначно определить ее положение на местности"/>
      <rule scalemaxdenom="10000" description="круг черного цвета диаметром 1.5 мм" filter="&quot;uslovnyy_znak&quot; = 1" symbol="1" scalemindenom="1" label="характерная точка границы, сведения о которой позволяют однозначно определить ее положение на местности"/>
    </rules>
    <symbols>
      <symbol alpha="1" type="marker" name="0">
        <layer pass="0" class="SimpleMarker" locked="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="255,255,255,255"/>
          <prop k="color_border" v="0,0,0,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="area"/>
          <prop k="size" v="1.5"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
        </layer>
      </symbol>
      <symbol alpha="1" type="marker" name="1">
        <layer pass="0" class="SimpleMarker" locked="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,0,0,255"/>
          <prop k="color_border" v="0,0,0,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="area"/>
          <prop k="size" v="1.5"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <customproperties>
    <property key="labeling" value="pal"/>
    <property key="labeling/addDirectionSymbol" value="false"/>
    <property key="labeling/angleOffset" value="0"/>
    <property key="labeling/blendMode" value="0"/>
    <property key="labeling/bufferBlendMode" value="0"/>
    <property key="labeling/bufferColorA" value="255"/>
    <property key="labeling/bufferColorB" value="255"/>
    <property key="labeling/bufferColorG" value="255"/>
    <property key="labeling/bufferColorR" value="255"/>
    <property key="labeling/bufferDraw" value="true"/>
    <property key="labeling/bufferJoinStyle" value="64"/>
    <property key="labeling/bufferNoFill" value="false"/>
    <property key="labeling/bufferSize" value="0.5"/>
    <property key="labeling/bufferSizeInMapUnits" value="false"/>
    <property key="labeling/bufferTransp" value="0"/>
    <property key="labeling/centroidWhole" value="false"/>
    <property key="labeling/dataDefined/Italic" value="1~~0~~~~pre"/>
    <property key="labeling/dataDefined/PositionX" value="1~~0~~~~podpis_x"/>
    <property key="labeling/dataDefined/PositionY" value="1~~0~~~~podpis_y"/>
    <property key="labeling/dataDefined/Underline" value="1~~0~~~~pre"/>
    <property key="labeling/decimals" value="0"/>
    <property key="labeling/displayAll" value="true"/>
    <property key="labeling/dist" value="1"/>
    <property key="labeling/distInMapUnits" value="false"/>
    <property key="labeling/enabled" value="true"/>
    <property key="labeling/fieldName" value="&quot;prefiks_nomera&quot;  || tostring(  &quot;nomer&quot; )"/>
    <property key="labeling/fontBold" value="false"/>
    <property key="labeling/fontCapitals" value="0"/>
    <property key="labeling/fontFamily" value="MS Shell Dlg 2"/>
    <property key="labeling/fontItalic" value="false"/>
    <property key="labeling/fontLetterSpacing" value="0"/>
    <property key="labeling/fontLimitPixelSize" value="false"/>
    <property key="labeling/fontMaxPixelSize" value="10000"/>
    <property key="labeling/fontMinPixelSize" value="3"/>
    <property key="labeling/fontSize" value="7.25"/>
    <property key="labeling/fontSizeInMapUnits" value="false"/>
    <property key="labeling/fontStrikeout" value="false"/>
    <property key="labeling/fontUnderline" value="false"/>
    <property key="labeling/fontWeight" value="50"/>
    <property key="labeling/fontWordSpacing" value="0"/>
    <property key="labeling/formatNumbers" value="false"/>
    <property key="labeling/isExpression" value="true"/>
    <property key="labeling/labelOffsetInMapUnits" value="true"/>
    <property key="labeling/labelPerPart" value="false"/>
    <property key="labeling/leftDirectionSymbol" value="&lt;"/>
    <property key="labeling/limitNumLabels" value="false"/>
    <property key="labeling/maxCurvedCharAngleIn" value="20"/>
    <property key="labeling/maxCurvedCharAngleOut" value="-20"/>
    <property key="labeling/maxNumLabels" value="2000"/>
    <property key="labeling/mergeLines" value="false"/>
    <property key="labeling/minFeatureSize" value="0"/>
    <property key="labeling/multilineAlign" value="0"/>
    <property key="labeling/multilineHeight" value="1"/>
    <property key="labeling/namedStyle" value="Обычный"/>
    <property key="labeling/obstacle" value="true"/>
    <property key="labeling/placeDirectionSymbol" value="0"/>
    <property key="labeling/placement" value="0"/>
    <property key="labeling/placementFlags" value="0"/>
    <property key="labeling/plussign" value="false"/>
    <property key="labeling/preserveRotation" value="true"/>
    <property key="labeling/previewBkgrdColor" value="#ffffff"/>
    <property key="labeling/priority" value="10"/>
    <property key="labeling/quadOffset" value="4"/>
    <property key="labeling/reverseDirectionSymbol" value="false"/>
    <property key="labeling/rightDirectionSymbol" value=">"/>
    <property key="labeling/scaleMax" value="10000"/>
    <property key="labeling/scaleMin" value="1"/>
    <property key="labeling/scaleVisibility" value="true"/>
    <property key="labeling/shadowBlendMode" value="6"/>
    <property key="labeling/shadowColorB" value="0"/>
    <property key="labeling/shadowColorG" value="0"/>
    <property key="labeling/shadowColorR" value="0"/>
    <property key="labeling/shadowDraw" value="false"/>
    <property key="labeling/shadowOffsetAngle" value="135"/>
    <property key="labeling/shadowOffsetDist" value="1"/>
    <property key="labeling/shadowOffsetGlobal" value="true"/>
    <property key="labeling/shadowOffsetUnits" value="1"/>
    <property key="labeling/shadowRadius" value="1.5"/>
    <property key="labeling/shadowRadiusAlphaOnly" value="false"/>
    <property key="labeling/shadowRadiusUnits" value="1"/>
    <property key="labeling/shadowScale" value="100"/>
    <property key="labeling/shadowTransparency" value="30"/>
    <property key="labeling/shadowUnder" value="0"/>
    <property key="labeling/shapeBlendMode" value="0"/>
    <property key="labeling/shapeBorderColorA" value="255"/>
    <property key="labeling/shapeBorderColorB" value="128"/>
    <property key="labeling/shapeBorderColorG" value="128"/>
    <property key="labeling/shapeBorderColorR" value="128"/>
    <property key="labeling/shapeBorderWidth" value="0"/>
    <property key="labeling/shapeBorderWidthUnits" value="1"/>
    <property key="labeling/shapeDraw" value="false"/>
    <property key="labeling/shapeFillColorA" value="255"/>
    <property key="labeling/shapeFillColorB" value="255"/>
    <property key="labeling/shapeFillColorG" value="255"/>
    <property key="labeling/shapeFillColorR" value="255"/>
    <property key="labeling/shapeJoinStyle" value="64"/>
    <property key="labeling/shapeOffsetUnits" value="1"/>
    <property key="labeling/shapeOffsetX" value="0"/>
    <property key="labeling/shapeOffsetY" value="0"/>
    <property key="labeling/shapeRadiiUnits" value="1"/>
    <property key="labeling/shapeRadiiX" value="0"/>
    <property key="labeling/shapeRadiiY" value="0"/>
    <property key="labeling/shapeRotation" value="0"/>
    <property key="labeling/shapeRotationType" value="0"/>
    <property key="labeling/shapeSVGFile" value=""/>
    <property key="labeling/shapeSizeType" value="0"/>
    <property key="labeling/shapeSizeUnits" value="1"/>
    <property key="labeling/shapeSizeX" value="0"/>
    <property key="labeling/shapeSizeY" value="0"/>
    <property key="labeling/shapeTransparency" value="0"/>
    <property key="labeling/shapeType" value="0"/>
    <property key="labeling/textColorA" value="255"/>
    <property key="labeling/textColorB" value="0"/>
    <property key="labeling/textColorG" value="0"/>
    <property key="labeling/textColorR" value="0"/>
    <property key="labeling/textTransp" value="0"/>
    <property key="labeling/upsidedownLabels" value="0"/>
    <property key="labeling/wrapChar" value=""/>
    <property key="labeling/xOffset" value="0"/>
    <property key="labeling/yOffset" value="0"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerTransparency>0</layerTransparency>
  <displayfield>id</displayfield>
  <label>0</label>
  <labelfield>nomer</labelfield>
  <labelattributes>
    <label fieldname="nomer" text="Подпись"/>
    <family fieldname="" name="MS Shell Dlg 2"/>
    <size fieldname="" units="pt" value="12"/>
    <bold fieldname="" on="0"/>
    <italic fieldname="" on="0"/>
    <underline fieldname="" on="0"/>
    <strikeout fieldname="" on="0"/>
    <color fieldname="" red="0" blue="0" green="0"/>
    <x fieldname=""/>
    <y fieldname=""/>
    <offset x="0" y="0" units="pt" yfieldname="" xfieldname=""/>
    <angle fieldname="" value="0" auto="0"/>
    <alignment fieldname="" value="center"/>
    <buffercolor fieldname="" red="255" blue="255" green="255"/>
    <buffersize fieldname="" units="pt" value="1"/>
    <bufferenabled fieldname="" on=""/>
    <multilineenabled fieldname="" on=""/>
    <selectedonly on=""/>
  </labelattributes>
  <edittypes>
    <edittype labelontop="0" editable="1" type="11" name="create_date"/>
    <edittype labelontop="0" editable="1" type="11" name="create_user"/>
    <edittype labelontop="0" editable="1" type="11" name="id"/>
    <edittype labelontop="0" editable="1" type="11" name="id_child"/>
    <edittype labelontop="0" editable="1" allowNull="false" orderByValue="true" key="id" layer="metod_opredeleniya_tochki20121205171115970" allowMulti="false" type="15" value="znachenie" name="id_metod_opredeleniya"/>
    <edittype labelontop="0" editable="1" allowNull="false" orderByValue="false" key="id" layer="sistema_koordinat20121212081704559" allowMulti="false" type="15" value="zona" name="id_msk"/>
    <edittype labelontop="0" editable="1" allowNull="false" orderByValue="true" key="id" layer="sposob_zakrepleniya_tochki20121205170827020" allowMulti="false" type="15" value="znachenie" name="id_sposob_zakrepleniya"/>
    <edittype labelontop="0" editable="1" type="11" name="id_uchastok"/>
    <edittype labelontop="0" editable="1" type="0" name="nomer"/>
    <edittype labelontop="0" editable="1" type="10" name="nomer_chasti"/>
    <edittype labelontop="0" editable="1" type="11" name="podpis_x"/>
    <edittype labelontop="0" editable="1" type="11" name="podpis_y"/>
    <edittype labelontop="0" editable="1" type="0" name="pogreshnost"/>
    <edittype labelontop="0" editable="1" type="0" name="poryadok_obhoda"/>
    <edittype labelontop="0" editable="1" unchecked="0" type="7" checked="1" name="pre"/>
    <edittype labelontop="0" editable="1" type="0" name="prefiks_nomera"/>
    <edittype labelontop="0" editable="1" type="11" name="update_date"/>
    <edittype labelontop="0" editable="1" type="11" name="update_user"/>
    <edittype labelontop="0" editable="1" type="3" name="uslovnyy_znak">
      <valuepair key="круг черного цвета диаметром 1.5 мм" value="1"/>
      <valuepair key="окружность диаметром 1.5 мм" value="0"/>
    </edittype>
    <edittype labelontop="0" editable="1" type="0" name="x"/>
    <edittype labelontop="0" editable="1" type="0" name="y"/>
  </edittypes>
  <editform>.</editform>
  <editforminit></editforminit>
  <featformsuppress>0</featformsuppress>
  <annotationform>.</annotationform>
  <editorlayout>generatedlayout</editorlayout>
  <aliases>
    <alias field="id_metod_opredeleniya" index="9" name="Определение"/>
    <alias field="id_msk" index="18" name="Система координат"/>
    <alias field="id_sposob_zakrepleniya" index="8" name="Закрепление"/>
    <alias field="nomer" index="5" name="Номер"/>
    <alias field="nomer_chasti" index="10" name="Номер контура"/>
    <alias field="pogreshnost" index="6" name="Погрешность"/>
    <alias field="poryadok_obhoda" index="4" name="Порядок"/>
    <alias field="pre" index="19" name="Прекратившая существование"/>
    <alias field="prefiks_nomera" index="7" name="Префикс"/>
    <alias field="uslovnyy_znak" index="13" name="Условный знак"/>
    <alias field="x" index="2" name="X"/>
    <alias field="y" index="3" name="Y"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <attributeactions>
    <actionsetting action="layer = qgis.utils.iface.activeLayer()&#xa;for feat in layer.getFeatures(QgsFeatureRequest().setFilterFid([% $id %])):&#xa;    qgis.utils.iface.openFeatureForm(layer, feat)" capture="0" type="1" name="Атрибуты"/>
  </attributeactions>
</qgis>
