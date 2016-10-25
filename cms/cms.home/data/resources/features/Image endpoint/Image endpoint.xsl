<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet exclude-result-prefixes="xs portal" version="2.0" xmlns="http://www.w3.org/1999/xhtml"
                xmlns:portal="http://www.enonic.com/cms/xslt/portal" xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>


  <xsl:template match="/">

    <xsl:variable name="filter">
      <xsl:choose>
        <xsl:when test="/result/context/querystring/parameter[@name = 'filter']">
          <xsl:value-of select="/result/context/querystring/parameter[@name = 'filter']"/>
        </xsl:when>
        <xsl:otherwise>scalewide(250,100)</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="background">
      <xsl:choose>
        <xsl:when test="/result/context/querystring/parameter[@name = 'background']">
          <xsl:value-of select="/result/context/querystring/parameter[@name = 'background']"/>
        </xsl:when>
        <xsl:otherwise>FFFFFF</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>


    <xsl:variable name="quality">
      <xsl:choose>
        <xsl:when test="/result/context/querystring/parameter[@name = 'quality']">
          <xsl:value-of select="/result/context/querystring/parameter[@name = 'quality']"/>
        </xsl:when>
        <xsl:otherwise>85</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <fieldset>
      <legend>Change image filters, etc.</legend>
    <form action="{portal:createPageUrl(())}" method="GET">

      <label>filter:</label>
      <input type="text" name="filter" value="{$filter}" size="67"/>

      <label>background (using this color to also paint the container of the images):</label>
      <input type="text" name="background" value="{$background}"/>

      <label>format (overrides default for file):</label>
      <input type="text" name="format" value=""/>

      <label>quality:</label>
      <input type="text" name="quality" value="{$quality}"/>

      <input type="submit" class="button clear" value="Apply"/>
    </form>
    </fieldset>
    <div style="background-color: #{$background}">
      <xsl:for-each select="/result/contents/content">

        <xsl:variable name="format">
          <xsl:choose>
            <xsl:when test="/result/context/querystring/parameter[@name = 'format']">
              <xsl:value-of select="/result/context/querystring/parameter[@name = 'format']"/>
            </xsl:when>
            <xsl:otherwise>jpg</xsl:otherwise>
          </xsl:choose>
        </xsl:variable>

        <xsl:choose>
          <xsl:when
              test="string-length(@key) > 0 and string-length($filter) > 0 and string-length($background) > 0 and string-length($format) > 0 and string-length($quality) > 0">
            <img src="{portal:createImageUrl( @key, $filter, $background, $format, $quality )}" alt="Image {position()} loading..." title="Image {position()}"/>
          </xsl:when>
          <xsl:when
              test="string-length(@key) > 0 and string-length($filter) > 0 and string-length($background) > 0 and string-length($format) > 0">
            <img src="{portal:createImageUrl( @key, $filter, $background, $format )}" alt="Image {position()} loading..." title="Image {position()}"/>
          </xsl:when>
          <xsl:when test="string-length(@key) > 0 and string-length($filter) > 0 and string-length($background) > 0">
            <img src="{portal:createImageUrl( @key, $filter, $background )}" alt="Image {position()} loading..." title="Image {position()}"/>
          </xsl:when>
          <xsl:when test="string-length(@key) > 0 and string-length($filter) > 0">
            <img src="{portal:createImageUrl( @key, $filter )}" alt="Image {position()} loading..." title="Image {position()}"/>
          </xsl:when>
          <xsl:otherwise>
            <img src="{portal:createImageUrl( @key, 'scalewide(250,100)' )}" alt="Image {position()} loading..." title="Image {position()}"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>

    </div>
  </xsl:template>


</xsl:stylesheet>
