<p:declare-step version="3.0"
                xmlns:p="http://www.w3.org/ns/xproc"
                xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <p:documentation>
    This is a simple pipeline with one input port, one output port,
    and one option.
  </p:documentation>

  <p:input port="source"/>
  <p:output port="result"/>

  <p:option name="name" as="xs:string" required="true"/>

  <p:identity message="Hello {$name}! Just passing through!"/>
  
</p:declare-step>
