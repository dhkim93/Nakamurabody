<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/common/header.jsp" />
</head>
<script language='javascript'>
	// function btnQuit() {
	// 	var retVal = confirm("見積支援システムを終了しますか?");
	// 	if (retVal == true) {
	// 		window.open('about:blank', '_self').self.close();
	// 	}
	// }
	function goToPage(parameter) {
		id = document.loginUser.loginId.value;
		name = document.loginUser.loginName.value;
		alert(id);
		alert(name);
		alert(parameter);
		
		if (parameter == "newCarSelect") {
			location.href = "newCarSelect.do?name=" + name + "&id=" + id + "&parameter=" + parameter;
		}else if(parameter == "estimateManageNewCar"){
			location.href = "estimateManagementNewCar.do?name=" + name + "&id=" + id + "&parameter=" + parameter;
		}
	}
</script>
<body>
	<div id="headerUser">
		<%@ include file="../common/top.jsp"%>
	</div>
	<div id="navLogin">
		<%@ include file="../common/nav_user.jsp"%>
	</div>
	<div id="bodyUser">
	<form name="loginUser" method="get">
			<input type="hidden" id="loginId2" name="loginId" value=${param.id } />
			<input type="hidden" id="loginName" name="loginName"
				value=${param.name } />
	</form>
		<button class="btnUser" id="newCar" type="button" onClick="goToPage('newCarSelect')">
			<img class="btn-img" src="/resources/images/newCar.png">
		</button>
		<button class="btnUser" id="repairCar" type="button">
			<img class="btn-img" src="/resources/images/repairCar.png">
		</button>
	</div>


	<div id="footerLogin">
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>