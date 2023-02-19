<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="text" omit-xml-declaration="yes" />

	<xsl:param name="fileName" />
	
	<xsl:variable name='newline'>
		<xsl:text>
</xsl:text>
	</xsl:variable>
	
	<xsl:template match="/coverage">
		<xsl:value-of select="$newline"/>

		<xsl:text># </xsl:text>
		<xsl:value-of select="$fileName"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$newline"/>

		<xsl:text>Line coverage: </xsl:text>
		<xsl:value-of select="round(number(@line-rate) * 100)"/>
		<xsl:text>% (</xsl:text>
		<xsl:value-of select="number(@lines-covered)"/>
		<xsl:text> of </xsl:text>
		<xsl:value-of select="number(@lines-valid)"/>
		<xsl:text>)  </xsl:text>
		<xsl:value-of select="$newline"/>

		<xsl:text>Branch coverage: </xsl:text>
		<xsl:value-of select="round(number(@branch-rate) * 100)"/>
		<xsl:text>% (</xsl:text>
		<xsl:value-of select="number(@branches-covered)"/>
		<xsl:text> of </xsl:text>
		<xsl:value-of select="number(@branches-valid)"/>
		<xsl:text>)</xsl:text>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$newline"/>
	</xsl:template>
	
</xsl:stylesheet>