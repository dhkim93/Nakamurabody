<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/common/header.jsp" />
<script type="text/javascript">

//jqgridの入力文字形態制御
function validNum(val, nm, valref){
	
	if($.isNumeric(val)){
		return [true, ""];
	}else{
            return [false, "整数のみ入力することができます."];
	}
	
}

	$(function() {
		jqgridTrans = $('#wrapper');
		jqgridTrans.jqGrid({
			datatype : "local",
			colNames : [ "選択", "作業項目", "標準工数", "実工数", "部品金額", "部品個数", "工賃金額",
				"detaildamagel","detaildamagem","detaildamages","detailtabid" ], // colname
			colModel : [ //
			{
				name : 'checkbox',
				formatter : checkbox
			}, {
				name : 'detailspecdetail'
			}, {
				name : 'standardmanhour'
			}, {
				name : 'actualmanhour'
			}, {
				name : 'productprice',editable:true,formatter:'integer',
				editrules: {
		            custom: true,
		            custom_func: validNum }
			}, {
				name : 'productcount',editable:true,formatter:'integer',
				editrules: {
		            custom: true,
		            custom_func: validNum }
			}, {
				name : 'sumprice',formatter:'integer'
			}, {
				name : 'detaildamagel',
				hidden : true
			}, {
				name : 'detaildamagem',
				hidden : true
			}, {
				name : 'detaildamages',
				hidden : true
			}, {
				name : 'detailtabid',
				hidden : true
			}, ],
	        formatter : {
	             integer : {thousandsSeparator: ",", defaultValue: '0'}
	        },
			cellEdit:true,
			cellsubmit:'clientArray',
			height : 240, //or auto, defaultHeight
			width : 900,
			caption : "中柱受Assy交換", //title 
			// 			autowidth : false,
			shrinkToFit : true,
			rowNum : 50, //rownum	
			// 		pager : "#pager", //paging
			viewrecords : true,
			/* 			multiselect : true, */
			rownumbers : true,
			useColSpanStyle : true,
			emptyrecords : "データがないです",

			loadComplete : searchList(),
			afterSaveCell: function (rowid, name, val, iRow, iCol) {
				resetSumData();
				var ret = $("#wrapper").getRowData(rowid);
				var id = ret.detailtabid;
				checkChangeManHour(id);
			},
		});

	});

	function searchList() {

		$.ajax({
			type : "POST",
			url : "<c:url value='/repairDetailTable.ajax'/>",
			/* 			data : {
			'customerkana' : $('#customerNameKana').val(),
			'telephone1' : $('#customerTelephone').val()
			}, */
			data : {
				'mastertype' : '${repairDetailVO.mastertype}',
				'tabid' : '${repairDetailVO.tabid}'
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
				var result = data.repairDetail;
				if (result != undefined && result.length > 0) {
					$('#wrapper').jqGrid("clearGridData");
					$('#wrapper').jqGrid("setGridParam", {
						dataType : "local",
						data : result
					}).trigger("reloadGrid");
				}
			},
			complete : function(data) {
				return false;
			}
		});
		return false;
	}

	function checkbox(cellvalue, options, rowObject) {
		var id = rowObject.detailtabid;
		var box = "<input type='checkbox' id=" + id+ " onclick='checkChangeManHour(" + id + ")'>"
		return box;
	}

	//チェックした行の工賃変更
	function checkChangeManHour(data) {

		resetSumData();
		
		var chkTabid = data.toString();
		//detailtabid앞에 사라진 0 붙여서 생성
		if (chkTabid.length == 1) {
			chkTabid = "0" + data
		}
		
		//チェックボックス状態
		var checkedStatus = $("#" + chkTabid).prop("checked");
		
		//gridのidの値を配列で取得
		var idArry = $("#wrapper").jqGrid('getDataIDs'); //grid의 id 값을 배열로 가져옴
		//チェックボックスがチェックした行の工賃変更
		for (var i = 0; i < idArry.length; i++) {
			//該当idの行データを取得
			var ret = $("#wrapper").getRowData(idArry[i]); // 해당 id의 row 데이터를 가져옴
			//チェックした行データを変更
			if (chkTabid === ret.detailtabid) {
				//テーブルに工数設定
				inputManHour(checkedStatus,idArry[i])
			}
			inputSumData(idArry[i]);
		}
		return false;
	}
	
	//(selectbox)標準工数の変動がいる場合
	function changeManHour() {

		resetSumData();
		
		//gridのidの値を配列で取得
		var idArry = $("#wrapper").jqGrid('getDataIDs'); //grid의 id 값을 배열로 가져옴
		//チェックボックスがチェックした行の工賃変更
		for (var i = 0; i < idArry.length; i++) {
			//該当idの行データを取得
			var ret = $("#wrapper").getRowData(idArry[i]); // 해당 id의 row 데이터를 가져옴
			//チェックボックス状態
			var checkedStatus = $("#" + ret.detailtabid).prop("checked");
			//テーブルに工数設定
			inputManHour(checkedStatus,idArry[i]);
			inputSumData(idArry[i]);
		}
		return false;
	}
	
	function inputManHour(checkedStatus,rowId){
		//設定した工数
		var manHourKind = document.getElementById('manHourKind').value;
		//変更する行のデータを取得
		var ret = $("#wrapper").getRowData(rowId);
		//チェックした場合
		if (checkedStatus === true) {
			//工数別処理
			switch (manHourKind) {
			//大の場合
			case '1':
				$("#wrapper").jqGrid('setCell', rowId,'standardmanhour', ret.detaildamagel);
				$("#wrapper").jqGrid('setCell', rowId,'actualmanhour', ret.detaildamagel);
				//工賃料金設定
				sumPrice(ret.detaildamagel,rowId);
				break;
			//中の場合
			case '2':
				$("#wrapper").jqGrid('setCell', rowId,'standardmanhour', ret.detaildamagem);
				$("#wrapper").jqGrid('setCell', rowId,'actualmanhour', ret.detaildamagem);
				//工賃料金設定
				sumPrice(ret.detaildamagem,rowId);
				break;
			//小の場合
			case '3':
				$("#wrapper").jqGrid('setCell', rowId,'standardmanhour', ret.detaildamages);
				$("#wrapper").jqGrid('setCell', rowId,'actualmanhour', ret.detaildamages);
				//工賃料金設定
				sumPrice(ret.detaildamages,rowId);
				break;
			default:
				break;
			}
/* 			//合計価格を計算して出力
			inputSumData(ret,rowId,true); */
		}
		//チェックしない場合
		else if (checkedStatus === false) {
			$("#wrapper").jqGrid('setCell', rowId, 'standardmanhour','0.00');
			$("#wrapper").jqGrid('setCell', rowId, 'actualmanhour','0.00');
			$("#wrapper").jqGrid('setCell', rowId, 'productprice','0.00');
			$("#wrapper").jqGrid('setCell', rowId, 'productcount','0.00');
			//工賃料金設定
			sumPrice(0,rowId);
/*  			//合計価格を計算して出力
			inputSumData(ret,rowId,false);  */
		}
	}
	

	function allSelect(checked) {
		
		resetSumData();
		
		//gridのidの値を配列で取得
		var idArry = $("#wrapper").jqGrid('getDataIDs'); //grid의 id 값을 배열로 가져옴
		//チェックボックスがチェックした行の工賃変更
		for (var i = 0; i < idArry.length; i++) {
			//該当idの行データを取得
			var ret = $("#wrapper").getRowData(idArry[i]); // 해당 id의 row 데이터를 가져옴
			if(checked === true){
				//チェックボックをチェック
				$("#"+ret.detailtabid).prop('checked', true);
				//チェックボックス状態
				var checkedStatus = $("#" + ret.detailtabid).prop("checked");
				inputManHour(checkedStatus,idArry[i]);
			}else if(checked === false){
				//チェックボックをチェック
				$("#"+ret.detailtabid).prop('checked', false);
				var checkedStatus = $("#" + ret.detailtabid).prop("checked");
				inputManHour(checkedStatus,idArry[i]);
			}
			inputSumData(idArry[i]);
		}
	}
	
	//総合計を出力
	function inputSumData(rowid){
		
		var ret = $("#wrapper").getRowData(rowid);
		
		var sumSmanhour = document.getElementById("sumStandardManhour");
		var sumAmanhour = document.getElementById("sumActualManhour");
		var sumPrice = document.getElementById("sumProductPrice");
		var sumAllPrice = document.getElementById("sumAllPrice");
		
		sumSmanhour.value = parseInt(sumSmanhour.value) + parseInt(ret.standardmanhour);
		sumAmanhour.value = parseInt(sumAmanhour.value) + parseInt(ret.actualmanhour);
		sumPrice.value = parseInt(sumPrice.value) + (parseInt(ret.productcount) * parseInt(ret.productprice));
		sumAllPrice.value = parseInt(sumAllPrice.value) + parseInt(ret.sumprice);

	}
	
	//工賃金額計算
	//manhour 工数
	//rowId   変更する行のid
	function sumPrice(manhour, rowId) {
		//変更する行のデータを取得
		var ret = $("#wrapper").getRowData(rowId);
		
		//工賃金額計算
		var sum = (manhour * '${repairDetailVO.labourCosts}') + (ret.productprice * ret.productcount)
		$("#wrapper").jqGrid('setCell', rowId, 'sumprice', sum);
		return false;
	}
	
	//合計データを初期化
	function resetSumData(){
		 document.getElementById("sumStandardManhour").value=0;
		 document.getElementById("sumActualManhour").value=0;
		 document.getElementById("sumProductPrice").value=0;
		 document.getElementById("sumAllPrice").value=0;
	}
	
	//確認ボタンを押す場合
	function save() {
	  
		var gridData = $("#wrapper").getRowData();
		gridData.push($("#wrapper").getRowData(gridData.length+1));
		
	  $.ajax({
	   type: "GET",
	         url: "<c:url value='/repairDetailResult.do'/>",
	         data : {D: gridData},
	         success: function(response, textStatus, xhr) {
	             alert("success");
	         },
	         error: function(xhr, textStatus, errorThrown) {
	             alert("error" + errorThrown);
	         }
	  });
	}


