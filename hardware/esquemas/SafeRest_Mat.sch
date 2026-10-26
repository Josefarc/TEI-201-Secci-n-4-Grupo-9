<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.6.2">
<drawing>
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
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="SafeRest">
<description>Simbolos del proyecto SafeRest Mat</description>
<packages>
<package name="CELDA_CARGA">
<pad name="1" x="-2.54" y="0" drill="1" diameter="1.8"/>
<pad name="2" x="0" y="0" drill="1" diameter="1.8"/>
<pad name="3" x="2.54" y="0" drill="1" diameter="1.8"/>
<wire x1="-4.41" y1="1.5" x2="4.41" y2="1.5" width="0.2032" layer="21"/>
<wire x1="4.41" y1="1.5" x2="4.41" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="4.41" y1="-1.5" x2="-4.41" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="-4.41" y1="-1.5" x2="-4.41" y2="1.5" width="0.2032" layer="21"/>
<text x="-4.41" y="2" size="1.27" layer="25">&gt;NAME</text>
<text x="-4.41" y="-3.27" size="1.27" layer="27">&gt;VALUE</text>
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
<text x="-10.76" y="-3.27" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="WEMOS_D1">
<pad name="1" x="-5.08" y="0" drill="1" diameter="1.8"/>
<pad name="2" x="-2.54" y="0" drill="1" diameter="1.8"/>
<pad name="3" x="0" y="0" drill="1" diameter="1.8"/>
<pad name="4" x="2.54" y="0" drill="1" diameter="1.8"/>
<pad name="5" x="5.08" y="0" drill="1" diameter="1.8"/>
<wire x1="-6.95" y1="1.5" x2="6.95" y2="1.5" width="0.2032" layer="21"/>
<wire x1="6.95" y1="1.5" x2="6.95" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="6.95" y1="-1.5" x2="-6.95" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="-6.95" y1="-1.5" x2="-6.95" y2="1.5" width="0.2032" layer="21"/>
<text x="-6.95" y="2" size="1.27" layer="25">&gt;NAME</text>
<text x="-6.95" y="-3.27" size="1.27" layer="27">&gt;VALUE</text>
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
<text x="-8.22" y="-3.27" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="BATERIA_18650">
<pad name="1" x="-1.27" y="0" drill="1" diameter="1.8"/>
<pad name="2" x="1.27" y="0" drill="1" diameter="1.8"/>
<wire x1="-3.14" y1="1.5" x2="3.14" y2="1.5" width="0.2032" layer="21"/>
<wire x1="3.14" y1="1.5" x2="3.14" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="3.14" y1="-1.5" x2="-3.14" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="-3.14" y1="-1.5" x2="-3.14" y2="1.5" width="0.2032" layer="21"/>
<text x="-3.14" y="2" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.14" y="-3.27" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="CARGADOR_USB">
<pad name="1" x="-1.27" y="0" drill="1" diameter="1.8"/>
<pad name="2" x="1.27" y="0" drill="1" diameter="1.8"/>
<wire x1="-3.14" y1="1.5" x2="3.14" y2="1.5" width="0.2032" layer="21"/>
<wire x1="3.14" y1="1.5" x2="3.14" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="3.14" y1="-1.5" x2="-3.14" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="-3.14" y1="-1.5" x2="-3.14" y2="1.5" width="0.2032" layer="21"/>
<text x="-3.14" y="2" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.14" y="-3.27" size="1.27" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="CELDA_CARGA">
<wire x1="-10.16" y1="10.16" x2="10.16" y2="10.16" width="0.254" layer="94"/>
<wire x1="10.16" y1="10.16" x2="10.16" y2="-10.16" width="0.254" layer="94"/>
<wire x1="10.16" y1="-10.16" x2="-10.16" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-10.16" x2="-10.16" y2="10.16" width="0.254" layer="94"/>
<text x="-10.16" y="11.43" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="-13.97" size="1.778" layer="96">&gt;VALUE</text>
<pin name="ROJO" x="15.24" y="5.08" length="middle" direction="pas" rot="R180"/>
<pin name="NEGRO" x="15.24" y="0" length="middle" direction="pas" rot="R180"/>
<pin name="BLANCO" x="15.24" y="-5.08" length="middle" direction="pas" rot="R180"/>
</symbol>
<symbol name="HX711">
<wire x1="-12.7" y1="10.16" x2="12.7" y2="10.16" width="0.254" layer="94"/>
<wire x1="12.7" y1="10.16" x2="12.7" y2="-10.16" width="0.254" layer="94"/>
<wire x1="12.7" y1="-10.16" x2="-12.7" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-12.7" y1="-10.16" x2="-12.7" y2="10.16" width="0.254" layer="94"/>
<text x="-12.7" y="11.43" size="1.778" layer="95">&gt;NAME</text>
<text x="-12.7" y="-13.97" size="1.778" layer="96">&gt;VALUE</text>
<pin name="E+" x="-17.78" y="7.62" length="middle" direction="pas"/>
<pin name="E-" x="-17.78" y="2.54" length="middle" direction="pas"/>
<pin name="A-" x="-17.78" y="-2.54" length="middle" direction="pas"/>
<pin name="A+" x="-17.78" y="-7.62" length="middle" direction="pas"/>
<pin name="VCC" x="17.78" y="7.62" length="middle" direction="pas" rot="R180"/>
<pin name="GND" x="17.78" y="2.54" length="middle" direction="pas" rot="R180"/>
<pin name="DT" x="17.78" y="-2.54" length="middle" direction="pas" rot="R180"/>
<pin name="SCK" x="17.78" y="-7.62" length="middle" direction="pas" rot="R180"/>
</symbol>
<symbol name="WEMOS_D1">
<wire x1="-15.24" y1="15.24" x2="15.24" y2="15.24" width="0.254" layer="94"/>
<wire x1="15.24" y1="15.24" x2="15.24" y2="-15.24" width="0.254" layer="94"/>
<wire x1="15.24" y1="-15.24" x2="-15.24" y2="-15.24" width="0.254" layer="94"/>
<wire x1="-15.24" y1="-15.24" x2="-15.24" y2="15.24" width="0.254" layer="94"/>
<text x="-15.24" y="16.51" size="1.778" layer="95">&gt;NAME</text>
<text x="-15.24" y="-19.05" size="1.778" layer="96">&gt;VALUE</text>
<pin name="3V3" x="-20.32" y="10.16" length="middle" direction="pas"/>
<pin name="GND" x="-20.32" y="5.08" length="middle" direction="pas"/>
<pin name="D5" x="-20.32" y="0" length="middle" direction="pas"/>
<pin name="D6" x="-20.32" y="-5.08" length="middle" direction="pas"/>
<pin name="5V" x="-20.32" y="-10.16" length="middle" direction="pas"/>
</symbol>
<symbol name="MODULO_UPS">
<wire x1="-12.7" y1="10.16" x2="12.7" y2="10.16" width="0.254" layer="94"/>
<wire x1="12.7" y1="10.16" x2="12.7" y2="-10.16" width="0.254" layer="94"/>
<wire x1="12.7" y1="-10.16" x2="-12.7" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-12.7" y1="-10.16" x2="-12.7" y2="10.16" width="0.254" layer="94"/>
<text x="-12.7" y="11.43" size="1.778" layer="95">&gt;NAME</text>
<text x="-12.7" y="-13.97" size="1.778" layer="96">&gt;VALUE</text>
<pin name="USB+" x="-17.78" y="7.62" length="middle" direction="pas"/>
<pin name="USB-" x="-17.78" y="2.54" length="middle" direction="pas"/>
<pin name="BAT+" x="-17.78" y="-2.54" length="middle" direction="pas"/>
<pin name="BAT-" x="-17.78" y="-7.62" length="middle" direction="pas"/>
<pin name="5V" x="17.78" y="2.54" length="middle" direction="pas" rot="R180"/>
<pin name="GND" x="17.78" y="-2.54" length="middle" direction="pas" rot="R180"/>
</symbol>
<symbol name="BATERIA_18650">
<wire x1="-10.16" y1="7.62" x2="10.16" y2="7.62" width="0.254" layer="94"/>
<wire x1="10.16" y1="7.62" x2="10.16" y2="-7.62" width="0.254" layer="94"/>
<wire x1="10.16" y1="-7.62" x2="-10.16" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-7.62" x2="-10.16" y2="7.62" width="0.254" layer="94"/>
<text x="-10.16" y="8.89" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="-11.43" size="1.778" layer="96">&gt;VALUE</text>
<pin name="BAT+" x="15.24" y="2.54" length="middle" direction="pas" rot="R180"/>
<pin name="BAT-" x="15.24" y="-2.54" length="middle" direction="pas" rot="R180"/>
</symbol>
<symbol name="CARGADOR_USB">
<wire x1="-10.16" y1="7.62" x2="10.16" y2="7.62" width="0.254" layer="94"/>
<wire x1="10.16" y1="7.62" x2="10.16" y2="-7.62" width="0.254" layer="94"/>
<wire x1="10.16" y1="-7.62" x2="-10.16" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-7.62" x2="-10.16" y2="7.62" width="0.254" layer="94"/>
<text x="-10.16" y="8.89" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="-11.43" size="1.778" layer="96">&gt;VALUE</text>
<pin name="5V" x="15.24" y="2.54" length="middle" direction="pas" rot="R180"/>
<pin name="GND" x="15.24" y="-2.54" length="middle" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="CELDA_CARGA" prefix="CELDA" uservalue="yes">
<gates><gate name="G$1" symbol="CELDA_CARGA" x="0" y="0"/></gates>
<devices><device name="" package="CELDA_CARGA"><connects>
<connect gate="G$1" pin="ROJO" pad="1"/>
<connect gate="G$1" pin="NEGRO" pad="2"/>
<connect gate="G$1" pin="BLANCO" pad="3"/>
</connects><technologies><technology name=""/></technologies></device></devices>
</deviceset>
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
</connects><technologies><technology name=""/></technologies></device></devices>
</deviceset>
<deviceset name="WEMOS_D1" prefix="MCU" uservalue="yes">
<gates><gate name="G$1" symbol="WEMOS_D1" x="0" y="0"/></gates>
<devices><device name="" package="WEMOS_D1"><connects>
<connect gate="G$1" pin="3V3" pad="1"/>
<connect gate="G$1" pin="GND" pad="2"/>
<connect gate="G$1" pin="D5" pad="3"/>
<connect gate="G$1" pin="D6" pad="4"/>
<connect gate="G$1" pin="5V" pad="5"/>
</connects><technologies><technology name=""/></technologies></device></devices>
</deviceset>
<deviceset name="MODULO_UPS" prefix="UPS" uservalue="yes">
<gates><gate name="G$1" symbol="MODULO_UPS" x="0" y="0"/></gates>
<devices><device name="" package="MODULO_UPS"><connects>
<connect gate="G$1" pin="USB+" pad="1"/>
<connect gate="G$1" pin="USB-" pad="2"/>
<connect gate="G$1" pin="BAT+" pad="3"/>
<connect gate="G$1" pin="BAT-" pad="4"/>
<connect gate="G$1" pin="5V" pad="5"/>
<connect gate="G$1" pin="GND" pad="6"/>
</connects><technologies><technology name=""/></technologies></device></devices>
</deviceset>
<deviceset name="BATERIA_18650" prefix="BAT" uservalue="yes">
<gates><gate name="G$1" symbol="BATERIA_18650" x="0" y="0"/></gates>
<devices><device name="" package="BATERIA_18650"><connects>
<connect gate="G$1" pin="BAT+" pad="1"/>
<connect gate="G$1" pin="BAT-" pad="2"/>
</connects><technologies><technology name=""/></technologies></device></devices>
</deviceset>
<deviceset name="CARGADOR_USB" prefix="CHG" uservalue="yes">
<gates><gate name="G$1" symbol="CARGADOR_USB" x="0" y="0"/></gates>
<devices><device name="" package="CARGADOR_USB"><connects>
<connect gate="G$1" pin="5V" pad="1"/>
<connect gate="G$1" pin="GND" pad="2"/>
</connects><technologies><technology name=""/></technologies></device></devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes/><variantdefs/>
<classes><class number="0" name="default" width="0" drill="0"/></classes>
<parts>
<part name="CELDA1" library="SafeRest" deviceset="CELDA_CARGA" device="" value="Celda 1"/>
<part name="CELDA2" library="SafeRest" deviceset="CELDA_CARGA" device="" value="Celda 2"/>
<part name="CELDA3" library="SafeRest" deviceset="CELDA_CARGA" device="" value="Celda 3"/>
<part name="CELDA4" library="SafeRest" deviceset="CELDA_CARGA" device="" value="Celda 4"/>
<part name="U1" library="SafeRest" deviceset="HX711" device="" value="HX711"/>
<part name="MCU1" library="SafeRest" deviceset="WEMOS_D1" device="" value="Wemos D1 (ESP8266)"/>
<part name="CHG1" library="SafeRest" deviceset="CARGADOR_USB" device="" value="Cargador USB 5V"/>
<part name="BAT1" library="SafeRest" deviceset="BATERIA_18650" device="" value="18650"/>
<part name="UPS1" library="SafeRest" deviceset="MODULO_UPS" device="" value="Modulo UPS"/>
</parts>
<sheets><sheet>
<plain>
<text x="15.24" y="203.2" size="2.54" layer="97">SafeRest - Mat: esquema de conexiones</text>
<text x="162.56" y="160.02" size="1.778" layer="97">ESP-NOW (inalambrico) -&gt; control remoto</text>
</plain>
<instances>
<instance part="CELDA1" gate="G$1" x="25.4" y="177.8"/>
<instance part="CELDA2" gate="G$1" x="25.4" y="147.32"/>
<instance part="CELDA3" gate="G$1" x="25.4" y="116.84"/>
<instance part="CELDA4" gate="G$1" x="25.4" y="86.36"/>
<instance part="U1" gate="G$1" x="101.6" y="137.16"/>
<instance part="MCU1" gate="G$1" x="177.8" y="137.16"/>
<instance part="CHG1" gate="G$1" x="25.4" y="48.26"/>
<instance part="BAT1" gate="G$1" x="25.4" y="22.86"/>
<instance part="UPS1" gate="G$1" x="101.6" y="35.56"/>
</instances>
<busses/>
<nets>
<net name="A+" class="0">
<segment>
<pinref part="CELDA1" gate="G$1" pin="ROJO"/>
<wire x1="40.64" y1="182.88" x2="50.8" y2="182.88" width="0.1524" layer="91"/>
<label x="50.8" y="182.88" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="CELDA3" gate="G$1" pin="ROJO"/>
<wire x1="40.64" y1="121.92" x2="50.8" y2="121.92" width="0.1524" layer="91"/>
<label x="50.8" y="121.92" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="A+"/>
<wire x1="83.82" y1="129.54" x2="73.66" y2="129.54" width="0.1524" layer="91"/>
<label x="73.66" y="129.54" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="E+" class="0">
<segment>
<pinref part="CELDA1" gate="G$1" pin="NEGRO"/>
<wire x1="40.64" y1="177.8" x2="50.8" y2="177.8" width="0.1524" layer="91"/>
<label x="50.8" y="177.8" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="CELDA2" gate="G$1" pin="BLANCO"/>
<wire x1="40.64" y1="142.24" x2="50.8" y2="142.24" width="0.1524" layer="91"/>
<label x="50.8" y="142.24" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="CELDA3" gate="G$1" pin="NEGRO"/>
<wire x1="40.64" y1="116.84" x2="50.8" y2="116.84" width="0.1524" layer="91"/>
<label x="50.8" y="116.84" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="CELDA4" gate="G$1" pin="BLANCO"/>
<wire x1="40.64" y1="81.28" x2="50.8" y2="81.28" width="0.1524" layer="91"/>
<label x="50.8" y="81.28" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="E+"/>
<wire x1="83.82" y1="144.78" x2="73.66" y2="144.78" width="0.1524" layer="91"/>
<label x="73.66" y="144.78" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="E-" class="0">
<segment>
<pinref part="CELDA1" gate="G$1" pin="BLANCO"/>
<wire x1="40.64" y1="172.72" x2="50.8" y2="172.72" width="0.1524" layer="91"/>
<label x="50.8" y="172.72" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="CELDA2" gate="G$1" pin="NEGRO"/>
<wire x1="40.64" y1="147.32" x2="50.8" y2="147.32" width="0.1524" layer="91"/>
<label x="50.8" y="147.32" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="CELDA3" gate="G$1" pin="BLANCO"/>
<wire x1="40.64" y1="111.76" x2="50.8" y2="111.76" width="0.1524" layer="91"/>
<label x="50.8" y="111.76" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="CELDA4" gate="G$1" pin="NEGRO"/>
<wire x1="40.64" y1="86.36" x2="50.8" y2="86.36" width="0.1524" layer="91"/>
<label x="50.8" y="86.36" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="E-"/>
<wire x1="83.82" y1="139.7" x2="73.66" y2="139.7" width="0.1524" layer="91"/>
<label x="73.66" y="139.7" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="A-" class="0">
<segment>
<pinref part="CELDA2" gate="G$1" pin="ROJO"/>
<wire x1="40.64" y1="152.4" x2="50.8" y2="152.4" width="0.1524" layer="91"/>
<label x="50.8" y="152.4" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="CELDA4" gate="G$1" pin="ROJO"/>
<wire x1="40.64" y1="91.44" x2="50.8" y2="91.44" width="0.1524" layer="91"/>
<label x="50.8" y="91.44" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="A-"/>
<wire x1="83.82" y1="134.62" x2="73.66" y2="134.62" width="0.1524" layer="91"/>
<label x="73.66" y="134.62" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="3V3" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="VCC"/>
<wire x1="119.38" y1="144.78" x2="129.54" y2="144.78" width="0.1524" layer="91"/>
<label x="129.54" y="144.78" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="MCU1" gate="G$1" pin="3V3"/>
<wire x1="157.48" y1="147.32" x2="147.32" y2="147.32" width="0.1524" layer="91"/>
<label x="147.32" y="147.32" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="GND"/>
<wire x1="119.38" y1="139.7" x2="129.54" y2="139.7" width="0.1524" layer="91"/>
<label x="129.54" y="139.7" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="MCU1" gate="G$1" pin="GND"/>
<wire x1="157.48" y1="142.24" x2="147.32" y2="142.24" width="0.1524" layer="91"/>
<label x="147.32" y="142.24" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="UPS1" gate="G$1" pin="GND"/>
<wire x1="119.38" y1="33.02" x2="129.54" y2="33.02" width="0.1524" layer="91"/>
<label x="129.54" y="33.02" size="1.778" layer="95"/>
</segment>
</net>
<net name="DT" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="DT"/>
<wire x1="119.38" y1="134.62" x2="129.54" y2="134.62" width="0.1524" layer="91"/>
<label x="129.54" y="134.62" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="MCU1" gate="G$1" pin="D5"/>
<wire x1="157.48" y1="137.16" x2="147.32" y2="137.16" width="0.1524" layer="91"/>
<label x="147.32" y="137.16" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="SCK" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="SCK"/>
<wire x1="119.38" y1="129.54" x2="129.54" y2="129.54" width="0.1524" layer="91"/>
<label x="129.54" y="129.54" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="MCU1" gate="G$1" pin="D6"/>
<wire x1="157.48" y1="132.08" x2="147.32" y2="132.08" width="0.1524" layer="91"/>
<label x="147.32" y="132.08" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="5V" class="0">
<segment>
<pinref part="MCU1" gate="G$1" pin="5V"/>
<wire x1="157.48" y1="127" x2="147.32" y2="127" width="0.1524" layer="91"/>
<label x="147.32" y="127" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="UPS1" gate="G$1" pin="5V"/>
<wire x1="119.38" y1="38.1" x2="129.54" y2="38.1" width="0.1524" layer="91"/>
<label x="129.54" y="38.1" size="1.778" layer="95"/>
</segment>
</net>
<net name="USB5V" class="0">
<segment>
<pinref part="CHG1" gate="G$1" pin="5V"/>
<wire x1="40.64" y1="50.8" x2="50.8" y2="50.8" width="0.1524" layer="91"/>
<label x="50.8" y="50.8" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="UPS1" gate="G$1" pin="USB+"/>
<wire x1="83.82" y1="43.18" x2="73.66" y2="43.18" width="0.1524" layer="91"/>
<label x="73.66" y="43.18" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="USBGND" class="0">
<segment>
<pinref part="CHG1" gate="G$1" pin="GND"/>
<wire x1="40.64" y1="45.72" x2="50.8" y2="45.72" width="0.1524" layer="91"/>
<label x="50.8" y="45.72" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="UPS1" gate="G$1" pin="USB-"/>
<wire x1="83.82" y1="38.1" x2="73.66" y2="38.1" width="0.1524" layer="91"/>
<label x="73.66" y="38.1" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="BAT+" class="0">
<segment>
<pinref part="BAT1" gate="G$1" pin="BAT+"/>
<wire x1="40.64" y1="25.4" x2="50.8" y2="25.4" width="0.1524" layer="91"/>
<label x="50.8" y="25.4" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="UPS1" gate="G$1" pin="BAT+"/>
<wire x1="83.82" y1="33.02" x2="73.66" y2="33.02" width="0.1524" layer="91"/>
<label x="73.66" y="33.02" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="BAT-" class="0">
<segment>
<pinref part="BAT1" gate="G$1" pin="BAT-"/>
<wire x1="40.64" y1="20.32" x2="50.8" y2="20.32" width="0.1524" layer="91"/>
<label x="50.8" y="20.32" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="UPS1" gate="G$1" pin="BAT-"/>
<wire x1="83.82" y1="27.94" x2="73.66" y2="27.94" width="0.1524" layer="91"/>
<label x="73.66" y="27.94" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
</nets>
</sheet></sheets>
</schematic>
</drawing>
</eagle>
