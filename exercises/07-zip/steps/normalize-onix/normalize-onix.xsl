<xsl:transform version="3.0" expand-text="yes"
               xmlns:onix2-short="http://www.editeur.org/onix/2.1/short"
               xmlns:onix2-reference="http://www.editeur.org/onix/2.1/reference"
               xmlns:onix3-short="http://ns.editeur.org/onix/3.0/short"
               xmlns:onix3-reference="http://ns.editeur.org/onix/3.0/reference"
               xmlns:xs="http://www.w3.org/2001/XMLSchema"
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:mode on-no-match="shallow-copy"/>

  <xsl:template match="onix2-short:*" as="element()">
    <xsl:element name="onix2-reference:{@refname}">
      <xsl:sequence select="@*"/>
      <xsl:apply-templates select="node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="onix3-short:*" as="element()">
    <xsl:element name="onix3-reference:{@refname}">
      <xsl:sequence select="@*"/>
      <xsl:apply-templates select="node()"/>
    </xsl:element>
  </xsl:template>

</xsl:transform>
