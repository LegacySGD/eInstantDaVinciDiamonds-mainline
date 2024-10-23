<?xml version='1.0' ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<PaytableResponse>
			
			<xsl:text>[</xsl:text>
			<xsl:apply-templates mode="PricePoint" select="//InstantWinPrizeInfo[@name='PrizeStructure']/PricePoint"/>
			<xsl:text>]</xsl:text>
		
<!-- 			<xsl:apply-templates select="//StripInfo[@name='FreeSpin']" mode="StripInfo"/> -->
		</PaytableResponse>
	</xsl:template>
	
	<xsl:template match="PricePoint" mode="PricePoint">
		<xsl:variable name="pricePoint" select="@amount"/>
		<xsl:variable name="divisionStripName" select="//KeyValuePairInfo[@name='PricePointStripMappings']/Mapping[@key=$pricePoint]/@value"/>
		<xsl:text>{</xsl:text>
		<xsl:text>"price":</xsl:text>
		<xsl:value-of select="$pricePoint"/>
		<xsl:text>,</xsl:text>
		<xsl:text>"prizeStructure":[</xsl:text>
		<xsl:apply-templates mode="PrizeStructure" select="//InstantWinPrizeInfo[@name='PrizeStructure']/PricePoint[@amount=$pricePoint]/Prize">
			<xsl:with-param name="divisionStripName" select="$divisionStripName"/>
		</xsl:apply-templates>
		<xsl:text>],</xsl:text>
		<xsl:text>"prizeTable":[</xsl:text>
		<xsl:apply-templates mode="PrizeTable" select="//InstantWinPrizeInfo[@name='PrizeTable']/PricePoint[@amount=$pricePoint]/Prize"/>
		<xsl:text>]</xsl:text>
		<xsl:text>}</xsl:text>
		<xsl:if test="position() != last()">
			<xsl:text>,</xsl:text>
		</xsl:if>
	</xsl:template>

	<xsl:template match="Prize" mode="PrizeStructure">
		<xsl:param name="divisionStripName"/>
		<xsl:variable name="division" select="@division"/>
		<xsl:variable name="numberOfUnsoldWagers" select="sum(//StripInfo[@name=$divisionStripName]/Strip[1]/Stop/@weight)"/>
		<xsl:variable name="numberOfRemainingWinners" select="//StripInfo[@name=$divisionStripName]/Strip[1]/Stop[@symbolID=$division]/@weight"/>
		<xsl:text>{</xsl:text>
		<xsl:text>"description":"</xsl:text>
		<xsl:value-of select="@description"/>
		<xsl:text>",</xsl:text>
		<xsl:text>"division":</xsl:text>
		<xsl:value-of select="$division"/>
		<xsl:text>,</xsl:text>
		
		<!-- numberOfRemainingWinners -->
		<xsl:text>"numberOfRemainingWinners":</xsl:text>
		<xsl:value-of select="$numberOfRemainingWinners"/>
		<xsl:text>,</xsl:text>
	
		<!-- numberOfUnsoldWagers -->
		<xsl:text>"numberOfUnsoldWagers":</xsl:text>
		<xsl:value-of select="$numberOfUnsoldWagers"/>
		<xsl:text>,</xsl:text>
		<xsl:text>"prize":</xsl:text>
		<xsl:value-of select="text()"/>
		<xsl:text>}</xsl:text>
		<xsl:if test="position() != last()">
			<xsl:text>,</xsl:text>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="Prize" mode="PrizeTable">
		<xsl:text>{</xsl:text>
		<xsl:text>"description":"</xsl:text>
		<xsl:value-of select="@description"/>
		<xsl:text>",</xsl:text>
		<xsl:text>"division":</xsl:text>
		<xsl:value-of select="@division"/>
		<xsl:text>,</xsl:text>
	
		<!-- numberOfRemainingWinners -->
		<xsl:text>"numberOfRemainingWinners":null,</xsl:text>
		<xsl:text>"numberOfUnsoldWagers":null,</xsl:text>
		<xsl:text>"prize":</xsl:text>
		<xsl:value-of select="text()"/>
		<xsl:text>}</xsl:text>
		<xsl:if test="position() != last()">
			<xsl:text>,</xsl:text>
		</xsl:if>
	</xsl:template>
	
</xsl:stylesheet>
