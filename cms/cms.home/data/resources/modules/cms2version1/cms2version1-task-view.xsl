<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    exclude-result-prefixes="#all"
    version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:portal="http://www.enonic.com/cms/xslt/portal">

  <xsl:import href="cms2version1-library.xsl"/>

  <xsl:template match="task" mode="full-view">
    <hr/>
    <a href="{portal:createPageUrl( ( 'taskId', id ) )}">
      <xsl:value-of select="title"/>
    </a>
    <br/>
    Project:
    <xsl:value-of select="project"/>
    <br/>
    Type:
    <xsl:value-of select="type"/>
    <br/>
    Sub-system:
    <xsl:value-of select="sub-system"/>
    <br/>
    Task:
    <xsl:value-of select="v1-task/id"/>
    <br/>
    Version:
    <xsl:value-of select="version"/>
    <br/>
    Assigned to:
    <xsl:value-of select="assigned-to"/>
    <br/>

  </xsl:template>


</xsl:stylesheet>
