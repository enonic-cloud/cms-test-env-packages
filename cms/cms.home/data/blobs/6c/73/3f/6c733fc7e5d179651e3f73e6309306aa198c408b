<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    exclude-result-prefixes="xs portal"
    version="2.0"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:portal="http://www.enonic.com/cms/xslt/portal"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output indent="yes" media-type="application/xhtml+xml" method="xhtml" omit-xml-declaration="yes"/>

  <xsl:param name="asynchron"/>

  <xsl:variable name="asynchron-enabled" select="boolean(string-length($asynchron) &gt; 0)"/>
  <xsl:variable name="render" select="not($asynchron-enabled) or boolean(/result/context/querystring/parameter[@name = 'render'] = 'true')"/>

  <xsl:template match="/">
		
    <xsl:choose>
      <xsl:when test="portal:isWindowInline()">
        <xsl:call-template name="load"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="render"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="load">

    <div id="my-window-container" style="border: 1px dashed black">
      Please wait.... loading window
    </div>

    <xsl:variable name="window-url" select="portal:createWindowUrl()"/>
    <script type="text/javascript">

      setTimeout( function() {
        $('#my-window-container').load('<xsl:value-of select="$window-url"/>');}, 1000 );

    </script>

  </xsl:template>

  <xsl:template name="render">

    <div style="background-color: lightblue; padding: 10px">
      Am I rendered inline?
      <xsl:value-of select="portal:isWindowInline()"/>
    </div>

  </xsl:template>


</xsl:stylesheet>
