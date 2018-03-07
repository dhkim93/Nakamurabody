<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<c:import url="/WEB-INF/views/common/header.jsp" />
<script>
window.onload = function(){
	var param = opener.document.getElementById('id').value;
	document.getElementById('id').value = param;
	};
	
function chclk() {
	var pass1 = document.chpassword.password1.value;
	var pass2 = document.chpassword.password2.value;
	var paramid = document.chpassword.id.value;
	
	if (pass1 != '') {
		if (pass1.length < 8 || pass1.length > 16) {
			alert('パスワードの文字数は８－１６桁にしてください。');
		} else if (pass2 == '') {
			alert('パスワード確認を入力してください。');
		} else if(pass1 != pass2){
			alert('パスワードとパスワード確認が異なっています。');
		} /* else if(paramid == pass1){
			alert('パスワードはIDと異なるようにしてください。');
		} */ else {
			$.ajax({
				type : "POST",
				url : "changepwd.ajax",
				data : {
					'employeeid' : $('#id').val(),
					'employeepassword' : $('#password1').val()
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
				},
				complete : function(data) {
					alert("パスワードを更新しました。");
					self.close();
					window.opener.getReturnValue("OK");
				}
			});
			return false;
		}
	} else {
		alert("パスワードを入力してください。");
	}
}
</script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>パスワード変更</title>
</head>
<body>
	<form method=post name=chpassword>
		<table border=0>
			<tr>
				<td colspan=3 bgcolor=skyblue>パスワード変更</td>
			</tr>
			<tr>
				<td colspan=3 height=10></td>
			</tr>
			<tr>
				<td width=120 bgcolor=skyblue>ID</td>
				<td width=20></td>
				<td><input type=text id=id name=id></td>
			</tr>
			<tr>
				<td colspan=3 height=10></td>
			</tr>
			<tr>
				<td bgcolor=skyblue>パスワード</td>
				<td><font color=red><strong>※</strong></font></td>
				<td><input type=password size=30 id=password1 name=password1></td>
			</tr>
			<tr>
				<td colspan=3 height=10></td>
			</tr>
			<tr>
				<td bgcolor=skyblue>パスワード確認</td>
				<td><font color=red><strong>※</strong></font></td>
				<td><input type=password size=30 name=password2></td>
			</tr>
		</table>
		<p>
			<input type=button style="width: 90pt; height: 35pt;" value=閉じる
				onclick="window.close()">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type=button style="width: 90pt; height: 35pt;" value=変更
				onclick='chclk(); return false;'>
	</form>
</body>

</html>