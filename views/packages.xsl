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

      <xsl:result-document href="#packages" method="ixsl:replace-content">
  <table cellpadding="0" cellspacing="0" border="1" width="100%" class="display" id="package-table">
    <thead>
      <tr>
        <th>path</th>
        <th>name</th>
        <th>author</th>
        <th>description</th>
      </tr>
    </thead>
  <tbody>     
    <xsl:for-each select="/depify:depify/depify:dep">
      <tr>
        <td><xsl:value-of select="@path"/></td>
        <td><xsl:value-of select="@name"/></td>
        <td><xsl:value-of select="@version"/></td>
        <td><xsl:value-of select="depify:desc"/></td>        
      </tr>
    </xsl:for-each>
  </tbody>
  </table>
  <script>
        $(document).ready(function() {
        $('#package-table').
        dataTable( {
        "bPaginate": false,
        "bScrollCollapse": true,
        "bAutoWidth": true
        }); });
  </script>
      </xsl:result-document>
       
      <xsl:result-document href="#footer-date" method="ixsl:replace-content">
        packages last updated <xsl:value-of select="*:depify/@ts"/>
      </xsl:result-document>
        
    </xsl:template>


</xsl:transform>	

