<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet exclude-result-prefixes="saxon xs portal" version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:portal="http://www.enonic.com/cms/xslt/portal" xmlns:saxon="http://icl.com/saxon" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- If you have any global javascript, put it here -->
  <xsl:template name="javascript">
    <script src="{portal:createResourceUrl('/_public/packages/commons/scripts/standard.js')}" type="text/javascript"><xsl:comment>//</xsl:comment></script>
    <script src="{portal:createResourceUrl('/_public/packages/commons/scripts/jquery-1.2.2.js')}" type="text/javascript"><xsl:comment>//</xsl:comment></script>
  </xsl:template>

  <!-- Prints the dynamically defined cascading stylesheet
  <xsl:template name="css">
    <link href="{portal:createResourceUrl(/verticaldata/context/framework/styles/style/@path)}" media="screen" rel="stylesheet" type="text/css"/>
  </xsl:template -->

  <!-- Prints the css link tag -->
  <xsl:template name="css">
    <link href="{portal:createResourceUrl('/_public/packages/site/screen.css')}" media="screen" rel="stylesheet" type="text/css"/>
  </xsl:template>

  <!-- dynamic header <title>-tag. Should be like this: content - menuitem(s) - site -->
  <xsl:template name="title">
    <title>
      <xsl:choose>
        <xsl:when test="$currentPageId = $firstPageKey">
          <xsl:choose>
            <xsl:when test="/verticaldata/menuitems/menuitem[@path = 'true']/heading !=''">
              <xsl:value-of select="concat(/verticaldata/menuitems/menuitem[0]/heading, ' - ', $siteName)"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="concat(/verticaldata/menuitems/menuitem[0]/name, ' - ', $siteName)"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:if test="$content">
            <xsl:value-of select="concat($content/title,' - ')"/>
          </xsl:if>
          <xsl:call-template name="pageTitle">
            <xsl:with-param name="currentMenuitem" select="/verticaldata/menuitems/menuitem[@path = 'true']"/>
          </xsl:call-template>
          <xsl:value-of select="$siteName"/>
        </xsl:otherwise>
      </xsl:choose>
    </title>
  </xsl:template>

  <!-- Help function, used in "title", recursive -->
  <xsl:template name="pageTitle">
    <xsl:param name="currentMenuitem"/>
    <xsl:if test="$currentMenuitem/@visible != 'no'">
      <xsl:value-of select="concat($currentMenuitem/name, ' - ')"/>
    </xsl:if>
    <xsl:if test="$currentMenuitem/menuitems/menuitem">
      <xsl:call-template name="pageTitle">
        <xsl:with-param name="currentMenuitem" select="$currentMenuitem/menuitems/menuitem[@path = 'true']"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <!-- navigationpath or breadcrumbs -->
  <xsl:template name="navigationPath">
    <xsl:param name="currentItem"/>
    <xsl:if test="$currentItem or $pagetitle != '' or $content or $currentItem/@key != $firstPageKey">
      <xsl:text> » </xsl:text>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="$currentItem/@visible != 'no'">
        <a href="{portal:createPageUrl($currentItem/@key, ())}">
          <xsl:value-of select="$currentItem/name"/>
        </a>
        <xsl:call-template name="navigationPath">
          <xsl:with-param name="currentItem" select="$currentItem/menuitems/menuitem[@path = 'true']"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="$pagetitle != ''">
            <xsl:value-of select="$pagetitle"/>
          </xsl:when>
          <xsl:when test="$content">
            <xsl:value-of select="$content/title"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:if test="$currentItem/@key != $firstPageKey">
              <xsl:value-of select="$currentItem/name"/>
            </xsl:if>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- A page should always have ONE <h1>-tag. This template makes sure of that. If there exists any content, it prints the content title.
       If not, the current menuitems subtitle or title is displayed -->
  <xsl:template name="heading">
    <xsl:if test="not($heading = 'false') and not(/verticaldata/context/querystring/parameter[@name = 'key'] != '')">
      <h1>
        <xsl:choose>
          <xsl:when test="$heading = 'contentTitle' and $content">
            <xsl:value-of select="$content/title"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:choose>
              <xsl:when test="$menuitem/subtitle != ''">
                <xsl:value-of select="$menuitem/subtitle"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$menuitem/name"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>
      </h1>
    </xsl:if>
  </xsl:template>

  <xsl:template name="breadcrumbs">
    <div id="breadcrumbs">
      <div>
        <span>You are here:</span>
        <xsl:text> </xsl:text>
        <xsl:choose>
          <xsl:when test="/verticaldata/menuitems/menuitem[@key = $firstPageKey]/menuitems/menuitem">
            <xsl:call-template name="navigationPath">
              <xsl:with-param name="currentItem" select="/verticaldata/menuitems[0]/menuitem"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="$currentPageId != $firstPageKey">
            <a href="{portal:createPageUrl($firstPageKey, ())}">
              <xsl:value-of select="/verticaldata/menus/menu/name"/>
            </a>
            <xsl:call-template name="navigationPath">
              <xsl:with-param name="currentItem" select="/verticaldata/menuitems[0]/menuitem[@path = 'true']"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="/verticaldata/menus/menu/name"/>
          </xsl:otherwise>
        </xsl:choose>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="topmenu">
    <xsl:comment>stopindex</xsl:comment>
    <ul class="menu horizontal">
      <xsl:attribute name="style">
        <xsl:value-of select="concat('width: ', $horizontalMenuFullWidth, 'px;')"/>
      </xsl:attribute>
      <xsl:apply-templates select="/verticaldata/menus/menu/menuitems"/>
    </ul>
    <xsl:comment>startindex</xsl:comment>
  </xsl:template>

  <xsl:template match="menuitems">
    <xsl:variable name="numberOfMenuitems">
      <xsl:value-of select="count(menuitem)"/>
    </xsl:variable>
    <xsl:variable name="tempWidthPerMenuitem" select="floor($horizontalMenuFullWidth div $numberOfMenuitems)"/>
    <xsl:variable name="rest" select="$horizontalMenuFullWidth - ($numberOfMenuitems * $tempWidthPerMenuitem)"/>
    <xsl:apply-templates select="menuitem" mode="topmenu">
      <xsl:with-param name="tempWidthPerMenuitem" select="$tempWidthPerMenuitem"/>
      <xsl:with-param name="rest" select="$rest"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="menuitem" mode="topmenu">
    <xsl:param name="tempWidthPerMenuitem"/>
    <xsl:param name="rest"/>
    <xsl:variable name="href">
      <xsl:choose>
        <xsl:when test="@type = 'url'">
          <xsl:value-of select="url"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="portal:createPageUrl(@key, ())"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="width">
      <xsl:choose>
        <xsl:when test="position() &lt;= $rest">
          <xsl:value-of select="$tempWidthPerMenuitem + 1"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$tempWidthPerMenuitem"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <li>
      <xsl:attribute name="style">
        <xsl:value-of select="concat('width: ', $width, 'px;')"/>
      </xsl:attribute>
      <xsl:if test="position() = 1">
        <xsl:attribute name="class"><xsl:text>first</xsl:text></xsl:attribute>
      </xsl:if>
      <xsl:if test="@path = 'true'">
        <xsl:attribute name="class">
          <xsl:text>path</xsl:text>
          <xsl:if test="position() = 1">
            <xsl:text> first</xsl:text>
          </xsl:if>
        </xsl:attribute>
      </xsl:if>
      <a href="{$href}">
        <xsl:if test="@active = 'true'">
          <xsl:attribute name="class">active</xsl:attribute>
        </xsl:if>
        <xsl:value-of select="name"/>
      </a>
    </li>
  </xsl:template>

  <xsl:template name="submenu">
    <xsl:variable name="activeTopMenuitem" select="/verticaldata/menuitems/menuitem[@path = 'true']"/>
    <xsl:comment>stopindex</xsl:comment>
    <h4><xsl:value-of select="$activeTopMenuitem/name"/></h4>
    <ul class="menu vertical">
      <xsl:apply-templates select="/verticaldata/menuitems/menuitem/menuitems/menuitem" mode="submenu"/>
    </ul>
    <xsl:comment>startindex</xsl:comment>
  </xsl:template>

  <xsl:template match="menuitem" mode="submenu">
    <xsl:variable name="href">
      <xsl:choose>
        <xsl:when test="@type = 'url'">
          <xsl:value-of select="url"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="portal:createPageUrl(@key, ())"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <li>
      <xsl:if test="@path = 'true'">
        <xsl:attribute name="class">
          <xsl:text>path</xsl:text>
        </xsl:attribute>
      </xsl:if>
      <a href="{$href}">
        <xsl:if test="@active = 'true'">
          <xsl:attribute name="class">active</xsl:attribute>
        </xsl:if>
        <xsl:value-of select="name"/>
      </a>
    </li>
  </xsl:template>

</xsl:stylesheet>
