<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
  xmlns:portal="http://www.enonic.com/cms/xslt/portal" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="xs portal" version="2.0">

  <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>

  <xsl:include href="/features/includes/displayContext.xsl"/>

  <xsl:template match="/">
    <p>
      <fieldset>
        <legend>createResourceUrl</legend>
        <UL>
          <LI>Bogus resource here sees yup: <a href="{portal:createResourceUrl('bogusresourceaddress')}"> here
            </a> (Should contain "undefinded - Path does not start with _public")</LI>
          <LI>No-existing resource: <a
              href="{portal:createResourceUrl('/_public/bogusresourceaddress.css')}"> here </a>
            (Should link to resource but no timestamp)</LI>
        </UL>
      </fieldset>
    </p>

    <xsl:call-template name="displayContext"> </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
