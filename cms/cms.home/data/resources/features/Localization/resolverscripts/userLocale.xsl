<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet exclude-result-prefixes="xs portal" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:portal="http://www.enonic.com/cms/xslt/portal"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="no" media-type="text" method="text" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <xsl:variable name="userLocale" select="/context/user/locale"/>
        <xsl:choose>
            <xsl:when test="$userLocale != ''"><xsl:value-of select="$userLocale"/></xsl:when>
            <xsl:otherwise>no</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>