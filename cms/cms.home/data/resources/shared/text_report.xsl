<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp '&#160;'>
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
         <xsl:output method="xml"/>
    <xsl:template match="/verticaldata/contents">
        <xsl:value-of select="content"/>    
    </xsl:template>
    </xsl:stylesheet>