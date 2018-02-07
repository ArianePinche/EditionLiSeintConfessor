<?xml version="1.0" encoding="UTF-8"?>

<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:c="http://www.w3.org/ns/xproc-step"
    version="1.0">

    <p:input port="source" sequence="true"/>
    <p:input port="parameters" kind="parameter"/>

    <p:xslt name="normalisation1">
        <p:input port="stylesheet">
            <p:document href="EtablissementTexte1"/>
        </p:input>
    </p:xslt>

    <p:xslt name="tokenisation">
        <p:input port="source">
            <p:pipe step="normalisation1" port="result"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="EtablissementTexte2.xsl"/>
        </p:input>
    </p:xslt>

    <p:store href=".../XML/textenettoyé.xml"/>

    <p:xslt name="tableauAccentuation">
        <p:input port="source">
            <p:pipe step="tokenisation" port="result"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="accentuation.xsl"/>
        </p:input>
    </p:xslt>

    <p:store href="../XML/tableauAccentuation.xml"/>

</p:declare-step>
