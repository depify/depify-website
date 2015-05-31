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

  <xsl:template match="input[@id='search-q']" mode="ixsl:onkeyup">
     <xsl:variable name="q" select="normalize-space(ixsl:get(//input[@id='search-q'], 'value'))"/>
    <xsl:result-document href="#packages" method="ixsl:replace-content">
      <xsl:call-template name="display-search">
        <xsl:with-param name="type" select="$q"/>
      </xsl:call-template>
    </xsl:result-document>
  </xsl:template>
    
  <xsl:template match="/" name="main">
  
    <xsl:result-document href="#footer" method="ixsl:replace-content">
      <span id="footer-date">packages last-updated: <xsl:value-of select="$ts"/> </span>
    </xsl:result-document>
    
    <xsl:result-document href="#packages" method="ixsl:replace-content">
      <xsl:call-template name="display">
        <xsl:with-param name="type">(xproc)</xsl:with-param>
      </xsl:call-template>
    </xsl:result-document>
    
  </xsl:template>

  <xsl:template match="tr" mode="ixsl:onclick">
    <core-overlay>
      <h2>Dialog</h2>
      <input placeholder="say something..."/>
        <div>I agree with this wholeheartedly.</div>
        <button>OK</button>
    </core-overlay>
      
    </xsl:template>    
  
    <xsl:template match="core-item[@id='help']" mode="ixsl:onclick">
      <xsl:result-document href="#packages" method="ixsl:replace-content">
        <h1>Help</h1>
    </xsl:result-document>
    </xsl:template>    

    <xsl:template match="core-item[@id='all']" mode="ixsl:onclick">
    <xsl:result-document href="#packages" method="ixsl:replace-content">
      <xsl:call-template name="display">
        <xsl:with-param name="type">(xproc|xquery|xslt|schema|js|xml)</xsl:with-param>
      </xsl:call-template>
      </xsl:result-document>
    </xsl:template>
        
    <xsl:template match="core-item" mode="ixsl:onclick">
      <xsl:variable name="event" select="ixsl:event()"/>
      <xsl:result-document href="#packages" method="ixsl:replace-content">
      <xsl:call-template name="display">
        <xsl:with-param name="type">
          <xsl:value-of select="ixsl:get($event,'target.id')"/>
        </xsl:with-param>
      </xsl:call-template>
      </xsl:result-document>
    </xsl:template>

    <xsl:template name="display" match="/depify:packages">
      <xsl:param name="type"/>
      <table id="package-table">
    <thead>
      <tr>
        <th>type</th>
        <th>package</th>
        <th>action</th>
      </tr>
    </thead>
  <tbody>     
    <xsl:for-each-group select="ixsl:source()/depify:packages/depify:depify[matches(@path,$type,'i')]" group-by="@name">
      <xsl:sort select="substring-before(substring-after(@path,'/packages/master/'),'/')"/>
      <xsl:sort select="current-group()[1]/@name"/>
            <tr id="{current-group()[1]/@name}">
        <td style="text-align:center;">
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
        <xsl:value-of select="substring-before(substring-after(@path,'/packages/master/'),'/')"/></td>
        
        <td><span style="padding-left:20px;font-size:1.2em;"><b><xsl:value-of select="current-group()[1]/@name"/></b> <sup style="margin-left:5px;font-size:.6em;">
