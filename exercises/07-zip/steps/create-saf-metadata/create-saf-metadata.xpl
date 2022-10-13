<p:declare-step version="3.0" type="fid:create-saf-metadata"
                xmlns:c="http://www.w3.org/ns/xproc-step"
                xmlns:fid="http://fid-romanistik.de/ns"
                xmlns:p="http://www.w3.org/ns/xproc"
                xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <p:input port="source"/>

  <p:option name="target" as="xs:string" required="true"/>

  <p:xslt name="transform" parameters="map{'outputBaseUri': p:urify($target)}">
    <p:with-input port="stylesheet" href="create-saf-metadata.xsl"/>
  </p:xslt>

  <p:for-each>
    <p:with-input pipe="secondary@transform"/>
    <p:store href="{document-uri(.)}"/>
  </p:for-each>

</p:declare-step>
