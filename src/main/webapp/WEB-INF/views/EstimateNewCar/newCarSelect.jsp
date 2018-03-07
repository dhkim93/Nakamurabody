<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>見積支援システム</title>
<c:import url="/WEB-INF/views/common/header.jsp" />
<script type="text/javascript">
	var estimatenumberParam; //見積番号パラメータ
	var customeridParam;		 //顧客IDパラメータ

	$(function() {
		$("#estimatenewcardetail").hide();
		jqgridTrans = $('#wrapper');
		jqgridTrans.jqGrid({
			datatype : "local",
			colNames : [ "見積番号", "見積日", "ボデータイプ", "仕様項目", "見積金額", "見積担当者明", "顧客名" , "customerid"], // colname
			colModel : [ // 
			{
				name : 'estimatenumber'
			}, {
				name : 'estimateday'
			}, {
				name : 'bodyname'
			}, {
				name : 'bodyspecname'
			}, {
				name : 'estimatemoney', formatter:numberWithCommas
			}, {
				name : 'estimateemployeename'
			}, {
				name : 'customername'
			},{
				name : 'customerid' ,  hidden:true
			},  
			],
			height : 280, //or auto, defaultHeight
			width : 1150,
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
			},
			// 			ondblClickRow : function(rowid, iRow, iCol, e) {
			// 				var data = jQuery('#wrapper').jqGrid('getRowData', rowid);
			// 				alert(data);
			// 			},
			onSelectRow :  function(rowid, iRow, iCol, e) { //row click 
				var data = jQuery('#wrapper').jqGrid('getRowData', rowid);
				estimatenumberParam = data.estimatenumber;
				customeridParam = data.customerid;
				btnAbledControll(data);
			}
		});
	});

	//戻るボタン
	function back(){
		$("#newcarselect").show();
		$("#estimatenewcardetail").hide();
		$("#Ilabel").hide();
		$("#I").hide();
	}

	function gridChange(){
		$("#newcarselect").hide();
		$("#estimatenewcardetail").show();
		jqgridTrans = $('#wrapper2');
		jqgridTrans.jqGrid({
			datatype : "local",
			colNames : ["選択仕様", "仕様項目", "仕様詳細", "単位", "定価", "個数", "小計", "estimatenumber", "customerid"], // colname
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
			},{
				name : 'estimatenumber' ,  hidden:true
			},  {
				name : 'customerid' ,  hidden:true
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
				var data = jQuery('#wrapper2').jqGrid('getRowData', rowid);
				estimatenumberParam = data.estimatenumber;
				customeridParam = data.customerid;
			}
		});
	}

	//ボタン有効
	function btnAbledControll(data){
		$("#deleteBtn").prop('disabled', false);
		$("#detailUpdateBtn").prop('disabled', false);
	}

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
	function deleteNewCar(){
		var confirmcheck = confirm("新車見積情報を削除します。\nよろしいですか？");

		if(confirmcheck){
			
			$.ajax({
				type : "POST",
				url : "<c:url value='/deleteNewCar.ajax'/>",
				data : {
					"estimatenumber" : estimatenumberParam,
					"customerid" : customeridParam,
				},
				dataType : "json",
				beforeSend : function() {
				},
				error : function(request, status, error) {
					console.log(" code : " + request.status + " message : "
							+ request.responseText + " error : " + error);
				},
				success : function(data){
					if(data.resultCnt > 0 ){
						alert("新車見積情報を削除しました。");
						var rowid = $("#wrapper").getGridParam( "selrow" );
						$("#wrapper").delRowData(rowid);
						back(); //戻る
					}else{
						alert("削除失敗しました。");
					}
				},
				complete : function(data) {
				}
			});
			return false;
		}

	}

	//GRID取得
	function searchList() {
		var estimatenumber = $('#estimatenumber').val(); 						//見積番号
		var estimateemployeekana = $('#estimateemployeekana').val(); 		//見積担当(カナ)
		var bodytype = $('#bodytype').val(); 											//ボデータイプ
		var customerkana = $('#customerkana').val(); 								//顧客名(カナ)
		var estimatemoneyfrom = $('#estimatemoneyfrom').val(); 				//見積金額(検索条件)
		var estimatemoneyto = $('#estimatemoneyto').val(); 						//見積金額(検索条件)
		var estimatedayfrom = $('#estimatedayfrom').val();						//見積期間(検索条件)
		var estimatedayto = $('#estimatedayto').val();								//見積期間(検索条件)

		var result = fieldCheck();
		if(result == false){
			alert("検索条件を１つ以上入力してください。");
			return false;
		}

		$.ajax({
			type : "POST",
			url : "<c:url value='/newCarSelect.ajax'/>",
			data : {
				"estimatenumber" : estimatenumber,
				"estimateemployeekana" : estimateemployeekana,
				"bodytype" : bodytype,
				"customerkana" : customerkana,
				"estimatemoneyfrom" : estimatemoneyfrom,
				"estimatemoneyto" : estimatemoneyto,
				"estimatedayfrom" : estimatedayfrom,
				"estimatedayto" : estimatedayto
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
					$('#wrapper').jqGrid("clearGridData"); //グリッド削除
					$('#wrapper').jqGrid("setGridParam", {
						dataType : "local",
						data : result
					}).trigger("reloadGrid");
				}else{
					$('#wrapper').jqGrid("clearGridData"); //グリッド削除
					alert("検索条件と一致する情報がありません。");
					$("#deleteBtn").prop('disabled', true);
					$("#detailUpdateBtn").prop('disabled', true);					
					
				}
			},
			complete : function(data) {
			}
		});
		return false;
	}

	//参照/変更ボタン
	function selectPopEstimateNewCarDetail(){
		//window.location.href = '/popEstimateNewCarDetail.do?estimatenumber='+estimatenumberParam+'&customerid='+customeridParam;
		gridChange(); //グリード変更
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/selectPopEstimateNewCarDetail.ajax'/>",
			data : {
				"estimatenumber" : estimatenumberParam,
				"customerid" : customeridParam
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
					$('#wrapper2').jqGrid("clearGridData"); //グリッド削除
					$('#wrapper2').jqGrid("setGridParam", {
						dataType : "local",
						data : result
					}).trigger("reloadGrid");

					$('.estimatenewcardetail #estimatenumber').val(result[0].estimatenumber);
					$('.estimatenewcardetail #customerkana').val(result[0].customerkana);
					$('.estimatenewcardetail #bodyname').val(result[0].bodyname);
					$('.estimatenewcardetail #customername1').val(result[0].customername1);
					$('.estimatenewcardetail #state').val(result[0].state);
					$('.estimatenewcardetail #estimateemployeename').val(result[0].estimateemployeename);
					$('.estimatenewcardetail #estimateday').val(result[0].estimateday);
					$('.estimatenewcardetail #remarks').val(result[0].remarks);
					
					var A = 0;var B = 0;var C = 0;var D = 0;var E = 0;
					var F = 0;var G = 0;var H = 0;var I = 0;var sum = 0;
					
					for(var i=0; i < result.length; i++) {
						
						if(result[i].tabname == 'A'){
							A += parseInt(result[i].subtotal);
							$('.estimatenewcardetail #A').val(numberWithCommas(A));
						}

						if(result[i].tabname == 'B'){
							B += parseInt(result[i].subtotal);
							$('.estimatenewcardetail #B').val(numberWithCommas(B));
						}

						if(result[i].tabname == 'C'){
							C += parseInt(result[i].subtotal);
							$('.estimatenewcardetail #C').val(numberWithCommas(C));
						}

						if(result[i].tabname == 'D'){
							D += parseInt(result[i].subtotal);
							$('.estimatenewcardetail #D').val(numberWithCommas(D));
						}

						if(result[i].tabname == 'E'){
							E += parseInt(result[i].subtotal);
							$('.estimatenewcardetail #E').val(numberWithCommas(E));
						}

						if(result[i].tabname == 'F'){
							F += parseInt(result[i].subtotal);
							$('.estimatenewcardetail #F').val(numberWithCommas(F));
						}
						
						if(result[i].tabname == 'G'){
							G += parseInt(result[i].subtotal);
							$('.estimatenewcardetail #G').val(numberWithCommas(G));
						}						

						if(result[i].tabname == 'H'){
							H += parseInt(result[i].subtotal);
							$('.estimatenewcardetail #H').val(numberWithCommas(H));
						}

						if(result[i].tabname == '直接入力'){
							I += parseInt(result[i].subtotal);
							$('#sumplace').append('<label id="Ilabel" >直接入力合計</label>');
							$('#sumplace').append('<input class="rightInput" type=text size=16 name="I" id="I"  disabled="disabled">');
							$('.estimatenewcardetail #I').val(numberWithCommas(I));
						}
						
						sum = A+B+C+D+E+F+G+H+I;
						$('.estimatenewcardetail #sum').val(numberWithCommas(sum));
						
					}

				}else{
					$('#wrapper2').jqGrid("clearGridData"); //グリッド削除
					alert("検索条件と一致する情報がありません。");
					$("#deleteBtn").prop('disabled', true);
					$("#detailUpdateBtn").prop('disabled', true);					
				}
			},
			complete : function(data) {
			}
		});
		return false;
	}	

	//validate function
	function fieldCheck(){
		var inputNum = false;
		var txtEle = $("#newCarSelectForm input[type=text]");
		var dateEle = $("#newCarSelectForm input[type=date]");
		var bodytypedetail = $("#bodytypedetail").val();
		var bodytype = $("#bodytype").val();
		
		for(var i = 0; i < txtEle.length; i ++){
			if("" != $(txtEle[i]).val()){
				var ele_id = $(txtEle[i]).attr("id");
				console.log("id : " + ele_id);
				inputNum = true;
			}
		}

		for(var i = 0; i < dateEle.length; i ++){
			if("" != $(dateEle[i]).val()){
				var ele_id = $(dateEle[i]).attr("id");
				console.log("id : " + ele_id);
				inputNum = true;
			}
		}

		if("" != bodytypedetail && "0" != bodytypedetail){
			inputNum = true;
		}

		if("" != bodytype && "0" != bodytype){
			inputNum = true;
		}		
		return inputNum;
	}

