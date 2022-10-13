<xsl:transform version="3.0" expand-text="yes"
               xpath-default-namespace="http://www.tei-c.org/ns/1.0"
               xmlns:json="http://www.w3.org/2005/xpath-functions"
               xmlns:xs="http://www.w3.org/2001/XMLSchema"
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:mode on-no-match="shallow-skip"/>

  <xsl:template match="listPerson">
    <json:array>
      <xsl:apply-templates/>
    </json:array>
  </xsl:template>

  <xsl:template match="person">
    <json:map>
      <json:string key="@context">http://schema.org/</json:string>
      <json:string key="@type">Person</json:string>
      <json:string key="@id">http://example.com/register/{@xml:id}</json:string>
      <json:string key="name">{persName}</json:string>
      <xsl:where-populated>
        <json:array key="sameAs">
          <xsl:for-each select="idno">
            <json:string>{.}</json:string>
          </xsl:for-each>
        </json:array>
      </xsl:where-populated>
    </json:map>
  </xsl:template>

</xsl:transform>
