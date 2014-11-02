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

  <xsl:variable name="ts" select="/depify:packages/@ts"/>

  <xsl:template match="input[@id='search-q']" mode="ixsl:onkeydown">
     <xsl:variable name="q" select="normalize-space(ixsl:get(//input[@id='search-q'], 'value'))"/>
    <xsl:result-document href="#packages" method="ixsl:replace-content">
      <xsl:call-template name="display-search">
        <xsl:with-param name="type" select="$q"/>
      </xsl:call-template>
    </xsl:result-document>
  </xsl:template>
    
  <xsl:template match="/" name="main">
  
    <xsl:result-document href="#footer" method="ixsl:replace-content">
      <span id="footer-date"><a href="https://github.com/depify/depify-packages" target="_packages">last-updated</a>: <xsl:value-of select="$ts"/> </span>
    </xsl:result-document>
    
    <xsl:result-document href="#packages" method="ixsl:replace-content">
      <xsl:call-template name="display"/>
      </xsl:result-document>
    </xsl:template>

    <xsl:template match="core-item[@id='help']" mode="ixsl:onclick">
      <xsl:result-document href="#packages" method="ixsl:replace-content">
        <h1>Help</h1>
    </xsl:result-document>
    </xsl:template>    

    <xsl:template match="core-item[@id='all']" mode="ixsl:onclick">
    <xsl:result-document href="#packages" method="ixsl:replace-content">
      <xsl:call-template name="display"/>
      </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="core-item[@id='xproc']" mode="ixsl:onclick">
    <xsl:result-document href="#packages" method="ixsl:replace-content">
      <xsl:call-template name="display">
            <xsl:with-param name="type">xproc</xsl:with-param>
      </xsl:call-template>
      </xsl:result-document>
    </xsl:template>    

    <xsl:template match="core-item[@id='xquery']" mode="ixsl:onclick">
    <xsl:result-document href="#packages" method="ixsl:replace-content">
      <xsl:call-template name="display">
            <xsl:with-param name="type">xquery</xsl:with-param>
      </xsl:call-template>
      </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="core-item[@id='xslt']" mode="ixsl:onclick">
    <xsl:result-document href="#packages" method="ixsl:replace-content">
      <xsl:call-template name="display">
            <xsl:with-param name="type">xslt</xsl:with-param>
      </xsl:call-template>
      </xsl:result-document>
    </xsl:template>

    <xsl:template match="core-item[@id='schema']" mode="ixsl:onclick">
    <xsl:result-document href="#packages" method="ixsl:replace-content">
      <xsl:call-template name="display">
            <xsl:with-param name="type">schema</xsl:with-param>
      </xsl:call-template>
      </xsl:result-document>
    </xsl:template>

    <xsl:template match="core-item[@id='js']" mode="ixsl:onclick">
    <xsl:result-document href="#packages" method="ixsl:replace-content">
      <xsl:call-template name="display">
            <xsl:with-param name="type">js</xsl:with-param>
      </xsl:call-template>
      </xsl:result-document>
    </xsl:template>

    <xsl:template match="core-item[@id='xml']" mode="ixsl:onclick">
    <xsl:result-document href="#packages" method="ixsl:replace-content">
      <xsl:call-template name="display">
            <xsl:with-param name="type">xml</xsl:with-param>
      </xsl:call-template>
      </xsl:result-document>
    </xsl:template>

    
    <xsl:template name="display" match="/depify:packages">
      <xsl:param name="type">(xquery|xpath|schema|js|xml|xslt)</xsl:param>
      <table id="package-table">
    <thead>
      <tr>
        <th>name</th>
        <th>type</th>
        <th>version</th>
        <th>author</th>
        <th>description</th>
        <th>action</th>
      </tr>
    </thead>
  <tbody>     
    <xsl:for-each select="ixsl:source()/depify:packages/depify:depify[matches(@path,$type)]">
      <xsl:sort select="substring-before(substring-after(@path,'/packages/master/'),'/')"/>
      <xsl:sort select="@name"/>
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

        <td><b><xsl:value-of select="@name"/></b></td>
        <td><xsl:value-of select="substring-before(substring-after(@path,'/packages/master/'),'/')"/></td>
        
        <td><xsl:value-of select="@version"/></td>
        <td><a href="http://github.com/{depify:author[1]/@id}" target="_github"><xsl:value-of select="depify:author/@id"/></a></td>        
        <td><p><xsl:value-of select="depify:desc"/></p></td>        
        <td style="text-align:left">
          <core-item icon="file-download" label="download">
                   <a href="{substring-before(@repo-uri,'.git')}/archive/master.zip"/>
          </core-item>
          <core-item icon="bug-report" label="issue">
                   <a href="{substring-before(@repo-uri,'.git')}/issues" target="_issues"/>
          </core-item>
          <core-item icon="launch" label="repo">
            <a href="{@repo-uri}" target="_repo"/>
          </core-item>
          <core-item icon="launch" label="website">
            <a href="{depify:website}" target="_website"/>
          </core-item>
        </td>        
      </tr>
      
    </xsl:for-each>
  </tbody>
  </table>
    <xsl:result-document href="#type" method="ixsl:replace-content">
     <xsl:value-of select="$type"/>
    </xsl:result-document>
    </xsl:template>

    <xsl:template name="display-search" match="/depify:packages">
      <xsl:param name="type">(xquery|xpath|schema|js|xml|xslt)</xsl:param>
      <table id="package-table">
    <thead>
      <tr>
        <th>name</th>
        <th>type</th>
        <th>version</th>
        <th>author</th>
        <th>description</th>
        <th>action</th>
      </tr>
    </thead>
  <tbody>     
    <xsl:for-each select="ixsl:source()/depify:packages/depify:depify[matches(.,$type)]">
      <xsl:sort select="substring-before(substring-after(@path,'/packages/master/'),'/')"/>
      <xsl:sort select="@name"/>
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

        <td><b><xsl:value-of select="@name"/></b></td>
        <td><xsl:value-of select="substring-before(substring-after(@path,'/packages/master/'),'/')"/></td>
        
        <td><xsl:value-of select="@version"/></td>
        <td><a href="http://github.com/{depify:author[1]/@id}" target="_github"><xsl:value-of select="depify:author/@id"/></a></td>        
        <td><p><xsl:value-of select="depify:desc"/></p></td>        
        <td style="text-align:left">
          <core-item icon="file-download" label="download">
                   <a href="{substring-before(@repo-uri,'.git')}/archive/master.zip"/>
          </core-item>
          <core-item icon="bug-report" label="issue">
                   <a href="{substring-before(@repo-uri,'.git')}/issues" target="_issues"/>
          </core-item>
          <core-item icon="launch" label="repo">
            <a href="{@repo-uri}" target="_repo"/>
          </core-item>
          <core-item icon="launch" label="website">
            <a href="{depify:website}" target="_website"/>
          </core-item>
        </td>        
      </tr>
      
    </xsl:for-each>
  </tbody>
  </table>
    <xsl:result-document href="#type" method="ixsl:replace-content">
     <xsl:value-of select="$type"/>
    </xsl:result-document>
    </xsl:template>    
</xsl:transform>	

