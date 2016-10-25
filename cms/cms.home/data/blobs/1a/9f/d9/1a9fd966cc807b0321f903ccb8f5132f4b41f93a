<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    exclude-result-prefixes="xs portal"
    version="2.0" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:portal="http://www.enonic.com/cms/xslt/portal"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output
      indent="yes"
      media-type="text/html"
      method="xml"
      omit-xml-declaration="yes"/>

  <xsl:include href="/features/includes/displayContext.xsl"/>

  <xsl:template match="/">

    <h1>Portlet Window QueryParams</h1>
    <p>
      paramNotOverrideable:
      <xsl:value-of select="/result/context/querystring/parameter[ @name = 'paramNotOverrideable' ]"/>
    </p>
    <p>
      paramOverrideable:
      <xsl:value-of select="/result/context/querystring/parameter[ @name = 'paramOverrideable' ]"/>
    </p>
    <p>
      <a href="{portal:createPageUrl( ('paramNotOverrideable', 'this should not show', 'paramOverrideable', 'this should show' ) )}">
        Test overriding
      </a>
    </p>
    <br/>
    <br/>
    <br/>
    <xsl:call-template name="displayContext">
    </xsl:call-template>


  </xsl:template>


</xsl:stylesheet>
