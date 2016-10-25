<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet exclude-result-prefixes="xs portal" version="2.0" xmlns="http://www.w3.org/1999/xhtml"
                xmlns:portal="http://www.enonic.com/cms/xslt/portal" xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>


  <xsl:template match="/">


    <fieldset>
      <legend>Content of type File</legend>

      <strong>The following urls are created with: createAttachmentUrl( &lt;content-key&gt; )</strong>
      <ul>
        <xsl:for-each select="result/files/contents/content">
          <xsl:variable name="nativeLink" select="@key"/>
          <li>
            <a href="{portal:createAttachmentUrl($nativeLink)}">
              <xsl:value-of select="title"/>
            </a>
            (native link: <xsl:value-of select="$nativeLink"/>)
          </li>
        </xsl:for-each>
      </ul>

      <strong>The following urls are created with: createAttachmentUrl( &lt;content-key&gt;/label/source )</strong>
      <ul>
        <xsl:for-each select="result/files/contents/content">
          <li>
            <xsl:variable name="nativeLink" select="concat( @key, '/label/source' )"/>            
            <a href="{portal:createAttachmentUrl( $nativeLink )}">
              <xsl:value-of select="title"/>
            </a>
            (native link: <xsl:value-of select="$nativeLink"/>)
          </li>
        </xsl:for-each>
      </ul>

      <strong>The following urls are created with: createAttachmentUrl( &lt;content-key&gt;/label/source, ('_download', 'true') )</strong>
      <ul>
        <xsl:for-each select="result/files/contents/content">
          <li>
            <xsl:variable name="nativeLink" select="concat( @key, '/label/source' )"/>
            <a href="{portal:createAttachmentUrl( $nativeLink, ('_download', 'true') )}">
              <xsl:value-of select="title"/>
            </a>
            (native link: <xsl:value-of select="$nativeLink"/>)
          </li>
        </xsl:for-each>
      </ul>

      <strong>The following urls are created with: createAttachmentUrl( &lt;content-key&gt;/binary/&lt;binary-key&gt; )</strong>
      <ul>
        <xsl:for-each select="result/files/contents/content/binaries/binary">
          <li>
            <xsl:variable name="content" select="parent::node()/parent::node()"/>
            <xsl:variable name="content-key" select="parent::node()/parent::node()/@key"/>
            <xsl:variable name="nativeLink" select="concat( $content-key, '/binary/', @key )"/>

            <a href="{portal:createAttachmentUrl( $nativeLink )}">
              <xsl:value-of select="$content/title"/> [key=<xsl:value-of select="@key"/>,filename=<xsl:value-of select="@filename"/>,label=<xsl:value-of select="@label"/>, filesize=<xsl:value-of select="@filesize"/>]
            </a>
            (native link: <xsl:value-of select="$nativeLink"/>)
          </li>
        </xsl:for-each>
      </ul>

    </fieldset>

    <fieldset>
      <legend>Content of type Image</legend>

      <strong>The following urls are created with: createAttachmentUrl( &lt;content-key&gt; )</strong>
      <ul>
        <xsl:for-each select="result/images/contents/content">
          <xsl:variable name="nativeLink" select="@key"/>
          <li>
            <a href="{portal:createAttachmentUrl($nativeLink)}">
              <xsl:value-of select="title"/>
            </a>
            (native link: <xsl:value-of select="$nativeLink"/>)
          </li>
        </xsl:for-each>
      </ul>

      <strong>The following urls are created with: createAttachmentUrl( &lt;content-key&gt;/label/small )</strong>
      <ul>
        <xsl:for-each select="result/images/contents/content">
          <li>
            <xsl:variable name="nativeLink" select="concat( @key, '/label/small' )"/>            
            <a href="{portal:createAttachmentUrl( $nativeLink )}">
              <xsl:value-of select="title"/>
            </a>
            (native link: <xsl:value-of select="$nativeLink"/>)
          </li>
        </xsl:for-each>
      </ul>

      <strong>The following urls are created with: createAttachmentUrl( &lt;content-key&gt;/binary/&lt;binary-key&gt; )</strong>
      <ul>
        <xsl:for-each select="result/images/contents/content/binaries/binary">
          <li>
            <xsl:variable name="content" select="parent::node()/parent::node()"/>
            <xsl:variable name="content-key" select="parent::node()/parent::node()/@key"/>
            <xsl:variable name="nativeLink" select="concat( $content-key, '/binary/', @key )"/>

            <a href="{portal:createAttachmentUrl( $nativeLink )}">
              <xsl:value-of select="$content/title"/> [key=<xsl:value-of select="@key"/>,filename=<xsl:value-of select="@filename"/>,label=<xsl:value-of select="@label"/>, filesize=<xsl:value-of select="@filesize"/>]
            </a>
            (native link: <xsl:value-of select="$nativeLink"/>)
          </li>
        </xsl:for-each>
      </ul>
    </fieldset>

    <fieldset>
      <legend>Content of type Custom</legend>
      <p>
        On a custom content, we can only reach binaries by giving binary key. 
      </p>

      <strong>The following urls are created with: createAttachmentUrl( &lt;content-key&gt;/binary/&lt;binary-key&gt; )</strong>
      <ul>
        <xsl:for-each select="result/custom-content/contents/content/binaries/binary">
          <li>
            <xsl:variable name="content" select="parent::node()/parent::node()"/>
            <xsl:variable name="content-key" select="parent::node()/parent::node()/@key"/>
            <xsl:variable name="nativeLink" select="concat( $content-key, '/binary/', @key )"/>

            <a href="{portal:createAttachmentUrl( $nativeLink )}">
              <xsl:value-of select="$content/title"/> [key=<xsl:value-of select="@key"/>,filename=<xsl:value-of select="@filename"/>,label=<xsl:value-of select="@label"/>, filesize=<xsl:value-of select="@filesize"/>]
            </a>
            (native link: <xsl:value-of select="$nativeLink"/>)
          </li>
        </xsl:for-each>
      </ul>
      
      <strong style="color:red">The following urls are created with: createAttachmentUrl( &lt;content-key&gt; ) and are not expected to work</strong>
      <ul>
        <xsl:for-each select="result/custom-content/contents/content">
          <li>
            <xsl:variable name="nativeLink" select="@key"/>

            <a href="{portal:createAttachmentUrl( $nativeLink )}">
              <xsl:value-of select="title"/>
            </a>
            (native link: <xsl:value-of select="$nativeLink"/>)
          </li>
        </xsl:for-each>
      </ul>




    </fieldset>

  </xsl:template>


</xsl:stylesheet>
