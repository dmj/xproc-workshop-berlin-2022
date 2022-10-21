<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	<!--profileDesc ausbauen-->
	<xsl:template match="teiHeader/profileDesc">
		<profileDesc>
			<langUsage>
				<language ident="XXX"/>
			</langUsage>
			<calendarDesc>
				<calendar xml:id="gregorian">
					<p>Gregorianischer Kalenderstil</p>
				</calendar>
				<calendar xml:id="julian">
					<p>Gregorianischer Kalenderstil</p>
				</calendar>
			</calendarDesc>
			<textClass>
				<catRef scheme="L_subjects" target="L_subjects.xml#XXX"/>
				<catRef scheme="L_terms" target="L_subjects.xml#"/>
			</textClass>
			<abstract>
				<listPerson>
					<person sameAs="L_persons.xml#leibniz_gottfried-wilhelm"/>
					<person sameAs="L_persons.xml#"/>
				</listPerson>
				<listPlace>
					<place sameAs="L_places.xml#"/>
				</listPlace>
			</abstract>
		</profileDesc>
	</xsl:template>
	<!--revisonDesc setzen-->
	<xsl:template match="teiHeader/revisionDesc">
		<revisionDesc>
			<change when="2021" who="#telota" status="base"/>
			<change when="2021-XX-XX" who="#stork" status="enrich_1"/>
		</revisionDesc>
	</xsl:template>
	<!--listWit in den header ziehen-->
	<xsl:template match="teiHeader/fileDesc/sourceDesc/listWit">
		<xsl:apply-templates select="following::listWit"/>
	</xsl:template>
	<!--@n für Reihen spezifizieren-->
	<xsl:template match="teiHeader/fileDesc/sourceDesc/biblStruct/monogr/title[@type = 'main']">
		<title>
			<xsl:copy-of select="@*"/>
			<xsl:attribute name="n">8</xsl:attribute>
			<xsl:apply-templates/>
		</title>
	</xsl:template>
	<!--Stück-Datierung präzisieren-->
	<xsl:template match="teiHeader/fileDesc/sourceDesc/biblStruct/analytic/date">
		<date>
			<xsl:attribute name="calendar"><xsl:text>#XXX</xsl:text></xsl:attribute>
			<xsl:attribute name="notBefore"><xsl:text>XXX</xsl:text></xsl:attribute>
			<xsl:attribute name="resp"><xsl:text>#XXX</xsl:text></xsl:attribute>
			<xsl:attribute name="cert"><xsl:text>XXX</xsl:text></xsl:attribute>
			<xsl:apply-templates/>
		</date>
		<date>
			<xsl:attribute name="calendar"><xsl:text>#XXX</xsl:text></xsl:attribute>
			<xsl:attribute name="notAfter"><xsl:text>XXX</xsl:text></xsl:attribute>
			<xsl:attribute name="resp"><xsl:text>#XXX</xsl:text></xsl:attribute>
			<xsl:attribute name="cert"><xsl:text>XXX</xsl:text></xsl:attribute>
		</date>
	</xsl:template>
	<!--Facsimile einfügen-->
	<xsl:template match="text">
		<facsimile source="digilib.bbaw.de" xml:id="L">
			<graphic url="XXX"/>
		</facsimile>
		<xsl:copy-of select="."/>
	</xsl:template>
</xsl:stylesheet>
