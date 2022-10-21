<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	<!--Schema zuweisen-->
	<xsl:template match="processing-instruction('xml-model')"/>
	<xsl:template match="/">
		<xsl:processing-instruction name="xml-model">
			<xsl:text>href="../../common/basisformat_leibniz_meta.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"</xsl:text>
		</xsl:processing-instruction>
		<xsl:apply-templates/>
	</xsl:template>
	<!--fileDesc titleStmt-->
	<xsl:template match="teiHeader/fileDesc/titleStmt">
		<titleStmt>
			<title>
				<xsl:attribute name="type">main</xsl:attribute>
					<xsl:copy-of select="following::body/div[@type = 'chapter']/head[1]/text()"/>
			</title>
			<title>
				<xsl:attribute name="type">sub</xsl:attribute>
				<xsl:text>Elektronische Erschließung der im Druck erschienenen Stücke, Metadaten und Text</xsl:text>
			</title>
			<respStmt>
				<orgName>TELOTA - Berlin-Brandenburgischen Akademie der Wissenschaften</orgName>
				<resp>
					<note type="remarkResponsibility">Digitale Konzeption und Projektbegleitung</note>
				</resp>
			</respStmt>
			<respStmt>
				<orgName>Leibniz-Editionsstelle Berlin der Berlin-Brandenburgischen Akademie der Wissenschaften</orgName>
				<resp>
					<note type="remarkResponsibility">Inhaltliche Konzeption</note>
				</resp>
			</respStmt>
			<respStmt>
				<persName>
					<forename>Martina</forename>
					<surname>Gödel</surname>
				</persName>
				<resp>
					<note type="remarkResponsibility">Datenmodell und Konvertierung Reihe VIII</note>
				</resp>
			</respStmt>
			<respStmt>
				<persName>
					<forename>Sebastian W.</forename>
					<surname>Stork</surname>
				</persName>
				<resp>
					<note type="remarkResponsibility">Bearbeiter Leibniz-Editionsstelle Berlin</note>
				</resp>
			</respStmt>
		</titleStmt>
	</xsl:template>
	<!--fileDesc editionStmt entfällt-->
<xsl:template match="teiHeader/fileDesc/editionStmt"/>
	<!--fileDesc publicationStmt-->
	<xsl:template match="teiHeader/fileDesc/publicationStmt">
		<publicationStmt>
			<publisher>Berlin-Brandenburgische Akademie der Wissenschaften</publisher>
