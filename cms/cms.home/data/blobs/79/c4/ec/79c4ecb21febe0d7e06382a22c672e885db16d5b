<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="xs portal" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:portal="http://www.enonic.com/cms/xslt/portal"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>

    <xsl:param name="categorykey"/>
    <xsl:param name="editPageKey"/>

    <xsl:template match="/">
        <link href="{portal:createResourceUrl('/_public/features/features.css')}" media="screen"
            rel="stylesheet" type="text/css"/>
        <script src="{portal:createResourceUrl('/_public/features/scripts/contentOperations.js', ())}" type="text/javascript"><xsl:comment>//</xsl:comment></script>

        <h3>Existing content:</h3>
        <table class="httpserviceslist">
            <tr>
                <th>Id</th>
                <th>Title</th>
                <th colspan="2">Operations</th>
            </tr>
            <xsl:apply-templates select="/result/contents/content"/>
        </table>

    </xsl:template>

    <xsl:template match="content">

        <xsl:variable name="contentKey" select="@key"/>

        <tr>
            <td>
                <xsl:value-of select="$contentKey"/>
            </td>
            <td>
                <i>
                    <xsl:value-of select="concat(contentdata/title,' - ',contentdata/descr)"/>
                </i>
            </td>
            <td width="10px">
                <a href="{portal:createPageUrl($editPageKey, ('key', @key))}">Edit</a>
            </td>
            <td width="10px">
                <a href="{portal:createServicesUrl('content','remove', ('key',$contentKey))}"
                    >Remove</a>
            </td>
        </tr>

    </xsl:template>
</xsl:stylesheet>
