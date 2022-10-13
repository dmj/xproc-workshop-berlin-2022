<p:declare-step version="3.0"
                xmlns:p="http://www.w3.org/ns/xproc"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:tei="http://www.tei-c.org/ns/1.0">

  <p:input  port="source"/>
  <p:output port="result" serialization="map{'indent': true()}" sequence="true"/>

  <p:for-each name="iterate-person">
    <p:with-input select="//tei:person"/>

    <p:variable name="id" as="xs:string" select="tei:person/@xml:id"/>

    <p:xslt name="person2rdf">
      <p:with-input port="source" pipe="current@iterate-person"/>
      <p:with-input port="stylesheet" href="tei2rdf.xsl"/>
    </p:xslt>

    <p:store href="output/{$id}.xml">
      <p:with-input port="source" pipe="result@person2rdf"/>
    </p:store>

    <p:xslt name="person2json">
      <p:with-input port="source" pipe="current@iterate-person"/>
      <p:with-input port="stylesheet" href="tei2json.xsl"/>
    </p:xslt>

    <p:store href="output/{$id}.json" serialization="map{'method': 'text'}">
      <p:with-input port="source" pipe="result@person2json" select="xml-to-json(.)"/>
    </p:store>

  </p:for-each>

</p:declare-step>