</script>
</head>
<body>
	<%@ include file="../common/nav_manager.jsp"%>
	
	<!-- 	新車見積情報選択 -->
	<div class = "newcarselect" id ="newcarselect">
		<div id="middle">
			<div id="sidebar1400">
				<fieldset>
					<form method=post id="newCarSelectForm" name="newCarSelectForm" action="/popEstimateNewCarDetail.do">
						<table width=100% border=0 cellspacing=0>
							<tr>
								<td colspan=5 bgcolor=skyblue>新車見積情報検索</td>
							</tr>
							<tr>
								<td colspan=5 height=5></td>
							</tr>
							<tr>
								<td width=120 bgcolor=skyblue >見積番号</td>
								<td width=20></td>
								<td><input type=text size=15 name=estimatenumber  id="estimatenumber"> (修正のみ入力)</td>
								<td width=20></td>
							</tr>
							
							<tr><td colspan=3 height=5/></tr>
							<tr>
								<td width=120 bgcolor=skyblue>ボデータイプ</td>
								<td></td>
								<td>
									<select id="bodytype" name="bodytype" onchange="javascript:searchBodyDetailCombo(this.value); return false; ">
										<option value="0">選択してください。</option>
										<c:forEach items="${bodyType}" var="bodyType">
											<option value="${bodyType.combotype}">${bodyType.comboname}</option>
										</c:forEach>
									</select>								
								</td>
								<td width=120 bgcolor=skyblue>顧客名（カナ）</td>
								<td><input type=text size=40 id="customerkana" name=customerkana></td>
							</tr>
							<tr><td colspan=3 height=10/></tr>
							<tr>
								<td bgcolor=skyblue>ボデー明細</td>
								<td></td>
								<td>
									<select id="bodytypedetail" name="bodytypedetail" style="height: 25px;">
									    <option value="0">選択してください。</option>
									</select>
								</td>
								<td width=120 bgcolor=skyblue>見積期間</td>
								<td>
									<input type="date" size=15 id="estimatedayfrom" name="estimatedayfrom">~
									<input type="date" size=15 id="estimatedayto" name="estimatedayto">
								</td>
							</tr>	
							<tr><td colspan=3 height=5/></tr>					
							<tr>
								<td bgcolor=skyblue>見積担当(カナ)</td>
								<td></td>
								<td><input type=text size=30 name="estimateemployeekana" id="estimateemployeekana"></td>
								<td width=120 bgcolor=skyblue>見積金額</td>
								<td>
									<input type="text" size=15  id="estimatemoneyfrom" name="estimatemoneyfrom" >~
									<input type="text" size=15 id="estimatemoneyto" name="estimatemoneyto" >
								</td>
							</tr>
							
							<tr>
								<td colspan=3 height=5></td>
							</tr>
						</table>
						
						<center>
							<input type=reset style="width: 110pt; height: 30pt;" value="クリア" >
							<input type="button" style="width: 110pt; height: 30pt;" value="検索" onclick="javascript:searchList(); return false;">
							<input type="button" style="width: 110pt; height: 30pt; float: right;" value="新規追加">
						</center>
					</form>
				</fieldset>
			</div>
			
			<div id="contentCenter">
				<fieldset>
					<table width=100% border=0 cellspacing=0>
						<tr>
							<td colspan=3 bgcolor=skyblue>新車見積情報一覧</td>
						</tr>
					</table>
					<div id="sidebar300">
						<table id="wrapper"></table>
					</div>
					<div style="display:inline-block; float: right; width: 150px; height: 250px;" >
						<input type="button" style="width: 110pt; height: 30pt; margin-bottom: 230px;" 
							id="detailUpdateBtn" disabled="disabled" onclick="javascript:selectPopEstimateNewCarDetail(); return false;" value="参照/変更">
						<input type="button" style="width: 110pt; height: 30pt; " 
							id="deleteBtn" disabled="disabled" onclick="javascript:deleteNewCar(); return false;" value="削除">
					</div>
				</fieldset>
			</div>
		</div><!-- end of middle -->
		
		<div id="footer2">
				<input type=button style="width: 120pt; height: 40pt;" value="閉じる" onclick="history.back();">
		</div>
	</div>
	
	<!-- 	新車見積詳細 -->
	<div class="estimatenewcardetail" id = "estimatenewcardetail" >
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
						<table id="wrapper2"></table>
					</div>
					</fieldset>		
					
					<div style="position: block;" id="sumplace">
						
						<label>A件合計 </label>
						<input class="rightInput" type=text size=16 name="A" id="A" disabled="disabled">
						
						<label>B件合計 </label>
						<input class="rightInput" type=text size=16 name="B" id="B"  disabled="disabled">
						
						<label>C件合計 </label>
						<input class="rightInput" type=text size=16 name="C" id="C"  disabled="disabled">
						
						<label>D件合計 </label>
						<input class="rightInput" type=text size=16 name="D" id="D"  disabled="disabled">
						
						<label>E件合計 </label>
						<input class="rightInput" type=text size=16 name="E" id="E"  disabled="disabled">
						
						<label>F件合計 </label>
						<input class="rightInput" type=text size=16 name="F" id="F"  disabled="disabled">
						</br>
						
						<label>G件合計      </label>
						<input class="rightInput" type=text size=16 name="G" id="G"  disabled="disabled">
						
						<label>H件合計     </label>
						<input class="rightInput" type=text size=16 name="H" id="H"  disabled="disabled">
						
						<input class="rightInput" style="float: right;"type=text size=16  name="sum" id="sum"  disabled="disabled">
						<label style=" background-color: yellow; float: right;" >合計金額 </label>
						
					</div>					
					
					<div style="margin-top: 5px;">
						<table width=100% border=0 cellspacing=0>
							<tr>
								<td style="background-color : skyblue ">見積日</td>
								<td>※<input type="date" size=16 id="estimateday" name="estimateday"  disabled="disabled"></td>
								<td bgcolor=skyblue>備考</td>
								<td>
									<textarea rows="4" cols="50" id="remarks" name="remarks"  disabled="disabled"></textarea>
								</td>
								<td><input type=button style="width: 120pt; height: 40pt; float: right;" value="削除" onclick="javascript:deleteNewCar(); return false;"></td>
								<td><input type=button style="width: 120pt; height: 40pt; float: right;" value="変更" onclick="window.close();"></td>
								<td><input type=button style="width: 120pt; height: 40pt; float: right;" value="複製" onclick="window.close();"></td>					
							</tr>		
						</table>
					</div>			
				</fieldset>
			</div>
		</div> <!-- end of middle -->
	
		<div id="footer2">
			<input type=button style="width: 120pt; height: 40pt;" value="閉じる" onclick="javascript:back(); return false;">
		</div>	
		
	</div>
	
</body>
</html>

