<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:test="http://microsoft.com/schemas/VisualStudio/TeamTest/2010">

	<xsl:output method="text" omit-xml-declaration="yes" />

	<xsl:param name="name" />

	<xsl:variable name='newline'>
		<xsl:text>
</xsl:text>
	</xsl:variable>

	<xsl:template match="/test:TestRun">
		<xsl:value-of select="$newline"/>

		<xsl:text># </xsl:text>
		<xsl:choose>
			<xsl:when test="test:Results/test:UnitTestResult[@outcome='Failed']">
				<xsl:text>❌ </xsl:text>
			</xsl:when>
			<xsl:when test="test:Results/test:UnitTestResult[@outcome!='Passed']">
				<xsl:text>❔ </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>✔ </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:value-of select="$name"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$newline"/>

		<xsl:text>Total: </xsl:text>
		<xsl:value-of select="test:ResultSummary/test:Counters/@total"/>
		<xsl:text>  </xsl:text>
		<xsl:value-of select="$newline"/>

		<xsl:text>Executed: </xsl:text>
		<xsl:value-of select="test:ResultSummary/test:Counters/@executed"/>
		<xsl:text>  </xsl:text>
		<xsl:value-of select="$newline"/>

		<xsl:text>Passed: </xsl:text>
		<xsl:value-of select="test:ResultSummary/test:Counters/@passed"/>
		<xsl:text>  </xsl:text>
		<xsl:value-of select="$newline"/>

		<xsl:text>Failed: </xsl:text>
		<xsl:value-of select="test:ResultSummary/test:Counters/@failed"/>
		<xsl:text>  </xsl:text>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$newline"/>

		<xsl:text>## Tests</xsl:text>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$newline"/>

		<xsl:for-each select="test:Results/test:UnitTestResult">
			<xsl:choose>
				<xsl:when test="@outcome='Passed'">
					<xsl:text>✔ </xsl:text>
				</xsl:when>
				<xsl:when test="@outcome='Failed'">
					<xsl:text>❌ </xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>❔ </xsl:text>
				</xsl:otherwise>
			</xsl:choose>

			<xsl:value-of select="@testName"/>
			<xsl:text>  </xsl:text>
			<xsl:value-of select="$newline"/>

			<xsl:if test="test:Output/test:ErrorInfo">
				<xsl:text>```</xsl:text>
				<xsl:value-of select="$newline"/>

				<xsl:value-of select="test:Output/test:ErrorInfo/test:Message"/>

				<xsl:value-of select="$newline"/>
				<xsl:value-of select="$newline"/>

				<xsl:value-of select="test:Output/test:ErrorInfo/test:StackTrace"/>

				<xsl:value-of select="$newline"/>
				<xsl:text>```</xsl:text>
				<xsl:value-of select="$newline"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	
</xsl:stylesheet>