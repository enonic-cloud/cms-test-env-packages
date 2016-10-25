<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="xs portal" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:portal="http://www.enonic.com/cms/xslt/portal"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>
    <xsl:variable name="categorykey" select="31"/>

    <xsl:template match="/">
        <link href="{portal:createResourceUrl('/_public/features/features.css')}" media="screen"
            rel="stylesheet" type="text/css"/>
        <script src="{portal:createResourceUrl('/_public/features/scripts/contentOperations.js', ())}" type="text/javascript"><xsl:comment>//</xsl:comment></script>

        <p>
            <h3>Add new content:</h3>
     
            <xsl:if test="/result/context/querystring/parameter[@name = 'error_content_create']">
                
                <xsl:variable name="errorCode"
                    select="/result/context/querystring/parameter[@name = 'error_content_create']"/>
                
                <p class="formError"> An error occured: <xsl:value-of select="$errorCode"/>
                    <xsl:text> - </xsl:text>
                    <xsl:choose>
                        <xsl:when test="$errorCode='150'">Missing content key</xsl:when>
                        <xsl:when test="$errorCode='400'">Missing parameters</xsl:when>
                        <xsl:when test="$errorCode='401'">Illegal values in parameters </xsl:when>
                        <xsl:when test="$errorCode='402'">Failed sending e-mail </xsl:when>
                        <xsl:when test="$errorCode='405'">Invalid Captcha</xsl:when>
                        
                    </xsl:choose>
                </p>
                
            </xsl:if>
            
            <xsl:variable name="pageId" select="/result/context/querystring/parameter[@name='id']"></xsl:variable>
            <xsl:variable name="redirect" select="portal:createPageUrl($pageId, ())"/>
            
            <form action="{portal:createServicesUrl('content','create', $redirect, ())}" id="form"
                method="post" enctype="multipart/form-data">
                <input type="hidden" value="0" id="elementCounter"/>
                <div class="form-content">
                    <input name="categorykey" type="hidden" value="{$categorykey}"/>
                    <table cellspacing="0" class="httpservices" id="myTable">
                        <tr>
                            <th class="left">Title <span class="required">*</span></th>
                            <td>
                                <input id="title" name="title" type="text"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="left">Description <span class="required">*</span></th>
                            <td>
                                <input name="descr" id="descr" type="text"/>
                            </td>
                        </tr>

                        <!-- Group config 1 -->
                        <th colspan="2">
                            <center>
                                <h3> Bikes </h3>
                            </center>
                        </th>
                        <tr>
                            <td colspan="2">
                                <strong>Bike 1</strong>
                            </td>
                        </tr>
                        <tr>
                            <th class="left comfield">Bike name<span class="required">*</span></th>
                            <td>
                                <input name="groupedblock[1].entryname" id="name" type="text"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="left comfield">Bike color<span class="required">*</span></th>
                            <td>
                                <input name="groupedblock[1].entryvalue" id="value" type="text"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <strong>Bike 2</strong>
                            </td>
                        </tr>
                        <tr>
                            <th class="left comfield">Bike name <span class="required">*</span></th>
                            <td>
                                <input name="groupedblock[2].entryname" id="name" type="text"/>
                            </td>
                        </tr>

                        <tr>
                            <th class="left comfield">Bike color <span class="required"
                                >*</span></th>
                            <td>
                                <input name="groupedblock[2].entryvalue" id="value" type="text"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <strong>Bike 3</strong>
                            </td>
                        </tr>
                        <tr>
                            <th class="left comfield">Bike name <span class="required">*</span></th>
                            <td>
                                <input name="groupedblock[3].entryname" id="name" type="text"/>
                            </td>
                        </tr>

                        <tr>
                            <th class="left comfield">Bike color <span class="required"
                                >*</span></th>
                            <td>
                                <input name="groupedblock[3].entryvalue" id="value" type="text"/>
                            </td>
                        </tr>

                        <!-- Group config 2 -->

                        <th colspan="2">
                            <center>
                                <h3> Cars </h3>
                            </center>
                        </th>
                        <tr>
                            <td colspan="2">
                                <strong>Car 1</strong>
                            </td>
                        </tr>
                        <tr>
                            <th class="left comfield">Car name<span class="required">*</span></th>
                            <td>
                                <input name="groupedblock2[1].entryname2" id="name" type="text"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="left comfield">Car color<span class="required">*</span></th>
                            <td>
                                <input name="groupedblock2[1].entryvalue2" id="value" type="text"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="left comfield">Car Brochoure:</th>
                            <td>
                                <input type="file" size="30"
                                    onchange="javascript:getFilename('uploadfile_input', this, 'groupedblock2[1]');"
                                    name="groupedblock2[1].uploadfile_input"/>
                                <input type="hidden" id="groupedblock2[1].filename_uploadfile_input"
                                    name="groupedblock2[1].filename_uploadfile_input" value=""/>
                                <a name="uploadfile_input_link"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Car test article:</td>
                            <td>
                                <input name="groupedblock2[1].relatedcontent_input_single"
                                    id="groupedblock2[1].relatedcontent_input_single" type="text"/>
                            </td>
                        </tr>
                        <td colspan="2">
                            <strong>Car 2 </strong>
                        </td>
                        <tr>
                            <th class="left comfield">Car name <span class="required">*</span></th>
                            <td>
                                <input name="groupedblock2[2].entryname2" id="name" type="text"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="left comfield">Car color <span class="required">*</span></th>
                            <td>
                                <input name="groupedblock2[2].entryvalue2" id="value" type="text"/>
                            </td>
                        </tr>

                        <tr>
                            <th class="left comfield">Car Brochoure:</th>
                            <td>
                                <input type="file" size="30"
                                    onchange="javascript:getFilename('uploadfile_input', this, 'groupedblock2[2]');"
                                    name="groupedblock2[2].uploadfile_input"/>
                                <input type="hidden" id="groupedblock2[2].filename_uploadfile_input"
                                    name="groupedblock2[2].filename_uploadfile_input" value=""/>
                                <a name="uploadfile_input_link"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Car test article:</td>
                            <td>
                                <input name="groupedblock2[2].relatedcontent_input_single"
                                    onchange="return activateButtonIfValue(this.id, 'addRelatedSingleButton');"
                                    id="groupedblock2[2].relatedcontent_input_single" type="text"/>
                            </td>
                        </tr>

                    </table>
                    <p class="enter-button">
                        <input type="submit" value="content_create"/>
                        <input onclick="valid.reset(); return false" type="reset" value="Clear form"
                        />
                    </p>
                </div>
            </form>
        </p>

    </xsl:template>

</xsl:stylesheet>
