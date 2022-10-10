<p:declare-step version="3.0"
                xmlns:p="http://www.w3.org/ns/xproc">

  <p:identity message="We are running {p:system-property('p:product-name')} {p:system-property('p:product-version')} from {p:system-property('p:vendor')}.">
    <p:with-input port="source">
      <p:empty/>
    </p:with-input>
  </p:identity>

  <p:validate-with-schematron message="Running Schematron validation via p:validate-with-schematron">
    <p:with-input port="source">
      <p:inline>
        <document/>
      </p:inline>
    </p:with-input>
    <p:with-input port="schema">
      <p:inline>
        <sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
          <sch:pattern>
            <sch:rule context="*">
              <sch:assert test="true()"/>
            </sch:rule>
          </sch:pattern>
        </sch:schema>
      </p:inline>
    </p:with-input>
  </p:validate-with-schematron>

</p:declare-step>
