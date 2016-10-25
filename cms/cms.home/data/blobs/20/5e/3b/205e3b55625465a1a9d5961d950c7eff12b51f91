<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:portal="http://www.enonic.com/cms/xslt/portal"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  exclude-result-prefixes="xs portal" version="2.0">
  
  <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>
  
  <xsl:include href="/features/includes/displayContext.xsl"/>
  
  <xsl:template match="/">
    <h2>
      getLocale-result:
    </h2> 
    <p>    <xsl:value-of select="/result/context/locale"/> </p>
    <h2>localize:</h2>
    <p>
      
      <ul>
        <li><b>localize('You-are-here'): </b><xsl:value-of select="portal:localize('You-are-here')"/></li>
        <li><b>localize('You-are-here', (), 'no'): </b><xsl:value-of select="portal:localize('You-are-here', (), 'no')"/></li>
        <li><b>localize('You-are-here', (), 'en'): </b><xsl:value-of select="portal:localize('You-are-here', (), 'en')"/></li>
        <li><b>localize('You-are-here', (), 'no_NO'): </b><xsl:value-of select="portal:localize('You-are-here', (), 'no_NO')"/></li>
        <li><b>localize('You-are-here', (), 'no_NO_nn'): </b><xsl:value-of select="portal:localize('You-are-here', (), 'no_NO_nn')"/></li>
        <li><b>localize('You-are-here', (), 'sz'): </b><xsl:value-of select="portal:localize('You-are-here', (), 'sz')"/></li>
        <li><b>localize('You-are-here', (), 'hurraforlsk''): </b><xsl:value-of select="portal:localize('You-are-here', (), 'hurraforlsk')"/></li>
        <li><b>localize('jquery-validate-rangelength', ('1','4')): </b><xsl:value-of select="portal:localize('jquery-validate-rangelength', ('1','4'))"/></li>
        <li><b>localize('jquery-validate-rangelength', ('1','4'), 'no'): </b><xsl:value-of select="portal:localize('jquery-validate-rangelength', ('1','4'), 'no')"/></li>
        <li><b>localize('jquery-validate-rangelength', ('1','4'), 'en'): </b><xsl:value-of select="portal:localize('jquery-validate-rangelength', ('1','4'), 'en')"/></li>
        
      </ul>
    </p>
    <fieldset>
      <legend>forceLocale:</legend>
      <form action="{portal:createServicesUrl('portal','forceLocale', ())}" id="form" method="post">
        
        <label for="lifetime">lifetime</label>
        <select id="lifetime" name="lifetime">
          <option value="permanent">permanent</option>
          <option value="session">session</option>
        </select>
        <br/>
        
        <label for="locale">locale:</label>
        <select id="locale" name="locale">
          <option value="en">en</option>
          <option value="en-us">en-us</option>
          <option value="nn">nn</option>
          <option value="no">no</option>
        </select>
        <br/>
        
        <input type="submit" class="button clear" value="Force locale"/>
      </form>
    </fieldset>
    <br/>
    <br/>
    <xsl:call-template name="displayContext">
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
