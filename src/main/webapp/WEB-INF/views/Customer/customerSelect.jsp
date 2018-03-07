<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<c:import url="/WEB-INF/views/common/header.jsp" />
<script>
	/* function selectrowdata(id) {
		var rowdata = $("#customerinfo").getRowData(id);
		alert(rowdata.customername1 + " / " + rowdata.address1 + " / "
				+ rowdata.telephone1);
	} */

	$(function() {
		jqgridTrans = $('#customerinfo');
		jqgridTrans.jqGrid({
			datatype : "local",
			colNames : [ "顧客名", "住所", "電話番号" ],
			colModel : [ {
				name : 'customername1'
			}, {
				name : 'address1'
			}, {
				name : 'telephone1'
			}, ],
			/* onSelectRow : function(id, b_check) {
				// alert(b_check ? "選択されました" : "解除されました");
				selectrowdata(id);
			}, */
			height : 260,
			width : 760,
			// autowidth : false,
			shrinkToFit : true,
			rowNum : 20,
			// pager : "#pager", //paging
			viewrecords : true,
			// multiselect : true,
			rownumbers : true,
			useColSpanStyle : true,
			emptyrecords : "empty",
			loadComplete : function(data) {
				// initPage("wrapper", "", "");
			},
		/* ondblClickRow : function(rowid, iRow, iCol, e) {
			var data = jQuery('#customerinfo').jqGrid('getRowData', rowid);
		} */
		});
	});

	function searchclk() {
		if (document.searchCustomer.customerNameKana.value.trim() == ""
				&& document.searchCustomer.customerTelephone.value.trim() == "") {
			alert('検索条件を一つ以上入力してください。');
			document.searchCustomer.customerNameKana.focus();
			exit;
		}
		if (!document.searchCustomer.customerTelephone.value.trim() == "") {
			if (document.searchCustomer.customerTelephone.value.trim().length != 4) {
				alert('電話番号は４桁で入力してください');
				document.searchCustomer.customerTelephone.focus();
				exit;
			}
		}

		$.ajax({
			type : "POST",
			url : "customerSelect.ajax",
			data : {
				'customerkana' : $('#customerNameKana').val(),
				'telephone1' : $('#customerTelephone').val()
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
				var result = data.customerSelect;
				if (result != undefined && result.length > 0) {
					$('#customerinfo').jqGrid("clearGridData");
					$('#customerinfo').jqGrid("setGridParam", {
						dataType : "local",
						data : result
					}).trigger("reloadGrid");
				} else {
					$('#customerinfo').jqGrid("clearGridData"); //グリッド削除
					alert("検索条件と一致する情報がありません。");
				}
			},
			complete : function(data) {
				// alert("complete");
			}
		});
		return false;
	}

	function selectrow() {

		var rowid = $("#customerinfo").jqGrid("getGridParam", "selrow");

		$.ajax({
					type : "POST",
					url : "customerDetail.ajax",
					data : {
						'customername1' : $("#customerinfo").jqGrid(
								"getRowData", rowid).customername1,
						'address1' : $("#customerinfo").jqGrid("getRowData",
								rowid).address1,
						'telephone1' : $("#customerinfo").jqGrid("getRowData",
								rowid).telephone1,
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
						// var key = Object.keys(data["customerDetail"][0]);
						// alert(key[0]);

						var result = data.customerDetail;
						var namekana = document
								.getElementById('detailNameKana');
						namekana.value = result[0].customerkana;
						var namekana = document.getElementById('detailName1');
						namekana.value = result[0].customername1;
						var namekana = document.getElementById('detailName2');
						namekana.value = result[0].customername2;
						var namekana = document.getElementById('detailState');
						namekana.value = result[0].state;
						var namekana = document.getElementById('detailPost');
						namekana.value = result[0].post;
						var namekana = document
								.getElementById('detailAddress1');
						namekana.value = result[0].address1;
						var namekana = document
								.getElementById('detailAddress2');
						namekana.value = result[0].address2;
						var namekana = document
								.getElementById('detailAddress3');
						namekana.value = result[0].address3;
						var namekana = document.getElementById('detailPhone1');
						namekana.value = result[0].telephone1;
						var namekana = document.getElementById('detailPhone2');
						namekana.value = result[0].telephone2;
						var namekana = document.getElementById('detailFaxNum');
						namekana.value = result[0].fax;
						var namekana = document.getElementById('detailEmail');
						namekana.value = result[0].email;
					},
					complete : function(data) {
						// alert("complete");
					}
				});
		return false;
	}

	/* function test() {
		var rowid, name, address, phone, test;
		var test = document.getElementById('detailNameKana');

		rowid = $("#customerinfo").jqGrid("getGridParam", "selrow");
		name = $("#customerinfo").jqGrid("getRowData", rowid).customername1;
		address = $("#customerinfo").jqGrid("getRowData", rowid).address1;
		phone = $("#customerinfo").jqGrid("getRowData", rowid).telephone1;

		test.value = name;
	} */

	function resetclk() {
		document.searchCustomer.reset();
		document.detailCustomer.reset();
		$("#customerinfo").clearGridData();
	}
