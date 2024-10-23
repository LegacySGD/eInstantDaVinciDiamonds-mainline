<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:variable name="test" select="/Paytable/@test" />
	<xsl:output encoding="UTF-8" indent="yes" method="html" />
	<xsl:include href="../ForceUtils.xsl" />
	<xsl:template match="/Paytable/PaytableData/ComponentsDataMapping">
		<html>
			<head>
				<title>Force</title>
				<style type="text/css">
		            div.panel {
		                display:block;
		                clear:both;
		                margin-top:3px;
		                margin-bottom:3px;
		            }
		            div.panel.price{
		            	text-align:center;
		            	font-size:25px;
		            }
		            div.panel.scenarioStart{
		                margin-top: 20px;
		            }
		            div.panel.submit {
		                display:block;
		                clear:both;
		                margin-top:20px;
		            }
		            input{
		                width:350px;
		                padding: 5px;
		            }
					input.check{
		                width:25px;
		            }
		            select{
		                width:300px;
		                padding: 5px;
		            }
		            p{
		                font-size:small;
		            }
		            label {
		                font-weight:bold;
		            }
		            div.panelGroup {
		                float:left;
		                margin-right:20px;
		                margin-top:10px;
		                margin-bottom:10px;
		                border: 1px;
		                border-style: solid;
		                padding:10px;
		            }
		        </style>
				<script type="text/javascript">
				<xsl:call-template name="ForceUtils.ImportJSUtils" />
				<![CDATA[
var visibleForm = "Force.Form50";
var prevDivSection = [];
function OnWindowLoad() {
	var pricePoints = [50, 100, 200, 300, 500, 1000];
	var numDivisions = 31;
	for (var price = 0; price < pricePoints.length; ++price) {
		prevDivSection.push(1);
		for (var div = 1; div <= numDivisions; ++div) {
			if (document.getElementById("DivisionSelection" + pricePoints[price] + ".Scenario.D" + div)) {
				document.getElementById("DivisionSelection" + pricePoints[price] + ".Scenario.D" + div + ".Input").value = "0";
				document.getElementById("DivisionSelection" + pricePoints[price] + ".Scenario.D" + div).setAttribute("hidden", "hidden");
			}
		}
	}

	document.getElementById("Force.Form100").setAttribute("hidden", "hidden");
	document.getElementById("Force.Form200").setAttribute("hidden", "hidden");
	document.getElementById("Force.Form300").setAttribute("hidden", "hidden");
	document.getElementById("Force.Form500").setAttribute("hidden", "hidden");
	document.getElementById("Force.Form1000").setAttribute("hidden", "hidden");

	divisionSelection50();
	document.getElementById("DivisionSelection50.Scenario.Division").setAttribute("onchange", "divisionSelection50()");
	divisionSelection100();
	document.getElementById("DivisionSelection100.Scenario.Division").setAttribute("onchange", "divisionSelection100()");
	divisionSelection200();
	document.getElementById("DivisionSelection200.Scenario.Division").setAttribute("onchange", "divisionSelection200()");
	divisionSelection300();
	document.getElementById("DivisionSelection300.Scenario.Division").setAttribute("onchange", "divisionSelection300()");
	divisionSelection500();
	document.getElementById("DivisionSelection500.Scenario.Division").setAttribute("onchange", "divisionSelection500()");
	divisionSelection1000();
	document.getElementById("DivisionSelection1000.Scenario.Division").setAttribute("onchange", "divisionSelection1000()");
	// Set the href for Share Scenario Data
	//document.getElementById("scenarioDataLink").href = "?pricepoint=0&forceodetype=0&revealdivision=1&revealpage=1";
	// Set the href for Unique Scenario Data per Price Point
	document.getElementById("scenarioDataLink").href = "?pricepoint=" + document.getElementById("selectedPricePoint").value + "&forceodetype=0&revealdivision=1&revealpage=1";
}

function updatePricePoints() {
	var sectionName = "Force.Form" + document.getElementById("selectedPricePoint").value;
	document.getElementById(visibleForm).setAttribute("hidden", "hidden");
	document.getElementById(sectionName).removeAttribute("hidden");
	visibleForm = sectionName;
	// Set the href for Share Scenario Data
	//document.getElementById("scenarioDataLink").href = "?pricepoint=0&forceodetype=0&revealdivision=1&revealpage=1";
	// Set the href for Unique Scenario Data per Price Point
	document.getElementById("scenarioDataLink").href = "?pricepoint=" + document.getElementById("selectedPricePoint").value + "&forceodetype=0&revealdivision=1&revealpage=1";
}
function divisionSelection50() {
	document.getElementById("DivisionSelection50.Scenario.D" + prevDivSection[0]).setAttribute("hidden", "hidden");
	var index = document.getElementById("DivisionSelection50.Scenario.Division").selectedIndex;
	var divisionNum = document.getElementById("DivisionSelection50.Scenario.Division")[index].text;
	document.getElementById("DivisionSelection50.Scenario.D" + divisionNum).removeAttribute("hidden");
	prevDivSection[0] = divisionNum;
}
function divisionSelection100() {
	document.getElementById("DivisionSelection100.Scenario.D" + prevDivSection[1]).setAttribute("hidden", "hidden");
	var index = document.getElementById("DivisionSelection100.Scenario.Division").selectedIndex;
	var divisionNum = document.getElementById("DivisionSelection100.Scenario.Division")[index].text;
	document.getElementById("DivisionSelection100.Scenario.D" + divisionNum).removeAttribute("hidden");
	prevDivSection[1] = divisionNum;
}
function divisionSelection200() {
	document.getElementById("DivisionSelection200.Scenario.D" + prevDivSection[2]).setAttribute("hidden", "hidden");
	var index = document.getElementById("DivisionSelection200.Scenario.Division").selectedIndex;
	var divisionNum = document.getElementById("DivisionSelection200.Scenario.Division")[index].text;
	document.getElementById("DivisionSelection200.Scenario.D" + divisionNum).removeAttribute("hidden");
	prevDivSection[2] = divisionNum;
}
function divisionSelection300() {
	document.getElementById("DivisionSelection300.Scenario.D" + prevDivSection[3]).setAttribute("hidden", "hidden");
	var index = document.getElementById("DivisionSelection300.Scenario.Division").selectedIndex;
	var divisionNum = document.getElementById("DivisionSelection300.Scenario.Division")[index].text;
	document.getElementById("DivisionSelection300.Scenario.D" + divisionNum).removeAttribute("hidden");
	prevDivSection[3] = divisionNum;
}
function divisionSelection500() {
	document.getElementById("DivisionSelection500.Scenario.D" + prevDivSection[4]).setAttribute("hidden", "hidden");
	var index = document.getElementById("DivisionSelection500.Scenario.Division").selectedIndex;
	var divisionNum = document.getElementById("DivisionSelection500.Scenario.Division")[index].text;
	document.getElementById("DivisionSelection500.Scenario.D" + divisionNum).removeAttribute("hidden");
	prevDivSection[4] = divisionNum;
}
function divisionSelection1000() {
	document.getElementById("DivisionSelection1000.Scenario.D" + prevDivSection[5]).setAttribute("hidden", "hidden");
	var index = document.getElementById("DivisionSelection1000.Scenario.Division").selectedIndex;
	var divisionNum = document.getElementById("DivisionSelection1000.Scenario.Division")[index].text;
	document.getElementById("DivisionSelection1000.Scenario.D" + divisionNum).removeAttribute("hidden");
	prevDivSection[5] = divisionNum;
}
window.onload = OnWindowLoad;
				]]>
				</script>
			</head>
			<body>
				<div class="panel">
		            <a href="?forceodetype=0&amp;revealdivision=1&amp;revealpage=1" target="_blank" id="scenarioDataLink">View All Scenario Data</a>
		        </div>
		        <div class="panel">
					<label>Price Point Selection:</label>
		        	<select id="selectedPricePoint" onchange="updatePricePoints()">
                        <option id="DivisionSelection50" value="50">50</option>
                        <option id="DivisionSelection100" value="100">100</option>
                        <option id="DivisionSelection200" value="200">200</option>
                        <option id="DivisionSelection300" value="300">300</option>
                        <option id="DivisionSelection500" value="500">500</option>
                        <option id="DivisionSelection1000" value="1000">1000</option>
                    </select>
                </div>
				<div class="panel">
					<form method="get" id="Force.Form50">
					<input name="groupId" type="hidden" value="DivisionSelection50" />
					<div class="panelGroup" id="DivisionSelection50">
						<div class="panel price">
							<h3>Price Point 50</h3>
						</div>
						<xsl:call-template name="ForceUtils.CreateForceToolSection.PopulatorWithStripMapping">
							<xsl:with-param name="executionModelName" select="'Scenario'"/>
							<xsl:with-param name="stageComponentName" select="'Scenario.RandomRequest.DivisionSelection'"/>
							<xsl:with-param name="optionalStripInfoName" select="'DivisionSelection50'"/>
							<xsl:with-param name="optionalGroupID" select="'DivisionSelection50'"/>
						</xsl:call-template>
						<xsl:apply-templates select="/Paytable/PaytableData/PopulationInfo[@name='ScenarioPerDivision']" mode="Force.PopulationIW" >
							<xsl:with-param name="stageName" select="'Scenario'"/>
							<xsl:with-param name="groupID" select="'DivisionSelection50'"/>
							<xsl:with-param name="stripMappingName" select="'ScenarioPerDivision'"/>
							<xsl:with-param name="stripInfoName" select="'ScenarioPerDivision'"/>
						</xsl:apply-templates>
						<div class="panel submit">
							<input type="submit" value="Force price point 50"></input>
						</div>
					</div>
				</form>
				</div>
				<div class="panel">
					<form method="get" id="Force.Form100">
					<input name="groupId" type="hidden" value="DivisionSelection100" />
					<div class="panelGroup" id="DivisionSelection100">
						<div class="panel price">
							<h3>Price Point 100</h3>
						</div>
						<xsl:call-template name="ForceUtils.CreateForceToolSection.PopulatorWithStripMapping">
							<xsl:with-param name="executionModelName" select="'Scenario'"/>
							<xsl:with-param name="stageComponentName" select="'Scenario.RandomRequest.DivisionSelection'"/>
							<xsl:with-param name="optionalStripInfoName" select="'DivisionSelection100'"/>
							<xsl:with-param name="optionalGroupID" select="'DivisionSelection100'"/>
						</xsl:call-template>

						<xsl:apply-templates select="/Paytable/PaytableData/PopulationInfo[@name='ScenarioPerDivision']" mode="Force.PopulationIW" >
							<xsl:with-param name="stageName" select="'Scenario'"/>
							<xsl:with-param name="groupID" select="'DivisionSelection100'"/>
							<xsl:with-param name="stripMappingName" select="'ScenarioPerDivision'"/>
							<xsl:with-param name="stripInfoName" select="'ScenarioPerDivision'"/>
						</xsl:apply-templates>
						<div class="panel submit">
							<input type="submit" value="Force price point 100"></input>
						</div>
					</div>
				</form>
				</div>
				<div class="panel">
					<form method="get" id="Force.Form200">
					<input name="groupId" type="hidden" value="DivisionSelection200" />
					<div class="panelGroup" id="DivisionSelection200">
						<div class="panel price">
							<h3>Price Point 200</h3>
						</div>
						<xsl:call-template name="ForceUtils.CreateForceToolSection.PopulatorWithStripMapping">
							<xsl:with-param name="executionModelName" select="'Scenario'"/>
							<xsl:with-param name="stageComponentName" select="'Scenario.RandomRequest.DivisionSelection'"/>
							<xsl:with-param name="optionalStripInfoName" select="'DivisionSelection200'"/>
							<xsl:with-param name="optionalGroupID" select="'DivisionSelection200'"/>
						</xsl:call-template>
						
						<xsl:apply-templates select="/Paytable/PaytableData/PopulationInfo[@name='ScenarioPerDivision']" mode="Force.PopulationIW" >
							<xsl:with-param name="stageName" select="'Scenario'"/>
							<xsl:with-param name="groupID" select="'DivisionSelection200'"/>
							<xsl:with-param name="stripMappingName" select="'ScenarioPerDivision'"/>
							<xsl:with-param name="stripInfoName" select="'ScenarioPerDivision'"/>
						</xsl:apply-templates>
						<div class="panel submit">
							<input type="submit" value="Force price point 200"></input>
						</div>
					</div>
				</form>
				</div>
				<div class="panel">
					<form method="get" id="Force.Form300">
					<input name="groupId" type="hidden" value="DivisionSelection300" />
					<div class="panelGroup" id="DivisionSelection300">
						<div class="panel price">
							<h3>Price Point 300</h3>
						</div>
						<xsl:call-template name="ForceUtils.CreateForceToolSection.PopulatorWithStripMapping">
							<xsl:with-param name="executionModelName" select="'Scenario'"/>
							<xsl:with-param name="stageComponentName" select="'Scenario.RandomRequest.DivisionSelection'"/>
							<xsl:with-param name="optionalStripInfoName" select="'DivisionSelection300'"/>
							<xsl:with-param name="optionalGroupID" select="'DivisionSelection300'"/>
						</xsl:call-template>
						
						
						<xsl:apply-templates select="/Paytable/PaytableData/PopulationInfo[@name='ScenarioPerDivision']" mode="Force.PopulationIW" >
							<xsl:with-param name="stageName" select="'Scenario'"/>
							<xsl:with-param name="groupID" select="'DivisionSelection300'"/>
							<xsl:with-param name="stripMappingName" select="'ScenarioPerDivision'"/>
							<xsl:with-param name="stripInfoName" select="'ScenarioPerDivision'"/>
						</xsl:apply-templates>
						<div class="panel submit">
							<input type="submit" value="Force price point 300"></input>
						</div>
					</div>
				</form>
				</div>
				<div class="panel">
					<form method="get" id="Force.Form500">
					<input name="groupId" type="hidden" value="DivisionSelection500" />
					<div class="panelGroup" id="DivisionSelection500">
						<div class="panel price">
							<h3>Price Point 500</h3>
						</div>
						<xsl:call-template name="ForceUtils.CreateForceToolSection.PopulatorWithStripMapping">
							<xsl:with-param name="executionModelName" select="'Scenario'"/>
							<xsl:with-param name="stageComponentName" select="'Scenario.RandomRequest.DivisionSelection'"/>
							<xsl:with-param name="optionalStripInfoName" select="'DivisionSelection500'"/>
							<xsl:with-param name="optionalGroupID" select="'DivisionSelection500'"/>
						</xsl:call-template>
						<xsl:apply-templates select="/Paytable/PaytableData/PopulationInfo[@name='ScenarioPerDivision']" mode="Force.PopulationIW" >
							<xsl:with-param name="stageName" select="'Scenario'"/>
							<xsl:with-param name="groupID" select="'DivisionSelection500'"/>
							<xsl:with-param name="stripMappingName" select="'ScenarioPerDivision'"/>
							<xsl:with-param name="stripInfoName" select="'ScenarioPerDivision'"/>
						</xsl:apply-templates>
						<div class="panel submit">
							<input type="submit" value="Force price point 500"></input>
						</div>
					</div>
				</form>
				</div>
				<div class="panel">
					<form method="get" id="Force.Form1000">
					<input name="groupId" type="hidden" value="DivisionSelection1000" />
					<div class="panelGroup" id="DivisionSelection1000">
						<div class="panel price">
							<h3>Price Point 1000</h3>
						</div>
						<xsl:call-template name="ForceUtils.CreateForceToolSection.PopulatorWithStripMapping">
							<xsl:with-param name="executionModelName" select="'Scenario'"/>
							<xsl:with-param name="stageComponentName" select="'Scenario.RandomRequest.DivisionSelection'"/>
							<xsl:with-param name="optionalStripInfoName" select="'DivisionSelection1000'"/>
							<xsl:with-param name="optionalGroupID" select="'DivisionSelection1000'"/>
						</xsl:call-template>
						
						<xsl:apply-templates select="/Paytable/PaytableData/PopulationInfo[@name='ScenarioPerDivision']" mode="Force.PopulationIW" >
							<xsl:with-param name="stageName" select="'Scenario'"/>
							<xsl:with-param name="groupID" select="'DivisionSelection1000'"/>
							<xsl:with-param name="stripMappingName" select="'ScenarioPerDivision'"/>
							<xsl:with-param name="stripInfoName" select="'ScenarioPerDivision'"/>
						</xsl:apply-templates>
						<div class="panel submit">
							<input type="submit" value="Force price point 1000"></input>
						</div>
					</div>
				</form>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="PopulationInfo" mode="Force.PopulationIW">
		<xsl:param name="stageName"/>
		<xsl:param name="groupID"/>
		<xsl:param name="stripMappingName"/>
		<xsl:param name="stripInfoName"/>
		<xsl:apply-templates select="Entry" mode="Force.EntryIW">
			<xsl:with-param name="stageName" select="$stageName"/>
			<xsl:with-param name="groupID" select="$groupID"/>
			<xsl:with-param name="stripMappingName" select="$stripMappingName"/>
			<xsl:with-param name="stripInfoName" select="$stripInfoName"/>
		</xsl:apply-templates>
	</xsl:template>
	
	<xsl:template match="Entry" mode="Force.EntryIW">
		<xsl:param name="stageName"/>
		<xsl:param name="groupID"/>
		<xsl:param name="stripMappingName"/>
		<xsl:param name="stripInfoName"/>
		<xsl:variable name="EntryName" select="@name"/>
		<xsl:variable name="stripName" select="//Paytable/PaytableData/PopulationStripMapping[@name=$stripMappingName]/Map[@entry=$EntryName]/@strip"/>
		<xsl:variable name="scenarioWeight" select="sum(//Paytable/PaytableData/StripInfo[@name=$stripInfoName]/Strip[@name=$stripName]/Stop/@weight) - 1" />
		<div id="{$groupID}.{$stageName}.{@name}">
			<div class="panel">
				<label>Scenario Index <!--(<xsl:value-of select="@name"/>)--> between 0-<xsl:value-of select="$scenarioWeight"/>:</label>
			</div>
			<div class="panel">
				<input name="{$groupID}.{$stageName}.{@name}" id="{$groupID}.{$stageName}.{@name}.Input" type="text"/>
			</div>
		</div>	
	</xsl:template>
	<xsl:template match="*|@*|text()">
		<xsl:value-of select="$test" />
		<xsl:apply-templates />
	</xsl:template>
</xsl:stylesheet>