<xsl:value-of select="current-group()[1]/@version"/>
        <xsl:if test="count(current-group()) gt 1">
          [<xsl:value-of select="subsequence(current-group()/@version,2,last())" separator="] ["/>]
        </xsl:if>
      </sup></span> 

      <p style="margin:20px;font-size: 0.8em;"><xsl:value-of select="current-group()[last()]/depify:desc"/> | <i><xsl:value-of select="current-group()[last()]/depify:author"/></i></p>
      <p style="float:right;margin:20px;font-size: 0.8em;">
       <label>install: </label> <input disabled="disabled" size="50" value="depify install {current-group()[1]/@name} {current-group()[1]/@version}"/>
      </p>
        </td>        
        <td style="text-align:left;margin-left:5px">
          <xsl:choose>
          <xsl:when test="ends-with(@repo-uri,'.zip')">
            <core-item icon="file-download" label="download">
              <a href="{@repo-uri}" target="_download"/>
          </core-item>
          </xsl:when>
          <xsl:otherwise>
            <core-item icon="file-download" label="download">
              <a href="{@repo-uri}/releases/latest" target="download"/>
            </core-item>
          </xsl:otherwise>
          </xsl:choose>
          <xsl:if test="contains(@repo-uri,'github.com')">
          <core-item icon="bug-report" label="issue">
                   <a href="{@repo-uri}/issues" target="_issues"/>
          </core-item>
          </xsl:if>
          <xsl:if test="not(ends-with(@repo-uri,'.zip'))">
          <core-item icon="launch" label="repo">
            <a href="{@repo-uri}" target="_repo"/>
          </core-item>
          </xsl:if>
          <xsl:if test="depify:website">
          <core-item icon="launch" label="website">
            <a href="{depify:website}" target="_website"/>
          </core-item>
          </xsl:if>
        </td>        
      </tr>
    </xsl:for-each-group>
    
    
  </tbody>
      </table>
     </xsl:template>

    <xsl:template match="a[@id eq 'show_info']" mode="ixsl:onclick">
      
    </xsl:template>

    <xsl:template match="div[@id eq 'info']">
         <xsl:variable name="style" select="if (@style:display eq 'block') then 'hidden' else 'block'  "/>
         <ixsl:set-attribute name="style:display" select="$style"/>
    </xsl:template>
        
    <xsl:template name="display-search" match="/depify:packages">
      <xsl:param name="type">(xquery|xpath|schema|js|xml|xslt)</xsl:param>

      <table id="package-table">
    <thead>
      <tr>
        <th>type</th>
        <th>package</th>
        <th>action</th>
      </tr>
    </thead>
  <tbody>     
    <xsl:for-each select="ixsl:source()/depify:packages/depify:depify[matches(.,$type,'i')]">
      <xsl:sort select="substring-before(substring-after(@path,'/packages/master/'),'/')"/>
      <xsl:sort select="@name"/>
      <tr id="{@name}">
        <td style="text-align:center;">
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
        <xsl:value-of select="substring-before(substring-after(@path,'/packages/master/'),'/')"/></td>

        <td><span style="padding-left:20px;font-size:1.2em;"><b><xsl:value-of select="@name"/></b> <sup style="margin-left:5px;font-size:.6em;"><xsl:value-of select="@version"/></sup></span>

        <p style="margin:20px;font-size: 0.8em;"><xsl:value-of select="depify:desc"/> | <i><xsl:value-of select="depify:author"/></i></p></td>        

                <td style="text-align:left;margin-left:5px">
          <xsl:choose>
          <xsl:when test="ends-with(@repo-uri,'.zip')">
            <core-item icon="file-download" label="download">
              <a href="{@repo-uri}" target="_download"/>
          </core-item>
          </xsl:when>
          <xsl:otherwise>
            <core-item icon="file-download" label="download">
              <a href="{@repo-uri}/releases/{@version}" target="download"/>
            </core-item>
          </xsl:otherwise>
          </xsl:choose>
          <xsl:if test="contains(@repo-uri,'github.com')">
          <core-item icon="bug-report" label="issue">
                   <a href="{@repo-uri}/issues" target="_issues"/>
          </core-item>
          </xsl:if>
          <xsl:if test="not(ends-with(@repo-uri,'.zip'))">
          <core-item icon="launch" label="repo">
            <a href="{@repo-uri}" target="_repo"/>
          </core-item>
          </xsl:if>
          <xsl:if test="depify:website">
          <core-item icon="launch" label="website">
            <a href="{depify:website}" target="_website"/>
          </core-item>
          </xsl:if>
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

