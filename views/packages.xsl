<xsl:transform
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ixsl="http://saxonica.com/ns/interactiveXSLT"
    xmlns:js="http://saxonica.com/ns/globalJS"
    xmlns:prop="http://saxonica.com/ns/html-property"
    xmlns:style="http://saxonica.com/ns/html-style-property"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:wc="http://www.webcomposite.com/xslt"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:depify="https://github.com/depify"
    exclude-result-prefixes="xs prop"
    extension-element-prefixes="ixsl"
    version="2.0">

  
    <xsl:template match="/" name="main">
      <xsl:result-document href="#packages" method="ixsl:replace-content">
  <table id="package-table">
    <thead>
      <tr>
        <th>name</th>
        <th>type</th>
        <th>version</th>
        <th>author</th>
        <th>description</th>
        <th>link</th>
      </tr>
    </thead>
  <tbody>     
    <xsl:for-each select="/depify:packages/depify:depify">
      <xsl:sort select="substring-before(substring-after(@path,'/packages/master/'),'/')"/>
      
      <tr>
        <xsl:choose>
          <xsl:when test="fn:contains(@path,'/xslt/')">
            <xsl:attribute name="style">background-color: #95A1C3;</xsl:attribute>
          </xsl:when>
          <xsl:when test="fn:contains(@path,'/xquery/')">
            <xsl:attribute name="style">background-color: #91867E;</xsl:attribute>
          </xsl:when>
          <xsl:when test="fn:contains(@path,'/xproc/')">
            <xsl:attribute name="style">background-color: #76A19E;</xsl:attribute>
          </xsl:when>
          <xsl:when test="fn:contains(@path,'/xml/')">
            <xsl:attribute name="style">background-color: #C9C27F;</xsl:attribute>
          </xsl:when>
          <xsl:when test="fn:contains(@path,'/schema/')">
            <xsl:attribute name="style">background-color: #C9C27F;</xsl:attribute>
          </xsl:when>
          <xsl:when test="fn:contains(@path,'/js/')">
            <xsl:attribute name="style">background-color: #B2B2B2;</xsl:attribute>
          </xsl:when>
          <xsl:otherwise>
          </xsl:otherwise>
        </xsl:choose>

        <td><xsl:value-of select="@name"/></td>
        <td><xsl:value-of select="substring-before(substring-after(@path,'/packages/master/'),'/')"/></td>
        
        <td><xsl:value-of select="@version"/></td>
        <td><xsl:value-of select="depify:author/@id"/></td>        
        <td><xsl:value-of select="depify:desc"/></td>        
        <td>
         <a href="{substring-before(@repo-uri,'.git')}/archive/master.zip">&#8627;download</a><br/>
         <a href="{@repo-uri}">&#8627;go repo</a><br/>
         <xsl:if test="depify:website"><a href="{depify:website}">&#8627; go web</a></xsl:if>
       </td>        
      </tr>
      
    </xsl:for-each>
  </tbody>
  </table>

      </xsl:result-document>
       
    </xsl:template>


</xsl:transform>	

