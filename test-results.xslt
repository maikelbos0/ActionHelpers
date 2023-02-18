<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:test="http://microsoft.com/schemas/VisualStudio/TeamTest/2010">

	<xsl:output method="text" omit-xml-declaration="yes" />

	<xsl:template match="/test:TestRun">
		<xsl:text>\n</xsl:text>
		
		<xsl:text># Test summary\n\n</xsl:text>
		
		<xsl:text>Total: </xsl:text>
		<xsl:value-of select="test:ResultSummary/test:Counters/@total"/>
		<xsl:text>  \n</xsl:text>
		
		<xsl:text>Executed: </xsl:text>
		<xsl:value-of select="test:ResultSummary/test:Counters/@executed"/>
		<xsl:text>  \n</xsl:text>
		
		<xsl:text>Passed: </xsl:text>
		<xsl:value-of select="test:ResultSummary/test:Counters/@passed"/>
		<xsl:text>  \n</xsl:text>
		
		<xsl:text>Failed: </xsl:text>
		<xsl:value-of select="test:ResultSummary/test:Counters/@failed"/>
		<xsl:text>\n\n</xsl:text>
		
		<xsl:text># Tests\n\n</xsl:text>

		<xsl:for-each select="test:Results/test:UnitTestResult">
			<xsl:choose>
				<xsl:when test="@outcome='Passed'">✔ </xsl:when>
				<xsl:when test="@outcome='Failed'">❌ </xsl:when>
				<xsl:otherwise>❔ </xsl:otherwise>
			</xsl:choose>

			<xsl:value-of select="@testName"/>
			<xsl:text>  \n</xsl:text>		

			<xsl:if test="test:Output/test:ErrorInfo">
				<xsl:text>```\n</xsl:text>
				
				<xsl:value-of select="test:Output/test:ErrorInfo/test:Message"/>

				<xsl:text>\n\n</xsl:text>
				
				<xsl:value-of select="test:Output/test:ErrorInfo/test:StackTrace"/>

				<xsl:text>\n```\n</xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>