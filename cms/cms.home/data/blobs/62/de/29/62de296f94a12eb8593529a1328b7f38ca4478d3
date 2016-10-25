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
  <xsl:include href="/libraries/process-html-area.xsl"/>


  <xsl:template match="/">
    Her kommer "document" som er lagret på portletten:
    <br/>
    <div style="background-color: darkseagreen;">
      <xsl:call-template name="process-html-area.process-html-area">
        <xsl:with-param name="document" select="/result/context/window/portlet/document"/>
        <xsl:with-param name="region-width" select="500" tunnel="yes"/>
        <xsl:with-param name="filter" select="''"/>
      </xsl:call-template>
    </div>

    <xsl:call-template name="displayContext"/>
  </xsl:template>


</xsl:stylesheet>
