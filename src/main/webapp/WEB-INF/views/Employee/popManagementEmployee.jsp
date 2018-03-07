<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/common/header.jsp" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language='javascript'>
	var employeeId; //社員ID
	var employeeKana;
	// 閉じるボタン
	function closeWindow() {
		window.close();
	}

	//参照/変更時削除
	function deleteList() {
		employeeId = document.updateEmployee.employeeId.value;
		employeeKana = document.updateEmployee.employeeKana.value;

		var msg = confirm("ID　:　【" + employeeId + "】、氏名　：　【" + employeeKana
				+ "】を削除します。よろしいですか?");
		if (msg == true) {

			$.ajax({
				type : "POST",
				url : "<c:url value='/deletePopEmployeeInfo.ajax'/>",
				data : {
					'employeeId' : employeeId
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
						alert("ID　:　【" + employeeId + "】、氏名　：　【" + employeeKana
								+ "】を削除しました。");
						self.close();
						opener.parent.location.reload();
						window.opener.getReturnValue("OK");
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
	// 参照/変更時保存
	function updateList() {
		employeeId = document.updateEmployee.employeeId.value;
		employeeKana = document.updateEmployee.employeeKana.value;
		var employeeName = $('#employeeName').val();
		var employeeMobileNumber = $('#employeeMobileNumber').val();
		var employeeEnteringDay = $('#employeeEnteringDay').val();//入社日付
		var employeeLeavingDay = $('#employeeLeavingDay').val();//退社日付
		var employeeEmail = $('#employeeEmail').val();
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;//email形式
		
		if (employeeName == "") {
			alert("氏名（漢字）を入力してください。");
		} else if (employeeKana == "") {
			alert("氏名（カナ）を入力してください。");
		} else if (employeeMobileNumber == "") {
			alert("携帯番号を入力してください。");
		} else if (employeeEnteringDay == "") {
			alert("入社日を入力してください。");
		} else if (employeeEmail != "" && exptext.test(employeeEmail)==false){
			alert("E-mailを正しく入力してください。");
		}　else {
			var msg = confirm("社員情報を保存します。よろしいですか?");
			if (msg == true) {
				$.ajax({
					type : "POST",
					url : "<c:url value='/updatePopEmployeeInfo.ajax'/>",
					data : {
						"employeeName" : employeeName,
						"employeeKana" : employeeKana,
						"employeeMobileNumber" : employeeMobileNumber,
						"employeeEnteringDay" : employeeEnteringDay,
						"employeeLeavingDay" : employeeLeavingDay,
						"employeeEmail" : employeeEmail,
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
							alert("社員情報を保存しました。");
							self.close();
							opener.parent.location.reload();
							window.opener.getReturnValue("OK");
						} else {
							alert("保存失敗しました。");
						}
					},
					complete : function(data) {

					}
				});
			}
		}

		return false;
	}

	// 新規登録
	function insertList() {
		employeeId = document.insertEmployee.employeeId.value;
		employeeKana = document.insertEmployee.employeeKana.value;
		var employeeName = document.insertEmployee.employeeName.value;
		var employeeMobileNumber = document.insertEmployee.employeeMobileNumber.value;
		var employeeEnteringDay = document.insertEmployee.employeeEnteringDay.value;//入社日付
		var employeeLeavingDay = document.insertEmployee.employeeLeavingDay.value;//退社日付
		var employeeEmail = document.insertEmployee.employeeEmail.value;
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;//email形式

		if (employeeId == "") {
			alert("IDを入力してください。");
		} else if (employeeName == "") {
			alert("氏名（漢字）を入力してください。");
		} else if (employeeKana == "") {
			alert("氏名（カナ）を入力してください。");
		} else if (employeeMobileNumber == "") {
			alert("携帯番号を入力してください。");
		} else if (employeeEnteringDay == "") {
			alert("入社日を入力してください。");
		} else if (employeeEmail != "" && exptext.test(employeeEmail)==false){
			alert("E-mailを正しく入力してください。");
		}else {
			var msg = confirm("社員情報を保存します。よろしいですか?");
			if (msg == true) {
				
				if (employeeId.length < 6) {
					alert("IDの文字数は6桁以上にしてください。");
				} else {
					$.ajax({
						type : "POST",
						url : "<c:url value='/duplicatePopEmployeeInfo.ajax'/>",
						data : {
							'employeeId' : employeeId
						},
									dataType : "json",
						async: false,
						beforeSend : function() {

						},
						error : function(request, status, error) {
							console.log(" code : " + request.status + " message : "
									+ request.responseText + " error : " + error);
						},
						success : function(data) {
							if (data.dupCheck > 0) {
								alert("【" + data.dupName
										+ "】様が使用している為登録できません。\n別のIDを入力してください");
							} else if (data.dupCheck == 0) {
								
								$.ajax({
									type : "POST",
									url : "<c:url value='/insertPopEmployeeInfo.ajax'/>",
									data : {
										"employeeName" : employeeName,
										"employeeKana" : employeeKana,
										"employeeMobileNumber" : employeeMobileNumber,
										"employeeEnteringDay" : employeeEnteringDay,
										"employeeLeavingDay" : employeeLeavingDay,
										"employeeEmail" : employeeEmail,
										"employeeId" : employeeId
									},
									dataType : "json",
									async: false,
									beforeSend : function() {

									},
									error : function(request, status, error) {
										console.log(" code : " + request.status + " message : "
												+ request.responseText + " error : " + error);
									},
									success : function(data) {
										if (data.resultCnt > 0) {
											alert("社員情報を保存しました。");
											self.close();
											opener.parent.location.reload();
											window.opener.getReturnValue("OK");
										} else {
											alert("保存失敗しました。");
										}
									},
									complete : function(data) {
										
									}
								});
							}
						},
						complete : function(data) {

						}
					});
				}
				
			}
		}

		return false;
	}
	
	//パスワードを初期化
	function resetPasswd() {
		employeeId = document.updateEmployee.employeeId.value;
		var msg = confirm("パスワードを初期化します。よろしいですか?");
		if (msg == true) {
			$.ajax({
				type : "POST",
				url : "<c:url value='/resetPopEmployeeInfo.ajax'/>",
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
						alert("パスワードを初期化しました。");
						self.close();
						window.opener.getReturnValue("OK");
					} else {
						alert("保存失敗しました。");
					}
				},
				complete : function(data) {

				}
			});
		}
		return false;
	}

	function dupCheck() {
		employeeId = document.insertEmployee.employeeId.value;
		if (employeeId == "") {
			alert("IDを入力してください。");
		} else if (employeeId.length < 6) {
			alert("IDの文字数は6桁以上にしてください。");
		} else {
			$.ajax({
				type : "POST",
				url : "<c:url value='/duplicatePopEmployeeInfo.ajax'/>",
				data : {
					'employeeId' : employeeId
				},
							dataType : "json",
				beforeSend : function() {

				},
				error : function(request, status, error) {
					console.log(" code : " + request.status + " message : "
							+ request.responseText + " error : " + error);
				},
				success : function(data) {
					if (data.dupCheck > 0) {
						alert("【" + data.dupName
								+ "】様が使用している為登録できません。\n別のIDを入力してください");
					} else if (data.dupCheck == 0) {
						alert("入力したID使用可能です。");
					}
				},
				complete : function(data) {

				}
			});
		}
		return false;
	}
// 	数字とハイフンと括弧のみ入力
	$(function(){
		$(document).on("keyup", "input:text[numberOnly]", function() {$(this).val( $(this).val().replace(/[^0-9\()-]/gi,"") );});
		$(document).on("keyup", "input:text[datetimeOnly]", function() {$(this).val( $(this).val().replace(/[^0-9\()-]/gi,"") );});
	});
</script>
</head>
<body>
	<div align=center>
		<h1>社員情報管理</h1>
	</div>
	<c:choose>
		<c:when test="${param.parameter.equals('updateList')}">
			<fieldset>
				<form method=get name="updateEmployee">
					<input type="hidden" id="loginId" name="loginId" value=${param.id } />
					<input type="hidden" id="loginName" name="loginName"
						value=${param.name } />

					<table width=100% border=0 cellspacing=0>
						<tr>
							<td colspan=7 bgcolor=skyblue>社員情報詳細</td>
						</tr>
						<tr>
							<td colspan=5 height=5></td>
						</tr>
						<tr>
							<td width=120 bgcolor=skyblue>ID</td>
							<td width=10><img src="/resources/images/required.png"></td>
							<td width=120><input type=text size=30 name=employeeId
								id="employeeId" value="${popEmployeeSelect.get(0).employeeId}"
								readonly></td>
							<td width=10> </td>
							<td width=135 bgcolor=skyblue>入社日</td>
							<td width=20> <img src="/resources/images/required.png"></td>
							<td><input type="date" size=30 id="employeeEnteringDay"
								name="employeeEnteringDay"
								value="${popEmployeeSelect.get(0).employeeEnteringDay}"></td>
						</tr>

						<tr>
							<td colspan=3 height=5 />
						</tr>
						<tr>
							<td width=120></td>
							<td width=20></td>
							<td width=120 align="right"><input type="button"
								value="ID重複チェック" name="idChk" id="idChk" disabled='disabled'></td>
							<td width=20></td>
							<td width=135 bgcolor=skyblue>退社日</td>
							<td width=20></td>
							<td><input type="date" size=30 id="employeeLeavingDay"
								name="employeeLeavingDay"
								value="${popEmployeeSelect.get(0).employeeLeavingDay}"></td>
						</tr>
						<tr>
							<td colspan=3 height=10 />
						</tr>
						<tr>
							<td bgcolor=skyblue>氏名（漢字）</td>
							<td width=20><img src="/resources/images/required.png"></td>
							<td><input type="text" size=30 id="employeeName"
								name="employeeName"
								value="${popEmployeeSelect.get(0).employeeName}"></td>
							<td width=20></td>
							<td width=135 bgcolor=skyblue>E-mail</td>
							<td width=20></td>
							<td><input type="text" size=30 id="employeeEmail"
								name="employeeEmail"
								value="${popEmployeeSelect.get(0).employeeEmail}"></td>
						</tr>

						<tr>
							<td colspan=3 height=5 />
						</tr>
						<tr>
							<td bgcolor=skyblue>氏名（カナ）</td>
							<td width=20><img src="/resources/images/required.png"></td>
							<td><input type="text" size=30 id="employeeKana"
								name="employeeKana"
								value="${popEmployeeSelect.get(0).employeeKana}"></td>
							<td width=20></td>
							<td width=135 bgcolor=skyblue>携帯番号</td>
							<td width=20><img src="/resources/images/required.png"></td>
							<td><input type="text" size=30 id="employeeMobileNumber"
								name="employeeMobileNumber"
								value="${popEmployeeSelect.get(0).employeeMobileNumber}" numberonly="true"></td>
						</tr>
						<tr>
							<td colspan=3 height=5 />
						</tr>
					</table>

					<input type="button" style="width: 90pt; height: 30pt;" value="削除"
						onclick="javascript:deleteList(); return false;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
						type="button" style="width: 90pt; height: 30pt;" value="パスワード初期化"
						onclick="javascript:resetPasswd(); return false;"> <input
						type="button" style="width: 90pt; height: 30pt; float: right;"
						value="保存" onclick="javascript:updateList(); return false;">
				</form>
			</fieldset>
		</c:when>
		<c:when test="${param.parameter.equals('insertList')}">
			<fieldset>
				<form method=get name="insertEmployee">
					<input type="hidden" id="loginId" name="loginId" value=${param.id } />
					<input type="hidden" id="loginName" name="loginName"
						value=${param.name } />

					<table width=100% border=0 cellspacing=0>
						<tr>
							<td colspan=7 bgcolor=skyblue>社員情報詳細</td>
						</tr>
						<tr>
							<td colspan=5 height=5></td>
						</tr>
						<tr>
							<td width=120 bgcolor=skyblue>ID</td>
							<td width=10><img src="/resources/images/required.png"></td>
							<td><input type=text size=30 name=employeeId id="employeeId" maxlength="16"></td>
							<td width=10></td>
							<td width=135 bgcolor=skyblue>入社日</td>
							<td width=20><img src="/resources/images/required.png"></td>
							<td><input type="date" size=30 id="employeeEnteringDay"
								name="employeeEnteringDay"> <script>
									document
											.getElementById('employeeEnteringDay').valueAsDate = new Date();
								</script></td>
						</tr>

						<tr>
							<td colspan=3 height=5 />
						</tr>
						<tr>
							<td width=120></td>
							<td width=20></td>
							<td width=120 align="right"><input type="button"
								value="ID重複チェック" name="idChk" id="idChk"
								onclick="javascript:dupCheck(); return false;"></td>
							<td width=20></td>
							<td width=135 bgcolor=skyblue>退社日</td>
							<td width=20></td>
							<td><input type="date" size=30 id="employeeLeavingDay"
								name="employeeLeavingDay"></td>
						</tr>
						<tr>
							<td colspan=3 height=10 />
						</tr>
						<tr>
							<td bgcolor=skyblue>氏名（漢字）</td>
							<td width=20><img src="/resources/images/required.png"></td>
							<td><input type="text" size=30 id="employeeName"
								name="employeeName"></td>
							<td width=20></td>
							<td width=135 bgcolor=skyblue>E-mail</td>
							<td width=20></td>
							<td><input type="text" size=30 id="employeeEmail"
								name="employeeEmail"></td>
						</tr>

						<tr>
							<td colspan=3 height=5 />
						</tr>
						<tr>
							<td bgcolor=skyblue>氏名（カナ）</td>
							<td width=20><img src="/resources/images/required.png"></td>
							<td><input type="text" size=30 id="employeeKana"
								name="employeeKana"></td>
							<td width=20></td>
							<td width=135 bgcolor=skyblue>携帯番号</td>
							<td width=20><img src="/resources/images/required.png"></td>
							<td><input type="text" size=30 id="employeeMobileNumber"
								name="employeeMobileNumber" datetimeonly="true"></td>
						</tr>
						<tr>
							<td colspan=3 height=5 />
						</tr>
					</table>

					<center>
						<input type="button"
							style="width: 90pt; height: 30pt; float: right;" value="保存"
							onClick="javascript:insertList(); return false;">
					</center>
				</form>
			</fieldset>
		</c:when>
	</c:choose>
	<div id="footerPop">
	<input type=button style="width: 90pt; height: 30pt;" value="閉じる"
		onClick="closeWindow()">
	</div>

</body>
</html>