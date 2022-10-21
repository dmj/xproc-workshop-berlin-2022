<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
		<!--graphic markieren-->
	<xsl:template match="facsimile/graphic">
			<graphic url="XXX"/>
		</xsl:template>
		<!--listwit in body vereinfachen-->
		<xsl:template match="witness[ancestor::body]">
			<witness><xsl:apply-templates/></witness>
		</xsl:template>
		<xsl:template match="msContents[ancestor::body]">
			<msContents><xsl:apply-templates/></msContents>
		</xsl:template>
		<xsl:template match="origin[ancestor::body]">
			<origin><xsl:apply-templates/></origin>
		</xsl:template>
		<!--catRef Korrektur -->
		<xsl:template match="catRef[@scheme='L_terms']">
			<catRef>
				<xsl:attribute name="scheme"><xsl:text>L_terms</xsl:text></xsl:attribute>
				<xsl:attribute name="target"><xsl:text>L_terms.xml#</xsl:text></xsl:attribute></catRef>
		</xsl:template>
		<!--Formeln im header vereinfachen -->
		<xsl:template match="formula[ancestor::teiHeader]">
			<xsl:apply-templates select="descendant::text()"/>
		</xsl:template>
	<!--Link zum PDF ausbauen -->
	<xsl:template match="idno[@type='PDF']">
		<idno type="PDF">
			<idno type="url">https://leibniz-berlin.bbaw.de/fileadmin/Webdateien/dateien/LSB_VIII_1.pdf</idno>
			<idno type="page">#page=XXX</idno>
		</idno>
	</xsl:template>
	</xsl:stylesheet>