<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns="http://www.w3.org/1999/xhtml"
                xmlns:util="enonic:utilities" xmlns:portal="http://www.enonic.com/cms/xslt/portal"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <xsl:import href="/libraries/utilities/standard-variables.xsl"/>
    <xsl:import href="/libraries/utilities/utilities.xsl"/>

    <xsl:template match="content[@contenttype = 'Community-Blog']">
        <xsl:variable name="url" select="portal:createContentUrl(@key)"/>
        <div>
            <xsl:choose>
                <xsl:when test="$device-class = 'mobile'">
                    <xsl:call-template name="gsa.image">
                        <xsl:with-param name="size" select="'wide'"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="gsa.image">
                        <xsl:with-param name="size" select="'thumbnail'"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
            <h2>
                <a href="{$url}">
                    <xsl:value-of select="contentdata/heading"/>
                </a>
            </h2>
            <p>
                <span class="byline">
                    <xsl:value-of
                            select="util:format-date(@publishfrom, /result/context/@languagecode, 'short', true())"/>
                </span>
                <xsl:if test="contentdata/article/preface != ''">
                    <xsl:value-of
                            select="util:crop-text(contentdata/article/preface, xs:integer(floor($region-width * 0.5)))"/>
                </xsl:if>
            </p>
            <div class="quiet">
                <xsl:value-of select="$url"/>
            </div>
        </div>
    </xsl:template>

    <!-- TODO: remove -->
    <xsl:template name="gsa.image">
        <xsl:param name="size"/>
        <xsl:if test="/result/gsa-search/contents/relatedcontents/content[@key = current()/contentdata/teaser/image/@key]">
            <a href="{portal:createContentUrl(@key,())}" title="{title}">
                <xsl:call-template name="utilities.display-image">
                    <xsl:with-param name="region-width" select="$region-width"/>
                    <xsl:with-param name="filter" select="$config-filter"/>
                    <xsl:with-param name="imagesize" select="$config-imagesize"/>
                    <xsl:with-param name="image"
                                    select="/result/gsa-search/contents/relatedcontents/content[@key = current()/contentdata/teaser/image/@key]"/>
                    <xsl:with-param name="size" select="$size"/>
                </xsl:call-template>
            </a>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
