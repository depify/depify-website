<xsl:transform
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ixsl="http://saxonica.com/ns/interactiveXSLT"
    xmlns:js="http://saxonica.com/ns/globalJS"
    xmlns:prop="http://saxonica.com/ns/html-property"
    xmlns:style="http://saxonica.com/ns/html-style-property"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:wc="http://www.webcomposite.com/xslt"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    exclude-result-prefixes="xs prop"
    extension-element-prefixes="ixsl"
    version="2.0">

    <xsl:template match="/" name="main">

      <xsl:result-document href="#package-list" method="ixsl:replace-content">
      <table>
        <th>
          <td>name</td>
          <td>version</td>
          <td>author</td>
        </th>
        <xsl:for-each select="//*:package">
          <tr>
           <td><xsl:value-of select="@name"/></td>
           <td><xsl:value-of select="@version"/></td>
           <td><xsl:value-of select="*:author"/></td>
          </tr>
        </xsl:for-each>
      </table>
      </xsl:result-document>

      <xsl:result-document href="#footer-date" method="ixsl:replace-content">
        packages last updated <xsl:value-of select="*:depify/@ts"/>
      </xsl:result-document>
        
    </xsl:template>


</xsl:transform>	

