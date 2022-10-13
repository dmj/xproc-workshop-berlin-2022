<p:declare-step version="3.0" type="fid:normalize-onix"
                xmlns:c="http://www.w3.org/ns/xproc-step"
                xmlns:fid="http://fid-romanistik.de/ns"
                xmlns:onix2-short="http://www.editeur.org/onix/2.1/short"
                xmlns:onix2-reference="http://www.editeur.org/onix/2.1/reference"
                xmlns:onix3-short="http://ns.editeur.org/onix/3.0/short"
                xmlns:onix3-reference="http://ns.editeur.org/onix/3.0/reference"
                xmlns:p="http://www.w3.org/ns/xproc">

  <p:input  port="source"/>
  <p:output port="result"/>

  <p:choose>
    <p:documentation>Namespace sicherstellen</p:documentation>
    <p:when test="/ONIXmessage[@release = '3.0']">
      <p:documentation>ONIX 3, short, ohne Namespace</p:documentation>
      <p:namespace-rename from="" to="http://ns.editeur.org/onix/3.0/short" apply-to="elements"/>
    </p:when>
    <p:when test="/ONIXMessage[@release = '3.0']">
      <p:documentation>ONIX 3, reference, ohne Namespace</p:documentation>
      <p:namespace-rename from="" to="http://ns.editeur.org/onix/3.0/reference" apply-to="elements"/>
    </p:when>
    <p:when test="/ONIXmessage">
      <p:documentation>ONIX 2, short, ohne Namespace</p:documentation>
      <p:namespace-rename from="" to="http://www.editeur.org/onix/2.1/short" apply-to="elements"/>
    </p:when>
    <p:when test="/ONIXMessage">
      <p:documentation>ONIX 2, reference, ohne Namespace</p:documentation>
      <p:namespace-rename from="" to="http://www.editeur.org/onix/2.1/short" apply-to="elements"/>
    </p:when>
    <p:when test="/onix2-short:ONIXmessage | /onix2-reference:ONIXMessage | /onix3-short:ONIXmessage | /onix3-reference:ONIXMessage">
      <p:documentation>ONIX 2 oder 3, short oder reference mit Namespace</p:documentation>
      <p:identity/>
    </p:when>
    <p:otherwise>
      <p:error code="UnknownInputFormat">
        <p:with-input port="source">
          <p:inline>
            <c:error>Unbekanntes Eingabeformat</c:error>
          </p:inline>
        </p:with-input>
      </p:error>
    </p:otherwise>
  </p:choose>

  <p:choose>
    <p:when test="/onix2-short:ONIXmessage">
      <p:validate-with-xml-schema>
        <p:with-input port="schema" href="schema/onix/2.1/ONIX_BookProduct_Release2.1_short.xsd"/>
      </p:validate-with-xml-schema>
    </p:when>
    <p:when test="/onix2-reference:ONIXMessage">
      <p:validate-with-xml-schema>
        <p:with-input port="schema" href="schema/onix/2.1/ONIX_BookProduct_Release2.1_reference.xsd"/>
      </p:validate-with-xml-schema>
    </p:when>
    <p:when test="/onix3-short:ONIXmessage">
      <p:validate-with-xml-schema>
        <p:with-input port="schema" href="schema/onix/3.0/ONIX_BookProduct_3.0_short.xsd"/>
      </p:validate-with-xml-schema>
    </p:when>
    <p:when test="/onix3-reference:ONIXMessage">
      <p:validate-with-xml-schema>
        <p:with-input port="schema" href="schema/onix/3.0/ONIX_BookProduct_3.0_reference.xsd"/>
      </p:validate-with-xml-schema>
    </p:when>
  </p:choose>

  <p:xslt>
    <p:with-input port="stylesheet" href="normalize-onix.xsl"/>
  </p:xslt>

</p:declare-step>
