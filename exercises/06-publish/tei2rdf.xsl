<xsl:transform version="3.0" expand-text="yes"
               xpath-default-namespace="http://www.tei-c.org/ns/1.0"
               xmlns:schema="http://schema.org/"
               xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
               xmlns:xs="http://www.w3.org/2001/XMLSchema"
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:mode on-no-match="shallow-skip"/>

  <xsl:template match="person">
    <rdf:RDF>
      <schema:Person rdf:about="http://example.com/register/{@xml:id}">
        <schema:name>{persName}</schema:name>
        <xsl:for-each select="idno">
          <schema:sameAs>{.}</schema:sameAs>
        </xsl:for-each>
      </schema:Person>
    </rdf:RDF>
  </xsl:template>

</xsl:transform>
