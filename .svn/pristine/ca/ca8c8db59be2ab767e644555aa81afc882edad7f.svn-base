<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<c:import url="/WEB-INF/views/common/header.jsp" />
<script>
	$(function() {
		jqgridTrans = $('#A');
		jqgridTrans.jqGrid({
			datatype : "local",
			colNames : [ "枠", "仕様項目", "仕様詳細", "単位", "定価", "個数", "入力", "小計" ],
			colModel : [ {
				name : 'framecode'
			}, {
				name : 'specitem'
			}, {
				name : 'specdetail'
			}, {
				name : 'unit'
			}, {
				name : 'listprice'
			}, {
				name : ''
			}, {
				name : ''
			}, {
				name : ''
			}, ],
			height : 180, //or auto, defaultHeight
			width : 1315,
			//autowidth : false,
			shrinkToFit : true,
			rowNum : 50, //rownum	
			// pager : "#pager", //paging
			viewrecords : true,
			// multiselect : true,
			// rownumbers : true,
			useColSpanStyle : true,
			emptyrecords : "empty",
			loadComplete : function(data) {
				// initPage("wrapper", "", "");
			},
		});
	});

	var oldTab;
	var obj1;
	var obj2;
	function searchClk() {
		if (obj1 != null) {
			obj1.style.display = "none";
		} else if (obj2 != null) {
			obj2.style.display = "none";
		} else if (oldTab != null) {
			oldTab.style.display = "none";
		}
		var bodytype = $('#combovalue').val();
		oldTab = "tabsA";

		$(function() {
			$("#tabs1").tabs();
		});
		var $target = $("ul[id='tabs1ul']");
		$target.empty();

		/* if (bodytype == 1) {
		$(function() {
			$("#tabs1").tabs();
		});
		document.getElementById('tabs1').style.display = '';
		document.getElementById('tabs2').style.display = 'none';
		var $target = $("ul[id='tabs1ul']");
		} else if (bodytype == 2) {
		$(function() {
			$("#tabs2").tabs();
		});
		document.getElementById('tabs2').style.display = '';
		document.getElementById('tabs1').style.display = 'none';
		var $target = $("ul[id='tabs2ul']");
		} */

		$.ajax({
					type : "POST",
					url : "searchTabname.ajax",
					data : {
						'mastertype' : bodytype
					},
					dataType : "json",
					beforeSend : function() {
					},
					error : function(request, status, error) {
						console.log(" code : " + request.status + " message : "
								+ request.responseText + " error : " + error);
					},
					success : function(data) {
						var result = data.searchTabname;
						for (var i = 0; i < result.length; i++) {
							var stabname = "'tabs" + result[i].tabname + "'";
							$('#tabs1ul').append(
									$('<li><a href="#tabs' + result[i].tabname
											+ '" onclick="changeDisplay('
											+ stabname + ');">'
											+ result[i].tabname + "</a></li>"));
						}
						for (var i = 0; i < result.length; i++) {
							createTable(result[i].tabname);
						}
					},
					complete : function(data) {
					}
				});
		return false;
	}

	function changeDisplay(tabid) {
		obj1 = document.getElementById(oldTab);
		obj1.style.display = "none";
		obj2 = document.getElementById(tabid);
		obj2.style.display = "block";
		oldTab = tabid;
	}

	function createTable(tabname) {
		$(function() {
			jqgridTrans = $('#' + tabname);
			jqgridTrans
					.jqGrid({
						datatype : "local",
						colNames : [ "枠", "仕様項目", "仕様詳細", "単位", "定価", "個数",
								"入力", "小計" ], // colname
						colModel : [ {
							name : 'framecode'
						}, {
							name : 'specitem'
						}, {
							name : 'specdetail'
						}, {
							name : 'unit'
						}, {
							name : 'listprice'
						}, {
							name : ''
						}, {
							name : ''
						}, {
							name : ''
						}, ],
						height : 180, //or auto, defaultHeight
						width : 1315,
						//autowidth : false,
						shrinkToFit : true,
						rowNum : 50, //rownum	
						// pager : "#pager", //paging
						viewrecords : true,
						// multiselect : true,
						// rownumbers : true,
						useColSpanStyle : true,
						emptyrecords : "empty",
						loadComplete : function(data) {
							// initPage("wrapper", "", "");
						},
						// ondblClickRow : function(rowid, iRow, iCol, e) {
						// var data = jQuery('#wrapper').jqGrid('getRowData', rowid);
						// alert(data);
						// },
					});
		});

		$.ajax({
			type : "POST",
			url : "searchByBodyType.ajax",
			data : {
				'mastertype' : $('#combovalue').val(),
				'tabname' : tabname
			},
			dataType : "json",
			beforeSend : function() {
				// startLoading();
			},
			error : function(request, status, error) {
				console.log(" code : " + request.status + " message : "
						+ request.responseText + " error : " + error);
			},
			success : function(data) {
				// alert("success");
				// if (!ajaxSessionCheck(data))
				// return false;
				var result = data.searchByBodyType;
				if (result != undefined && result.length > 0) {
					$('#' + tabname).jqGrid("clearGridData");
					$('#' + tabname).jqGrid("setGridParam", {
						dataType : "local",
						data : result
					}).trigger("reloadGrid");
				} else {
					$('#' + tabname).jqGrid("clearGridData");
					alert("検索条件と一致する情報がありません。");
				}
			},
			complete : function(data) {
				// alert("complete");
			}
		});
		return false;
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新車見積</title>
</head>
<body>
	<div id="cus_header">
		<h1 align="center">新車見積</h1>
	</div>
	<div id="estimateRepair_top">
		<form id="topform" method="post">
			<fieldset>
				<span>新車見積選択</span>
				<table>
					<tr>
						<td><span>ボデータイプ</span></td>
						<td width="10%">*</td>
						<td><select id="combovalue">
								<c:forEach items="${selectBodyType }" var="bodyType">
									<option value="${bodyType.combotype }">${bodyType.comboname }</option>
								</c:forEach>
						</select></td>
						<td width="30%"></td>
						<td><input type="button" value="検索"
							onclick="searchClk(); return false;"></td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>

	<div id="cus_middle">
		<fieldset style="height: 430px">
			<span>修理見積</span>
			<div id="tabs1">
				<ul id=tabs1ul>
				</ul>
				
				<div id="tabsA" style="display: block">
					<table id="A"></table>
				</div>

				<div id="tabsB" style="display: none">
					<table id="B"></table>
				</div>

				<div id="tabsC" style="display: none">
					<table id="C"></table>
				</div>

				<div id="tabsD" style="display: none">
					<table id="D"></table>
				</div>

				<div id="tabsE" style="display: none">
					<table id="E"></table>
				</div>

				<div id="tabsF" style="display: none">
					<table id="F"></table>
				</div>

				<div id="tabsG" style="display: none">
					<table id="G"></table>
				</div>

				<div id="tabsH" style="display: none">
					<table id="H"></table>
				</div>
			</div>

			<table width=100% border=0 cellspacing=0>
				<tr>
					<td bgcolor=skyblue>A件合計</td>
					<td><input type=text size=10 name="sumA" id="sumA"></td>
					<td bgcolor=skyblue>B件合計</td>
					<td><input type=text size=10 name="sumB" id="sumB"></td>
					<td bgcolor=skyblue>C件合計</td>
					<td><input type=text size=10 name="sumC" id="sumC"></td>
					<td bgcolor=skyblue>D件合計</td>
					<td><input type=text size=10 name="sumD" id="sumD"></td>
					<td bgcolor=skyblue>E件合計</td>
					<td><input type=text size=10 name="sumE" id="sumE"></td>
					<td bgcolor=skyblue>F件合計</td>
					<td><input type=text size=10 name="sumF" id="sumF"></td>
				</tr>

				<tr>
					<td colspan=3 height=5></td>
				</tr>

				<tr>
					<td bgcolor=skyblue>G件合計</td>
					<td><input type=text size=10 name="sumG" id="sumG"></td>
					<td bgcolor=skyblue>H件合計</td>
					<td><input type=text size=10 name="sumH" id="sumH"></td>
					<td bgcolor=skyblue>直接入力枠合計</td>
					<td><input type=text size=10 name="sumI" id="sumI"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td bgcolor=yellow>合計金額</td>
					<td><input type=text size=10 name="sumAll" id="sumAll"></td>
				</tr>
			</table>
		</fieldset>
	</div>
	<div id="footer">
		<input type=button style="width: 120pt; height: 40pt;" value="戻る"
			onclick="history.back()">
	</div>
</body>
</html>