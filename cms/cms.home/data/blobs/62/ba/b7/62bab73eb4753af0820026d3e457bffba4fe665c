<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet exclude-result-prefixes="rdf purl xs portal" version="2.0" xmlns="http://www.w3.org/1999/xhtml"
                xmlns:purl="http://purl.org/rss/1.0/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                xmlns:portal="http://www.enonic.com/cms/xslt/portal" xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="no" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>

    <xsl:include href="/libraries/commons/includes/utilities.xsl"/>
    <xsl:include href="/libraries/commons/includes/frame.xsl"/>

    <xsl:param name="include-frame" select="false()"/>

  <xsl:param name="show-channel-title" select="'true'"/>
  <xsl:param name="number-of-items" as="xs:integer" select="50"/>
  <xsl:param name="chars-in-description" as="xs:integer" select="200"/>
  <xsl:param name="show-logo" select="'false'"/>

  <xsl:param name="header-text" select="''"/>
  <xsl:template match="/">


    <xsl:choose>
        <xsl:when test="$include-frame">
            <xsl:call-template name="frame">
                <xsl:with-param name="content" select="$content"/>
                <xsl:with-param name="frame-heading" select="$frame-heading"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
            <xsl:copy-of select="$content"/>
        </xsl:otherwise>
    </xsl:choose>

    <xsl:apply-templates select="/result/rdf:RDF | /result/rss/channel | /rss/channel"/>

  </xsl:template>

  <xsl:template match="channel">
    <xsl:if test="$show-channel-title != 'false'">
      <xsl:if test="$show-logo != 'false'">
        <xsl:if test="image/url != ''">
          <xsl:choose>
            <xsl:when test="image/link != ''">
              <a href="{image/link}" rel="external" style="display:block">
                <img src="{image/url}" alt="{image/title}"/>
              </a>
            </xsl:when>
            <xsl:otherwise>
              <img src="{image/url}" alt="{image/title}"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
      </xsl:if>
      <h5>
        <xsl:choose>
          <xsl:when test="link != ''">
            <a href="{link}" rel="external" style="display:block" title="{title}">
              <xsl:value-of select="title"/>
            </a>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="title"/>
          </xsl:otherwise>
        </xsl:choose>
      </h5>
      <xsl:if test="description !=''">
        <p>
          <xsl:value-of select="substring(description,1,$chars-in-description)"/>
        </p>
      </xsl:if>
    </xsl:if>
    <ul>
      <xsl:apply-templates select="item[position() &lt;= $number-of-items]"/>
    </ul>
  </xsl:template>

  <xsl:template match="rdf:RDF">
    <xsl:if test="$show-channel-title != 'false'">
      <xsl:if test="$show-logo != 'false'">
        <xsl:if test="purl:image/purl:url != ''">
          <xsl:choose>
            <xsl:when test="purl:image/purl:link != ''">
              <a href="{purl:image/purl:link}" rel="external" style="display:block">
                <img src="{purl:image/purl:url}" alt="{purl:image/purl:title}"/>
              </a>
            </xsl:when>
            <xsl:otherwise>
              <img src="{purl:image/purl:url}" alt="{purl:image/purl:title}"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
      </xsl:if>
      <h5>
        <xsl:choose>
          <xsl:when test="purl:channel/purl:link != ''">
            <a href="{purl:channel/purl:link}" rel="external" style="display:block" title="{purl:channel/purl:title}">
              <xsl:value-of select="purl:channel/purl:title"/>
            </a>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="purl:channel/purl:title"/>
          </xsl:otherwise>
        </xsl:choose>
      </h5>
      <xsl:if test="purl:channel/purl:description !=''">
        <p>
          <xsl:value-of select="substring(purl:channel/purl:description,1,$chars-in-description)"/>
        </p>
      </xsl:if>
    </xsl:if>
    <ul>
      <xsl:apply-templates select="purl:item[position() &lt;= $number-of-items]"/>
    </ul>
  </xsl:template>

  <xsl:template match="purl:item | item">
    <li>
      <a href="{purl:link | link}" rel="external" title="{purl:title | title}">
        <xsl:value-of select="purl:title | title"/>
      </a>
      <xsl:if test="purl:description">
        <br/>
        <xsl:value-of select="substring(purl:description | description, 1, $chars-in-description)"
                      disable-output-escaping="yes"/>
        ...
      </xsl:if>
    </li>
  </xsl:template>
</xsl:stylesheet>