<xsl:transform version="3.0" expand-text="yes"
               exclude-result-prefixes="#all"
               xmlns:map="http://www.w3.org/2005/xpath-functions/map"
               xmlns:onix2="http://www.editeur.org/onix/2.1/reference"
               xmlns:onix3="http://ns.editeur.org/onix/3.0/reference"
               xmlns:xs="http://www.w3.org/2001/XMLSchema"
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:mode on-no-match="shallow-skip"/>

  <xsl:param name="outputBaseUri" as="xs:string" required="yes"/>

  <xsl:template match="/">
    <xsl:variable name="values" as="element(dcvalue)*">
      <xsl:apply-templates/>
    </xsl:variable>

    <xsl:for-each-group select="$values" group-by="string(@schema)">
      <xsl:variable name="filename" as="xs:string"
                    select="if (@schema) then concat('metadata_', @schema) else 'dublin_core'"/>
      <xsl:result-document href="{resolve-uri($filename, $outputBaseUri)}.xml">
        <dublin_core>
          <xsl:sequence select="@schema"/>
          <xsl:for-each select="current-group()">
            <xsl:copy>
              <xsl:sequence select="@* except @schema"/>
              <xsl:sequence select="node()"/>
            </xsl:copy>
          </xsl:for-each>
        </dublin_core>
      </xsl:result-document>
    </xsl:for-each-group>

  </xsl:template>

  <!-- ONIX 2 -->

  <xsl:variable name="onix2:dcContributorQualifier" as="map(xs:string, xs:string)"
                select="map{'A01': 'author', 'B01': 'editor'}"/>

  <xsl:template match="onix2:Product">
    <xsl:apply-templates>
      <xsl:with-param name="defaultLang" as="xs:string" tunnel="yes"
                      select="onix2:Language[onix2:LanguageRole = '01']/onix2:LanguageCode"/>
    </xsl:apply-templates>
  </xsl:template>

  <!-- ONIX 2 Title: 01 = "Distinctive Title", 03 = "Title in original language" -->
  <xsl:template match="onix2:Title[onix2:TitleType = ('01', '03')]">
    <xsl:param name="defaultLang" as="xs:string" tunnel="yes" required="yes"/>
    <xsl:variable name="titleText" as="xs:string"
                  select="if (onix2:TitleText) then onix2:TitleText else string-join((onix2:TitlePrefix, onix2:TitleWithoutPrefix), ' ')"/>
    <xsl:variable name="titleLang" as="xs:string"
                  select="(onix2:TitleText/@language, onix2:TitleWithoutPrefix/@language, $defaultLang)[1]"/>
    <dcvalue element="title" language="{$titleLang}">
      <xsl:value-of separator=" : " select="($titleText, onix2:Subtitle)"/>
    </dcvalue>
  </xsl:template>

  <xsl:template match="onix2:PublicationDate">
    <dcvalue element="date" qualifier="issued">
      <xsl:value-of select="substring(., 1, 4)"/>
    </dcvalue>
  </xsl:template>

  <xsl:template match="onix2:Contributor[string(onix2:ContributorRole) = map:keys($onix2:dcContributorQualifier)]">
    <dcvalue element="contributor" qualifier="{map:get($onix2:dcContributorQualifier, string(onix2:ContributorRole))}">
      <xsl:choose>
        <xsl:when test="onix2:PersonNameInverted">
          <xsl:value-of select="onix2:PersonNameInverted"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:variable name="nameParticles" as="xs:string+" select="tokenize(onix2:PersonName, '\s+')"/>
          <xsl:value-of select="($nameParticles[last()], $nameParticles[position() lt last()])" separator=", "/>
        </xsl:otherwise>
      </xsl:choose>
    </dcvalue>
  </xsl:template>

  <!-- ONIX 3 -->

  <xsl:template match="onix3:DescriptiveDetail">
    <xsl:apply-templates>
      <xsl:with-param name="defaultLang" as="xs:string" tunnel="yes"
                      select="onix3:Language[onix3:LanguageRole = '01']/onix3:LanguageCode"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="onix3:PublishingDetail/onix3:PublishingDate[onix3:PublishingDateRole = ('01')]/onix3:Date">
    <xsl:if test="not(matches(@dateformat, '^(0[0-9]|1[01])$'))">
      <xsl:message terminate="yes">
        <xsl:text>Nicht unterstütztes ONIX 3 Datumsformat: {@dateformat} (siehe Liste 55)</xsl:text>
      </xsl:message>
    </xsl:if>
    <dcvalue element="date" qualifier="issued">
      <xsl:value-of select="substring(., 1, 4)"/>
    </dcvalue>
  </xsl:template>

</xsl:transform>
