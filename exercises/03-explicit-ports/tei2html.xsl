<xsl:transform version="3.0" expand-text="yes" exclude-result-prefixes="#all"
               xpath-default-namespace="http://www.tei-c.org/ns/1.0"
               xmlns:xs="http://www.w3.org/2001/XMLSchema"
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" version="5"/>

  <xsl:mode on-no-match="shallow-copy"/>

  <xsl:template match="TEI">
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta name="referrer" content="no-referrer"/>
        <title>{teiHeader/fileDesc/titleStmt/title}</title>
      </head>
      <body>
        <xsl:apply-templates select="text/body/node()"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="teiHeader"/>
  <xsl:template match="standOff"/>

  <xsl:template match="w | pc">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="lb">
    <br/>
  </xsl:template>

  <xsl:template match="pb"/>

  <xsl:template match="ab">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

</xsl:transform>
