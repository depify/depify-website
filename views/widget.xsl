<xsl:transform
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ixsl="http://saxonica.com/ns/interactiveXSLT"
    xmlns:js="http://saxonica.com/ns/globalJS"
    xmlns:prop="http://saxonica.com/ns/html-property"
    xmlns:style="http://saxonica.com/ns/html-style-property"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:wc="http://www.webcomposite.com/xslt"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:depify="https://github.com/xquery/depify"
    exclude-result-prefixes="xs prop"
    extension-element-prefixes="ixsl"
    version="2.0">

  <xsl:template match="/" name="main">

    <xsl:result-document href="#package-list" method="ixsl:replace-content">
      <table id="package-table">
        <thead>
          <tr>
            <td>type</td>
            <td>repo</td>
            <td>version</td>
            <td>author</td>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="/depify:depify/depify:dep[fn:matches(@path,'(xml|xslt|xproc|xquery)')]">
            <tr class="tooltip" title="{*:desc/data(.)}">
              <td><xsl:choose>
                <xsl:when test="fn:matches(@path,'xquery')">
                  xquery
                </xsl:when>
                <xsl:when test="fn:matches(@path,'xslt')">
                  xslt
                </xsl:when>
                <xsl:when test="fn:matches(@path,'js')">
                  js
                </xsl:when>
                <xsl:when test="fn:matches(@path,'xml')">
                  xml
                </xsl:when>
                <xsl:when test="fn:matches(@path,'xproc')">
                  xproc
                </xsl:when>
                <xsl:otherwise>
                  other
                </xsl:otherwise>
              </xsl:choose>
              </td>
              <td><a href="{*:repo/*:uri}" target="repo"><xsl:value-of select="@name"/></a></td>
              <td><xsl:value-of select="@version"/></td>
              <td><xsl:value-of select="*:author"/></td>
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
      <script>
        $(document).ready(function() {
        $('#package-table').
        dataTable( {
        "bPaginate": false,
        "bLengthChange": false,
        "bFilter": false,
        "bSort": true,
        "bInfo": false,
        "bAutoWidth": false,
        "bPaginate": false,
        "bScrollCollapse": true
        }) });
      </script>
    </xsl:result-document>

    <xsl:result-document href="#footer-date" method="ixsl:replace-content">
      packages last updated <xsl:value-of select="*:depify/@ts"/>
    </xsl:result-document>
    
  </xsl:template>


</xsl:transform>	

