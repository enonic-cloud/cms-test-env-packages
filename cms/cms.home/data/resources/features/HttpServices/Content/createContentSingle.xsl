<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="xs portal" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:portal="http://www.enonic.com/cms/xslt/portal"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>

    <xsl:variable name="categorykey" select="30"/>

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
                    <table cellspacing="0" class="httpservices">
                        <tr>
                            <th class="left">Title <span class="required">*</span></th>
                            <td>
                                <input id="title" name="title" type="text"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="left">Description <span class="required">*</span></th>
                            <td>
                                <input name="descr" id="descr" type="text"
                                    value="{contentdata/descr}"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="left comfield">Comment <span class="required">*</span></th>
                            <td>
                                <xsl:element name="textarea">
                                    <xsl:attribute name="cols">10</xsl:attribute>
                                    <xsl:attribute name="rows">5</xsl:attribute>
                                    <xsl:attribute name="id">input_comment</xsl:attribute>
                                    <xsl:attribute name="name">comment</xsl:attribute>
                                    <xsl:attribute name="class">required</xsl:attribute>
                                    <xsl:attribute name="title">Write a comment</xsl:attribute>
                                    <xsl:value-of select="comment"/>
                                </xsl:element>
                            </td>
                        </tr>
                        <tr>
                            <th class="left comfield">Selected: </th>
                            <td>
                                <input name="radiobutton1" id="radiobutton1" type="radio" value="0"
                                    >0</input>
                                <input name="radiobutton1" id="radiobutton1" type="radio" value="5"
                                    >5</input>
                                <input name="radiobutton1" id="radiobutton1" type="radio" value="10"
                                    >10</input>
                                <input name="radiobutton1" id="radiobutton1" type="radio" value="20"
                                    >20</input>
                                <input name="radiobutton1" id="radiobutton1" type="radio" value="50"
                                    >50</input>
                            </td>

                        </tr>

                        <tr>
                            <th class="left comfield">Upload file 1:</th>
                            <td>
                                <input type="file" size="40"
                                    onchange="javascript:getFilename('uploadfile_input', this);"
                                    name="uploadfile_input"/>
                                <input type="hidden" id="filename_uploadfile_input"
                                    name="filename_uploadfile_input" value=""/>
                                <a name="uploadfile_input_link"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="left comfield">Upload file 2:</th>
                            <td>
                                <input type="file" size="40"
                                    onchange="javascript:getFilename('uploadfile_input_2', this);"
                                    name="uploadfile_input_2"/>
                                <input type="hidden" id="filename_uploadfile_input_2"
                                    name="filename_uploadfile_input_2" value=""/>
                                <a name="uploadfile_input_link"/>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" class="form_labelcolumn" nowrap="true" width="">Files:
                                (key[,key...])</td>
                            <td>
                                <input type="text" size="30" id="filesInputField"
                                    onchange="return activateButtonIfValue(this.id, 'addFilesButton');"/>
                                <button id="addFilesButton" disabled="true"
                                    onclick="return addHiddenValue(filesInputField.value, 'files', 'files')"
                                    >do add</button>
                                <ul>
                                    <div class="left comfield" valign="top" id="files"> </div>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">Image: (key[,key...])</td>
                            <td>

                                <input name="imageContentInputField" id="imageContentInputField"
                                    type="text" size="30"
                                    onchange="return activateButtonIfValue(this.id, 'addImageButton');"/>
                                <button id="addImageButton" disabled="true"
                                    onclick="return addHiddenValue(imageContentInputField.value, 'images', 'images_input')"
                                    >do add</button>
                                <ul>
                                    <div class="left comfield" valign="top" id="images"> </div>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <td>Related contents: (key[,key...])</td>
                            <td>
                                <input name="relatedContentInputField" id="relatedContentInputField"
                                    onchange="return activateButtonIfValue(this.id, 'addRelatedButton');"
                                    type="text"
                                    tip="Add related content ids as comma separated list"/>
                                <button id="addRelatedButton" disabled="true"
                                    onclick="return addHiddenValue(relatedContentInputField.value, 'relatedContents', 'relatedcontent_input')"
                                    >do add</button>
                                <ul>
                                    <div id="relatedContents"> </div>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <td>Related content:</td>
                            <td>
                                <input name="relatedcontent_input_single"
                                    onchange="return activateButtonIfValue(this.id, 'addRelatedSingleButton');"
                                    id="relatedcontent_input_single" type="text"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Use ost? </td>
                            <td>
                                <input name="ost" id="ost" type="checkbox" value="true"/>
                                <BR/>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" class="form_labelcolumn" nowrap="true" width=""
                                >Dropdown:</td>
                            <td valign="baseline">
                                <select name="dropdown_input">
                                    <option value="option1">Option1</option>
                                    <option value="option2">Option2</option>
                                    <option value="option3">Option3</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>XML:</td>
                            <td>
                                <textarea name="myXml" rows="5" cols="95"/>
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
