<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns:portal="http://www.enonic.com/cms/xslt/portal" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output indent="no" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>

    <xsl:param name="xml-proxy">
        <type>page</type>
    </xsl:param>
    <xsl:param name="feed-url" select="'http://www.enonic.com/rss'"/>
    <xsl:param name="number-of-items" select="3"/>

    <xsl:variable name="list-id" select="concat('social-bookmark-list', /verticaldata/context/portlet-window/portlet/@key)"/>

    <xsl:template match="/">
        <xsl:variable name="feed-provider">
            <xsl:choose>
                <xsl:when test="matches(lower-case($feed-url), 'delicious')">delicious</xsl:when>
                <xsl:otherwise>unknown</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <div class="{concat('social-bookmarks ', $feed-provider)}">
            <h2>
                <xsl:value-of select="portal:localize('Recommended-links', ($feed-provider))"/>
            </h2>
            <ul id="{$list-id}">
                <li>
                    <a href="#" class="refresh-content">
                        <xsl:value-of select="portal:localize('Update')"/>
                    </a>
                </li>
            </ul>
        </div>
        <script type="text/javascript" src="{portal:createResourceUrl('/_public/modules/flickr-gallery/scripts/flickr-gallery.js')}"><xsl:comment>//</xsl:comment></script>
        <script type="text/javascript">
            <xsl:comment>
                
                <xsl:value-of select="concat('var listId = &quot;', $list-id, '&quot;;')"/>
            
                $(function () {
                    // Refresh feed content
                    $('.social-bookmarks a.refresh-content').click(function (event) {
                        event.preventDefault();
                        feedList = $(this).closest('ul');
                        <xsl:value-of select="concat('feedUrl = &quot;', portal:createPageUrl($xml-proxy, ('url', $feed-url)), '&quot;;')"/>
                        <xsl:value-of select="concat('numOfItems = Number(', $number-of-items, ');')"/>
                        loadFeed(feedList, feedUrl, numOfItems);
                    });
        
                    // Initial data load
                    $('#' + listId + ' a.refresh-content').trigger('click');
                });
            //</xsl:comment>
        </script>
    </xsl:template>
    
</xsl:stylesheet>
