<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	<!--sourceDesc mit text verlinken-->
	<xsl:template match="//text">
		<text>
			<xsl:attribute name="xml:id"><xsl:copy-of select="//TEI/@xml:id"/><xsl:text>_text</xsl:text></xsl:attribute>
			<xsl:apply-templates/>
		</text>
	</xsl:template>
	<xsl:template match="//idno[@type='TEI-Version']">
		<idno>
			<xsl:copy-of select="@type"/>
			<xsl:attribute name="target"><xsl:text>#</xsl:text><xsl:copy-of select="//TEI/@xml:id"/><xsl:text>_text</xsl:text></xsl:attribute>
		</idno>
	</xsl:template>
	<!--Facsimile mit Haupttextzeugen verlinken-->
	<xsl:template match="//listWit/witness[1]">
		<witness>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="corresp"><xsl:text>#</xsl:text><xsl:copy-of select="//TEI/@xml:id"/><xsl:text>_facs-haupttextzeuge</xsl:text></xsl:attribute>
			<xsl:apply-templates/>
		</witness>
	</xsl:template>
	<xsl:template match="//facsimile">
		<facsimile>
			<xsl:attribute name="source">digilib.bbaw.de</xsl:attribute>
			<xsl:attribute name="xml:id"><xsl:copy-of select="//TEI/@xml:id"/><xsl:text>_facs-haupttextzeuge</xsl:text></xsl:attribute>
			<graphic url=""/>
		</facsimile>
	</xsl:template>
</xsl:stylesheet>
