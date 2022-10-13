<xsl:transform version="3.0" expand-text="yes"
               xpath-default-namespace="http://www.tei-c.org/ns/1.0"
               xmlns:dct="http://purl.org/dc/terms/"
               xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
               xmlns:tei="http://www.tei-c.org/ns/1.0"
               xmlns:xs="http://www.w3.org/2001/XMLSchema"
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:mode on-no-match="shallow-skip"/>

  <xsl:template match="TEI">
    <rdf:RDF>
      <dct:BibliographicResource>
        <xsl:apply-templates/>
      </dct:BibliographicResource>
    </rdf:RDF>
  </xsl:template>

  <xsl:template match="titleInfo/title">
    <dct:title>{.}</dct:title>
  </xsl:template>

</xsl:transform>
