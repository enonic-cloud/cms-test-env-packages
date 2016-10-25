<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    exclude-result-prefixes="xs portal"
    version="2.0" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:portal="http://www.enonic.com/cms/xslt/portal"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output
      indent="yes"
      media-type="text/html"
      method="xml"
      omit-xml-declaration="yes"/>
      
  <xsl:param name="title"/>

  <xsl:template match="/">
    
    <h2><xsl:value-of select="$title"/></h2>
    <xsl:choose>
    	<xsl:when test="result/context/resource/@type = 'content'">
    		<p>
    			Requested content: <xsl:value-of select="result/context/resource/display-name"/>
	    	</p>
    	</xsl:when>
    	<xsl:otherwise>
    		<p>
    			Requested menu-item: <xsl:value-of select="result/context/resource/display-name"/>
	    	</p>
    	</xsl:otherwise>
    </xsl:choose>
    
    
    <h3>get-content</h3>
    <xsl:if test="result/get-content/contents/content">  	
    <ul>    
    <xsl:for-each select="result/get-content/contents/content">
    	<xsl:call-template name="content">
	    	<xsl:with-param name="relatedcontents" select="parent::node()/relatedcontents"/>
		</xsl:call-template>
    </xsl:for-each>
    </ul>
    </xsl:if>

    <h3>get-related-content (children)</h3>
    <xsl:if test="result/get-related-content-children/contents/content">  	
    <ul>    
    <xsl:for-each select="result/get-related-content-children/contents/content">
    	<xsl:call-template name="content">
	    	<xsl:with-param name="relatedcontents" select="parent::node()/relatedcontents"/>
		</xsl:call-template>
    </xsl:for-each>
    </ul>
    </xsl:if>     
    
    <h3>get-related-content (parents)</h3>
    <xsl:if test="result/get-related-content-parents/contents/content">  	
    <ul>    
    <xsl:for-each select="result/get-related-content-parents/contents/content">
    	<xsl:call-template name="content">
	    	<xsl:with-param name="relatedcontents" select="parent::node()/relatedcontents"/>
		</xsl:call-template>
    </xsl:for-each>
    </ul>
    </xsl:if>     
    
    <h3>get-content-by-category</h3>
    <xsl:if test="result/get-content-by-category/contents/content">
    <ul>
    <xsl:for-each select="result/get-content-by-category/contents/content">
    	<xsl:call-template name="content">
	 	    <xsl:with-param name="relatedcontents" select="parent::node()/relatedcontents"/>
 	    </xsl:call-template>
    </xsl:for-each>
    </ul>
    </xsl:if>
    
    
    <h3>get-content-by-section</h3>
    <xsl:if test="result/get-content-by-section/contents/content">
    <ul>
    <xsl:for-each select="result/get-content-by-section/contents/content">
    	<xsl:call-template name="content">
	   	    <xsl:with-param name="relatedcontents" select="parent::node()/relatedcontents"/>
   	    </xsl:call-template>
    </xsl:for-each>
    </ul>
    </xsl:if>
    
    <h3>get-content-by-query</h3>
    <xsl:if test="result/get-content-by-query/contents/content">
    <ul>
    <xsl:for-each select="result/get-content-by-query/contents/content">
    	<xsl:call-template name="content">
   		    <xsl:with-param name="relatedcontents" select="parent::node()/relatedcontents"/>
	    </xsl:call-template>
    </xsl:for-each>
    </ul>
    </xsl:if>

  </xsl:template>

  <xsl:template name="content">
  	<xsl:param name="relatedcontents"/>

  	<li>
      <strong><a href="{portal:createContentUrl( @key )}"><xsl:value-of select="@key"/>: <xsl:value-of select="title"/> (status = <xsl:value-of select="@status"/>)</a></strong>
      <xsl:if test="contentdata/relatedimage/@key">
      	<a href="{portal:createImageUrl( contentdata/relatedimage/@key, 'scalesquare(15)' )}">[<img src="{portal:createImageUrl( contentdata/relatedimage/@key, 'scalesquare(15)' )}"/>]</a>
      </xsl:if>
      <xsl:if test="contentdata/relatedfile/file/@key">
      	<a href="{portal:createAttachmentUrl( contentdata/relatedfile/file/@key, 'scalesquare(15)' )}">[file]</a>
      </xsl:if>
      <br/>      
      <xsl:for-each select="relatedcontentkeys/relatedcontentkey[ @level = 1 ]">
		<xsl:variable name="key" select="@key"/>
	    <xsl:apply-templates select="$relatedcontents/content[ @key =  $key ]" mode="related-child">
	    	<xsl:with-param name="relatedcontents" select="$relatedcontents"/>
	    	<xsl:with-param name="level" select="1"/>	    	
	    </xsl:apply-templates>
      </xsl:for-each>
      <xsl:for-each select="relatedcontentkeys/relatedcontentkey[ @level = -1 ]">
		<xsl:variable name="key" select="@key"/>
	    <xsl:apply-templates select="$relatedcontents/content[ @key =  $key ]" mode="related-parent">
	    	<xsl:with-param name="relatedcontents" select="$relatedcontents"/>
	    	<xsl:with-param name="level" select="-1"/>	 
	    </xsl:apply-templates>
      </xsl:for-each>
    </li>
   
  </xsl:template>
   
  <xsl:template match="content" mode="related-child">
	<xsl:param name="relatedcontents"/>
	<xsl:param name="level"/>
	child: <a href="{portal:createContentUrl( @key )}"><xsl:value-of select="@key"/>: <xsl:value-of select="title"/> (status = <xsl:value-of select="@status"/>, level=<xsl:value-of select="$level"/>)</a><br/>
	
	
	<xsl:for-each select="relatedcontentkeys/relatedcontentkey[ @level = 1 ]">
		<xsl:variable name="key" select="@key"/>
	    <xsl:apply-templates select="$relatedcontents/content[ @key =  $key ]" mode="related-child">
	    	<xsl:with-param name="relatedcontents" select="$relatedcontents"/>
	    	<xsl:with-param name="level" select="$level + 1"/>
	    </xsl:apply-templates>
    </xsl:for-each>

  </xsl:template>
  
  <xsl:template match="content" mode="related-parent">
	<xsl:param name="level"/>
	<xsl:param name="relatedcontents"/>
	parent: <a href="{portal:createContentUrl( @key )}"><xsl:value-of select="@key"/>: <xsl:value-of select="title"/> (status = <xsl:value-of select="@status"/>, level=<xsl:value-of select="$level"/>)</a><br/>
	
	<xsl:for-each select="relatedcontentkeys/relatedcontentkey[ @level = -1 ]">
		<xsl:variable name="key" select="@key"/>
	    <xsl:apply-templates select="$relatedcontents/content[ @key =  $key ]" mode="related-parent">
	    	<xsl:with-param name="relatedcontents" select="$relatedcontents"/>
	    	<xsl:with-param name="level" select="$level - 1"/>	 
	    </xsl:apply-templates>
      </xsl:for-each>
    
  </xsl:template>


</xsl:stylesheet>
