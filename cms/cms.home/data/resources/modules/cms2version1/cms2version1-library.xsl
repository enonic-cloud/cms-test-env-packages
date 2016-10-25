<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    exclude-result-prefixes="#all"
    version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:portal="http://www.enonic.com/cms/xslt/portal">

  <xsl:template match="subsystem" mode="path-view">
    <xsl:param name="first" select="'false'"/>

    <xsl:if test="parent-id">
      <xsl:variable name="parent-id" select="parent-id"/>
      <xsl:apply-templates select="parent::*/subsystem[ id = $parent-id ]" mode="path-view"/>
    </xsl:if>

    <xsl:value-of select="name"/>
    <xsl:if test="$first = 'false'">
      /
    </xsl:if>

  </xsl:template>

  <xsl:template match="subsystem" mode="minimal-view">

    <xsl:variable name="path">
      <xsl:apply-templates select="current()" mode="path-view">
        <xsl:with-param name="first" select="'true'"/>
      </xsl:apply-templates>
    </xsl:variable>

    <xsl:value-of select="$path"/>

  </xsl:template>

  <xsl:template match="member" mode="minimal-view">

    <xsl:value-of select="nickname"/>

  </xsl:template>

</xsl:stylesheet>
