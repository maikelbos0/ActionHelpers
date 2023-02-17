<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/TestRun">
			<xsl:text>
# Test results

Total: </xsl:text>
			<xsl:value-of select="ResultSummary/Counters/@total"/>
			<xsl:text>
Executed: </xsl:text>
			<xsl:value-of select="ResultSummary/Counters/@executed"/>
			<xsl:text>
Passed: </xsl:text>
			<xsl:value-of select="ResultSummary/Counters/@passed"/>
			<xsl:text>
Failed: </xsl:text>
			<xsl:value-of select="ResultSummary/Counters/@failed"/>
			<xsl:text>

# Tests </xsl:text>
			
			<xsl:for-each select="Results/UnitTestResult">
				<xsl:choose>
					<xsl:when test="@outcome='Passed'">✔ </xsl:when>
					<xsl:when test="@outcome='Failed'">❌ </xsl:when>
					<xsl:otherwise>❔ </xsl:otherwise>
				</xsl:choose>

				<xsl:value-of select="@testName"/>
				<xsl:if test="Output/ErrorInfo">
					<xsl:text>
```</xsl:text>
					<xsl:value-of select="Output/ErrorInfo/Message"/>
					<xsl:text>
</xsl:text>
					<xsl:value-of select="Output/ErrorInfo/StackTrace"/>
					<xsl:text>
```</xsl:text>
				</xsl:if>
				<xsl:text>
</xsl:text>
			</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>

