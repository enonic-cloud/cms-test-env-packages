<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:portal="http://www.enonic.com/cms/xslt/portal"
                xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xs portal" version="2.0">

  <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>

  <xsl:include href="/features/includes/displayContext.xsl"/>


  <xsl:template match="/">
    <p>
      Current locale:
      <xsl:value-of select="/result/context/locale"/>
    </p>
    <fieldset>
      <legend>Operation: forceLocale</legend>
      <form action="{portal:createServicesUrl('portal','forceLocale', ())}" id="form" method="post">

        <label for="lifetime">lifetime</label>
        <select id="lifetime" name="lifetime">
          <option value="permanent">permanent</option>
          <option value="session">session</option>
        </select>
        <br/>

        <label for="locale">locale:</label>
        <input type="text" id="locale" name="locale"/>
        <br/>

        <input type="submit" value="Force locale" class="button clear"/>
      </form>
      <br/>
    </fieldset>

    <fieldset>
      <legend>Operation: resetLocale</legend>
      <form action="{portal:createServicesUrl('portal','resetLocale', ())}" id="form" method="post">
        <input type="submit" value="Reset locale"/>
      </form>
    </fieldset>


    <xsl:call-template name="displayContext"/>

  </xsl:template>
</xsl:stylesheet>
