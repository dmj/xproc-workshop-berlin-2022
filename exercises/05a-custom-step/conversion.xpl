<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" version="3.0"
                xmlns:ex="http://example.com/ns" type="ex:conversion">

  <p:input  port="source"/>
  <p:output port="result"/>

  <p:xslt>
    <p:with-input port="stylesheet">
      <p:document href="leibniz-VIII-2_2_metadatenheader.xsl"/>
    </p:with-input>
  </p:xslt>
  <p:xslt>
    <p:with-input port="stylesheet">
      <p:document href="leibniz-VIII-2_2_metadatenheader_enrich.xsl"/>
    </p:with-input>
  </p:xslt>
  <p:xslt>
    <p:with-input port="stylesheet">
      <p:document href="leibniz-VIII-2_2_metadatenheader_link.xsl"/>
    </p:with-input>
  </p:xslt>
  <p:xslt>
    <p:with-input port="stylesheet">
      <p:document href="leibniz-VIII-2_2_metadatenheader_clean-up.xsl"/>
    </p:with-input>
  </p:xslt>
  <p:xslt>
    <p:with-input port="stylesheet">
      <p:document href="leibniz-VIII-2_2_metadatenheader_finalize.xsl"/>
    </p:with-input>
  </p:xslt>

</p:declare-step>
