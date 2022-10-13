<p:declare-step version="3.0"
                xmlns:example="http://example.com/ns"
                xmlns:p="http://www.w3.org/ns/xproc"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <p:input  port="source"/>
  <p:output port="result" serialization="map{'indent': true()}"/>

  <p:declare-step type="example:lesefassung">
    <p:input  port="source"/>
    <p:output port="result"/>

    <p:unwrap match="tei:pc | tei:w"/>

    <p:delete match="@corresp"/>

    <p:insert match="tei:revisionDesc" position="last-child">
      <p:with-input port="insertion">
        <p:inline><tei:change when="{current-dateTime()}">Lesefassung erstellt</tei:change></p:inline>
      </p:with-input>
    </p:insert>

  </p:declare-step>

  <example:lesefassung/>

</p:declare-step>
