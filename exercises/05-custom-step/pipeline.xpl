<p:declare-step version="3.0"
                xmlns:example="http://example.com/ns"
                xmlns:p="http://www.w3.org/ns/xproc"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <p:input  port="source"/>
  <p:output port="result" serialization="map{'indent': true()}"/>

  <example:lesefassung/>

</p:declare-step>
