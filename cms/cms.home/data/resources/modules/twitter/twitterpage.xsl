<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:saxon="http://saxon.sf.net" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:portal="http://www.enonic.com/cms/xslt/portal">
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="UTF-8" indent="yes" media-type="text/html" method="xml" omit-xml-declaration="yes"/>

    <xsl:template match="/">
        <twitter>
            <xsl:apply-templates select="/result/contents/content"/>          
        </twitter>
    </xsl:template>
    
    <xsl:template match="content">
        <message>
            <xsl:attribute name="key"><xsl:value-of select="@key"/></xsl:attribute>
            <xsl:attribute name="publishfrom"><xsl:value-of select="@publishfrom"/></xsl:attribute>
            <xsl:attribute name="link"><xsl:value-of select="portal:createContentUrl(@key)"/></xsl:attribute>
            <xsl:value-of select="contentdata/heading"/>       
        </message>
    </xsl:template>
</xsl:stylesheet>