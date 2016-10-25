<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet exclude-result-prefixes="xs portal" version="2.0"
   xmlns="http://www.w3.org/1999/xhtml" xmlns:portal="http://www.enonic.com/cms/xslt/portal"
   xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

   <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>

   <xsl:param name="title" as="xs:string"/>

   <xsl:template match="/">
      <link href="{portal:createResourceUrl('/_public/features/features.css')}" media="screen"
         rel="stylesheet" type="text/css"/>
      <script src="{portal:createResourceUrl('/_public/features/scripts/contentOperations.js', ())}" type="text/javascript"><xsl:comment>//</xsl:comment></script>
      
      
      <h1>
         <xsl:value-of select="$title"/>
      </h1>
      
      <div id="fullXML" style="display: none">
         <a href="javascript:hidediv('fullXML')">hide xml</a>
         
         <p>
            <textarea>
               <xsl:copy-of select="/result"/>
            </textarea>
         </p>
      </div>
      <a href="javascript:showdiv('fullXML')">show xml</a>
      
      Default run-as-user on site is:
      <xsl:choose>
         <xsl:when test="/result/context/site/default-run-as-user/user">
            <xsl:value-of select="/result/context/site/default-run-as-user/user/displayName"/>    
         </xsl:when>
         <xsl:otherwise>
            Not set.
         </xsl:otherwise>
      </xsl:choose>
      
      <br/>
      <br/>
      Running portlet window as: <xsl:value-of select="/result/context/user/@qualified-name"/>
      <br/>
      <br/>
      
   </xsl:template>


</xsl:stylesheet>
