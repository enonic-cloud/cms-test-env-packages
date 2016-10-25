<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet exclude-result-prefixes="xs portal" version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:portal="http://www.enonic.com/cms/xslt/portal" xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

   <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>


   <xsl:template match="/">

      <h3>createWindowPlaceholder</h3>
      <p>
         portal:createWindowPlaceholder( '1123:123' ):<br/>
         <i>createWindowsPlaceholder in portlet not supported</i>
         <!--
         <strong><xsl:value-of select="portal:createWindowPlaceholder( '1123:123' )"/></strong>        
      -->
      </p>
      <p>
         portal:createWindowPlaceholder( '1123:123', ( 'abc', '123' ) ):<br/>
         <i>createWindowsPlaceholder in portlet not supported</i>
         <!--
         <strong><xsl:value-of select="portal:createWindowPlaceholder( '1123:123', ( 'abc', '123' ) )"/></strong>        
         -->
      </p>
   
   </xsl:template>


</xsl:stylesheet>