<!--Für neuen Band anpassen-->
			<date type="creation">2021</date>
			<availability>
				<licence target="http://creativecommons.org/licenses/by/4.0/deed.de">
					<p>Namensnennung-Nicht kommerziell 4.0 International (CC BY-NC 4.0)</p>
				</licence>
			</availability>
		</publicationStmt>
	</xsl:template>
	<!--sourceDesc biblStruct-->
	<xsl:template match="teiHeader/fileDesc/sourceDesc/biblFull">
		<biblStruct>
			<analytic>
				<xsl:apply-templates select="titleStmt/author"/>
				<title>
					<xsl:attribute name="type">chapter</xsl:attribute>
					<xsl:attribute name="level">a</xsl:attribute>
					<xsl:attribute name="n">
						<xsl:copy-of select="following::body/div[@type = 'chapter']/@n"/>
					</xsl:attribute>
					<xsl:copy-of select="following::body/div[@type = 'chapter']/head[1]/text()"/>
				</title>
				<xsl:if test="following::*[self::div[@type = 'section']]">
					<title>
						<xsl:attribute name="type">section</xsl:attribute>
						<xsl:attribute name="level">a</xsl:attribute>
						<xsl:attribute name="n">
							<xsl:copy-of select="following::*[self::div[@type = 'section']]/@n"/>
						</xsl:attribute>
						<xsl:copy-of select="following::*[self::div[@type = 'section']]/head[1]/text()"/>
					</title></xsl:if>
				<xsl:if test="not(following::*[self::div[@type = 'section']])">
					<title type="section" level="a" n=""/>
				</xsl:if>
				<date>
					<xsl:if test="following::body/div[@type = 'chapter']">
						<xsl:apply-templates select="following::body/div[@type = 'chapter']/head[2]/text()"/>
					</xsl:if>
					<xsl:if test="not(following::body/div[@type = 'chapter'])">
						<xsl:apply-templates select="following::div[@type = 'chapter']/head[2]/text()"/>
					</xsl:if>
				</date>
				<idno type="PDF">XXX</idno>
			</analytic>
			<monogr>
				<xsl:apply-templates select="titleStmt/title[@type = 'main']"/>
				<!--Für neuen Band anpassen-->
				<title type="volume" n="1" level="m"><xsl:text>Erster Band 1668 – 1676</xsl:text></title>
				<imprint>
					<xsl:apply-templates select="publicationStmt/*"/>
				</imprint>
				<biblScope unit="page" from="XXX" to="XXX"/>
			</monogr>
			<series>
			<xsl:apply-templates select="seriesStmt/title[@type='main']"></xsl:apply-templates>
			</series>
		</biblStruct>
	</xsl:template>
	<!--sourceDesc listWit (Textzeugen)-->
	<xsl:template match="div[@type = 'chapter' or @type='section']/div[@type = 'ueberlieferung']/p/list">
		<listWit>
			<xsl:apply-templates/>
		</listWit>
	</xsl:template>
	<xsl:template match="div[@type = 'chapter' or @type='section']/div[@type = 'ueberlieferung']/p/list/item[label/hi[starts-with(.,'L')]]">
		<witness>
			<xsl:attribute name="n">
				<xsl:copy-of select="label/hi"/>
			</xsl:attribute>
			<msDesc>
				<msIdentifier>
					<repository>Gottfried Wilhelm Leibniz Bibliothek Hannover</repository>
					<idno type="Signatur">XXX</idno>
				</msIdentifier>
				<msContents>
					<xsl:attribute name="corresp"><xsl:text>L_witness-content-types.xml#XXX</xsl:text>
					</xsl:attribute>
					<summary>
						<xsl:apply-templates select="p"/>
					</summary>
				</msContents>
			<physDesc>
				<objectDesc form="Handschrift"/>
			</physDesc>
			<history>
				<origin corresp="L_witness-origin-types.xml#origin-XXX"/>
			</history>
			</msDesc>
		</witness>
	</xsl:template>
	<xsl:template match="div[@type = 'chapter' or @type='section']/div[@type = 'ueberlieferung']/p/list/item[label/hi[starts-with(.,'l')]]">
		<witness>
			<xsl:attribute name="n">
				<xsl:copy-of select="label/hi"/>
			</xsl:attribute>
			<msDesc>
				<msIdentifier>
					<repository>Gottfried Wilhelm Leibniz Bibliothek Hannover</repository>
					<idno type="Signatur">XXX</idno>
				</msIdentifier>
				<msContents>
					<xsl:attribute name="corresp"><xsl:text>L_witness-content-types.xml#XXX</xsl:text></xsl:attribute>
					<summary>
						<xsl:apply-templates select="p"/>
					</summary>
				</msContents>
				<physDesc>
					<objectDesc form="Handschrift"/>
				</physDesc>
				<history>
					<origin corresp="L_witness-origin-types.xml#origin-XXX"/>
				</history>
			</msDesc>
		</witness>
	</xsl:template>
	<xsl:template match="div[@type = 'chapter' or @type='section']/div[@type = 'ueberlieferung']/p/list/item[label/hi[starts-with(.,'A')]]">
		<witness>
			<xsl:attribute name="n">
				<xsl:copy-of select="label/hi"/>
			</xsl:attribute>
			<msDesc>
				<msIdentifier>
					<repository>Gottfried Wilhelm Leibniz Bibliothek Hannover</repository>
					<idno type="Signatur">XXX</idno>
				</msIdentifier>
				<msContents>
					<xsl:attribute name="corresp"><xsl:text>L_witness-content-types.xml#XXX</xsl:text></xsl:attribute>
					<summary>
						<xsl:apply-templates select="p"/>
					</summary>
				</msContents>
				<physDesc>
					<objectDesc form="Handschrift"/>
				</physDesc>
				<history>
					<origin corresp="L_witness-origin-types.xml#origin-XXX"/>
				</history>
			</msDesc>
		</witness>
	</xsl:template>
	<xsl:template match="div[@type = 'chapter' or @type='section']/div[@type = 'ueberlieferung']/p/list/item[label/hi[starts-with(.,'E')]]">
		<witness>
			<xsl:attribute name="n">
				<xsl:copy-of select="label/hi"/>
			</xsl:attribute>
			<msDesc>
				<msIdentifier>
					<collection>Leibniz-Bibliographie</collection>
					<idno type="Laufende-Nummer">XXX</idno>
				</msIdentifier>
				<msContents>
					<xsl:attribute name="corresp"><xsl:text>L_witness-content-types.xml#XXX</xsl:text></xsl:attribute>
					<summary>
						<xsl:apply-templates select="p"/>
					</summary>
				</msContents>
				<physDesc>
					<objectDesc form="Druck"/>
				</physDesc>
				<history>
					<origin corresp="L_witness-origin-types.xml#origin-XXX"/>
				</history>
			</msDesc>
		</witness>
	</xsl:template>
	<xsl:template match="div[@type = 'chapter' or @type='section']/div[@type = 'ueberlieferung']/p/list/item[label/hi[not(starts-with(.,'L') or starts-with(.,'l') or starts-with(.,'A') or starts-with(.,'E'))]]">
		<witness>
			<xsl:attribute name="n">
				<xsl:copy-of select="label/hi"/>
			</xsl:attribute>
			<msDesc>
				<msIdentifier>
					<repository>XXX</repository>
					<idno type="Signatur">XXX</idno>
				</msIdentifier>
				<msContents>
					<xsl:attribute name="corresp"><xsl:text>L_witness-content-types.xml#XXX</xsl:text></xsl:attribute>
						<summary>
							<xsl:apply-templates select="p"/>
						</summary>
				</msContents>
				<physDesc>
					<objectDesc form="XXX"/>
				</physDesc>
				<history>
					<origin corresp="L_witness-origin-types.xml#origin-XXX"/>
				</history>
			</msDesc>
		</witness>
	</xsl:template>
</xsl:stylesheet>
