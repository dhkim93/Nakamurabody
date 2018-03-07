<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>見積支援システム</title>
<c:import url="/WEB-INF/views/common/header.jsp" />
<script type="text/javascript">

	var estimatenumberParam; //見積番号
	var customeridParam;		 //顧客ID

	$(document).ready(function() {
		jqgridTrans = $('#wrapper');
		jqgridTrans.jqGrid({
			datatype : "local",
			colNames : ["選択仕様", "仕様項目", "仕様詳細", "単位", "定価", "個数", "小計"], // colname
			colModel : [ // 
			{
				name : 'choicespec'
			}, {
				name : 'specitem'
			}, {
				name : 'specdetail'
			}, {
				name : 'unit'
			}, {
				name : 'listprice', formatter:numberWithCommas
			}, {
				name : 'quantity'
			}, {
				name : 'subtotal', formatter:numberWithCommas
			},
			],
			height : 200, //or auto, defaultHeight
			width : 1320,
			//autowidth : false,
			shrinkToFit : true,
			rowNum : 50, //rownum	
			// pager : "#pager", //paging
			viewrecords : true,
			//multiselect : true,
			rownumbers : true,
			useColSpanStyle : true,
			emptyrecords : "empty",
			loadComplete : function(data) {
				jQuery("tr.jqgrow:odd").addClass("oddRow");
				jQuery("tr.jqgrow:even").addClass("evenRow");
			//initPage("wrapper", "", "");
			},
			// 			ondblClickRow : function(rowid, iRow, iCol, e) {
			// 				var data = jQuery('#wrapper').jqGrid('getRowData', rowid);
			// 				alert(data);
			// 			},
			onSelectRow :  function(rowid, iRow, iCol, e) { //row click 
				var data = jQuery('#wrapper').jqGrid('getRowData', rowid);
				estimatenumberParam = data.estimatenumber;
				customeridParam = data.customerid;
			}
		});
		var EstimateNewCarDetailInfo = ${EstimateNewCarDetailJson};
        $("#wrapper").addRowData(1,EstimateNewCarDetailInfo);
	});


	//comma by third number format 
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	//ボデー明細combobox value取得
	function searchBodyDetailCombo(sParam){
		var bodytype = $("#bodytype option:selected");
		var $target = $("select[name='bodytypedetail']");
		$target.empty();
		$target.append("<option value=''>選択してください。</option>");
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/searchBodyDetailCombo.ajax'/>",
			data : {
				"bodytype" : sParam,
			},
			dataType : "json",
			beforeSend : function() {
			},
			error : function(request, status, error) {
				console.log(" code : " + request.status + " message : "
						+ request.responseText + " error : " + error);
			},
			success : function(data) {
				var result = data.bodyTypeDetail;
		        $.each(result, function(index, element) {
		            $('#bodytypedetail').append($('<option>', {
		                text : element.specdetail
		            }));
		        });
			},
			complete : function(data) {
			}
		});
		return false;
	}	

	//グリッド削除
	function deleteNewCarDetail(){
		var estimatenumber = $('#estimatenumber').val();		//見積番号
		var customerid = $('#customerid').val();					//顧客ID
		$.ajax({
			type : "POST",
			url : "<c:url value='/deleteNewCarDetail.ajax'/>",
			data : {
				"estimatenumber" : estimatenumber,
				"customerid" : customerid,
			},
			dataType : "json",
			beforeSend : function() {
			},
			error : function(request, status, error) {
				console.log(" code : " + request.status + " message : "
						+ request.responseText + " error : " + error);
			},
			success : function(data){
				if(data.resultCnt > 1 ){
					alert("新車見積情報を削除しました。");
				}else{
					alert("削除失敗しました。");
				}
			},
			complete : function(data) {
			}
		});
		return false;
	}

