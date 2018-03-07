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

<script type="text/javascript">
	$(function() {
		var value="${selectPrice.get(0).comboname}";
		('$price').val(numberWithCommas(value));
	});

	function Winclose() {
		alert(true);
		window.close();
		self.close();
		var win = window.open('about:blank', '_self');
		win.close();
	}

	function checkDataType() {
		var price = document.getElementById("price").value;
		alert(price);
		if (price.length > 0) {
			var answer = confirm("工賃情報を更新します。\nよろしいでしょうか。")
			if (answer) {
				alert("工賃情報を更新しました。");
				return true;
			}
			return false;
		} else {
			return false;
		}
	}
	function numberWithCommas(x) {
		document.getElementById("price").value = x.toString().replace(
				/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	function showKeyCode(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39) {
			return;
		} else {
			return false;
		}
	}
	function Winclose() {
		alert(true);
		window.close();
		self.close();
		var win = window.open('about:blank', '_self');
		win.close();
	}
</script>
</head>
<body id="popMM">
	<form action="#" onsubmit="checkDataType();">
		<div id="all">
			<div id="first">
				<table
					style="border-collapse: collapse; border-spacing: 0; width: 100%; height: 100%; margin: 0">
					<tr>
						<td style="background-color: skyblue;" colspan="5">工賃メインテナンス</td>
					</tr>
					<tr>
						<td colspan="5"></td>
					</tr>
					<tr>
						<td style="width: 5%"></td>
						<td style="background-color: skyblue; width: 40%">工賃金額</td>
						<td style="width: 5%"><font color="red">※</font></td>
						<td style="width: 40%"><input type="text"
							value="" id="price"
							onkeydown="return showKeyCode(event)"
							onblur="numberWithCommas(this.value)" /></td>
						<td style="width: 5%"></td>
					</tr>
					<tr>
						<td colspan="4"></td>
					</tr>
				</table>
			</div>
			<div id="second">
				<input type="button" id="btn1" value="閉じる" onClick="Winclose()" />
				<input type="submit" id="btn2" value="保存" />
			</div>
		</div>
	</form>
</body>
</html>