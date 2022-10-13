<p:declare-step version="3.0" type="fid:create-saf" name="create-saf"
                xmlns:c="http://www.w3.org/ns/xproc-step"
                xmlns:fid="http://fid-romanistik.de/ns"
                xmlns:p="http://www.w3.org/ns/xproc"
                xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <p:documentation>
    Erstellt ein Verzeichnis im DSpace Simple Archive Format (SAF) aus
    einer Verlagslieferung im DNB-Standardformat.
  </p:documentation>

  <p:import href="normalize-onix/normalize-onix.xpl"/>
  <p:import href="create-saf-metadata/create-saf-metadata.xpl"/>

  <p:input  port="source" content-types="application/zip">
    <p:documentation>ZIP-Datei der Verlagsdaten</p:documentation>
  </p:input>

  <p:option name="target" as="xs:string" required="true">
    <p:documentation>Zielverzeichnis</p:documentation>
  </p:option>

  <p:archive-manifest name="archive-manifest">
    <p:with-input port="source" pipe="source@create-saf"/>
  </p:archive-manifest>

  <p:variable name="manifest" as="document-node(element(c:archive))" select=".">
    <p:pipe step="archive-manifest" port="result"/>
  </p:variable>

  <p:unarchive>
    <p:with-input port="source" pipe="source@create-saf"/>
  </p:unarchive>

  <p:for-each depends="archive-manifest" name="create-saf-content">
    <p:output port="result" sequence="true"/>

    <p:variable name="baseUri" as="xs:string" select="p:document-property(., 'base-uri')"/>
    <p:variable name="name" as="xs:string" select="$manifest/c:archive/c:entry[@href eq $baseUri]/@name"/>
    <p:variable name="dir" as="xs:string?" select="substring-before($manifest/c:archive/c:entry[tokenize(@name, '/')[last()] eq 'catalogue_md.xml']/@name, 'catalogue_md.xml')"/>

    <p:choose>
      <p:when test="$name eq concat($dir, 'catalogue_md.xml')">
        <p:output port="result" sequence="true"/>
        <fid:normalize-onix p:message="Normalisiere ONIX Metadaten"/>
        <fid:create-saf-metadata target="{p:urify($target)}"/>
      </p:when>
      <p:when test="starts-with($name, concat($dir, 'content/'))">
        <p:output port="result" sequence="true"/>
        <p:store href="{resolve-uri(substring-after($name, 'content/'), p:urify($target))}"/>
        <p:set-properties properties="map{'filename': substring-after($name, 'content/')}"/>
      </p:when>
      <p:otherwise>
        <p:output port="result" sequence="true"/>
        <p:sink/>
      </p:otherwise>
    </p:choose>
  </p:for-each>

  <p:group name="store-source">
    <p:output port="result" sequence="false"/>
    <p:identity>
      <p:with-input port="source" pipe="source@create-saf"/>
    </p:identity>
    <p:set-properties properties="map{
                                  'filename': tokenize(p:document-property(., 'base-uri'), '/')[last()],
                                  'properties': ('bundle:DEPOSIT')
                                  }">

    </p:set-properties>
    <p:store href="{resolve-uri(p:document-property(., 'filename'), p:urify($target))}"/>
  </p:group>

  <p:for-each>
    <p:with-input>
      <p:pipe step="create-saf-content" port="result"/>
      <p:pipe step="store-source" port="result"/>
    </p:with-input>

    <p:variable name="filename" as="xs:string" select="p:document-property(., 'filename')"/>
    <p:variable name="properties" as="xs:string*" select="p:document-property(., 'properties')"/>
    <p:identity>
      <p:with-input port="source">
        <p:inline content-type="text/plain">{$filename}{if (empty($properties)) then '' else '&#9;'}{string-join($properties, '&#9;')}</p:inline>
      </p:with-input>
    </p:identity>
  </p:for-each>

  <p:text-join separator="&#10;"/>
  <p:store href="{resolve-uri('contents', p:urify($target))}"/>

</p:declare-step>
