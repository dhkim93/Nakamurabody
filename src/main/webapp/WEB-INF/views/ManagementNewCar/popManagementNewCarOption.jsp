<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>tab example</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<c:import url="/WEB-INF/views/common/header.jsp" />
<style type="text/css">
.oddEeveRow tr:nth-child(2n) {
	background-color: white;
}

.oddEeveRow tr:nth-child(2n-1) {
	background-color: #00FFFF;
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
<script type="text/javascript"
	src="http://www.ok-soft-gmbh.com/jqGrid/jquery.jqGrid-4.3.1/js/jquery.jqGrid.src.js"></script>
<script type="text/javascript"
	src="http://www.ok-soft-gmbh.com/jqGrid/jquery.jqGrid-4.3.1/plugins/jQuery.jqGrid.dynamicLink1.js"></script>

<script type="text/javascript">
	$(function() {
		var selectedCellId;
		jqgridTrans = $('#tb');
		jqgridTrans
				.jqGrid({
					datatype : "local",
					colNames : [ " ", "表示順", "ボデータイプ" ], // colname
					colModel : [ // 
					{
						name : 'state',
						width : 15,
						align : 'left'

					}, {
						name : 'tabid',
						editable : true,
						width : 40

					}, {
						name : 'tabname',
						editable : true,
					} ],
					width : 460,
					height : 275,
					autowidth : false,
					shrinkToFit : true,
					pager : "#pager", //paging
					useColSpanStyle : true,
					emptyrecords : "empty",
					loadComplete : showFirstData(),
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
						if (events && events.keydown && events.keydown.length) {
							oldKeydown = events.keydown[0].handler;
							$cellInput.unbind('keydown', oldKeydown);
							$cellInput.bind('keydown', function(e) {
								$this.jqGrid('setGridParam', {
									cellEdit : true
								});
								jQuery("#tb").jqGrid('setCell',
										rowid, 'state', '✎');
								if(rowid==$("#tb").jqGrid('getDataIDs').length){
									var result = $("#tb").jqGrid('getDataIDs').length + 1;
									var initdata = {
											state : '*',
											tabid : '',
											tabname : ''
									};
									$("#tb").jqGrid('addRowData', result, initdata, 'last');
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

						var allData = jQuery("#tb").jqGrid('getRowData');
						var i = 0;
						while (i < allData.length + 1) {
							if (jQuery("#tb").jqGrid('getRowData', i).state == '▶*'
									|| jQuery("#tb")
											.jqGrid('getRowData', i).state == '*') {
								jQuery("#tb").jqGrid('setCell', i, 'state',
										'*');
							} else {
								jQuery("#tb").jqGrid('setCell', i, 'state',
										null);
							}
							i++;
						}
						if (jQuery("#tb").jqGrid('getRowData', id).state == "*") {
							jQuery("#tb")
									.jqGrid('setCell', id, 'state', "▶*");
						} else {
							jQuery("#tb").jqGrid('setCell', id, 'state', "▶");
						}
					},
					loadComplete : function(data) {
						jQuery("table").addClass("oddEeveRow");
					}
				});

	});
	
	//データ取得
	function showFirstData() {
		var selectNo = "${list[0].combotype}";
		$.ajax({
			url:"/popManageNewCarOptionList.ajax",
	        type:'POST',
	        contentType:"application/x-www-form-urlencoded; charset=UTF-8",
	        data: {'selectObj':selectNo},
			
			beforeSend : function() {
			},
			error : function(request, status, error) {
				console.log(" code : " + request.status + " message : "
						+ request.responseText + " error : " + error);
			},
			success : function(data) {
				var result = data.comboData;
				if (result != undefined && result.length > 0) {
					$('#tb').jqGrid("clearGridData");
					$('#tb').jqGrid("setGridParam", {
						dataType : "local",
						data : result
					}).trigger("reloadGrid");
				}
			},
			complete : function(data) {
				var result = $("#tb").jqGrid('getDataIDs').length + 1;
				var initdata = {
						state : '*',
						tabid : '',
						tabname : ''
				};
				$("#tb").jqGrid('addRowData', result, initdata, 'last');
				$("table").removeClass("oddEeveRow");
				jQuery("table").addClass("oddEeveRow");
			}
		});
		return false;
	}

	//行追加
	function addrow() {
		var sel = $("#tb").jqGrid('getGridParam', "selrow");
		$("#tb").jqGrid("saveCell", sel);
		var result = $("#tb").jqGrid('getDataIDs').length + 1;
		var initdata = {
				state : '',
				tabid : '',
				tabname : ''
		};
		$("#tb").jqGrid('addRowData', result, initdata, 'before', sel);
		$("table").removeClass("oddEeveRow");
		jQuery("table").addClass("oddEeveRow");
		// 		console.log(rowId);

	}
	
    //保存ボタン押下場合
    function saveData(){
	   	$.ajaxSettings.traditional = true;
		var arr = new Array();
		var rowList = $("#tb").jqGrid("getDataIDs");
		for(var i =0; i<rowList.length;i++){
			var rowData = $("#tb").jqGrid('getRowData',rowList[i]);
			arr.push(rowData);
		}
		var json = JSON.stringify(arr);
// 		alert(json);

    	if(confirm("ボデータイプ情報を更新します。 よろしいですが？")){
			$.ajax({
		        url:"/popManageNewCarBodySave.ajax",
		        type:'POST',
		        contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		        data: {'jsonData':json},
		        success:function(data){
		            alert("ボデ―タイプ情報を更新しました。");
		            window.opener.location.reload();
		            self.close();
		        },
		        error:function(jqXHR, textStatus, errorThrown){
		            alert("error 発生 　:　" + textStatus + " : " + errorThrown);
		            self.close();
		        }
		    });
    	}else{
    	}
    }
    
    //delete-Keyを押下場合、選択された行を削除
    $(document).keydown(function(event) {
    	var rowid = $("#tb").getGridParam( "selrow" );
    	if (event.keyCode == '46' && rowid!=null ) {
    		var row = $("#tb").jqGrid('getRowData',rowid);
    		var tabname = row.tabname
//     		alert(tabname);
    	    
    	    	if(confirm("選択した行を削除します。 よろしいですが？")){
    	    		$("#tb").delRowData(rowid);
    	   		}else{
    	    	}
    	    }
    	});

	function Winclose() {
		window.close();
		self.close();
		var win = window.open('about:blank', '_self');
		win.close();
	}
	
	function comboChange(selectObj){
// 		alert(selectObj.value + "가 선택 되었습니다.");
		var selectNo = selectObj.value;
		$.ajax({
			url:"/popManageNewCarOptionList.ajax",
	        type:'POST',
	        contentType:"application/x-www-form-urlencoded; charset=UTF-8",
	        data: {'selectObj':selectNo},
			
			beforeSend : function() {
			},
			error : function(request, status, error) {
				console.log(" code : " + request.status + " message : "
						+ request.responseText + " error : " + error);
			},
			success : function(data) {
// 				alert(data);
				var result = data.comboData;
				if (result != undefined && result.length > 0) {
					$('#tb').jqGrid("clearGridData");
					$('#tb').jqGrid("setGridParam", {
						dataType : "local",
						data : result
					}).trigger("reloadGrid");
				}
			},
			complete : function(data) {
				var result = $("#tb").jqGrid('getDataIDs').length + 1;
				var initdata = {
						state : '*',
						tabid : '',
						tabname : ''
				};
				$("#tb").jqGrid('addRowData', result, initdata, 'last');
				$("table").removeClass("oddEeveRow");
				jQuery("table").addClass("oddEeveRow");
			}
		});
	}
</script>


</head>
<body id="popMV">
	<form action="">
		<div id="container">
			<h4>ボデ―タイプメンテナンス</h4>
			<div id="container" style="width: 485px;"> 	
				<table style="padding: 5px; list-style: none;" >
					<tr>
						<td style="background-color: skyblue; border-color:white; width: 20%">&nbsp;ボデータイプ</td>
						<td style="background-color: white; border-color:white; width: 5%"><font color="red">&nbsp; ※</font></td>
						<td style="background-color: white; border-color:white; width: 40%" align="left">
								<c:if test="${!empty list}">
									<select name="selectBox" onChange="comboChange(this)">
										<c:forEach var="object" items="${list}" varStatus="i">
											<option value="${object.combotype}">${object.comboname}</option>
										</c:forEach>
									</select>
								</c:if>
						</td>
					</tr>
				</table>
			</div>
			<div id="tbgroup">
				<ul class="tab">
					<li class="current" data-tab="tab1"><a href="#">ボデ―タイプ</a></li>
				</ul>

				<div id="tab1" class="tabcontent current">
					<table class="table1" id="tb" style="position: static;"
						data-role="content"></table>
				</div>
			</div>
			<div id="btgroup">
				<input type="button" value="閉じる" style="margin-left: 0px;"onclick="Winclose()">
				<input type="button" value="行追加" style="margin-left: 65px; margin-right: 5px;" id="plusLine"
					onclick="addrow()">
				<input type="button" value="保存" onclick="saveData()">
			</div>
		</div>
	</form>

</body>
</html>