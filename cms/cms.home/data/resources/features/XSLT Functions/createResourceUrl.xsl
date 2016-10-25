<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
  xmlns:portal="http://www.enonic.com/cms/xslt/portal" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="xs portal" version="2.0">
  
  <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>
  
  <xsl:include href="/features/includes/displayContext.xsl"/>
  
  <xsl:template match="/">
    <p>
      <H2>Bogus resource</H2>
      <h4><xsl:value-of select="portal:createResourceUrl('bogusresourceaddress')"/></h4>(Should contain "undefinded - Path does not start with _public")
    </p>
    <p>
      <H2>No-existing resource:</H2>
      <h4><xsl:value-of select="portal:createResourceUrl('/_public/bogusresourceaddress.css')"/></h4> (Should link to resource but no timestamp)
    </p>
    <p>
      <H2>Nested functions:</H2>
      <h4><xsl:value-of select="portal:createResourceUrl('/_public/libraries/scripts/jquery-1.3.2.min.js', 
        ('attachment',portal:createAttachmentUrl('225')))"/></h4> (Should link to resource with timestamp and attachment-parameter with rendered url to file)
    </p> 
	<h2>createUrlAsPath = true</h2>
	<p>
		test cms.site.createUrlAsPath = true
	</p>
	<p>
		<xsl:variable name="url" select="concat('//', /result/context/querystring/@server, portal:createResourceUrl('/_public/skins/advanced/beach/pc.css'))"/>
		
		<a href="{$url}">
			<xsl:value-of select="$url"/>
		</a>
	</p>
    <xsl:call-template name="displayContext"> </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
