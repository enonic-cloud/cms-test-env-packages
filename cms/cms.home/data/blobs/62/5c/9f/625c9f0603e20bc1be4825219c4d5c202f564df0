<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="portal" version="2.0" xmlns:portal="http://www.enonic.com/cms/xslt/portal" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template name="portalFunctionsForNewsletter">
        
       <p>createUrl('/', () )<br/>
          <xsl:variable name="url" select="portal:createUrl('/', () )"/>
          <a href="{$url}" target="_blank">
            <xsl:value-of select="$url"/>
          </a>
        </p>
        
       <p>createPageUrl(57, ())<br/>
            <xsl:value-of select="portal:createPageUrl(57, ())"/>
        </p>
        
        <p>
            Test av createContentUrl <br/>
            <xsl:value-of select="portal:createContentUrl(39, ('param1', 'value1', 'param2', 'value2'))"/>
        </p>
        
        
        <p> Test av createServicesUrl <br/>
            <xsl:value-of select="portal:createServicesUrl('user', 'login', 'http://myredirecturl', ())"/>
        </p>
        
        <p>
            Test av createAttachmentUrl <br/>
            <xsl:value-of select="portal:createAttachmentUrl( 75 )"/>
            
        </p>
        
        <p> 
            Test av createImageUrl <br/>
            <img src="{portal:createImageUrl( 38 )}"/>
        </p>
        
        <p>
            Test av createResourceUrl <br/>
            <xsl:value-of select="portal:createResourceUrl('/_public/package/site/screen.css')"/>
        </p>
        
        <p>
            Test av createCaptchaImageUrl <br/>
            <xsl:value-of select="portal:createCaptchaImageUrl()"/>
        </p>
        
        <p>
            Test av createCaptchaFormInputName <br/>
            <xsl:value-of select="portal:createCaptchaFormInputName()"/>
        </p>
        
        <p>
            Test av createWindowUrl <br/>
            <xsl:value-of select="portal:createWindowUrl( )"/>
            
        </p>
        
        <p>
            Test av getInstanceKey <br/>
            <xsl:value-of select="portal:getInstanceKey()"/>
        </p>
        
        <p>
            Test av getPageKey <br/>
            <xsl:value-of select="portal:getPageKey()"/>
        </p>
        
        <p>
            Test av getLocale <br/>
            <xsl:value-of select="portal:getLocale()"/>
        </p>
        
        <p>
            Test av localize <br/>
            <xsl:value-of select="portal:localize('hello')"/> 
        </p>
        
        <p>
            Test av getWindowKey <br/>
            <xsl:value-of select="portal:getWindowKey()"/>
        </p>
        
        <p>
           Test av createWindowPlaceholder <br/>                             
           <xsl:value-of select="portal:createWindowPlaceholder( '157:60', () )"/>
        </p>
        
        <p>
            Test av isCaptchaEnabled <br/>
            <xsl:value-of select="portal:isCaptchaEnabled('content', 'create')"/>
        </p>
        
        <p>
            Test av isWindowInline <br/>
            <xsl:value-of select="portal:isWindowInline()"/>
        </p>      
        
    </xsl:template>
    
    
</xsl:stylesheet>