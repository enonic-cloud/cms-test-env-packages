<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns="http://www.w3.org/1999/xhtml" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:util="enonic:utilities" 
    xmlns:portal="http://www.enonic.com/cms/xslt/portal" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema">
    
    
    <!-- Returns language code, country code or variant code from locale ('en_GB', 'no_NO_nb') as xs:string. Language code is default. -->
    <xsl:function name="util:get-code-from-locale" as="xs:string">
        <xsl:param name="locale" as="xs:string"/>
        <xsl:param name="code" as="xs:string?"/>
        <xsl:choose>
            <xsl:when test="$code = 'country'">
                <xsl:value-of select="tokenize($locale, '_')[2]"/>
            </xsl:when>
            <xsl:when test="$code = 'variant'">
                <xsl:value-of select="tokenize($locale, '_')[3]"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="tokenize($locale, '_')[1]"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <xsl:decimal-format name="price-no" decimal-separator="," grouping-separator=" "/>
    <xsl:decimal-format name="price-en" decimal-separator="." grouping-separator=" "/>
    <xsl:function name="util:format-price" as="xs:string">
        <xsl:param name="price" as="xs:double"/>
        <xsl:param name="language" as="xs:string?"/>
        <xsl:variable name="localized-decimal-format">
            <xsl:text>price-</xsl:text>
            <xsl:choose>
                <xsl:when test="lower-case(util:get-code-from-locale($language, ())) = 'no'">no</xsl:when>
                <xsl:otherwise>en</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="localized-picture-string-with-decimals">
            <xsl:choose>
                <xsl:when test="lower-case(util:get-code-from-locale($language, ())) = 'no'"># ### ###,00</xsl:when>
                <xsl:otherwise># ### ###.00</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="localized-picture-string">
            <xsl:choose>
                <xsl:when test="lower-case(util:get-code-from-locale($language, ())) = 'no'"># ### ###</xsl:when>
                <xsl:otherwise># ### ###</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="decimals" as="xs:string?" select="tokenize(xs:string($price), '\.')[2]"/>
        <xsl:variable name="price" as="xs:string">
            <xsl:choose>
                <xsl:when test="$decimals castable as xs:integer and xs:integer($decimals) gt 0">
                    <xsl:value-of select="format-number($price, $localized-picture-string-with-decimals, $localized-decimal-format)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat(format-number($price, $localized-picture-string, $localized-decimal-format), ',-')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="$price"/>
    </xsl:function>
    
    
</xsl:stylesheet>