<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:portal="http://www.enonic.com/cms/xslt/portal" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="xs portal"
    version="2.0">

    <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>

    <xsl:include href="/features/includes/displayContext.xsl"/>

    <xsl:template match="/">

        <h2>Testing createPageUrl 2</h2>

        <ul>
            <li>
                <a href="{portal:createPageUrl(56, ())}">createPageUrl menuitem on same site (sample-packages)</a>
            </li>
            <li>
                <a href="{portal:createPageUrl(121, ())}">createPageUrl menuitem on site with cms.site.url-property (Intranett / home)</a>
            </li>
            <li>
                <a href="{portal:createPageUrl(214, ())}">createPageUrl menuitem on site without cms.site.url-property - should fail</a>
            </li>


        </ul>



        <xsl:call-template name="displayContext"> </xsl:call-template>
    </xsl:template>
</xsl:stylesheet>
