<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.6.2"><drawing>
<settings><setting alwaysvectorfont="no"/><setting verticaltext="up"/></settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="yes" active="yes"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="yes" active="yes"/>
<layer number="17" name="Pads" color="2" fill="1" visible="yes" active="yes"/>
<layer number="18" name="Vias" color="2" fill="1" visible="yes" active="yes"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="yes" active="yes"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="yes" active="yes"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="yes" active="yes"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="yes" active="yes"/>
<layer number="25" name="tNames" color="7" fill="1" visible="yes" active="yes"/>
<layer number="26" name="bNames" color="7" fill="1" visible="yes" active="yes"/>
<layer number="27" name="tValues" color="7" fill="1" visible="yes" active="yes"/>
<layer number="28" name="bValues" color="7" fill="1" visible="yes" active="yes"/>
<layer number="29" name="tStop" color="7" fill="1" visible="yes" active="yes"/>
<layer number="30" name="bStop" color="7" fill="1" visible="yes" active="yes"/>
<layer number="39" name="tKeepout" color="4" fill="1" visible="yes" active="yes"/>
<layer number="40" name="bKeepout" color="1" fill="1" visible="yes" active="yes"/>
<layer number="41" name="tRestrict" color="4" fill="1" visible="yes" active="yes"/>
<layer number="42" name="bRestrict" color="1" fill="1" visible="yes" active="yes"/>
<layer number="44" name="Drills" color="7" fill="1" visible="yes" active="yes"/>
<layer number="45" name="Holes" color="7" fill="1" visible="yes" active="yes"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="yes" active="yes"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="yes" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="101" name="CableRojo" color="4" fill="1" visible="yes" active="yes"/>
<layer number="102" name="CableNegro" color="8" fill="1" visible="yes" active="yes"/>
<layer number="103" name="CableVerde" color="2" fill="1" visible="yes" active="yes"/>
<layer number="104" name="CableAmarillo" color="14" fill="1" visible="yes" active="yes"/>
<layer number="105" name="CableBlanco" color="7" fill="1" visible="yes" active="yes"/>
<layer number="106" name="CableGris" color="8" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R"><libraries><library name="SafeRest">
<description>Simbolos del proyecto SafeRest Mat</description><packages>
<package name="CELDA_CARGA">
<pad name="1" x="-2.54" y="0" drill="1" diameter="1.8"/>
<pad name="2" x="0" y="0" drill="1" diameter="1.8"/>
<pad name="3" x="2.54" y="0" drill="1" diameter="1.8"/>
<wire x1="-4.41" y1="1.5" x2="4.41" y2="1.5" width="0.2032" layer="21"/>
<wire x1="4.41" y1="1.5" x2="4.41" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="4.41" y1="-1.5" x2="-4.41" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="-4.41" y1="-1.5" x2="-4.41" y2="1.5" width="0.2032" layer="21"/>
<text x="-4.41" y="2" size="1.27" layer="25">&gt;NAME</text>
</package>
<package name="HX711">
<pad name="1" x="-8.89" y="0" drill="1" diameter="1.8"/>
<pad name="2" x="-6.35" y="0" drill="1" diameter="1.8"/>
<pad name="3" x="-3.81" y="0" drill="1" diameter="1.8"/>
<pad name="4" x="-1.27" y="0" drill="1" diameter="1.8"/>
<pad name="5" x="1.27" y="0" drill="1" diameter="1.8"/>
<pad name="6" x="3.81" y="0" drill="1" diameter="1.8"/>
<pad name="7" x="6.35" y="0" drill="1" diameter="1.8"/>
<pad name="8" x="8.89" y="0" drill="1" diameter="1.8"/>
<wire x1="-10.76" y1="1.5" x2="10.76" y2="1.5" width="0.2032" layer="21"/>
<wire x1="10.76" y1="1.5" x2="10.76" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="10.76" y1="-1.5" x2="-10.76" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="-10.76" y1="-1.5" x2="-10.76" y2="1.5" width="0.2032" layer="21"/>
<text x="-10.76" y="2" size="1.27" layer="25">&gt;NAME</text>
</package>
<package name="WEMOS_D1">
<pad name="1" x="-6.35" y="0" drill="1" diameter="1.8"/>
<pad name="2" x="-3.81" y="0" drill="1" diameter="1.8"/>
<pad name="3" x="-1.27" y="0" drill="1" diameter="1.8"/>
<pad name="4" x="1.27" y="0" drill="1" diameter="1.8"/>
<pad name="5" x="3.81" y="0" drill="1" diameter="1.8"/>
<pad name="6" x="6.35" y="0" drill="1" diameter="1.8"/>
<wire x1="-8.22" y1="1.5" x2="8.22" y2="1.5" width="0.2032" layer="21"/>
<wire x1="8.22" y1="1.5" x2="8.22" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="8.22" y1="-1.5" x2="-8.22" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="-8.22" y1="-1.5" x2="-8.22" y2="1.5" width="0.2032" layer="21"/>
<text x="-8.22" y="2" size="1.27" layer="25">&gt;NAME</text>
</package>
<package name="MODULO_UPS">
<pad name="1" x="-6.35" y="0" drill="1" diameter="1.8"/>
<pad name="2" x="-3.81" y="0" drill="1" diameter="1.8"/>
<pad name="3" x="-1.27" y="0" drill="1" diameter="1.8"/>
<pad name="4" x="1.27" y="0" drill="1" diameter="1.8"/>
<pad name="5" x="3.81" y="0" drill="1" diameter="1.8"/>
<pad name="6" x="6.35" y="0" drill="1" diameter="1.8"/>
<wire x1="-8.22" y1="1.5" x2="8.22" y2="1.5" width="0.2032" layer="21"/>
<wire x1="8.22" y1="1.5" x2="8.22" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="8.22" y1="-1.5" x2="-8.22" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="-8.22" y1="-1.5" x2="-8.22" y2="1.5" width="0.2032" layer="21"/>
<text x="-8.22" y="2" size="1.27" layer="25">&gt;NAME</text>
</package>
<package name="BATERIA_18650">
<pad name="1" x="-1.27" y="0" drill="1" diameter="1.8"/>
<pad name="2" x="1.27" y="0" drill="1" diameter="1.8"/>
<wire x1="-3.14" y1="1.5" x2="3.14" y2="1.5" width="0.2032" layer="21"/>
<wire x1="3.14" y1="1.5" x2="3.14" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="3.14" y1="-1.5" x2="-3.14" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="-3.14" y1="-1.5" x2="-3.14" y2="1.5" width="0.2032" layer="21"/>
<text x="-3.14" y="2" size="1.27" layer="25">&gt;NAME</text>
</package>
<package name="CARGADOR_USB">
<pad name="1" x="-1.27" y="0" drill="1" diameter="1.8"/>
<pad name="2" x="1.27" y="0" drill="1" diameter="1.8"/>
<wire x1="-3.14" y1="1.5" x2="3.14" y2="1.5" width="0.2032" layer="21"/>
<wire x1="3.14" y1="1.5" x2="3.14" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="3.14" y1="-1.5" x2="-3.14" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="-3.14" y1="-1.5" x2="-3.14" y2="1.5" width="0.2032" layer="21"/>
<text x="-3.14" y="2" size="1.27" layer="25">&gt;NAME</text>
</package>
</packages><symbols>
<symbol name="CELDA_CARGA">
<wire x1="-15.24" y1="10.16" x2="15.24" y2="10.16" width="0.4064" layer="94"/>
<wire x1="15.24" y1="10.16" x2="15.24" y2="-10.16" width="0.4064" layer="94"/>
<wire x1="15.24" y1="-10.16" x2="-15.24" y2="-10.16" width="0.4064" layer="94"/>
<wire x1="-15.24" y1="-10.16" x2="-15.24" y2="10.16" width="0.4064" layer="94"/>
<pin name="rojo" x="20.32" y="5.08" length="middle" direction="pas" visible="pin" rot="R180"/>
<pin name="negro" x="20.32" y="0" length="middle" direction="pas" visible="pin" rot="R180"/>
<pin name="blanco" x="20.32" y="-5.08" length="middle" direction="pas" visible="pin" rot="R180"/>
</symbol>
<symbol name="HX711">
<wire x1="-12.7" y1="10.16" x2="12.7" y2="10.16" width="0.4064" layer="94"/>
<wire x1="12.7" y1="10.16" x2="12.7" y2="-10.16" width="0.4064" layer="94"/>
<wire x1="12.7" y1="-10.16" x2="-12.7" y2="-10.16" width="0.4064" layer="94"/>
<wire x1="-12.7" y1="-10.16" x2="-12.7" y2="10.16" width="0.4064" layer="94"/>
<pin name="E+" x="-17.78" y="7.62" length="middle" direction="pas" visible="pin"/>
<pin name="E-" x="-17.78" y="2.54" length="middle" direction="pas" visible="pin"/>
<pin name="A-" x="-17.78" y="-2.54" length="middle" direction="pas" visible="pin"/>
<pin name="A+" x="-17.78" y="-7.62" length="middle" direction="pas" visible="pin"/>
<pin name="VCC" x="17.78" y="7.62" length="middle" direction="pas" visible="pin" rot="R180"/>
<pin name="GND" x="17.78" y="2.54" length="middle" direction="pas" visible="pin" rot="R180"/>
<pin name="DT" x="17.78" y="-2.54" length="middle" direction="pas" visible="pin" rot="R180"/>
<pin name="SCK" x="17.78" y="-7.62" length="middle" direction="pas" visible="pin" rot="R180"/>
</symbol>
<symbol name="WEMOS_D1">
<wire x1="-15.24" y1="25.4" x2="15.24" y2="25.4" width="0.4064" layer="94"/>
<wire x1="15.24" y1="25.4" x2="15.24" y2="-25.4" width="0.4064" layer="94"/>
<wire x1="15.24" y1="-25.4" x2="-15.24" y2="-25.4" width="0.4064" layer="94"/>
<wire x1="-15.24" y1="-25.4" x2="-15.24" y2="25.4" width="0.4064" layer="94"/>
<pin name="3V3" x="-20.32" y="17.78" length="middle" direction="pas" visible="pin"/>
<pin name="G@1" x="-20.32" y="12.7" length="middle" direction="pas" visible="pin"/>
<pin name="D5" x="-20.32" y="7.62" length="middle" direction="pas" visible="pin"/>
<pin name="D6" x="-20.32" y="2.54" length="middle" direction="pas" visible="pin"/>
<pin name="5V" x="-20.32" y="-15.24" length="middle" direction="pas" visible="pin"/>
<pin name="G@2" x="-20.32" y="-20.32" length="middle" direction="pas" visible="pin"/>
</symbol>
<symbol name="MODULO_UPS">
<wire x1="-12.7" y1="10.16" x2="12.7" y2="10.16" width="0.4064" layer="94"/>
<wire x1="12.7" y1="10.16" x2="12.7" y2="-10.16" width="0.4064" layer="94"/>
<wire x1="12.7" y1="-10.16" x2="-12.7" y2="-10.16" width="0.4064" layer="94"/>
<wire x1="-12.7" y1="-10.16" x2="-12.7" y2="10.16" width="0.4064" layer="94"/>
<pin name="USB+" x="-17.78" y="7.62" length="middle" direction="pas" visible="pin"/>
<pin name="USB-" x="-17.78" y="2.54" length="middle" direction="pas" visible="pin"/>
<pin name="BAT+" x="-17.78" y="-2.54" length="middle" direction="pas" visible="pin"/>
<pin name="BAT-" x="-17.78" y="-7.62" length="middle" direction="pas" visible="pin"/>
<pin name="5V" x="17.78" y="2.54" length="middle" direction="pas" visible="pin" rot="R180"/>
<pin name="GND" x="17.78" y="-2.54" length="middle" direction="pas" visible="pin" rot="R180"/>
</symbol>
<symbol name="BATERIA_18650">
<wire x1="-17.78" y1="7.62" x2="17.78" y2="7.62" width="0.4064" layer="94"/>
<wire x1="17.78" y1="7.62" x2="17.78" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="17.78" y1="-7.62" x2="-17.78" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="-17.78" y1="-7.62" x2="-17.78" y2="7.62" width="0.4064" layer="94"/>
<pin name="BAT+" x="22.86" y="2.54" length="middle" direction="pas" visible="pin" rot="R180"/>
<pin name="BAT-" x="22.86" y="-2.54" length="middle" direction="pas" visible="pin" rot="R180"/>
</symbol>
<symbol name="CARGADOR_USB">
<wire x1="-17.78" y1="7.62" x2="17.78" y2="7.62" width="0.4064" layer="94"/>
<wire x1="17.78" y1="7.62" x2="17.78" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="17.78" y1="-7.62" x2="-17.78" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="-17.78" y1="-7.62" x2="-17.78" y2="7.62" width="0.4064" layer="94"/>
<pin name="5V" x="22.86" y="2.54" length="middle" direction="pas" visible="pin" rot="R180"/>
<pin name="GND" x="22.86" y="-2.54" length="middle" direction="pas" visible="pin" rot="R180"/>
</symbol>
</symbols><devicesets>
<deviceset name="CELDA_CARGA" prefix="CELDA" uservalue="yes">
<gates><gate name="G$1" symbol="CELDA_CARGA" x="0" y="0"/></gates>
<devices><device name="" package="CELDA_CARGA"><connects>
<connect gate="G$1" pin="rojo" pad="1"/>
<connect gate="G$1" pin="negro" pad="2"/>
<connect gate="G$1" pin="blanco" pad="3"/>
</connects><technologies><technology name=""/></technologies></device></devices></deviceset>
<deviceset name="HX711" prefix="U" uservalue="yes">
<gates><gate name="G$1" symbol="HX711" x="0" y="0"/></gates>
<devices><device name="" package="HX711"><connects>
<connect gate="G$1" pin="E+" pad="1"/>
<connect gate="G$1" pin="E-" pad="2"/>
<connect gate="G$1" pin="A-" pad="3"/>
<connect gate="G$1" pin="A+" pad="4"/>
<connect gate="G$1" pin="VCC" pad="5"/>
<connect gate="G$1" pin="GND" pad="6"/>
<connect gate="G$1" pin="DT" pad="7"/>
<connect gate="G$1" pin="SCK" pad="8"/>
</connects><technologies><technology name=""/></technologies></device></devices></deviceset>
<deviceset name="WEMOS_D1" prefix="MCU" uservalue="yes">
<gates><gate name="G$1" symbol="WEMOS_D1" x="0" y="0"/></gates>
<devices><device name="" package="WEMOS_D1"><connects>
<connect gate="G$1" pin="3V3" pad="1"/>
<connect gate="G$1" pin="G@1" pad="2"/>
<connect gate="G$1" pin="D5" pad="3"/>
<connect gate="G$1" pin="D6" pad="4"/>
<connect gate="G$1" pin="5V" pad="5"/>
<connect gate="G$1" pin="G@2" pad="6"/>
</connects><technologies><technology name=""/></technologies></device></devices></deviceset>
<deviceset name="MODULO_UPS" prefix="UPS" uservalue="yes">
<gates><gate name="G$1" symbol="MODULO_UPS" x="0" y="0"/></gates>
<devices><device name="" package="MODULO_UPS"><connects>
<connect gate="G$1" pin="USB+" pad="1"/>
<connect gate="G$1" pin="USB-" pad="2"/>
<connect gate="G$1" pin="BAT+" pad="3"/>
<connect gate="G$1" pin="BAT-" pad="4"/>
<connect gate="G$1" pin="5V" pad="5"/>
<connect gate="G$1" pin="GND" pad="6"/>
</connects><technologies><technology name=""/></technologies></device></devices></deviceset>
<deviceset name="BATERIA_18650" prefix="BAT" uservalue="yes">
<gates><gate name="G$1" symbol="BATERIA_18650" x="0" y="0"/></gates>
<devices><device name="" package="BATERIA_18650"><connects>
<connect gate="G$1" pin="BAT+" pad="1"/>
<connect gate="G$1" pin="BAT-" pad="2"/>
</connects><technologies><technology name=""/></technologies></device></devices></deviceset>
<deviceset name="CARGADOR_USB" prefix="CHG" uservalue="yes">
<gates><gate name="G$1" symbol="CARGADOR_USB" x="0" y="0"/></gates>
<devices><device name="" package="CARGADOR_USB"><connects>
<connect gate="G$1" pin="5V" pad="1"/>
<connect gate="G$1" pin="GND" pad="2"/>
</connects><technologies><technology name=""/></technologies></device></devices></deviceset>
</devicesets></library></libraries>
<attributes/><variantdefs/><classes><class number="0" name="default" width="0" drill="0"/></classes>
<parts>
<part name="CELDA1" library="SafeRest" deviceset="CELDA_CARGA" device="" value="Celda 1"/>
<part name="CELDA2" library="SafeRest" deviceset="CELDA_CARGA" device="" value="Celda 2"/>
<part name="CELDA3" library="SafeRest" deviceset="CELDA_CARGA" device="" value="Celda 3"/>
<part name="CELDA4" library="SafeRest" deviceset="CELDA_CARGA" device="" value="Celda 4"/>
<part name="U1" library="SafeRest" deviceset="HX711" device="" value="Modulo HX711"/>
<part name="MCU1" library="SafeRest" deviceset="WEMOS_D1" device="" value="Wemos D1 (ESP8266)"/>
<part name="CHG1" library="SafeRest" deviceset="CARGADOR_USB" device="" value="Cargador USB 5V"/>
<part name="BAT1" library="SafeRest" deviceset="BATERIA_18650" device="" value="Bateria 18650"/>
<part name="UPS1" library="SafeRest" deviceset="MODULO_UPS" device="" value="Modulo UPS"/>
</parts><sheets><sheet><plain>
<text x="10.16" y="212.09" size="3.81" layer="94" font="vector" ratio="14">SafeRest - Mat: esquema de conexiones</text>
<text x="10.16" y="201.93" size="1.778" layer="97" font="vector">Las etiquetas iguales (E+, E-, A+, A-) son el mismo punto: se unen entre si</text>
<text x="10.16" y="196.85" size="1.778" layer="97" font="vector">y llegan al HX711. Asi las 4 celdas forman un solo puente de medicion.</text>
<text x="93.98" y="120.65" size="1.524" layer="97" font="vector">Celdas 1 y 3: negro-&gt;E+, blanco-&gt;E-, rojo-&gt;A+</text>
<text x="93.98" y="116.332" size="1.524" layer="97" font="vector">Celdas 2 y 4: negro-&gt;E-, blanco-&gt;E+, rojo-&gt;A-</text>
<text x="17.78" y="177.8" size="2.1844" layer="94" font="vector" ratio="14" align="center">Celda 1</text>
<text x="17.78" y="147.32" size="2.1844" layer="94" font="vector" ratio="14" align="center">Celda 2</text>
<text x="17.78" y="116.84" size="2.1844" layer="94" font="vector" ratio="14" align="center">Celda 3</text>
<text x="17.78" y="86.36" size="2.1844" layer="94" font="vector" ratio="14" align="center">Celda 4</text>
<text x="111.76" y="150.368" size="2.1844" layer="94" font="vector" ratio="14" align="center">Modulo HX711</text>
<text x="187.96" y="123.19" size="2.1844" layer="94" font="vector" ratio="14" align="center">Wemos D1</text>
<text x="187.96" y="118.11" size="2.1844" layer="94" font="vector" ratio="14" align="center">(ESP8266)</text>
<text x="26.67" y="48.26" size="2.1844" layer="94" font="vector" ratio="14" align="center">Cargador USB 5V</text>
<text x="26.67" y="22.86" size="2.1844" layer="94" font="vector" ratio="14" align="center">Bateria 18650</text>
<text x="111.76" y="48.768" size="2.1844" layer="94" font="vector" ratio="14" align="center">Modulo UPS</text>
<text x="179.07" y="133.858" size="1.524" layer="97" font="vector">(GPIO14)</text>
<text x="179.07" y="128.778" size="1.524" layer="97" font="vector">(GPIO12)</text>
<wire x1="187.96" y1="152.4" x2="187.96" y2="165.1" width="0.6096" layer="106" style="longdash"/>
<text x="187.96" y="168.148" size="1.778" layer="97" font="vector" align="center">ESP-NOW (inalambrico) -&gt; control remoto</text>
<text x="64.77" y="53.34" size="1.524" layer="97" font="vector" align="center">micro-USB</text>
<wire x1="45.72" y1="182.88" x2="60.96" y2="182.88" width="0.6096" layer="101"/>
<wire x1="45.72" y1="177.8" x2="60.96" y2="177.8" width="0.6096" layer="102"/>
<wire x1="45.72" y1="172.72" x2="60.96" y2="172.72" width="0.6096" layer="105"/>
<wire x1="45.72" y1="152.4" x2="60.96" y2="152.4" width="0.6096" layer="101"/>
<wire x1="45.72" y1="147.32" x2="60.96" y2="147.32" width="0.6096" layer="102"/>
<wire x1="45.72" y1="142.24" x2="60.96" y2="142.24" width="0.6096" layer="105"/>
<wire x1="45.72" y1="121.92" x2="60.96" y2="121.92" width="0.6096" layer="101"/>
<wire x1="45.72" y1="116.84" x2="60.96" y2="116.84" width="0.6096" layer="102"/>
<wire x1="45.72" y1="111.76" x2="60.96" y2="111.76" width="0.6096" layer="105"/>
<wire x1="45.72" y1="91.44" x2="60.96" y2="91.44" width="0.6096" layer="101"/>
<wire x1="45.72" y1="86.36" x2="60.96" y2="86.36" width="0.6096" layer="102"/>
<wire x1="45.72" y1="81.28" x2="60.96" y2="81.28" width="0.6096" layer="105"/>
<wire x1="129.54" y1="144.78" x2="167.64" y2="144.78" width="0.6096" layer="101"/>
<wire x1="129.54" y1="139.7" x2="167.64" y2="139.7" width="0.6096" layer="102"/>
<wire x1="129.54" y1="134.62" x2="167.64" y2="134.62" width="0.6096" layer="103"/>
<wire x1="129.54" y1="129.54" x2="167.64" y2="129.54" width="0.6096" layer="104"/>
<wire x1="129.54" y1="38.1" x2="152.4" y2="38.1" width="0.6096" layer="101"/>
<wire x1="152.4" y1="38.1" x2="152.4" y2="111.76" width="0.6096" layer="101"/>
<wire x1="152.4" y1="111.76" x2="167.64" y2="111.76" width="0.6096" layer="101"/>
<wire x1="129.54" y1="33.02" x2="160.02" y2="33.02" width="0.6096" layer="102"/>
<wire x1="160.02" y1="33.02" x2="160.02" y2="106.68" width="0.6096" layer="102"/>
<wire x1="160.02" y1="106.68" x2="167.64" y2="106.68" width="0.6096" layer="102"/>
<wire x1="53.34" y1="25.4" x2="71.12" y2="25.4" width="0.6096" layer="101"/>
<wire x1="71.12" y1="25.4" x2="71.12" y2="33.02" width="0.6096" layer="101"/>
<wire x1="71.12" y1="33.02" x2="93.98" y2="33.02" width="0.6096" layer="101"/>
<wire x1="53.34" y1="20.32" x2="76.2" y2="20.32" width="0.6096" layer="102"/>
<wire x1="76.2" y1="20.32" x2="76.2" y2="27.94" width="0.6096" layer="102"/>
<wire x1="76.2" y1="27.94" x2="93.98" y2="27.94" width="0.6096" layer="102"/>
<wire x1="53.34" y1="50.8" x2="81.28" y2="50.8" width="0.6096" layer="106" style="longdash"/>
<wire x1="81.28" y1="50.8" x2="81.28" y2="43.18" width="0.6096" layer="106" style="longdash"/>
<wire x1="81.28" y1="43.18" x2="93.98" y2="43.18" width="0.6096" layer="106" style="longdash"/>
<wire x1="53.34" y1="45.72" x2="76.2" y2="45.72" width="0.6096" layer="106" style="longdash"/>
<wire x1="76.2" y1="45.72" x2="76.2" y2="38.1" width="0.6096" layer="106" style="longdash"/>
<wire x1="76.2" y1="38.1" x2="93.98" y2="38.1" width="0.6096" layer="106" style="longdash"/>
<text x="172.72" y="87.63" size="2.1844" layer="94" font="vector" ratio="14">Leyenda</text>
<wire x1="172.72" y1="81.28" x2="185.42" y2="81.28" width="0.8128" layer="101"/>
<text x="187.96" y="80.518" size="1.778" layer="97" font="vector">5 V / 3V3 / BAT+</text>
<wire x1="172.72" y1="74.93" x2="185.42" y2="74.93" width="0.8128" layer="102"/>
<text x="187.96" y="74.168" size="1.778" layer="97" font="vector">GND / BAT-</text>
<wire x1="172.72" y1="68.58" x2="185.42" y2="68.58" width="0.8128" layer="103"/>
<text x="187.96" y="67.818" size="1.778" layer="97" font="vector">DT (D5)</text>
<wire x1="172.72" y1="62.23" x2="185.42" y2="62.23" width="0.8128" layer="104"/>
<text x="187.96" y="61.468" size="1.778" layer="97" font="vector">SCK (D6)</text>
<wire x1="172.72" y1="55.88" x2="185.42" y2="55.88" width="0.8128" layer="106" style="longdash"/>
<text x="187.96" y="55.118" size="1.778" layer="97" font="vector">USB (micro-USB)</text>
</plain><instances>
<instance part="CELDA1" gate="G$1" x="25.4" y="177.8"/>
<instance part="CELDA2" gate="G$1" x="25.4" y="147.32"/>
<instance part="CELDA3" gate="G$1" x="25.4" y="116.84"/>
<instance part="CELDA4" gate="G$1" x="25.4" y="86.36"/>
<instance part="U1" gate="G$1" x="111.76" y="137.16"/>
<instance part="MCU1" gate="G$1" x="187.96" y="127"/>
<instance part="CHG1" gate="G$1" x="30.48" y="48.26"/>
<instance part="BAT1" gate="G$1" x="30.48" y="22.86"/>
<instance part="UPS1" gate="G$1" x="111.76" y="35.56"/>
</instances><busses/><nets>
<net name="A+" class="0">
<segment>
<pinref part="CELDA1" gate="G$1" pin="rojo"/>
<wire x1="45.72" y1="182.88" x2="60.96" y2="182.88" width="0.1524" layer="91"/>
<label x="60.96" y="182.88" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="CELDA3" gate="G$1" pin="rojo"/>
<wire x1="45.72" y1="121.92" x2="60.96" y2="121.92" width="0.1524" layer="91"/>
<label x="60.96" y="121.92" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="A+"/>
<wire x1="93.98" y1="129.54" x2="83.82" y2="129.54" width="0.1524" layer="91"/>
<label x="83.82" y="129.54" size="1.778" layer="95" xref="yes" rot="R180"/>
</segment>
</net>
<net name="E+" class="0">
<segment>
<pinref part="CELDA1" gate="G$1" pin="negro"/>
<wire x1="45.72" y1="177.8" x2="60.96" y2="177.8" width="0.1524" layer="91"/>
<label x="60.96" y="177.8" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="CELDA2" gate="G$1" pin="blanco"/>
<wire x1="45.72" y1="142.24" x2="60.96" y2="142.24" width="0.1524" layer="91"/>
<label x="60.96" y="142.24" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="CELDA3" gate="G$1" pin="negro"/>
<wire x1="45.72" y1="116.84" x2="60.96" y2="116.84" width="0.1524" layer="91"/>
<label x="60.96" y="116.84" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="CELDA4" gate="G$1" pin="blanco"/>
<wire x1="45.72" y1="81.28" x2="60.96" y2="81.28" width="0.1524" layer="91"/>
<label x="60.96" y="81.28" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="E+"/>
<wire x1="93.98" y1="144.78" x2="83.82" y2="144.78" width="0.1524" layer="91"/>
<label x="83.82" y="144.78" size="1.778" layer="95" xref="yes" rot="R180"/>
</segment>
</net>
<net name="E-" class="0">
<segment>
<pinref part="CELDA1" gate="G$1" pin="blanco"/>
<wire x1="45.72" y1="172.72" x2="60.96" y2="172.72" width="0.1524" layer="91"/>
<label x="60.96" y="172.72" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="CELDA2" gate="G$1" pin="negro"/>
<wire x1="45.72" y1="147.32" x2="60.96" y2="147.32" width="0.1524" layer="91"/>
<label x="60.96" y="147.32" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="CELDA3" gate="G$1" pin="blanco"/>
<wire x1="45.72" y1="111.76" x2="60.96" y2="111.76" width="0.1524" layer="91"/>
<label x="60.96" y="111.76" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="CELDA4" gate="G$1" pin="negro"/>
<wire x1="45.72" y1="86.36" x2="60.96" y2="86.36" width="0.1524" layer="91"/>
<label x="60.96" y="86.36" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="E-"/>
<wire x1="93.98" y1="139.7" x2="83.82" y2="139.7" width="0.1524" layer="91"/>
<label x="83.82" y="139.7" size="1.778" layer="95" xref="yes" rot="R180"/>
</segment>
</net>
<net name="A-" class="0">
<segment>
<pinref part="CELDA2" gate="G$1" pin="rojo"/>
<wire x1="45.72" y1="152.4" x2="60.96" y2="152.4" width="0.1524" layer="91"/>
<label x="60.96" y="152.4" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="CELDA4" gate="G$1" pin="rojo"/>
<wire x1="45.72" y1="91.44" x2="60.96" y2="91.44" width="0.1524" layer="91"/>
<label x="60.96" y="91.44" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="A-"/>
<wire x1="93.98" y1="134.62" x2="83.82" y2="134.62" width="0.1524" layer="91"/>
<label x="83.82" y="134.62" size="1.778" layer="95" xref="yes" rot="R180"/>
</segment>
</net>
<net name="3V3" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="VCC"/>
<pinref part="MCU1" gate="G$1" pin="3V3"/>
<wire x1="129.54" y1="144.78" x2="167.64" y2="144.78" width="0.1524" layer="91"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="GND"/>
<pinref part="MCU1" gate="G$1" pin="G@1"/>
<wire x1="129.54" y1="139.7" x2="167.64" y2="139.7" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="UPS1" gate="G$1" pin="GND"/>
<pinref part="MCU1" gate="G$1" pin="G@2"/>
<wire x1="129.54" y1="33.02" x2="160.02" y2="33.02" width="0.1524" layer="91"/>
<wire x1="160.02" y1="33.02" x2="160.02" y2="106.68" width="0.1524" layer="91"/>
<wire x1="160.02" y1="106.68" x2="167.64" y2="106.68" width="0.1524" layer="91"/>
</segment>
</net>
<net name="DT" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="DT"/>
<pinref part="MCU1" gate="G$1" pin="D5"/>
<wire x1="129.54" y1="134.62" x2="167.64" y2="134.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SCK" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="SCK"/>
<pinref part="MCU1" gate="G$1" pin="D6"/>
<wire x1="129.54" y1="129.54" x2="167.64" y2="129.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="5V" class="0">
<segment>
<pinref part="UPS1" gate="G$1" pin="5V"/>
<pinref part="MCU1" gate="G$1" pin="5V"/>
<wire x1="129.54" y1="38.1" x2="152.4" y2="38.1" width="0.1524" layer="91"/>
<wire x1="152.4" y1="38.1" x2="152.4" y2="111.76" width="0.1524" layer="91"/>
<wire x1="152.4" y1="111.76" x2="167.64" y2="111.76" width="0.1524" layer="91"/>
</segment>
</net>
<net name="BAT+" class="0">
<segment>
<pinref part="BAT1" gate="G$1" pin="BAT+"/>
<pinref part="UPS1" gate="G$1" pin="BAT+"/>
<wire x1="53.34" y1="25.4" x2="71.12" y2="25.4" width="0.1524" layer="91"/>
<wire x1="71.12" y1="25.4" x2="71.12" y2="33.02" width="0.1524" layer="91"/>
<wire x1="71.12" y1="33.02" x2="93.98" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="BAT-" class="0">
<segment>
<pinref part="BAT1" gate="G$1" pin="BAT-"/>
<pinref part="UPS1" gate="G$1" pin="BAT-"/>
<wire x1="53.34" y1="20.32" x2="76.2" y2="20.32" width="0.1524" layer="91"/>
<wire x1="76.2" y1="20.32" x2="76.2" y2="27.94" width="0.1524" layer="91"/>
<wire x1="76.2" y1="27.94" x2="93.98" y2="27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="USB5V" class="0">
<segment>
<pinref part="CHG1" gate="G$1" pin="5V"/>
<pinref part="UPS1" gate="G$1" pin="USB+"/>
<wire x1="53.34" y1="50.8" x2="81.28" y2="50.8" width="0.1524" layer="91"/>
<wire x1="81.28" y1="50.8" x2="81.28" y2="43.18" width="0.1524" layer="91"/>
<wire x1="81.28" y1="43.18" x2="93.98" y2="43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="USBGND" class="0">
<segment>
<pinref part="CHG1" gate="G$1" pin="GND"/>
<pinref part="UPS1" gate="G$1" pin="USB-"/>
<wire x1="53.34" y1="45.72" x2="76.2" y2="45.72" width="0.1524" layer="91"/>
<wire x1="76.2" y1="45.72" x2="76.2" y2="38.1" width="0.1524" layer="91"/>
<wire x1="76.2" y1="38.1" x2="93.98" y2="38.1" width="0.1524" layer="91"/>
</segment>
</net>
</nets></sheet></sheets></schematic></drawing></eagle>