</script>
</head>
<body>
	<div id="header" align=center>
		<h1>新車見積詳細</h1>
	</div>
	<div id="middle">
		<div id="sidebar1400150">
			<fieldset>
				<form method=post name=searchCustomer action="#">
					<table width=100% border=0 cellspacing=0>
						<c:set var="EstimateNewCarDetailOne" value="${EstimateNewCarDetail.get(0)}" />
						<input type="hidden" id="customerid" name="customerid" value="${EstimateNewCarDetailOne.customerid}" />
						<tr>
							<td colspan=6 bgcolor=skyblue>見積情報</td>
						</tr>
						<tr>
							<td colspan=6 height=5></td>
						</tr>
						<tr>
							<td width=120 bgcolor=skyblue >見積番号</td>
							<td><input type=text size="30" name=estimatenumber  id="estimatenumber" value="${EstimateNewCarDetailOne.estimatenumber}" disabled="disabled"></td>
							<td width=20></td>
							<td width=120 bgcolor=skyblue>顧客名（カナ）</td>
							<td><input type=text size="30" id="customerkana" name=customerkana value="${EstimateNewCarDetailOne.customerkana}" disabled="disabled"></td>			
							<td width=20></td>				
						</tr>
						
						<tr><td colspan=3 height=5/></tr>
						
						<tr>
							<td width=120 bgcolor=skyblue>ボデータイプ</td>
							<td><input type=text size="30" id="bodyname" name="bodyname" value="${EstimateNewCarDetailOne.bodyname}" disabled="disabled"></td>
							<td width=20></td>
							<td width=120 bgcolor=skyblue>顧客名（漢字）</td>
							<td>
								<input type=text size="30" id="customername1" name="customername1" value="${EstimateNewCarDetailOne.customername1}" disabled="disabled">			
								<input type=text size="15" id="state" name="state" value="${EstimateNewCarDetailOne.state}" disabled="disabled">
							</td>
						</tr>
						
						<tr><td colspan=3 height=5/></tr>
						
						<tr>
							<td bgcolor=skyblue>見積担当</td>
							<td><input type=text size=30 name="estimateemployeename" id="estimateemployeename" value="${EstimateNewCarDetailOne.estimateemployeename}" disabled="disabled"></td>
							<td width=20></td>
							<td width=20></td>
							<td>
							</td>
						</tr>
						
						<tr>
							<td colspan=3 height=5></td>
						</tr>
						
					</table>
				</form>
			</fieldset>
		</div>
		
		<div id="contentCenter">
			
			<fieldset>
				<table width=100% border=0 cellspacing=0>
					<tr>
						<td colspan=3 bgcolor=skyblue>新車見積情報</td>
					</tr>
				</table>
				
				<fieldset>
				<div id="sidebar225">
					<table id="wrapper"></table>
				</div>
				</fieldset>		
				
				<div style="position: block;">
						<c:forEach items="${EstimateNewCarDetail}" var="itemList" varStatus="status">
							<c:if test="${itemList.tabname eq 'A'}">
								<c:set var="A" value="${A + itemList.subtotal}"></c:set>
							</c:if>
							<c:if test="${itemList.tabname eq 'B'}">
								<c:set var="B" value="${B + itemList.subtotal}"></c:set>
							</c:if>
							<c:if test="${itemList.tabname eq 'C'}">
								<c:set var="C" value="${C + itemList.subtotal}"></c:set>
							</c:if>
							<c:if test="${itemList.tabname eq 'D'}">
								<c:set var="D" value="${D + itemList.subtotal}"></c:set>
							</c:if>
							<c:if test="${itemList.tabname eq 'E'}">
								<c:set var="E" value="${E + itemList.subtotal}"></c:set>
							</c:if>
							<c:if test="${itemList.tabname eq 'F'}">
								<c:set var="F" value="${F + itemList.subtotal}"></c:set>
							</c:if>
							<c:if test="${itemList.tabname eq 'G'}">
								<c:set var="G" value="${G + itemList.subtotal}"></c:set>
							</c:if>
							<c:if test="${itemList.tabname eq 'H'}">
								<c:set var="H" value="${H + itemList.subtotal}"></c:set>
							</c:if>	
							<c:if test="${itemList.tabname eq '直接入力'}">
								<c:set var="I" value="${I + itemList.subtotal}"></c:set>
							</c:if>									
						</c:forEach>
						
						<c:set var="sum" value = "${A+B+C+D+E+F+G+H+I}" />
						
						<label>A件合計 </label>
						<input class="rightInput" type=text size=16 name="A" id="A" value="<fmt:formatNumber value="${A}" pattern="#,###.##"/>" disabled="disabled">
						
						<label>B件合計 </label>
						<input class="rightInput" type=text size=16 name="B" id="B" value="<fmt:formatNumber value="${B}" pattern="#,###.##"/>" disabled="disabled">
						
						<label>C件合計 </label>
						<input class="rightInput" type=text size=16 name="C" id="C" value="<fmt:formatNumber value="${C}" pattern="#,###.##"/>" disabled="disabled">
						
						<label>D件合計 </label>
						<input class="rightInput" type=text size=16 name="D" id="D" value="<fmt:formatNumber value="${D}" pattern="#,###.##"/>" disabled="disabled">
						
						<label>E件合計 </label>
						<input class="rightInput" type=text size=16 name="E" id="E" value="<fmt:formatNumber value="${E}" pattern="#,###.##"/>" disabled="disabled">
						
						<label>F件合計 </label>
						<input class="rightInput" type=text size=16 name="F" id="F" value="<fmt:formatNumber value="${F}" pattern="#,###.##"/>" disabled="disabled">
						
						</br>
						
						<label>G件合計      </label>
						<input class="rightInput" type=text size=16 name="G" id="G" value="<fmt:formatNumber value="${G}" pattern="#,###.##"/>" disabled="disabled">
						
						<label>H件合計     </label>
						<input class="rightInput" type=text size=16 name="H" id="H" value="<fmt:formatNumber value="${H}" pattern="#,###.##"/>" disabled="disabled">

						<c:forEach items="${EstimateNewCarDetail}" var="itemList" varStatus="status">
							<c:if test="${itemList.tabname eq '直接入力'}">
								<label>直接入力合計 </label>
								<input class="rightInput" type=text size=16 name="I" id="I" value="<fmt:formatNumber value="${I}" pattern="#,###.##"/>" disabled="disabled">
							</c:if>								
						</c:forEach>						
						
						<input class="rightInput" style="float: right;"type=text size=16  name="sum" id="sum" value="<fmt:formatNumber value="${sum}" pattern="#,###.##"/>" disabled="disabled">
						<label style=" background-color: yellow; float: right;" >合計金額 </label>
				</div>					
				
				<div style="margin-top: 5px;">
					<table width=100% border=0 cellspacing=0>
						<tr>
							<td style="background-color : skyblue ">見積日</td>
							<td>※<input type="date" size=16 id="estimateday" name="estimateday" value="${EstimateNewCarDetailOne.estimateday}" disabled="disabled"></td>
							<td bgcolor=skyblue>備考</td>
							<td>
								<textarea rows="4" cols="50" disabled="disabled"></textarea>
							</td>
							<td><input type=button style="width: 120pt; height: 40pt; float: right;" value="削除" onclick="javascript:deleteNewCarDetail(); return false;"></td>
							<td><input type=button style="width: 120pt; height: 40pt; float: right;" value="変更" onclick="window.close();"></td>
							<td><input type=button style="width: 120pt; height: 40pt; float: right;" value="複製" onclick="window.close();"></td>					
						</tr>		
					</table>
				</div>			
			</fieldset>
		</div>
	</div>
	
	<div id="footer2">
			<input type=button style="width: 120pt; height: 40pt;" value="閉じる" onclick="history.back();">
	</div>
	
</body>

</html>