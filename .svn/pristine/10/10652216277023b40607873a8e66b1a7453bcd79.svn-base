<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/common/header.jsp" />
<script type="text/javascript">
	$(function() {
		jqgridTrans = $('#wrapper');
		jqgridTrans.jqGrid({
			datatype : "local",
			colNames : [ "表示順", "作業内容", "標準工数", "実工数", "部品金額", "工賃金額", "詳細","imageurl","mastertype" ], // colname
			colModel : [ // 
			{
				name : 'tabid'
			}, {
				name : 'specdetail'
			}, {
				name : 'standardmanhour'
			}, {
				name : 'manhour'
			}, {
				name : '0'
			}, {
				name : '0'
			}, {
				name : 'btn_detail',
				formatter : detailButton
			},{
				name : 'imageurl', hidden:true
			},{
				name : 'mastertype', hidden:true
			} ],
			height : 240, //or auto, defaultHeight
			width : 700,
			//caption : "aaaaaaaaaaaaaaaaaa", //title 
			// 			autowidth : false,
			shrinkToFit : true,
			rowNum : 50, //rownum	
			// 		pager : "#pager", //paging
			viewrecords : true,
			// multiselect : true, 
			rownumbers : true,
			useColSpanStyle : true,
			emptyrecords : "empty",
			loadComplete : function(data) {
				//initPage("wrapper", "", "");
			},
			ondblClickRow : function(rowid, iRow, iCol, e) {
				var data = jQuery('#wrapper').jqGrid('getRowData', rowid);
			},
			onSelectRow: function(id){
				rowdata(id);
			}

		});
	});

	function searchList() {
		$.ajax({
			type : "POST",
			url : "<c:url value='/estimateRepairSearch.ajax'/>",
			/* 			data : {
			'customerkana' : $('#customerNameKana').val(),
			'telephone1' : $('#customerTelephone').val()
			}, */
			data : {
				'combotype' : $('#combovalue').val()
			},
			dataType : "json",
			beforeSend : function() {
				//startLoading();
			},
			error : function(request, status, error) {
				console.log(" code : " + request.status + " message : "
						+ request.responseText + " error : " + error);
			},
			success : function(data) {
				// 				alert("success");
				// 				if (!ajaxSessionCheck(data))
				// 					return false;
				var result = data.dataList;
				if (result != undefined && result.length > 0) {
					$('#wrapper').jqGrid("clearGridData");
					$('#wrapper').jqGrid("setGridParam", {
						dataType : "local",
						data : result
					}).trigger("reloadGrid");
				}
			},
			complete : function(data) {
				/* alert("complete"); */
			}
		});
		return false;
	}
	function detailButton(cellvalue, options, rowObject) {
		 if (rowObject.Status != "Not Started") {
		        var edit = "<input class='Viewbtn'  type='button' value='詳細' onclick=\"open_detail("+rowObject.tabid+","+rowObject.mastertype+");\"  />";
		        return edit;
		    }
		    return '';
	}
	function rowdata(id){
		var data = $('#wrapper').getRowData(id);
		document.getElementById('image').src = data.imageurl;
	}
	function open_detail(tabid,mastertype){
		var select= document.getElementById("combovalue");
		var textValue = select.options[select.selectedIndex].text
		location.href="http://localhost:8080/repairDetail.do?comboname="+textValue+"&tabid="+tabid+"&mastertype="+mastertype;
		
	}
</script>
</head>
<body>
	<div id="cus_header">
		<h1 align="center">修理見積</h1>
	</div>
	<div id="estimateRepair_top">
		<form id="topform" method="post" action="#">
			<fieldset>
				<span>修理見積選択</span>
				<table>
					<tr>
						<td><span>車輌タイプ</span></td>
						<td width="10%">*</td>
						<td><select id="combovalue">
								<c:forEach items="${ allNewCarType}" var="carType">
									<option value="${carType.combotype}">${carType.comboname }</option>
								</c:forEach>
						</select></td>
						<td width="30%"></td>
						<td><input type="button" value="検索"
							onclick="searchList(); return false;"></td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>

	<div id="cus_middle">
		<fieldset>
			<div id="estimateRepair_middle_top">
				<span>修理見積</span>
			</div>
			<p>
			<div id="estimateRepair_middle_left">
				<fieldset style="height: 270">
					<table id="wrapper"></table>
				</fieldset>
			</div>
			<div id="estimateRepair_middle_right">
				<fieldset style="width: 570; height: 300">
					<span>作業(部品)画像</span> <img src="" id="image">
				</fieldset>
			</div>
			<div id="estimateRepair_middle_bottom">
				<input type="button" value="確認" style="float: right">
			</div>
		</fieldset>
	</div>
	<div id="footer">
		<input type="button" value="戻る" onclick="window.history.back();">
	</div>
</body>
</html>