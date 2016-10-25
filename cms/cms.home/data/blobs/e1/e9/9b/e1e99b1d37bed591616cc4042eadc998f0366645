<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet exclude-result-prefixes="xs portal" version="2.0"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:portal="http://www.enonic.com/cms/xslt/portal"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="no" media-type="text" method="text" omit-xml-declaration="yes"/>
  <xsl:variable name="supportedLanguages">nn|no|sq|en</xsl:variable>
  <xsl:template match="/">
        <xsl:apply-templates select="/context/request/accept"/>
  </xsl:template>
  <xsl:template match="accept">
	<xsl:value-of select="language[matches(.,$supportedLanguages)][1]"/>
  </xsl:template>
</xsl:stylesheet>
