<p:declare-step version="3.0"
                xmlns:p="http://www.w3.org/ns/xproc">

  <p:output port="result" pipe="result@create-html"/>
  <p:output port="result.rdf" pipe="result@create-rdf"/>

  <p:load href="document.xml" name="load-document"/>

  <p:xslt name="create-html">
    <p:with-input port="source" pipe="result@load-document"/>
    <p:with-input port="stylesheet" href="tei2html.xsl"/>
  </p:xslt>

  <p:xslt name="create-rdf">
    <p:with-input port="source" pipe="result@load-document"/>
    <p:with-input port="stylesheet" href="tei2rdf.xsl"/>
  </p:xslt>

</p:declare-step>
