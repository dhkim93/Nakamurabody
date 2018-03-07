<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/common/header.jsp" />
</head>
<style type="text/css">

  .ui-jqgrid .ui-state-highlight { background: #ABF200; }  
.myAltRowClassEven { background: #00FFFF; border-color: #79B7E7;}

</style>
<script type="text/javascript">
	var employeeId; //社員ID
	var employeeKana;
	$(function() {
		jqgridTrans = $('#wrapper');
		jqgridTrans
				.jqGrid({
					datatype : "local",
					colNames : [ "", "No", "社員ID", "氏名（漢字）", "氏名（カナ）", "携帯番号",
							"入社日", "退社日" ], // colname
					colModel : [ // 
						{
							name : 'state',
							width : 20,
							align : 'left'
						},	
					{
						name : 'rowNumResult',
						width : 60
					}, {
						name : 'employeeId'
					}, {
						name : 'employeeName'
					}, {
						name : 'employeeKana'
					}, {
						name : 'employeeMobileNumber'
					}, {
						name : 'employeeEnteringDay'
					}, {
						name : 'employeeLeavingDay'
					}, ],
					height : 280, //or auto, defaultHeight
					width : 1150,
					// 			autowidth : false,
					shrinkToFit : true,
					rowNum : 50, //rownum	
					// 		pager : "#pager", //paging
// 					viewrecords : true,
					// 			multiselect : true,
					rownumbers : false,
					useColSpanStyle : true,
					emptyrecords : "empty",
					loadComplete : function(data) {
						//initPage("wrapper", "", "");
					},
					onSelectRow : function(rowid, iRow, iCol, e) { //row click 
						var data = jQuery('#wrapper').jqGrid('getRowData',
								rowid);
						//クリックした該当行の情報取得
						employeeId = data.employeeId;
						employeeKana = data.employeeKana;
						
					},
					onCellSelect : function(id, cellidx, cellvalue) { 
						//▶表示オンオフ
						var allData = jQuery("#wrapper").jqGrid('getRowData');
						var i = 0;
						while (i < allData.length + 2) {
								jQuery("#wrapper").jqGrid('setCell', i, 'state', null);
								i++;
						}
						if (jQuery("#wrapper").jqGrid('getRowData', id).state == '') {
							jQuery("#wrapper")
									.jqGrid('setCell', id, 'state', "▶");
						} 
						
					},
					loadComplete: function () {
						//グリッド色変更
					    $(this).find(">tbody>tr.jqgrow:odd").addClass("myAltRowClassEven");
					    //行の数表示
						var resultData = jQuery("#wrapper").jqGrid('getRowData');
						var i = 0;
						while (i < resultData.length + 2) {
								jQuery("#wrapper").jqGrid('setCell', i, 'rowNumResult', i);
								i++;
						}
						//一番目行に「▶」表示
						jQuery("#wrapper").jqGrid('setCell', 1, 'state', "▶");
					}
					
				});
	});

	//comma by third number format 
	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	//GRID取得
	function searchList() {
		employeeId = $('#employeeId').val(); //社員ID
		employeeKana = $('#employeeKana').val(); //氏名(カナ)
		var employeeDayFrom = $('#employeeDayFrom').val();//入社日付
		var employeeDayTo = $('#employeeDayTo').val();//退社日付
		var chkResult =document.searchEmploy.chkLeave.checked;//退社チェック
		$.ajax({
			type : "POST",
			url : "<c:url value='/selectEmployeeInfo.ajax'/>",
			data : {
				"employeeId" : employeeId,
				"employeeKana" : employeeKana,
				"employeeDayFrom" : employeeDayFrom,
				"employeeDayTo" : employeeDayTo,
				"chkResult" : chkResult
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
					if (employeeId.length == 0 && employeeKana.length == 0 
										&& employeeDayFrom.length == 0 && employeeDayTo.length == 0) {
					alert("検索条件を一つ以上入力してください。");
					$('#wrapper').jqGrid("clearGridData");

					} else if(result != undefined && result.length > 0) {
					$('#wrapper').jqGrid("clearGridData");
					$('#wrapper').jqGrid("setGridParam", {
						dataType : "local",
						data : result
					}).trigger("reloadGrid");
					
					$("#wrapper").jqGrid('setSelection', "1", true);//一番目行自動選択
				} else {
					alert("検索条件と一致する情報がありません。");
					$('#wrapper').jqGrid("clearGridData");
				}
			},
			complete : function(data) {
			}
		});
		return false;
	}
	
	//グリッド削除
	function deleteList() {
		var msg = confirm("ID　:　【"+employeeId+"】、氏名　：　【"+employeeKana+"】を削除します。よろしいですか?");
		if (msg == true) {
			$.ajax({
				type : "POST",
				url : "<c:url value='/deleteEmployeeInfo.ajax'/>",
				data : {
					"employeeId" : employeeId
				},
				dataType : "json",
				beforeSend : function() {
				},
				error : function(request, status, error) {
					console.log(" code : " + request.status + " message : "
							+ request.responseText + " error : " + error);
				},
				success : function(data) {
					if (data.resultCnt > 0) {
						alert("ID　:　【"+employeeId+"】、氏名　：　【"+employeeKana+"】を削除しました。");
						searchList(); //取得
					} else {
						alert(employeeId);
						alert("削除失敗しました。");
					}
				},
				complete : function(data) {
				}
			});
		}
		
		return false;
	}
// 	クリア
	function clearList() {
		$("#wrapper").jqGrid("clearGridData");
	}
// 	戻る
	function goBackPage() {
		var id = document.searchEmploy.loginId.value;
		var name = document.searchEmploy.loginName.value;
		location.href = "loginManager.do?name=" + name + "&id=" + id;
	}
// 	新規追加/参照更新
 	function popWindow(parameter) {
		cw = screen.availWidth;
		ch = screen.availHeight;
		sw = 880;
		sh = 370;
		ml = (cw - sw) / 2;
		mt = (ch - sh) / 2;
		if(parameter == 'insertList'){
			var popWindow = window.open('popManagementEmployee.do?parameter='+parameter, '', 'width=' + sw
					+ ',height=' + sh + ',top=' + mt + ',left=' + ml
					+ ',resizable=no,scrollbars=yes');
		}else if(parameter == 'updateList')
			var popWindow = window.open('popManagementEmployee.do?employeeId='+employeeId+ "&parameter=" + parameter, '', 'width=' + sw
					+ ',height=' + sh + ',top=' + mt + ',left=' + ml
					+ ',resizable=no,scrollbars=yes');
	} 
</script>

<body>
	<div id="header" align=center>
<!-- 		<h1>社員情報管理</h1> -->
		<%@ include file="../common/nav_manager.jsp"%>
	</div>
	<div id="middle">
		<div id="sidebar1400">
			<fieldset>
				<form method=get name="searchEmploy">
				<input type="hidden" id="loginId" name="loginId" value=${param.id } />
			<input type="hidden" id="loginName" name="loginName" value=${param.name } />
					<table width=100% border=0 cellspacing=0>
						<tr>
							<td colspan=5 bgcolor=skyblue>社員情報検索</td>
						</tr>
						<tr>
							<td colspan=5 height=5></td>
						</tr>
						<tr>
							<td width=120 bgcolor=skyblue>社員ID</td>
							<td width=20></td>
							<td><input type=text size=40 name=employeeId id="employeeId"></td>
							<td width=20></td>
						</tr>

						<tr>
							<td colspan=3 height=5 />
						</tr>
						<tr>
							<td width=120 bgcolor=skyblue>氏名（カナ）</td>
							<td width=20></td>
							<td><input type=text size=40 name=employeeKana
								id="employeeKana"></td>
							<td width=20></td>
						</tr>
						<tr>
							<td colspan=3 height=10 />
						</tr>
						<tr>
							<td bgcolor=skyblue>入社日</td>
							<td width=20></td>
							<td><input type="date" size=20 id="employeeDayFrom"
								name="employeeDayFrom" value=""> ~ <input type="date"
								size=15 id="employeeDayTo" name="employeeDayTo">
								<input type="checkbox" name="chkLeave" value="chkLeave"checked>(退社者を含む)</td>
							<td width=20></td>
						</tr>

						<tr>
							<td colspan=3 height=5 />
						</tr>
					</table>

					<center>
						<input type="reset" style="width: 110pt; height: 30pt;"
							value="クリア" onclick="clearList()"> <input type="button"
							style="width: 110pt; height: 30pt;" value="検索"
							onclick="javascript:searchList(); return false;"> <input
							type="button" style="width: 110pt; height: 30pt; float: right;"
							value="新規追加"  onclick="popWindow('insertList')">
					</center>
				</form>
			</fieldset>
		</div>

		<div id="contentCenter">
			<fieldset>
				<table width=100% border=0 cellspacing=0>
					<tr>
						<td colspan=3 bgcolor=skyblue>社員情報一覧</td>
					</tr>
				</table>
				<div id="sidebar300">
					<table id="wrapper"></table>
				</div>
				<div
					style="display: inline-block; float: right; width: 150px; height: 250px;">
					<input type="button"
						style="width: 110pt; height: 30pt; margin-bottom: 230px;"
						value="参照/変更" onclick="popWindow('updateList')"> <input type="button"
						style="width: 110pt; height: 30pt;"
						onclick="javascript:deleteList(); return false;" value="削除">
				</div>
			</fieldset>
		</div>
	</div>
	<div id="footer2">
		<input type=button style="width: 120pt; height: 30pt;" value="戻る"
			onclick="goBackPage()">
	</div>
</body>
</html>