<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet exclude-result-prefixes="xs portal" version="2.0"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:portal="http://www.enonic.com/cms/xslt/portal"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="no" media-type="text" method="text" omit-xml-declaration="yes"/>
  <xsl:variable name="iphone">iphone</xsl:variable>
  <xsl:variable name="android">adroid</xsl:variable>
  <xsl:variable name="operamini">opera mini</xsl:variable>
  <xsl:variable name="blackberry">blackberry</xsl:variable>
  <xsl:variable name="palm">palm os|palm|hiptop|avantgo|plucker|xiino|blazer|elaine</xsl:variable>
  <xsl:variable name="windowsmobile">windows ce; ppc;|windows ce; smartphone;|windows ce; iemobile</xsl:variable>
  <xsl:variable name="generichandheld">up.browser|up.link|mmp|symbian|smartphone|</xsl:variable>
  <xsl:variable name="generichandheld2">midp|wap|vodafone|o2|pocket|kindle|mobile|pda|psp|treo</xsl:variable>
  <xsl:template match="/">
    <xsl:variable name="userAgent" select="lower-case(/context/request/user-agent)"/>
    <xsl:choose>
      <xsl:when test='matches($userAgent, $iphone)'>
        iphone
      </xsl:when>
      <xsl:when test='matches($userAgent, $android)'>
        android
      </xsl:when>
      <xsl:when test='matches($userAgent, $operamini)'>
        operamini
      </xsl:when>
      <xsl:when test='matches($userAgent, $blackberry)'>
        blackberry
      </xsl:when>
      <xsl:when test='matches($userAgent, $palm)'>
        palm
      </xsl:when>
      <xsl:when test='matches($userAgent, $windowsmobile)'>
        windowsmobile
      </xsl:when>
      <xsl:when test='matches($userAgent, concat($generichandheld,$generichandheld2))'>
        generichandheld
      </xsl:when>
      <xsl:otherwise>
        screen
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>