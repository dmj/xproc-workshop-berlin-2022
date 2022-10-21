<p:declare-step version="3.0"
                xmlns:ex="http://example.com/ns"
                xmlns:c="http://www.w3.org/ns/xproc-step"
                xmlns:p="http://www.w3.org/ns/xproc"
                xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <p:import href="conversion.xpl"/>

  <p:directory-list path="{resolve-uri('stuecke', static-base-uri())}" include-filter=".*xml"/>
  <p:for-each>
    <p:with-input select="//c:file"/>
    
    <p:variable name="sourceUrl" as="xs:string" select="resolve-uri(c:file/@name, base-uri(c:file))"/>
    <p:variable name="targetUrl" as="xs:string" select="resolve-uri(concat('stuecke-verarbeitet/', c:file/@name), static-base-uri())"/>

    <p:load href="{$sourceUrl}" message="Lade Quelldatei {$sourceUrl}"/>

    <!-- Die Beispieldateien inkludieren Dateien die nicht zur
         Verfügung gestellt werden können. Der Schritt p:xinclude
         führt die XInclude-Anweisung aus. -->
    <!-- <p:xinclude/> -->

    <ex:conversion p:message="Transformiere {$sourceUrl}"/>

    <p:store href="{$targetUrl}" message="Speichere Zieldatei {$targetUrl}"/>

  </p:for-each>
  
</p:declare-step>
