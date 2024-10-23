<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:x="anything">
	<xsl:namespace-alias stylesheet-prefix="x" result-prefix="xsl"/>
	<xsl:output encoding="UTF-8" indent="yes" method="xml" />
	<xsl:include href="../utils.xsl"/>

	<xsl:template match="/Paytable">
		<x:stylesheet version="1.0" xmlns:java="http://xml.apache.org/xslt/java" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
			exclude-result-prefixes="java" xmlns:lxslt="http://xml.apache.org/xslt" xmlns:my-ext="ext1" extension-element-prefixes="my-ext">
			<x:import href="HTML-CCFR.xsl" />
			<x:output indent="no" method="xml" omit-xml-declaration="yes" />
			
			<!--
			TEMPLATE
			Match:
			-->
			<x:template match="/">
				<x:apply-templates select="*"/>
				<x:apply-templates select="/output/root[position()=last()]" mode="last"/>
				<br/>
			</x:template>
			<lxslt:component prefix="my-ext" functions="formatJson retrievePrizeTable">
				<lxslt:script lang="javascript">
					<![CDATA[
function formatJson(jsonContext, translations, prizeValues, prizeNamesDesc) {
	var scenario = getScenario(jsonContext);
	var tranMap = parseTranslations(translations);
	var prizeMap = parsePrizes(prizeNamesDesc, prizeValues);
	return doFormatJson(scenario, tranMap, prizeMap);
}
function doFormatJson(scenario, tranMap, prizeMap) {
	var indicator = scenario.split("|")[0];
	var playGrid = scenario.split("|")[1];
	var result = new ScenarioConvertor().convert(indicator, playGrid);

	var r = [];
	r.push('<table border="0" cellpadding="2" cellspacing="1" width="100%" class="gameDetailsTable" style="table-layout:fixed">');
	r.push('<tr>');
	r.push('<td class="tablehead" width="100%" colspan="5">');
	r.push(tranMap.outcomeLabel);
	r.push('</td>');
	r.push('</tr>');

	function _parseSymbol(e, delimiter) {
		var arr = null;
		if (e.length == 1) {
			r.push(tranMap[e]);
		} else if (e.length == 2) {
			arr = e.split("");
			r.push(tranMap[arr[0]] + delimiter + tranMap[arr[1]]);
		}
	}

	result.outcomeTable.forEach(function (row) {
		r.push('<tr>');
		row.forEach(function (col) {
			r.push('<td class="tablebody" width="20%">');
			r.push(_parseSymbol(col, " / "));
			r.push('</td>');
		});
		r.push('</tr>');
	});

	r.push('<tr>');
	r.push('<td class="tablehead" width="60%" colspan="3">');
	r.push(tranMap.lineLabel);
	r.push('</td>');
	r.push('<td class="tablehead" width="20%">');
	r.push(tranMap.winLabel);
	r.push('</td>');
	r.push('<td class="tablehead" width="20%">');
	r.push(tranMap.winPrizeLabel);
	r.push('</td>');
	r.push('</tr>');
	result.resultTable.forEach(function (line) {
		r.push('<tr>');
		r.push('<td class="tablebody" width="60%" colspan="3">');
		var lineIdx = 0;
		line[0].forEach(function (e) {
			lineIdx++;
			r.push(tranMap[e]);
			if (lineIdx < 3) {
				r.push(", ");
			}
		});
		r.push('</td>');
		r.push('<td class="tablebody" width="20%">');
		if (line[1] === undefined) {
			r.push(tranMap.noWinLabel);
		} else {
			r.push(line[1][1]);
		}
		r.push('</td>');
		r.push('<td class="tablebody" width="20%">');
		if (line[1] === undefined) {
			r.push(" - ");
		} else {
			r.push(prizeMap[line[1][0]]);
		}
		r.push('</td>');
		r.push('</tr>');
	});
	r.push('</table>');
	return r.join('');
}
function getScenario(jsonContext) {
	var jsObj = JSON.parse(jsonContext);
	var scenario = jsObj.scenario;
	scenario = scenario.replace(/\0/g, '');
	return scenario;
}
function parsePrizes(prizeNamesDesc, prizeValues) {
	var prizeNames = (prizeNamesDesc.substring(1)).split(',');
	var convertedPrizeValues = (prizeValues.substring(1)).split('|');
	var map = [];
	for (var idx = 0; idx < prizeNames.length; idx++) {
		map[prizeNames[idx]] = convertedPrizeValues[idx];
	}
	return map;
}
function parseTranslations(translationNodeSet) {
	var map = [];
	var list = translationNodeSet.item(0).getChildNodes();
	for (var idx = 1; idx < list.getLength(); idx++) {
		var childNode = list.item(idx);
		if (childNode.name == "phrase") {
			map[childNode.getAttribute("key")] = childNode.getAttribute("value");
		}
	}
	return map;
}

function Result(lineArr, indicator, outcomeTable) {
	var map = _parseWinMap();
	function _parseWinMap() {
		var map = {"A": 0, "B": 0, "C": 0, "D": 0, "E": 0, "F": 0};
		lineArr.forEach(function (e) {
			if (e.prize !== null) {
				map[e.prize]++;
			}
		});
		return map;
	}
	function _parseLayout() {
		var idx = parseInt(indicator);
		switch (idx) {
			case 1:
				return [0, 1, 3, 4];
			case 2:
				return [1, 2, 4, 5];
			case 3:
				return [3, 4, 6, 7];
			case 4:
				return [4, 5, 7, 8];
			default:
				return null;
		}
	}
	function _parseWinPrizeSymbols() {
		var rtn = {};
		Object.keys(map).forEach(function (key) {
			var val = map[key];
			if (val !== 0) {
				rtn[key] = [key + val, val];
			}
		});
		return rtn;
	}
	function _parseWinPrizeSymbolsWithLines() {
		var rtn = {};
		lineArr.forEach(function (line) {
			if (line.prize !== null) {
				if (rtn[line.prize] === undefined) {
					rtn[line.prize] = [];
				}
				rtn[line.prize].push(line);
			}
		});
		return rtn;
	}
	function _parseResultTable(winPrizeSymbols) {
		var arr = [];
		var grids = ["A", "B", "C", "D", "E", "F"];
		grids.forEach(function (e) {
			var a = [e, e, e];
			var b = winPrizeSymbols[e];
			arr.push([a, b]);
		});
		return arr;
	}
	var _layout = _parseLayout(indicator);
	var _winPrizeSymbols = _parseWinPrizeSymbols();
	var _winPrizeSymbolsWithLines = _parseWinPrizeSymbolsWithLines();
	var _resultTable = _parseResultTable(_winPrizeSymbols);
	return {
		lines: lineArr,
		indicator: indicator,
		layout: _layout,
		winPrizeSymbols: _winPrizeSymbols,
		winPrizeSymbolsWithLines: _winPrizeSymbolsWithLines,
		outcomeTable: outcomeTable,
		resultTable: _resultTable
	};
}
function Line(prize, playGrid, winLine) {
	return {
		prize: prize,
		playGrid: playGrid,
		winLine: winLine,
		gridText: playGrid.join()
	};
}
function ScenarioConvertor() {
	return {
		convert: function (indicator, playGrid) {
			function _parseWinPrizeSymbol(a, b, c) {
				if (a.length == 1 && (b.indexOf(a) != -1 && c.indexOf(a) != -1)) {
					return a;
				} else if (b.length == 1 && (a.indexOf(b) != -1 && c.indexOf(b) != -1)) {
					return b;
				} else if (c.length == 1 && (a.indexOf(c) != -1 && b.indexOf(c) != -1)) {
					return c;
				}
				return null;
			}
			function _buildLine(gridDataArr, lineIdxArr) {
				var rtn = [];
				var a = gridDataArr[lineIdxArr[0]];
				var b = gridDataArr[lineIdxArr[1]];
				var c = gridDataArr[lineIdxArr[2]];
				var playGridArr = [a, b, c];
				var prizeSymbol = _parseWinPrizeSymbol(a, b, c);
				if (prizeSymbol === null && (a.length == 2 && b.length == 2 && c.length == 2)) {
					var e = a.charAt(0);
					var f = a.charAt(1);
					var prizeSymbolA = _parseWinPrizeSymbol(e, b, c);
					var prizeSymbolB = _parseWinPrizeSymbol(f, b, c);
					var winRtnA = (prizeSymbolA !== null);
					var winRtnB = (prizeSymbolB !== null);
					if (winRtnA && winRtnB) {
						rtn.push(new Line(prizeSymbolA, playGridArr, winRtnA));
						rtn.push(new Line(prizeSymbolB, playGridArr, winRtnB));
					} else if (winRtnA && !winRtnB) {
						rtn.push(new Line(prizeSymbolA, playGridArr, winRtnA));
					} else if (!winRtnA && winRtnB) {
						rtn.push(new Line(prizeSymbolB, playGridArr, winRtnB));
					} else if (!winRtnA && !winRtnB) {
						rtn.push(new Line(null, playGridArr, false));
					}
				} else if (prizeSymbol !== null) {
					rtn.push(new Line(prizeSymbol, playGridArr, true));
				} else if (prizeSymbol === null) {
					rtn.push(new Line(null, playGridArr, false));
				}
				return rtn;
			}
			var _gridDataArr = playGrid.split(",");
			function _generateLine() {
				var lineRtn = [];
				var lineArr;
				var linesIdxArrs = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]];
				var lineIdxArr;
				for (var idx = 0; idx < linesIdxArrs.length; idx++) {
					lineIdxArr = linesIdxArrs[idx];
					lineArr = _buildLine(_gridDataArr, lineIdxArr);
					if (lineArr.length > 1) {
						lineRtn.push(lineArr[0]);
						lineRtn.push(lineArr[1]);
					} else {
						lineRtn.push(lineArr[0]);
					}
				}
				return lineRtn;
			}
			function _buildOutcomeTable() {
				var _outcomeTable = [];
				var idx = 0;
				var a, b, c;
				for (idx = 0; idx < _gridDataArr.length; idx += 3) {
					a = _gridDataArr[idx];
					b = _gridDataArr[idx + 1];
					c = _gridDataArr[idx + 2];
					_outcomeTable.push([a, b, c]);
				}
				return _outcomeTable;
			}
			var rtn = new Result(_generateLine(), indicator, _buildOutcomeTable());
			return rtn;
		}
	};
}
					]]>
				</lxslt:script>
			</lxslt:component>
			<x:template match="root" mode="last">
				<table border="0" cellpadding="1" cellspacing="1" width="100%" class="gameDetailsTable">
					<tr>
						<td valign="top" class="subheader">
							<x:value-of select="//translation/phrase[@key='totalWager']/@value" />
							<x:value-of select="': '" />
							<x:call-template name="Utils.ApplyConversionByLocale">
								<x:with-param name="multi" select="/output/denom/percredit"/>
								<x:with-param name="value" select="//ResultData/WagerOutcome[@name='Game.Total']/@amount"/>
								<x:with-param name="code" select="/output/denom/currencycode"/>
								<x:with-param name="locale" select="//translation/@language"/>
							</x:call-template>
						</td>
					</tr>
					<tr>
						<td valign="top" class="subheader">
							<x:value-of select="//translation/phrase[@key='totalWins']/@value" />
							<x:value-of select="': '" />
							<x:call-template name="Utils.ApplyConversionByLocale">
								<x:with-param name="multi" select="/output/denom/percredit"/>
								<x:with-param name="value" select="//ResultData/PrizeOutcome[@name='Game.Total']/@totalPay" />
								<x:with-param name="code" select="/output/denom/currencycode"/>
								<x:with-param name="locale" select="//translation/@language"/>
							</x:call-template>
						</td>
					</tr>
				</table>
			</x:template>
		
			<!--
			TEMPLATE
			Match:		digested/game
			-->
			<x:template match="//Outcome">
				<x:if test="OutcomeDetail/Stage = 'Scenario'">
					<x:call-template name="History.Detail" />
				</x:if>
				<x:if test="OutcomeDetail/Stage = 'Wager' and OutcomeDetail/NextStage = 'Wager'">
					<x:call-template name="History.Detail" />
				</x:if>
			</x:template>
		
			<!--
			TEMPLATE
			Name:		Wager.Detail (base game)
			-->
			<x:template name="History.Detail">
				<table border="0" cellpadding="0" cellspacing="0" width="100%" class="gameDetailsTable">
					<tr>
						<td class="tablebold" background="">
							<x:value-of select="//translation/phrase[@key='transactionId']/@value"/>
							<x:value-of select="': '"/>
							<x:value-of select="OutcomeDetail/RngTxnId"/>
						</td>
					</tr>
				</table>
				<x:variable name="odeResponseJson" select="string(//ResultData/JSONOutcome[@name='ODEResponse']/text())" />
				<x:variable name="translations" select="lxslt:nodeset(//translation)" />
				<x:variable name="wageredPricePoint" select="string(//ResultData/WagerOutcome[@name='Game.Total']/@amount)" />
				<x:variable name="prizeTable" select="lxslt:nodeset(//lottery)" />
				<x:variable name="convertedPrizeValues">
					<x:apply-templates select="//lottery/prizetable/prize" mode="PrizeValue"/>
				</x:variable>
				<x:variable name="prizeNames">
					<x:apply-templates select="//lottery/prizetable/description" mode="PrizeDescriptions"/>
				</x:variable>
				<x:value-of select="my-ext:formatJson($odeResponseJson, $translations, string($convertedPrizeValues), string($prizeNames))" disable-output-escaping="yes" />
			</x:template>
		
			<x:template match="prize" mode="PrizeValue">
					<x:text>|</x:text>
					<x:call-template name="Utils.ApplyConversionByLocale">
						<x:with-param name="multi" select="/output/denom/percredit" />
					<x:with-param name="value" select="text()" />
						<x:with-param name="code" select="/output/denom/currencycode" />
						<x:with-param name="locale" select="//translation/@language" />
					</x:call-template>
			</x:template>
			<x:template match="description" mode="PrizeDescriptions">
				<x:text>,</x:text>
				<x:value-of select="text()" />
			</x:template>
			
			<x:template match="text()"/>
			
		</x:stylesheet>
	</xsl:template>
	
	<xsl:template name="TemplatesForResultXSL">
		<x:template match="@aClickCount">
		    <clickcount>
		        <x:value-of select="."/>
		    </clickcount>
		</x:template>
		<x:template match="*|@*|text()">
		    <x:apply-templates/>
		</x:template>
	</xsl:template>
	
</xsl:stylesheet>
