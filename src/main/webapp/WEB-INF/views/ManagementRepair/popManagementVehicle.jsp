<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>tab example</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<c:import url="/WEB-INF/views/common/header.jsp" />
<style type="text/css">
.oddEeveRow tr:nth-child(2n) {
	background-color: #00FFFF;
}

.oddEeveRow tr:nth-child(2n-1) {
	background-color: white;
}

.oddEeveRow td {
	border: 1px solid gray;
}
</style>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="http://www.ok-soft-gmbh.com/jqGrid/jquery.jqGrid-4.3.1/js/i18n/grid.locale-en.js"></script>
<script type="text/javascript">
	// 	$.jgrid.no_legacy_api = true;
	// 	$.jgrid.useJSON = true;
</script>
<script type="text/javascript"
	src="http://www.ok-soft-gmbh.com/jqGrid/jquery.jqGrid-4.3.1/js/jquery.jqGrid.src.js"></script>
<script type="text/javascript"
	src="http://www.ok-soft-gmbh.com/jqGrid/jquery.jqGrid-4.3.1/plugins/jQuery.jqGrid.dynamicLink1.js"></script>

<script type="text/javascript">
	$(function() {
		var selectedCellId;
		jqgridTrans = $('#listNo');
		jqgridTrans
				.jqGrid({
					datatype : "local",
					colNames : [ " ", "表示順", "車輛タイプ名" ], // colname
					colModel : [ // 
					{
						name : 'abc',
						width : 15,
						align : 'left'

					}, {
						name : 'combotype',
						editable : true,
						width : 40

					}, {
						name : 'comboname',
						editable : true,
					} ],
					// 										width:300px;
					// 															height:400px;
					width : 460,
					height : 275,
					autowidth : false,
					shrinkToFit : true,
					pager : "#pager", //paging
					useColSpanStyle : true,
					emptyrecords : "empty",
					loadComplete : searchList(),
					beforeSelectRow : function(rowid, e) {
						var $this = $(this), $td = $(e.target).closest('td'), $tr = $td
								.closest('tr'), iRow = $tr[0].rowIndex, iCol = $.jgrid
								.getCellIndex($td);

						if (typeof lastRowIndex !== "undefined"
								&& typeof lastColIndex !== "undefined"
								&& (iRow !== lastRowIndex || iCol !== lastColIndex)) {
							$this.jqGrid('setGridParam', {
								cellEdit : true
							});
							$this.jqGrid('restoreCell', lastRowIndex,
									lastColIndex, true);
							$this.jqGrid('setGridParam', {
								cellEdit : false
							});
							$(this.rows[lastRowIndex].cells[lastColIndex])
									.removeClass("ui-state-highlight");
						}
						return true;
					},
					cellsubmit : 'clientArray',
					ondblClickRow : function(rowid, iRow, iCol) {
						var $this = $(this);

						$this.jqGrid('setGridParam', {
							cellEdit : true
						});
						$this.jqGrid('editCell', iRow, iCol, true);
						$this.jqGrid('setGridParam', {
							cellEdit : false
						});
					},
					afterEditCell : function(rowid, cellName, cellValue, iRow,
							iCol) {
						
						var cellDOM = this.rows[iRow].cells[iCol], oldKeydown, $cellInput = $(
								'input, select, textarea', cellDOM), events = $cellInput
								.data('events'), $this = $(this);
// 						$(cellDOM).removeClass("ui-state-highlight");
// 						$("#listNo").jqGrid("saveCell", rowid);
						if (events && events.keydown && events.keydown.length) {
							oldKeydown = events.keydown[0].handler;
							$cellInput.unbind('keydown', oldKeydown);
							$cellInput.bind('keydown', function(e) {
								$this.jqGrid('setGridParam', {
									cellEdit : true
								});
								jQuery("#listNo").jqGrid('setCell',
										rowid, 'abc', '✎');
								if(rowid==$("#listNo").jqGrid('getDataIDs').length){
									var result = $("#listNo").jqGrid('getDataIDs').length + 1;
									var initdata = {
										abc : '*',
										combotype : '',
										comboname : ''
									};
									$("#listNo").jqGrid('addRowData', result, initdata, 'last');
									$("table").removeClass("oddEeveRow");
									jQuery("table").addClass("oddEeveRow");
								}
								oldKeydown.call(this, e);
								$this.jqGrid('setGridParam', {
									cellEdit : false
								});
							}).bind('focusout', function(e) {
								$this.jqGrid('setGridParam', {
									cellEdit : true
								});
								$this.jqGrid('restoreCell', iRow, iCol, true);
								$this.jqGrid('setGridParam', {
									cellEdit : false
								});
								$(cellDOM).removeClass("ui-state-highlight");
							});
						}
					},
					onCellSelect : function(id, cellidx, cellvalue) { // use this event to capture edited cellID

						var allData = jQuery("#listNo").jqGrid('getRowData');
						var i = 0;
						while (i < allData.length + 1) {
							if (jQuery("#listNo").jqGrid('getRowData', i).abc == '▶*'
									|| jQuery("#listNo")
											.jqGrid('getRowData', i).abc == '*') {
								jQuery("#listNo").jqGrid('setCell', i, 'abc',
										'*');
							} else {
								jQuery("#listNo").jqGrid('setCell', i, 'abc',
										null);
							}
							i++;
						}
						if (jQuery("#listNo").jqGrid('getRowData', id).abc == "*") {
							jQuery("#listNo")
									.jqGrid('setCell', id, 'abc', "▶*");
						} else {
							jQuery("#listNo").jqGrid('setCell', id, 'abc', "▶");
						}
					},
					loadComplete : function(data) {
						jQuery("table").addClass("oddEeveRow");
					}
				});

	});

	function searchList() {
		$.ajax({
			type : "POST",
			url : "<c:url value='/popManagementVehicle.ajax'/>",
			data : {
				"" : ""
			},
			dataType : "json",
			beforeSend : function() {
			},
			error : function(request, status, error) {
				console.log(" code : " + request.status + " message : "
						+ request.responseText + " error : " + error);
			},
			success : function(data) {
				var result = data.resultList;
				if (result != undefined && result.length > 0) {
					$('#listNo').jqGrid("clearGridData");
					$('#listNo').jqGrid("setGridParam", {
						dataType : "local",
						data : result
					}).trigger("reloadGrid");
				}
			},
			complete : function(data) {
				var result = $("#listNo").jqGrid('getDataIDs').length + 1;
				var initdata = {
					abc : '*',
					combotype : '',
					comboname : ''
				};
				$("#listNo").jqGrid('addRowData', result, initdata, 'last');
				$("table").removeClass("oddEeveRow");
				jQuery("table").addClass("oddEeveRow");
			}
		});
		return false;
	}

	function addrow() {
		var sel = $("#listNo").jqGrid('getGridParam', "selrow");
		$("#listNo").jqGrid("saveCell", sel);
		var result = $("#listNo").jqGrid('getDataIDs').length + 1;
		var initdata = {
			abc : '',
			combotype : '',
			comboname : ''
		};
		$("#listNo").jqGrid('addRowData', result, initdata, 'before', sel);
		$("table").removeClass("oddEeveRow");
		jQuery("table").addClass("oddEeveRow");
		// 		console.log(rowId);

	}

	function Winclose() {
		window.close();
		self.close();
		var win = window.open('about:blank', '_self');
		win.close();
	}
</script>


</head>
<body id="popMV">
	<form action="">
		<div id="container">
			<h4>How to develop a tab menu with jQuery</h4>
			<div id="tbgroup">
				<ul class="tab">
					<li class="current" data-tab="tab1"><a href="#">About</a></li>
				</ul>

				<div id="tab1" class="tabcontent current">
					<table class="table1" id="listNo" style="position: static;"
						data-role="content"></table>
				</div>
			</div>
			<div id="btgroup">
				<input type="button" value="閉じる" style="margin-left: 0px;"
					onclick="Winclose()"> <input type="button" value="行追加"
					style="margin-left: 65px; margin-right: 5px;" id="plusLine"
					onclick="addrow()"> <input type="button" value="保存">
			</div>
		</div>
	</form>

</body>
</html>