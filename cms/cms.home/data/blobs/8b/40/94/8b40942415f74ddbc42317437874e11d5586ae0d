<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
   version="2.0" 
   exclude-result-prefixes="xs" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"   
   xmlns:xs="http://www.w3.org/2001/XMLSchema">
   
    <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>

    <xsl:include href="/libraries/utilities/process-html-area.xsl"/>

    <xsl:param name="showRelatedArticle">
        <type>page</type>
    </xsl:param>
    <xsl:param name="imageMaxWith" select="310"/>
    <xsl:param name="filters" select="'rounded(10)'" as="xs:string"/>

    <xsl:template match="/">

        <xsl:if test="/result/contents/content">
            <div id="article">
                <xsl:apply-templates select="/result/contents/content"/>
            </div>
        </xsl:if>
    </xsl:template>

    <xsl:template match="content">
        <h1>
            <xsl:value-of select="title"/>
        </h1>

        <xsl:variable name="columnWidth">
            <xsl:choose>
                <xsl:when test="/result/context/device-class = 'mobile'">296</xsl:when>
                <xsl:otherwise>690</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <h4>Column width: <xsl:value-of select="$columnWidth"/></h4>
        <h4>Applied filters: <xsl:value-of select="$filters"/></h4>
        <!--xsl:if test="/result/contents/relatedcontents/content[@key = current()/contentdata/htmldocument/images/image/@key]">
            <div class="images">
                <xsl:for-each
                    select="contentdata/htmldocument/images/image[@key = /result/contents/relatedcontents/content/@key]">
                    <xsl:variable name="currentImage"
                        select="/result/contents/relatedcontents/content[@key = current()/@key]"/>
                    <div class="image">
                        <xsl:call-template name="displayImage">
                            <xsl:with-param name="image" select="$currentImage"/>
                            <xsl:with-param name="imageMaxWidth" select="$imageMaxWith"/>
                        </xsl:call-template>
                        <xsl:if test="text != ''">
                            <div class="text">
                                <xsl:value-of select="text"/>
                            </div>
                        </xsl:if>
                    </div>
                </xsl:for-each>
            </div>
        </xsl:if-->
        <xsl:if test="contentdata/text/*|contentdata/text/text()">
            <div class="editor">
                <xsl:call-template name="process-html-area.process-html-area">
                    <xsl:with-param name="document" select="contentdata/text"/>
                    <xsl:with-param name="region-width" tunnel="yes" select="$columnWidth"/>
                    <xsl:with-param name="filter" select="$filters"/>
                </xsl:call-template>
            </div>
        </xsl:if>
    </xsl:template>


</xsl:stylesheet>
