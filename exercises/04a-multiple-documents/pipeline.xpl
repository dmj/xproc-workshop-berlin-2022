<p:declare-step version="3.0"
                xmlns:c="http://www.w3.org/ns/xproc-step"
                xmlns:p="http://www.w3.org/ns/xproc"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <p:output port="result"/>

  <p:directory-list …/>

  <p:for-each>
    <p:with-input select="…"/>

    <p:variable name="href" as="xs:string" select="…"/>

    <p:identity message="The value of the href variable is: {$href}"/>

    <p:load href="{$href}"/>

    <p:delete match="@pos"/>

    <p:store href="{$href}.new"/>

  </p:for-each>


</p:declare-step>
