<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs tei"
    version="1.0">
    <xsl:output method="xml" omit-xml-declaration="yes"
        doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
    />
    <!-- Tailored on the background of letter-to-LG.xml spoiler
        Please note that some solutions can be differently made, simplified etc
        These are for illustration only, but feel free to use if and retailor it
        for your own project.
    -->
    <xsl:template match="/">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title>
                    Sample Digitisation Project
                </title>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
                <link rel="stylesheet" href="assets/css/main.css"/>
                <link rel="stylesheet" href="assets/css/desktop.css"/>
            </head>
            <body>
                <header>
                    <h1>My Project</h1>
                </header>
                <nav id="sitenav"><a href="index.html">Home</a> |
                    <a href="diplomatic.html">Diplomatic Transcription</a> |
                    <a href="reading.html">Reading Text</a> |
                    <a href="toplayer.html">Top Layer</a> |
                </nav>
                <!--h1>
                    <xsl:value-of select="//tei:text//tei:head"/>
                </h1-->
                <div>
                    <xsl:apply-templates select="//tei:text"/>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:dateline">
        <p class="dateline"><xsl:apply-templates/></p>
    </xsl:template>

    <xsl:template match="tei:head">
        <h1><xsl:apply-templates/></h1>
    </xsl:template>

    <xsl:template match="tei:lg">
        <p><xsl:apply-templates/></p>
    </xsl:template>

    <xsl:template match="tei:persName">
        <strong><xsl:apply-templates/></strong>
    </xsl:template>

    <xsl:template match="tei:said">
        <span style="color:blue;" ><strong><xsl:apply-templates/></strong></span>
    </xsl:template>

    <xsl:template match="tei:lb|tei:l">
        <xsl:apply-templates/> <br/>
    </xsl:template>

    <xsl:template match="tei:pb">
        <p> <strong> Page break <xsl:apply-templates/>  Page break </strong> </p>
    </xsl:template>

    <xsl:template match="tei:emph">
        <xsl:choose>
            <xsl:when test="@rend ='ul'">
                <em style="text-decoration : underline"><xsl:apply-templates/></em>
            </xsl:when>
            <xsl:otherwise>
                <em><xsl:apply-templates/></em>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
