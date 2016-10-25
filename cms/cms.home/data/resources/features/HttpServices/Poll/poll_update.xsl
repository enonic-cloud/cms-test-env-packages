<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="xs portal" version="2.0"
      xmlns="http://www.w3.org/1999/xhtml" xmlns:portal="http://www.enonic.com/cms/xslt/portal"
      xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>
      
      
      <xsl:template match="/">      
            
            <xsl:call-template name="displayError"/>
            
            <xsl:call-template name="singleValuePoll"/>
            <xsl:call-template name="multiValuePoll"/>
            
      </xsl:template>
      
      <xsl:template name="multiValuePoll">
            
            <xsl:variable name="content" select="/result/contents/content[2]"/>            
            <xsl:variable name="redirectKey" select="/result/context/querystring/parameter[@name='id']"/>
            <xsl:variable name="redirect" select="portal:createPageUrl($redirectKey, ())"/>
            
            
            <p>
                  
                  <form action="{portal:createServicesUrl('poll','update', $redirect, ())}" id="formSet" method="post"
                        enctype="multipart/form-data">
                        
                        <fieldset>
                              <legend>Poll with multiple</legend>
                              
                              <input type="hidden" value="{$content/@key}" name="key" id="key"/>
                              
                              <label>Title</label> <xsl:value-of select="$content/contentdata/title"/>
                              
                              <xsl:for-each select="$content/contentdata/alternatives/alternative">
                                    <label for="poll{./@id}"><xsl:value-of select="."/></label>
                                    <input type="checkbox" name="poll{./@id}" value="{./@id}"/><br/>                                           
                              </xsl:for-each>    
                              
                              <p class="clear">
                                    <input type="submit" value="Update poll"/>
                              </p>
                              
                        </fieldset>
                  </form>
            </p>
            
            
            <p>
                  <xsl:call-template name="summary">
                        <xsl:with-param name="content" select="$content"/>
                  </xsl:call-template>
            </p>
      </xsl:template>
      
      <xsl:template name="summary">
            <xsl:param name="content"/>
            <h3>Summary of poll</h3>
            <table class="httpservices">
                  <tr>
                        <th>Number of voters/votes</th>
                        <th><xsl:value-of select="$content/contentdata/alternatives/@count"/></th>
                  </tr>
                  <tr>
                        <th>Option</th>
                        <th>Count</th>
                  </tr>                              
                  <xsl:for-each select="$content/contentdata/alternatives/alternative">
                        <tr>
                              <th><xsl:value-of select="."/></th>
                              <th><xsl:value-of select="./@count"/></th>
                        </tr>
                  </xsl:for-each>                                                
            </table>
      </xsl:template>
   
      <xsl:template name="displayError">
            
            <xsl:if test="/result/context/querystring/parameter[@name = 'error_poll_update']">
                  
                  <xsl:variable name="errorCode"
                        select="/result/context/querystring/parameter[@name = 'error_poll_update']"/>
                  
                  <p class="formError"> An error occured: <xsl:value-of select="$errorCode"/>
                        <xsl:text> - </xsl:text>
                        <xsl:choose>
                              <xsl:when test="$errorCode='100'">Unknown poll selection</xsl:when>
                        </xsl:choose>
                  </p>
                  
            </xsl:if>
            
            <xsl:if test="/result/context/querystring/parameter[@name = 'status']">
                  
                  <xsl:variable name="status"
                        select="/result/context/querystring/parameter[@name = 'status']"/>
                  
                  <p class="formError"> 
                        An error occured: <xsl:value-of select="$status"/>
                  </p>
                  
            </xsl:if>
            
      </xsl:template>
      
      
      <xsl:template name="singleValuePoll">
            
            <xsl:variable name="content" select="/result/contents/content[1]"/>
            <xsl:variable name="redirectKey" select="/result/context/querystring/parameter[@name='id']"/>
            <xsl:variable name="redirect" select="portal:createPageUrl($redirectKey, ())"/>
            
            
            <link href="{portal:createResourceUrl('/_public/features/features.css')}" media="screen"
                  rel="stylesheet" type="text/css"/>
            
            <p>
                  
                  <form action="{portal:createServicesUrl('poll','update', $redirect, ())}" id="formSet" method="post"
                        enctype="multipart/form-data">
                        
                        <fieldset>
                              <legend>Poll</legend>
                              <input type="hidden" value="{$content/@key}" name="key" id="key"/>
                              <label>Title</label> <xsl:value-of select="$content/contentdata/title"/>
                              
                              <p>
                                    <select name="choice">
                                          <xsl:for-each select="$content/contentdata/alternatives/alternative">
                                                <option value="{./@id}"><xsl:value-of select="."/></option>
                                          </xsl:for-each>
                                          <option value="100">Unknown poll selection</option>
                                    </select>
                              </p>
                              
                              <p class="clear">
                                    <input type="submit" value="Update poll"/>
                              </p>
                              
                        </fieldset>
                  </form>
            </p>
            
            
            <p>
                  <xsl:call-template name="summary">
                        <xsl:with-param name="content" select="$content"/>
                  </xsl:call-template>
            </p>
      </xsl:template>
      
</xsl:stylesheet>