</script>
</head>
<body>
<form id="frm" action="/repairDetailResult.do" method="post">
	<div id="cus_middle">
		<fieldset>
			<div id="estimateRepair_middle_top">
				<span>作業工数選択</span>
				<table>
					<tr>
						<td>車輌タイプ</td>
						<td><input type="text" size="20"
							value=${ repairDetailVO.comboname} readonly></td>
					</tr>
					<tr>
						<td>標準工数</td>
						<td><select id="manHourKind" onchange="changeManHour()">
								<c:forEach items="${manHourKind }" var="manhour">
									<option value=${manhour.combotype }>${manhour.comboname }</option>
								</c:forEach>
						</select></td>
					</tr>
				</table>
			</div>
			<p>
			<div id="estimateRepair_middle_top">
				<fieldset>
					<table id="wrapper"></table>
					<br><br>	
					<table>
						<tr>
						<td width="50"></td>
							<td>
								<input type="checkbox" onclick="allSelect(this.checked)"/>
								全て選択/解除
							</td>
							<td width= "70px">
							</td>
							<td width= "40px">
								合計
							</td>
							<td width= "120px">
								<input type=text size="7" readonly value=0 id="sumStandardManhour">
							</td>
							<td width= "115px">
								<input type=text size="7" readonly value=0 id="sumActualManhour">
							</td>
							<td width= "115px">
								<input type=text size="7" readonly value=0 id="sumProductPrice">
							</td>
							<td width= "110px">
							
							</td>
							<td>
								<input type=text size="10" readonly value=0 id="sumAllPrice">
							</td>
						</tr>
					</table>
				</fieldset>
			</div>
			<div id="estimateRepair_middle_bottom">
					<input type="submit" value="確認" style="float: right" onclick="save()">
			</div>
		</fieldset>
	</div>
	<div id="footer">
		<input type="button" value="閉じる" onclick="window.history.back();">
	</div>
</form>
</body>
</html>