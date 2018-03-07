<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
table {
	width: 100%;
}
/*
   th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  } 
td {
	background-color: #bbdefb;
}
     td {
    background-color: #e3f2fd;
  } */
#header {
	width: 1400px;
	height: 70px;
	margin-left: 50px;
	margin-bottom: 10px;
}

#middle {
	width: 1400px;
	margin-left: 50px;
	float: left;
}

#sidebar1 {
	width: 1400px;
	height: 180px;
	float: left;
	margin-top: 10px;
	margin-left: 10px;
	margin-right: 10px;
	margin-bottom: 10px;
}

#sidebar2 {
	width: 1400px;
	height: 350px;
	float: left;
	margin-left: 10px;
	margin-right: 10px;
	margin-bottom: 10px;
}

#footer {
	width: 1400px;
	height: 70px;
	float: left;
	margin-left: 50px;d
	margin-top: 10px;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="header">
		<h1 align="center">修理見積確認</h1>
	</div>
	<div id="middle">
		<div id="sidebar1">
			<fieldset>
				<table cellspacing="10">
					<tr>
						<td colspan="5" bgcolor="#bbdefb">顧客情報</td>
					</tr>
					<tr>
						<td bgcolor="#bbdefb">見積番号</td>
						<td><input type="text"></td>
						<td width="15%"></td>
						<td bgcolor="#bbdefb">顧客名(カナ)</td>
						<td><input type="text"></td>
					</tr>
					<tr>
						<td bgcolor="#bbdefb">車輌</td>
						<td><input type="text"></td>
						<td width="15%"></td>
						<td bgcolor="#bbdefb">顧客名(漢字)</td>
						<td><input type="text">
						<input type="text" size="3"></td>
					</tr>
					<tr>
						<td bgcolor="#bbdefb">見積担当</td>
						<td><input type="text"></td>
						<td width="15%"></td>
						<td></td>
						<td align="right">
							<input type="button" value="顧客情報選択" style="height: 30pt; width: 150pt">
						</td>
					</tr>
				</table>
			</fieldset>
		</div>
		<div id="sidebar2">
			<fieldset>
				<table>
					<tr>
						<td>見積日</td>
						<td>*カレンダー</td>
						<td>備考</td>
						<td rowspan="2"><textarea rows="" cols=""></textarea></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="4"></td>
						<td><input type="text">
						<input type="text"></td>
				</table>
			</fieldset>
		</div>
	</div>
	<div id="footer">
	
				<div id="testTable"> 
					<table border="1" bordercolor="1313EE">
						<c:forEach items="${newCarSelect}" begin="1" var="comments"
		 					varStatus="status">
 							<tr> 
								<td>${comments.mastertype}</td>
 							</tr>
						</c:forEach>
 					</table> 
 				</div>
		<input type="button" value="閉じる">
	</div>
</body>
</html>