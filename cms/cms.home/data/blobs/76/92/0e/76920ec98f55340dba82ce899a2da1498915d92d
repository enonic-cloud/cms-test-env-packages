<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet exclude-result-prefixes="xs portal" 
   version="2.0" xmlns="http://www.w3.org/1999/xhtml" 
   xmlns:portal="http://www.enonic.com/cms/xslt/portal" 
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


   <xsl:template name="datasource-result">
       
      <xsl:variable name="path-to-codemirror" select="portal:createResourceUrl('/_public/features/codemirror/')" />
      
      <script type="text/javascript" src="{ concat( $path-to-codemirror, 'js/codemirror.js' )}">//</script>
      
      <p class="clear">
         datasource-result:<br/>
         <textarea style="width:600px; height: 600px" id="datasource-1">
            <xsl:copy-of select="/result/datasource-result"/>
         </textarea>
      </p>
      
      <script type="text/javascript">
         var codeMirror = CodeMirror.fromTextArea('datasource-1', {
         path: "<xsl:value-of select="$path-to-codemirror"/>js/",
         parserfile: ["parsexml.js"],
         reindentOnLoad: true,
         stylesheet: ["<xsl:value-of select="$path-to-codemirror"/>css/xmlcolors.css"],
         });
      </script>
      
   </xsl:template>


</xsl:stylesheet>
