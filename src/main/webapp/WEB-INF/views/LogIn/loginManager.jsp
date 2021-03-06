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
	var id, name, pageName;

	function goToPage(parameter) {

		// 	document.loginMng.submit();
		id = document.loginMng.loginId.value;
		name = document.loginMng.loginName.value;
		alert(id);
		alert(name);
		alert(parameter);
		
		if (parameter == "employeeInfo") {
			location.href = "employeeManagement.do?name=" + name + "&id=" + id + "&parameter=" + parameter;
		}else if(parameter == "estimateManageNewCar"){
			location.href = "estimateManagementNewCar.do?name=" + name + "&id=" + id + "&parameter=" + parameter;
		} else if(parameter == "popManageNewCarBody"){
			cw = screen.availWidth;
			ch = screen.availHeight;
			sw = 440;
			sh = 250;
			ml = (cw - sw) / 2;
			mt = (ch - sh) / 2;
			var pwdpop = window.open('popManageNewCarBody.do', 'width=' + sw
					+ ',height=' + sh + ',top=' + mt + ',left=' + ml
					+ ',resizable=no,scrollbars=yes');
			
		} else if(parameter == "popManageNewCarUnit"){
			cw = screen.availWidth;
			ch = screen.availHeight;
			sw = 440;
			sh = 250;
			ml = (cw - sw) / 2;
			mt = (ch - sh) / 2;
			var pwdpop = window.open('popManageNewCarUnit.do', 'width=' + sw
					+ ',height=' + sh + ',top=' + mt + ',left=' + ml
					+ ',resizable=no,scrollbars=yes');
		} else if(parameter == "popManagementVehicle"){
			cw = screen.availWidth;
			ch = screen.availHeight;
			sw = 440;
			sh = 250;
			ml = (cw - sw) / 2;
			mt = (ch - sh) / 2;
			var pwdpop = window.open('popManagementVehicle.do', 'width=' + sw
					+ ',height=' + sh + ',top=' + mt + ',left=' + ml
					+ ',resizable=no,scrollbars=yes');
			
		}else if(parameter == "popManagementManhour"){
			cw = screen.availWidth;
			ch = screen.availHeight;
			sw = 440;
			sh = 250;
			ml = (cw - sw) / 2;
			mt = (ch - sh) / 2;
			var pwdpop = window.open('popManagementManhour.do', 'width=' + sw
					+ ',height=' + sh + ',top=' + mt + ',left=' + ml
					+ ',resizable=no,scrollbars=yes');
		}else if(parameter == "popManageNewCarOption"){
			cw = screen.availWidth;
			ch = screen.availHeight;
			sw = 440;
			sh = 250;
			ml = (cw - sw) / 2;
			mt = (ch - sh) / 2;
			var pwdpop = window.open('popManageNewCarOption.do', 'width=' + sw
					+ ',height=' + sh + ',top=' + mt + ',left=' + ml
					+ ',resizable=no,scrollbars=yes');
		}else if(parameter == "popManagementRepairDetail"){
			cw = screen.availWidth;
			ch = screen.availHeight;
			sw = 440;
			sh = 250;
			ml = (cw - sw) / 2;
			mt = (ch - sh) / 2;
			var pwdpop = window.open('popManagementRepairDetail.do', 'width=' + sw
					+ ',height=' + sh + ',top=' + mt + ',left=' + ml
					+ ',resizable=no,scrollbars=yes');
		}
	}
</script>
<body>
	<div id="navLogin">
		<%@ include file="../common/nav_manager.jsp"%>
	</div>
	<div id="bodyManager">
		<form name="loginMng" method="get">
			<input type="hidden" id="loginId" name="loginId" value=${param.id } />
			<input type="hidden" id="loginName" name="loginName"
				value=${param.name } />
			<div id="btnLine1">
				<input type="button" value="新車見積マスタメンタナンス "
					onClick="goToPage('estimateManageNewCar')">
			</div>
			<div id="btnLine1">
				<input type="button" value="修理見積&#10;マスタメンタナンス" onClick="goToPage('popManagementRepairDetail')">
			</div>
			<div id="btnLine1">
				<input type="button" value="社員情報管理" onClick="goToPage('employeeInfo')">
			</div>
			<span id="btnLine2"> <span id="btnLine2Left"> <input
					type="button" value="ボデータイプメンタナンス" onClick="goToPage('popManageNewCarBody')">
			</span> <span id="btnLine2Right"> <input type="button" 
					value="単位メンタナンス" onClick="goToPage('popManageNewCarUnit')">
			</span>
			</span> <span id="btnLine2"> <span id="btnLine2Left"> <input
					type="button" value="車輌タイプメンタナンス" onClick="goToPage('popManagementVehicle')">
			</span> <span id="btnLine2Right"> <input type="button"
					value="工賃メンタナンス" onClick="goToPage('popManagementManhour')">
			</span>
			</span> <span id="btnLine2"></span> <span id="btnLine3"> <span
				id="btnLine2Left"> <input type="button" value="オプションメンタナンス" onClick="goToPage('popManageNewCarOption')">

			</span>
			</span>
		</form>
	</div>

	<div id="footerLogin">
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>