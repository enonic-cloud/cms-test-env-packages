<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns="http://www.w3.org/1999/xhtml"
                xmlns:util="enonic:utilities" xmlns:portal="http://www.enonic.com/cms/xslt/portal"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:import href="/libraries/utilities/standard-variables.xsl"/>
    <xsl:import href="/libraries/utilities/utilities.xsl"/>

    <xsl:template match="content[@contenttype = 'event']">
        <xsl:variable name="start-date" select="contentdata/start-date"/>
        <xsl:variable name="start-time" select="contentdata/start-time"/>
        <xsl:variable name="end-date" select="contentdata/end-date"/>
        <xsl:variable name="end-time" select="contentdata/end-time"/>
        <xsl:variable name="url" select="portal:createContentUrl(@key)"/>
        <div>
            <a href="{$url}" title="{title}" class="date">
                <span class="day">
                    <xsl:value-of select="day-from-date(xs:date($start-date))"/>
                </span>
                <span class="month">
                    <xsl:value-of select="format-date(xs:date($start-date), '[MN,*-3]', $language, (), ())"/>
                </span>
            </a>
            <h2>
                <a href="{$url}">
                    <xsl:value-of select="contentdata/heading"/>
                </a>
            </h2>
            <p>
                <strong>
                    <xsl:value-of select="concat(portal:localize('When'), ': ')"/>
                </strong>
                <xsl:variable name="date">
                    <xsl:value-of select="$start-date"/>
                    <xsl:if test="$start-time != ''">
                        <xsl:value-of select="concat(' ', $start-time)"/>
                    </xsl:if>
                </xsl:variable>
                <xsl:value-of select="util:format-date($date, $language, (), true())"/>
                <xsl:if test="$end-date &gt; $start-date or $end-time != ''">
                    <xsl:text> -</xsl:text>
                    <xsl:if test="$end-date &gt; $start-date">
                        <xsl:value-of select="concat(' ', util:format-date($end-date, $language, (), ()))"/>
                    </xsl:if>
                    <xsl:if test="$end-time != ''">
                        <xsl:value-of select="concat(' ', util:format-time($end-time, $language))"/>
                    </xsl:if>
                </xsl:if>
                <xsl:if test="contentdata/location != ''">
                    <strong>
                        <xsl:value-of select="concat(' ', portal:localize('Where'), ': ')"/>
                    </strong>
                    <xsl:value-of select="contentdata/location"/>
                </xsl:if>
            </p>
            <div class="quiet">
                <xsl:value-of select="$url"/>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
