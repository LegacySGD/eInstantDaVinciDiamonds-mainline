<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name="test" select="/Paytable/@test" />
	<xsl:output encoding="UTF-8" indent="yes" method="xml" />
	<xsl:template match="/Paytable/PaytableData/PaytableVariation/Variation/ExecutionModelMapping">
		<ForceData>
			<SoftwareId>
				<xsl:value-of select="/Paytable/PaytableData/PaytableVariation/Variation/SoftwareId" />
			</SoftwareId>
			<DataFileSuffix>Scenario</DataFileSuffix>
			<!-- Price Point 50 -->
			<ForcedRandomResponse stageName="Scenario" groupId="DivisionSelection50">
				<xsl:apply-templates select="ExecutionModel[@name='Scenario']/Data[@type='Scenario.RandomRequest.DivisionSelection']" mode="Force.GenericExecutionModelDataMapping" >
					<xsl:with-param name="StripMappingName">DivisionSelection</xsl:with-param>
					<xsl:with-param name="StripInfoName">DivisionSelection50</xsl:with-param>
				</xsl:apply-templates>
			</ForcedRandomResponse>
			<ForcedRandomResponse stageName="Scenario" groupId="DivisionSelection50">
				<xsl:apply-templates select="ExecutionModel[@name='Scenario']/Data[@type='Scenario.RandomRequest.ScenarioPerDivision']" mode="Force.GenericExecutionModelDataMapping" >
					<xsl:with-param name="StripMappingName" select="'ScenarioPerDivision'"/>
					<xsl:with-param name="StripInfoName" select="'ScenarioPerDivision'"/>
				</xsl:apply-templates>
			</ForcedRandomResponse>
			<!-- Price Point 100 -->
			<ForcedRandomResponse stageName="Scenario" groupId="DivisionSelection100">
				<xsl:apply-templates select="ExecutionModel[@name='Scenario']/Data[@type='Scenario.RandomRequest.DivisionSelection']" mode="Force.GenericExecutionModelDataMapping" >
					<xsl:with-param name="StripMappingName">DivisionSelection</xsl:with-param>
					<xsl:with-param name="StripInfoName">DivisionSelection100</xsl:with-param>
				</xsl:apply-templates>
			</ForcedRandomResponse>
			<ForcedRandomResponse stageName="Scenario" groupId="DivisionSelection100">
				<xsl:apply-templates select="ExecutionModel[@name='Scenario']/Data[@type='Scenario.RandomRequest.ScenarioPerDivision']" mode="Force.GenericExecutionModelDataMapping" >
					<xsl:with-param name="StripMappingName" select="'ScenarioPerDivision'"/>
					<xsl:with-param name="StripInfoName" select="'ScenarioPerDivision'"/>
				</xsl:apply-templates>
			</ForcedRandomResponse>
			<!-- Price Point 200 -->
			<ForcedRandomResponse stageName="Scenario" groupId="DivisionSelection200">
				<xsl:apply-templates select="ExecutionModel[@name='Scenario']/Data[@type='Scenario.RandomRequest.DivisionSelection']" mode="Force.GenericExecutionModelDataMapping" >
					<xsl:with-param name="StripMappingName">DivisionSelection</xsl:with-param>
					<xsl:with-param name="StripInfoName">DivisionSelection200</xsl:with-param>
				</xsl:apply-templates>
			</ForcedRandomResponse>
			<ForcedRandomResponse stageName="Scenario" groupId="DivisionSelection200">
				<xsl:apply-templates select="ExecutionModel[@name='Scenario']/Data[@type='Scenario.RandomRequest.ScenarioPerDivision']" mode="Force.GenericExecutionModelDataMapping" >
					<xsl:with-param name="StripMappingName" select="'ScenarioPerDivision'"/>
					<xsl:with-param name="StripInfoName" select="'ScenarioPerDivision'"/>
				</xsl:apply-templates>
			</ForcedRandomResponse>
			<!-- Price Point 300 -->
			<ForcedRandomResponse stageName="Scenario" groupId="DivisionSelection300">
				<xsl:apply-templates select="ExecutionModel[@name='Scenario']/Data[@type='Scenario.RandomRequest.DivisionSelection']" mode="Force.GenericExecutionModelDataMapping" >
					<xsl:with-param name="StripMappingName">DivisionSelection</xsl:with-param>
					<xsl:with-param name="StripInfoName">DivisionSelection300</xsl:with-param>
				</xsl:apply-templates>
			</ForcedRandomResponse>
			<ForcedRandomResponse stageName="Scenario" groupId="DivisionSelection300">
				<xsl:apply-templates select="ExecutionModel[@name='Scenario']/Data[@type='Scenario.RandomRequest.ScenarioPerDivision']" mode="Force.GenericExecutionModelDataMapping" >
					<xsl:with-param name="StripMappingName" select="'ScenarioPerDivision'"/>
					<xsl:with-param name="StripInfoName" select="'ScenarioPerDivision'"/>
				</xsl:apply-templates>
			</ForcedRandomResponse>
			<!-- Price Point 500 -->
			<ForcedRandomResponse stageName="Scenario" groupId="DivisionSelection500">
				<xsl:apply-templates select="ExecutionModel[@name='Scenario']/Data[@type='Scenario.RandomRequest.DivisionSelection']" mode="Force.GenericExecutionModelDataMapping" >
					<xsl:with-param name="StripMappingName">DivisionSelection</xsl:with-param>
					<xsl:with-param name="StripInfoName">DivisionSelection500</xsl:with-param>
				</xsl:apply-templates>
			</ForcedRandomResponse>
			<ForcedRandomResponse stageName="Scenario" groupId="DivisionSelection500">
				<xsl:apply-templates select="ExecutionModel[@name='Scenario']/Data[@type='Scenario.RandomRequest.ScenarioPerDivision']" mode="Force.GenericExecutionModelDataMapping" >
					<xsl:with-param name="StripMappingName" select="'ScenarioPerDivision'"/>
					<xsl:with-param name="StripInfoName" select="'ScenarioPerDivision'"/>
				</xsl:apply-templates>
			</ForcedRandomResponse>
			<!-- Price Point 1000 -->
			<ForcedRandomResponse stageName="Scenario" groupId="DivisionSelection1000">
				<xsl:apply-templates select="ExecutionModel[@name='Scenario']/Data[@type='Scenario.RandomRequest.DivisionSelection']" mode="Force.GenericExecutionModelDataMapping" >
					<xsl:with-param name="StripMappingName">DivisionSelection</xsl:with-param>
					<xsl:with-param name="StripInfoName">DivisionSelection1000</xsl:with-param>
				</xsl:apply-templates>
			</ForcedRandomResponse>
			<ForcedRandomResponse stageName="Scenario" groupId="DivisionSelection1000">
				<xsl:apply-templates select="ExecutionModel[@name='Scenario']/Data[@type='Scenario.RandomRequest.ScenarioPerDivision']" mode="Force.GenericExecutionModelDataMapping" >
					<xsl:with-param name="StripMappingName" select="'ScenarioPerDivision'"/>
					<xsl:with-param name="StripInfoName" select="'ScenarioPerDivision'"/>
				</xsl:apply-templates>
			</ForcedRandomResponse>
		</ForceData>
	</xsl:template>
	<xsl:template match="Data" mode="Force.GenericExecutionModelDataMapping">
		<xsl:param name="StripMappingName"/>
		<xsl:param name="StripInfoName"/>
		<xsl:variable name="componentDataName" select="@name" />
		<xsl:apply-templates select="/Paytable/PaytableData/ComponentsDataMapping/ComponentData[@name=$componentDataName]" mode="Force.GenericComponentDataMapping" >
			<xsl:with-param name="StripMappingName" select="$StripMappingName"/>
			<xsl:with-param name="StripInfoName" select="$StripInfoName"/>
		</xsl:apply-templates>
	</xsl:template>
	<xsl:template match="ComponentData" mode="Force.GenericComponentDataMapping">
		<xsl:param name="StripMappingName"/>
		<xsl:param name="StripInfoName"/>
		<xsl:apply-templates select="Data[@type='PopulationInfo']" mode="Force.GenericPopulationInfoDataMapping" >
			<xsl:with-param name="StripMappingName" select="$StripMappingName"/>
			<xsl:with-param name="StripInfoName" select="$StripInfoName"/>
		</xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Data" mode="Force.GenericPopulationInfoDataMapping">
		<xsl:param name="StripMappingName"/>
		<xsl:param name="StripInfoName"/>
		<xsl:variable name="populationInfoName" select="@name" />
		<xsl:apply-templates select="/Paytable/PaytableData/PopulationInfo[@name=$populationInfoName]" mode="Force.GenericPopulationInfoMapping" >
			<xsl:with-param name="StripMappingName" select="$StripMappingName"/>
			<xsl:with-param name="StripInfoName" select="$StripInfoName"/>
		</xsl:apply-templates>
	</xsl:template>
	<xsl:template match="PopulationInfo" mode="Force.GenericPopulationInfoMapping">
		<xsl:param name="StripMappingName"/>
		<xsl:param name="StripInfoName"/>
		<xsl:apply-templates select="Entry" mode="Force.GenericPopulationInfoEntryMapping">
			<xsl:with-param name="StripMappingName" select="$StripMappingName"/>
			<xsl:with-param name="StripInfoName" select="$StripInfoName"/>
		</xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Entry" mode="Force.GenericPopulationInfoEntryMapping">
		<xsl:param name="StripMappingName"/>
		<xsl:param name="StripInfoName"/>
		<xsl:variable name="EntryName" select="@name"/>
		<xsl:variable name="stripName" select="//Paytable/PaytableData/PopulationStripMapping[@name=$StripMappingName]/Map[@entry=$EntryName]/@strip"/>
		<RandomValue>
			<xsl:attribute name="max">
				<xsl:value-of select="sum(//Paytable/PaytableData/StripInfo[@name=$StripInfoName]/Strip[@name=$stripName]/Stop/@weight)" />
			</xsl:attribute>
			<xsl:value-of select="@name" />
		</RandomValue>
	</xsl:template>
	<xsl:template match="Strip" mode="Force.SumAllStopWeights">
		<xsl:value-of select="/Stop/@weight"/>
	</xsl:template>
	<!-- Removes unnecessary characters in resulting xml file -->
	<xsl:template match="*|@*|text()">
		<xsl:value-of select="$test" />
		<xsl:apply-templates />
	</xsl:template>
</xsl:stylesheet>