</script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>顧客情報選択</title>
</head>
<body>
	<div id="cus_header" align=center>
		<h1>顧客情報選択</h1>
	</div>
	<div id="cus_middle">
		<div id="cus_sidebar1">
			<fieldset>
				<form method=post name=searchCustomer action="#">
					<table width=100% border=0 cellspacing=0>
						<tr>
							<td colspan=3 bgcolor=skyblue>顧客情報検索</td>
						</tr>
						<tr>
							<td colspan=3 height=10></td>
						</tr>
						<tr>
							<td width=120 bgcolor=skyblue>顧客名（カナ）</td>
							<td width=20></td>
							<td><input type=text size=30 name=customerNameKana
								id=customerNameKana></td>
						</tr>
						<tr>
							<td colspan=3 height=10></td>
						</tr>
						<tr>
							<td bgcolor=skyblue>電話番号</td>
							<td></td>
							<td><input type=text size=12 name=customerTelephone
								id=customerTelephone>（下４桁）</td>
						</tr>
						<tr>
							<td colspan=3 height=10></td>
						</tr>
					</table>
					<center>
						<input type=button style="width: 110pt; height: 30pt;" value="クリア"
							onclick="resetclk()"> <input type=button
							style="width: 110pt; height: 30pt;" value="検索"
							onclick="searchclk(); return false;">
					</center>
				</form>
			</fieldset>
		</div>

		<div id="cus_content">
			<fieldset>
				<form method=post name=detailCustomer action=#>
					<table width=100% border=0>
						<tr>
							<td colspan=3 bgcolor=skyblue>顧客情報詳細</td>
						</tr>
						<tr>
							<td colspan=3 height=5></td>
						</tr>
						<tr>
							<td width=120 bgcolor=skyblue>顧客名（カナ）</td>
							<td width=20></td>
							<td><input type=text size=30 id=detailNameKana
								name=detailNameKana readonly="readonly"></td>
						</tr>
						<tr>
							<td colspan=3 height=5></td>
						</tr>
						<tr>
							<td width=120 bgcolor=skyblue>顧客名（漢字）</td>
							<td width=20></td>
							<td><input type=text size=30 id=detailName1 name=detailName1
								readonly="readonly"></td>
						</tr>
						<tr>
							<td colspan=3 height=5></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td><input type=text size=30 id=detailName2 name=detailName2
								readonly="readonly"></td>
						</tr>
						<tr>
							<td colspan=3 height=5></td>
						</tr>
						<tr>
							<td width=120 bgcolor=skyblue>敬称</td>
							<td width=20></td>
							<td><input type=text size=10 id=detailState name=detailState
								readonly="readonly"></td>
						</tr>
					</table>
					<fieldset>
						<legend align="left">顧客情報</legend>
						<table width=100% border=0>
							<tr>
								<td width=120 bgcolor=skyblue>郵便番号</td>
								<td width=20></td>
								<td><input type=text size=15 id=detailPost name=detailPost
									readonly="readonly"></td>
							</tr>
							<tr>
								<td colspan=3 height=5></td>
							</tr>
							<tr>
								<td width=120 bgcolor=skyblue>住所</td>
								<td width=20></td>
								<td><input type=text size=35 id=detailAddress1
									name=detailAddress1 readonly="readonly"></td>
							</tr>
							<tr>
								<td colspan=3 height=5></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td><input type=text size=35 id=detailAddress2
									name=detailAddress2 readonly="readonly"></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td><input type=text size=35 id=detailAddress3
									name=detailAddress3 readonly="readonly"></td>
							</tr>
							<tr>
								<td width=120 bgcolor=skyblue>電話番号</td>
								<td width=20></td>
								<td><input type=text size=35 id=detailPhone1
									name=detailPhone1 readonly="readonly"></td>
							</tr>
							<tr>
								<td colspan=3 height=5></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td><input type=text size=35 id=detailPhone2
									name=detailPhone2 readonly="readonly"></td>
							</tr>
							<tr>
								<td width=120 bgcolor=skyblue>FAX番号</td>
								<td width=20></td>
								<td><input type=text size=35 id=detailFaxNum
									name=detailFaxNum readonly="readonly"></td>
							</tr>
							<tr>
								<td colspan=3 height=5></td>
							</tr>
							<tr>
								<td width=120 bgcolor=skyblue>E-Mail</td>
								<td width=20></td>
								<td><input type=text size=40 id=detailEmail
									name=detailEmail readonly="readonly"></td>
							</tr>
							<tr>
								<td colspan=3 height=5></td>
							</tr>
						</table>
					</fieldset>
					<p>
						<span style="float: right"><input type=submit
							style="width: 110pt; height: 30pt;" value="確定"></span>
				</form>
			</fieldset>
		</div>
		<div id="cus_sidebar2">
			<fieldset style="height: 340px">
				<table id="customerinfo"></table>
				<p>
					<span style="float: right"><input type=button
						style="width: 110pt; height: 30pt;" value=詳細
						onclick="selectrow(); return false;"></span>
			</fieldset>
		</div>
	</div>
	<div id="footer">
		&nbsp;&nbsp;<input type=button style="width: 120pt; height: 40pt;"
			value="閉じる" onclick="window.close()">
	</div>

</body>
</html>