<p:declare-step version="3.0"
                xmlns:c="http://www.w3.org/ns/xproc-step"
                xmlns:err="http://www.w3.org/ns/xproc-error"
                xmlns:fid="http://fid-romanistik.de/ns"
                xmlns:p="http://www.w3.org/ns/xproc"
                xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <p:import href="create-saf.xpl"/>

  <p:option name="source" as="xs:string" required="true"/>
  <p:option name="target" as="xs:string" required="true"/>

  <p:directory-list path="{p:urify($source)}" include-filter=".*\.zip$" max-depth="unbounded"/>
  <p:viewport match="c:file">
    <p:variable name="ident" as="xs:string" select="substring-before(c:file/@name, '.zip')"/>
    <p:load href="{resolve-uri(c:file/@name, base-uri(c:file))}"/>
    <p:try>
      <p:group>
        <fid:create-saf target="{resolve-uri($ident, p:urify($target))}/"/>
        <p:identity>
          <p:with-input port="source">
            <p:empty/>
          </p:with-input>
        </p:identity>
      </p:group>
      <p:catch name="catch">
        <p:identity message="Fehler beim Publizieren des SAF für {$ident}">
          <p:with-input port="source" pipe="error@catch"/>
        </p:identity>
        <p:file-delete href="{resolve-uri($ident, p:urify($target))}/" fail-on-error="true" recursive="true"/>
      </p:catch>
    </p:try>
  </p:viewport>

</p:declare-step>
