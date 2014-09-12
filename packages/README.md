<depify xmlns="https://github.com/xquery/depify" ts="2014-09-12T20:24:50.212Z"><dep path="/packages/master/xslt/2/Schematron/1.6/" name="schematron" repo-uri="http://www.schematron.com/tmp/iso-schematron-xslt2.zip" version="1.6"><title>ISO SCHEMATRON 2010</title><desc>ISO Schematron is a language for making assertion about the presence or absense
    of patterns in XML documents. It is typically used for as a schema language, or
    to augment existing schema languages, and to check business rules. It is very
    powerful, yet quite simple: a developer only need know XPath and about five other
    elements. 
    
    This is an open source implementation of ISO Schematron in XSLT. Although ISO does
    not allow reference implementations which might compete with the text of the
    standard, this code has been compiled by Rick Jelliffe, inventor of Schematron
    and editor of the ISO standard; so developers can certainly use it as an 
    unofficial reference implementation for clarification. 
    
    This implementation is based on one by Oliver Becker. API documentation is 
    available separately; try www.schematron.com for this. Funding for this
    stylesheet over the years has come from Topologi Pty. Ltd., Geotempo Ltd.,
    and ASCC, Tapei.
    
    There are two versions of this skeleton: one is tailored for XSLT1 processors
    and the other is tailored for XSLT2 processors. Future versions of the
    XSLT2 skeleton may support more features than that the XSLT 1 skeleton. 
  </desc><license type="APL-V1.0"/><license type="zlib/libpng">http://www.opensource.org/licenses/zlib-license.php</license><author id="">Rick Jelliffe</author><website>http://www.schematron.com/</website><repo type="" uri=""/><xslt version="2.0" type="standalone">
    <uri>iso_schematron_skeleton.xsl</uri>
    To summarize, a basic 2 step process flow for some commandline processor is like this:
    I) XSLT -input=xxx.sch  -output=xxx.xsl  -stylesheet=iso_schematron_skeleton.xsl
    II) XSLT -input=document.xml  -output=xxx-document.results  -stylesheet=xxx.xsl
  </xslt></dep><dep path="/packages/master/xslt/1/functx/1.0/" name="xslt.1.functx" version="1.0"><title>FunctX library</title><desc>The FunctX function library is a set of useful functions on
  XML documents and data. It comes in two flavors: XQuery 1.0 and
  XSLT 2.0. Where possible, XPath 2.0 is is used in order to keep the
  function definitions as consistent as possible across the two
  languages. The source code for the functions is available under the
  GNU-LGPL license. However, the longer descriptions of the functions
  and the design of the FunctX Web sites is copyrighted and may only
  be used with permission.This site also includes descriptions and
  examples of the XQuery and XPath built-in functions, taken with
  permission from the book XQuery (2007, O'Reilly Media).We hope you
  find these functions useful and that you will take the time to
  provide feedback and/or contribute your own functions.
 </desc><license type="GNU-LGPL">
   <uri/>
 </license><repo type="?">
   <uri/>
 </repo><author id="pwalmsley">Priscilla Walmsley</author><website>http://www.xqueryfunctions.com/</website><xslt version="1.0">
   <prefix>functx</prefix>
   <namespace>http://www.functx.com</namespace>
   <uri>functx.xsl</uri>
 </xslt></dep><dep path="/packages/master/xquery/marklogic/xray/1.0/" name="xray" repo-uri="https://github.com/robwhitby/xray" version="1.0"><title>xray</title><desc>xray is a framework for writing XQuery unit tests on MarkLogic
  Server.</desc><license type="?"/><author id="rwhitby">Rob Whitby</author><website>https://github.com/robwhitby/xray</website><scm>
    <uri>https://github.com/robwhitby/xray.git</uri>
  </scm><app>
    <uri>index.xqy</uri>
  </app><shell os="linux osx">
    <uri>test-runner.sh</uri>
  </shell></dep><dep path="/packages/master/xquery/marklogic/scribd-ml-connector/1.0/" name="xquery.marklogic.libscribd" version="1.0"><title>libscribd</title><desc>This module contains all the functions for integrating Scribd with MarkLogic.</desc><license type="APL-V2.0"/><author id="ableasdale">Alex Bleasdale</author><website>https://github.com/xquery/?</website><xquery vendor="marklogic" version="4.2">
    <prefix>libscribd</prefix>
    <ns>http://marklogic.com/ps/lib-scribd</ns>
    <file>lib-scribd.xqy</file>
  </xquery></dep><dep path="/packages/master/xquery/marklogic/rxq/1.0/" name="rxq" repo-uri="https://github.com/xquery/rxq.git" version="1.0"/><dep path="/packages/master/xquery/marklogic/roxy/1.0/" name="roxy" repo-uri="https://github.com/marklogic/roxy.git" version="1.0"><title>Roxy</title><desc>Roxy (RObust XQuerY Framework) is a lightweight framework for quickly developing well-structured, 
    easily maintained XQuery applications. Roxy was heavily inspired by Ruby On Rails and CakePHP.</desc><license type="APL-V2">
    <uri>http://www.apache.org/licenses/LICENSE-2.0</uri>
  </license><author id="paxtonhare">Paxton Hare</author><author id="dmcassel">Dan Cassel</author><website>https://github.com/marklogic/roxy</website><scm>
    <uri>https://github.com/marklogic/roxy.git</uri>
  </scm><app/></dep><dep path="/packages/master/xquery/marklogic/oauth2/1.0/" name="xquery.marklogic.oauth2" version="1.0"><title>oauth2</title><desc>An Oauth2 client implementation example for MarkLogic server.
This library demonstrates OAuth2 authentication (much simpler than OAuth 1) with
Facebook and Github. It relies on some conventions for configuring providers 
and mapping provider users to MarkLogic users.</desc><license type="?"/><author id="ndw">Norm Walsh</author><website>https://github.com/ndw/oauth2</website></dep><dep path="/packages/master/xquery/marklogic/ml-schematron/1.0/" name="ml-schematron" repo-uri="https://github.com/ndw/ML-Schematron.git" version="1.0"><title>ML Schematron</title><desc>This repository includes a schematron.xqy module that will allow you to
    perform Schematron validation with MarkLogic Server version 4.2.
      </desc><license type="?"/><author id="ndw">Norm Walsh</author><website>https://github.com/ndw/ML-Schematron</website><repo type="git" uri="https://github.com/ndw/ML-Schematron.git"/><xquery>
    <prefix>mx</prefix>
    <namespace>http://www.marklogic.com/mx</namespace>
    <uri>schematron.xqy</uri>
  </xquery><dep name="xslt.2.Schematron" version="1.6"/></dep><dep path="/packages/master/xquery/marklogic/ml-queue/1.0/" name="ml-queue" version="1.0" repo-uri="https://github.com/grtjn/ml-queue"><title>ml-queue</title><desc>The normal task server queue doesn't discriminate between kinds of tasks. CPF processing can for instance flood the queue, and cause front-end request respond slowly. This queue is maintained separately, allows prioritizing, and the cron is designed only to launch tasks when the task server has spare threads. In other words, ideal for background processing.
  </desc><license type="?"/><author id="">Geert Josten</author><website>https://github.com/grtjn/ml-queue</website><repo type="git" uri="https://github.com/grtjn/ml-queue.git"/><app type="standalone"/></dep><dep path="/packages/master/xquery/3/xqueryparserxq/1.0/" name="xqueryparserxq" version="1.0" repo-uri="https://github.com/jpcs/xqueryparser.xq.git"><title>xqueryparser.xq</title><desc>An parser for XQuery 3.0 and MarkLogic extensions.</desc><license type="APLV2.0">
      <uri>https://github.com/jpcs/xqueryparser.xq/blob/master/LICENSE</uri>
   </license><repo type="git">
      <uri>https://github.com/jpcs/xqueryparser.xq.git</uri>
   </repo><author id="jpcs">John Snelson</author><website>https://github.com/jpcs/xqueryparser.xq</website><xquery version="3.0">
      <prefix>xqp</prefix>
      <namespace>http://github.com/jpcs/xqueryparser.xq</namespace>
      <uri>xqueryparser.xq</uri>
   </xquery></dep><dep path="/packages/master/xquery/3/transformxq/1.0/" name="transformxq" version="1.0" repo-uri="https://github.com/jpcs/transform.xq.git"><title>transform.xq</title><desc>An extensible transformation library for XQuery 3.0.</desc><license type="APLV2.0">
      <uri>https://github.com/jpcs/transform.xq/blob/master/LICENSE</uri>
   </license><repo type="git">
      <uri>https://github.com/jpcs/transform.xq.git</uri>
   </repo><author id="jpcs">John Snelson</author><website>https://github.com/jpcs/transform.xq/</website><xquery version="3.0">
      <prefix>tfm</prefix>
      <namespace>http://snelson.org.uk/functions/transform</namespace>
      <uri>transform.xq</uri>
   </xquery></dep><dep path="/packages/master/xquery/3/rbtreexq/1.0/" name="rbtree.xq" version="1.0" repo-uri="https://github.com/jpcs/rbtree.xq"><title>rbtree.xq</title><desc>An implementation of a red/black tree built using XQuery 3.0 higher order functions, and an associative map library built on top of it..</desc><license type="APLV2.0">
      <uri>https://github.com/jpcs/rbtree.xq/blob/master/LICENSE</uri>
   </license><repo type="git">
      <uri>https://github.com/jpcs/rbtree.xq.git</uri>
   </repo><author id="jpcs">John Snelson</author><website>https://github.com/jpcs/rbtree.xq</website><xquery version="3.0">
      <prefix>rbtree</prefix>
      <namespace>http://snelson.org.uk/functions/rbtree</namespace>
      <uri>transform.xq</uri>
   </xquery><xquery version="3.0">
      <prefix>map</prefix>
      <namespace>http://snelson.org.uk/functions/map</namespace>
      <uri>map.xq</uri>
   </xquery></dep><dep path="/packages/master/xquery/3/functionalxq/1.0/" name="functional.xq" version="1.0" repo-uri="git://github.com/jpcs/functional.xq.git"><title>functional.xq</title><desc>A library of useful functionality for working with XQuery 3.0 higher order functions.
      Includes a number of functions from the standard Haskell prelude, as well as functions to
      perform currying, function composition, and Y-combination.</desc><license type="APLV2">
      <uri>https://github.com/jpcs/functional.xq/blob/master/LICENSE</uri>
   </license><repo type="git">
      <uri>git://github.com/jpcs/functional.xq.git</uri>
   </repo><author id="jpcs">John Snelson</author><website>https://github.com/jpcs/functional.xq/</website><xquery version="3.0">
      <prefix>func</prefix>
      <namespace>http://snelson.org.uk/functions/functional</namespace>
      <uri>functional.xq</uri>
   </xquery></dep><dep path="/packages/master/xquery/1/functx/1.0/" name="xquery.1.functx" version="1.0"><title>FunctX library</title><desc>The FunctX function library is a set of useful functions on
  XML documents and data. It comes in two flavors: XQuery 1.0 and
  XSLT 2.0. Where possible, XPath 2.0 is is used in order to keep the
  function definitions as consistent as possible across the two
  languages. The source code for the functions is available under the
  GNU-LGPL license. However, the longer descriptions of the functions
  and the design of the FunctX Web sites is copyrighted and may only
  be used with permission.This site also includes descriptions and
  examples of the XQuery and XPath built-in functions, taken with
  permission from the book XQuery (2007, O'Reilly Media).We hope you
  find these functions useful and that you will take the time to
  provide feedback and/or contribute your own functions.
 </desc><license type="GNU-LGPL">
   <uri>?</uri>
 </license><repo type="?">
   <uri>?</uri>
 </repo><author id="pwalmsley">Priscilla Walmsley</author><website>http://www.xqueryfunctions.com/</website><xquery version="1.0">
   <prefix>functx</prefix>
   <namespace>http://www.functx.com</namespace>
   <uri>functx.xq</uri>
 </xquery></dep><dep path="/packages/master/xproc/1/ml-xproc-library/1.0/" name="ml-xproc-library" repo-uri="https://github.com/philipfennell/xproc-libraries" version="1.0"><title>ML XProc Libraries</title><desc xmlns:xhtml="http://www.w3.org/1999/xhtml">
  XProc libraries for working with MarkLogic.
  </desc><license type=""/><repo type="git">
   <uri>https://github.com/philipfennell/xproc-libraries</uri>
 </repo><author id="philipfennell">Philip Fennell</author><website>https://github.com/philipfennell/xproc-libraries</website><xproc vendor="xmlcalabash" version="1.0">
   <source/>
   <result/>
   <uri>XprocCorb/pipelines/xproccorb.xpl</uri>
 </xproc><xproc vendor="xmlcalabash" version="1.0">
    <source/>
    <result/>
    <uri>XprocLoader/pipelines/xprocloader.xpl</uri>
  </xproc><xproc vendor="xmlcalabash" version="1.0">
    <source/>
    <result/>
    <uri>XprocMLAdmin/build.xpl</uri>
  </xproc></dep><dep path="/packages/master/schema/relaxng/1/xslt-relax-ng/1.0/" name="xslt-relax-ng" version="1.0" repo-uri="https://github.com/ndw/xslt-relax-ng.git"><title>RelaxNG schemas for XSLT 1 &amp; XSLT 2</title><desc xmlns:xhtml="http://www.w3.org/1999/xhtml">
    <xhtml:p>This project provides RELAX NG grammars for XSLT stylesheets. Because stylesheets are required to have a version number, it's straightforward for a RELAX NG validator to choose between the xslt10.rnc and xslt20.rnc grammars.</xhtml:p>
    <xhtml:p>As work on XSLT 3.0 stabilizes, I plan to include support for that as well.</xhtml:p>
    <xhtml:p>Having a RELAX NG grammar makes syntax directed editing of XSLT stylesheets much easier in tools like Emacs and oXygen that support RELAX NG.</xhtml:p> 
  </desc><license type="?">
   <uri>?</uri>
 </license><repo type="git">
   <uri>https://github.com/ndw/xslt-relax-ng.git</uri>
 </repo><author id="ndw">Norm Walsh</author><website>https://github.com/ndw/xslt-relax-ng</website><schema>
   <uri>xslt.rnc</uri>
 </schema></dep><dep path="/packages/master/js/ecmascript/xqib/0.7.2/" name="xqib" version="0.7.2" repo-uri="http://www.xqib.org/download/xqib-js-0.8-beta.zip"><title>xqib - xquery in the browser</title><desc>XQIB allows you to program client-side Web applications with XQuery instead of JavaScript. It works in most modern browsers (IE9, Firefox 3.6+, Chrome 8, Safari 5) and does not require the installation of any plugin.
      XQuery is a W3C standard, just like HTML and XML, and is perfectly tailored for working with HTML, XML and REST. This means more elegant programs and less code. Moreover, by using an XQuery Web application server (such as MarkLogic or Sausalito) in conjunction with XQIB, having the same language on both the server and the client side allows you to reuse your code.
   </desc><license type="APLV2">
      <uri>NOTICE</uri>
   </license><repo type="svn">
      <uri>https://mxquery.svn.sourceforge.net/svnroot/mxquery/trunk/MXQuery/</uri>
   </repo><author id="">FLWOR Foundation, ETH Zurich Systems Group and Oracle</author><website>http://www.xqib.org/?page_id=2</website><js>
      <uri>xqueryjs/mxqueryjs.nocache.js</uri>
   </js></dep><dep path="/packages/master/js/ecmascript/qunit/1.0/" name="qunit" version="1.0" repo-uri="https://github.com/jquery/qunit.git"><title>QUnit - A JavaScript Unit Testing Framework</title><desc>A JavaScript Unit Testing Framework</desc><license type="GPL/MIT">
    <uri>?</uri>
  </license><repo type="?">
    <uri>?</uri>
  </repo><author id="">John Resig</author><author id="">Joern Zaefferer</author><website>http://docs.jquery.com/QUnit</website><js required="true">
    <uri>js/qunit.js</uri>
  </js><js required="true">
    <uri>js/jquery.js</uri>
  </js><js required="true">
    <uri>js/common.js</uri>
  </js><css required="true">
    <type>text/css</type>
    <rel>stylesheet</rel>
    <uri>css/qunit.css</uri>
  </css></dep><dep path="/packages/master/js/ecmascript/prettify/1.0/" name="prettify" version="1.0" repo-uri="https://github.com/michaek/google-code-prettify-small.git"><title>Prettify.js library</title><desc>A Javascript module and CSS file that allows syntax highlighting of source code snippets in an html page. </desc><license type="APLV2">
   <uri>http://google-code-prettify.googlecode.com/svn/trunk/COPYING</uri>
 </license><repo type="git">
     <uri>https://github.com/michaek/google-code-prettify-small</uri>
 </repo><author id="">Mike Samuel</author><website>http://code.google.com/p/google-code-prettify/</website><js required="true">
   <uri>prettify.js</uri>
 </js><js required="true">    
   <uri>lang-xq.js</uri>
  </js><css required="true">
   <type>text/css</type> 
   <rel>stylesheet</rel>
   <uri>prettify.css</uri>
 </css></dep></depify>