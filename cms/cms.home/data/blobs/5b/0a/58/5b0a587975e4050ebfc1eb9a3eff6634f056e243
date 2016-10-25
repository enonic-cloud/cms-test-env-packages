<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:portal="http://www.enonic.com/cms/xslt/portal" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="xs portal" version="2.0">
    
    <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>
    
    <xsl:include href="/features/includes/displayContext.xsl"/>
    
    <xsl:template match="/">           
        
        <xsl:variable name="redirectOK" select="portal:createPageUrl( () )"/>
        
        <fieldset>
            <legend>CreateServicesUrl - portal:createPageUrl with redirect to self</legend>
            
            <form action="{portal:createServicesUrl('portal','resetLocale', $redirectOK, ())}" id="form" method="post">
                    <input class="button" type="submit" value="submit"/>
            </form>    
            
            <label>Resulting link:</label>
            
            <textarea style="height:75px;">
                <xsl:value-of select="portal:createServicesUrl('portal','resetLocale',  $redirectOK, ())"/>
            </textarea>           
            
        </fieldset>
        <xsl:call-template name="displayContext"> </xsl:call-template>
    </xsl:template>
</xsl:stylesheet>
