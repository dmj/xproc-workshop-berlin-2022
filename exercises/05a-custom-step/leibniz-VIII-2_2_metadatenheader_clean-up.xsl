<?xml version="1.0" encoding="UTF-8"?>
	<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns="http://www.tei-c.org/ns/1.0"
		xpath-default-namespace="http://www.tei-c.org/ns/1.0"
		version="2.0">
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
		<!--Reste von xi:include beseitigen-->
		<xsl:template match="teiHeader/fileDesc/titleStmt">
			<titleStmt><xsl:apply-templates></xsl:apply-templates></titleStmt>
		</xsl:template>
		<!--Reste von xi:include beseitigen-->
		<xsl:template match="teiHeader/encodingDesc">
			<encodingDesc><xsl:apply-templates></xsl:apply-templates></encodingDesc>
		</xsl:template>
		<!--überflüssige Layoutinformation aus listWit Nachkommen in teiHeader entfallen lassen-->
<xsl:template match="idno[@type='Katalognummer']/p">
	<xsl:apply-templates select="hi[@rendition='#smaller']/node()"/>
		</xsl:template>
		<xsl:template match="summary/p/hi[@rendition='#smaller']">
			<xsl:apply-templates/>
		</xsl:template>
	</xsl:stylesheet>