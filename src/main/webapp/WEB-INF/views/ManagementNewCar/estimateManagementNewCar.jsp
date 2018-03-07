<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ボデータイプメンテナンス</title>
<c:import url="/WEB-INF/views/common/header.jsp" />
<style type="text/css">
ul.tabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 32px;
	border-bottom: 1px solid gray;
	border-left: 1px solid gray;
	width: 100%;
	font-family: "dotum";
	font-size: 12px;
}

ul.tabs li {
	float: left;
	text-align: center;
	cursor: pointer;
	width: 82px;
	height: 31px;
	line-height: 31px;
	border: 1px solid gray;
	border-left: none;
	font-weight: bold;
	background: #fafafa;
	overflow: hidden;
	position: relative;
}

ul.tabs li.active {
	background: #FFFFFF;
	border-bottom: 1px solid #FFFFFF;
}

.tab_container {
	border: 1px solid gray;
	border-top: none;
	clear: both;
	float: left;
	width: 100%;
	height: 250px;
	background: #FFFFFF;
}

.tab_content {
	padding: 5px;
	font-size: 12px;
	display: none;
}
/* tr:nth-of-type(2n) { */
/*   background-color: red; */
/* } */
.tab_container .tab_content ul {
	width: 100%;
	margin: 0px;
	padding: 0px;
}

.tab_container .tab_content ul li {
	padding: 5px;
	list-style: none
}

;
#container {
	width: 249px;
	margin: 0 auto;
}

.highlight {
	background-color: lime;
}
</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>



<script type="text/javascript">
	$(document).ready(function() {
						$(function() {

							$(".tab_content").hide();
							$(".tab_content:first").show();

							$("ul.tabs li").click(function() {
										$("ul.tabs li").removeClass("active").css("color", "#333");
										//$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
										$(this).addClass("active").css("color", "darkred");
										$(".tab_content").hide()
										var activeTab = $(this).attr("rel");
										$("#" + activeTab).fadeIn()
									});
						});
						// 						$('table tr:even').css("backgroundColor","#f5f5fc");
						$('#Option tr:first').addClass("highlight");
						$('#Option tr').click(function() {
							$('#Option tr').removeClass("highlight");
							$(this).addClass("highlight");
						});

						$("#itemAdd")
								.click(
										function() {
											var contents = '';

											contents += '<tr>';
											contents += '<td></td>';
											contents += '<td><input type="text" name="sumPrice" class="sumPrice" /></td>';
											contents += '<td><input type="text" name="sumPrice" class="sumPrice" /></td>';
											contents += '</tr>';
											$(".highlight").before(contents);

											$('#Option tr')
													.click(
															function() {
																$('#Option tr')
																		.removeClass(
																				"highlight");
																$(this)
																		.addClass(
																				"highlight");
															});
										});

					});
</script>
</head>

<body>
<!-- 	<div><h1 align="center">新車見積マスタメンテナンス</h1></div> -->
<div id="navLogin">
		<%@ include file="../common/nav_manager.jsp"%>
	</div>
	<div
		style="border: 1px solid gray; height: auto; width: 1560px; padding: 0px; margin-bottom: 20px; padding-bottom: 10px">
		<div style="background-color: #8BBDFF;">新車見積マスタ選択</div>
		<div id="container" style="height: 40px; padding: 5px;">
			<table
				style="border-collapse: collapse; border-spacing: 0; width: 100%; height: 100%; margin: 0">
				<tr>
					<td colspan="5"></td>
				</tr>
				<tr>
					<td style="width: 1%"></td>
					<td style="background-color: skyblue; width: 20%">&nbsp;ボデータイプ</td>
					<td style="width: 5%"><font color="red">&nbsp; ※</font></td>
					<td style="width: 40%"><select name="selectBox">
							<option value="${data.inputtype}">${data.inputtype}</option>
					</select></td>
					<td style="width: 5%"></td>
				</tr>
				<tr>
					<td colspan="4"></td>
				</tr>
			</table>
		</div>
	</div>

	<div
		style="border: 1px solid gray; height: auto; width: 1560px; padding: 0px; padding-bottom: 10px">
		<div style="background-color: #8BBDFF;">新車見積マスタ一覧</div>
		<div id="container" style="height: 290px; padding: 5px;">
			<ul class="tabs">
				<li class="active" rel="tab1">ボデータイプ</li>
				<li rel="tab2">aaaaaaaaaa</li>
				<li rel="tab3">bbbbbbbbbb</li>
			</ul>
			<div class="tab_container">
				<div id="tab1" class="tab_content">

					<table border="1">
						<thead>
							<tr>
								<td></td>
								<td>表示順</td>
								<td>ボデータイプ</td>
							</tr>
						</thead>
						<tbody id="Option">
							<c:forEach items="${list}" var="data">
								<tr>
									<td></td>
									<td>${data.combotype}</td>
									<td>${data.comboname}</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
			<!-- .tab_container -->
		</div>
		<!-- #container -->

		<div align="right" style=" margin-right : 10px">
			<input type="button" name="" value="行追加" id="itemAdd">
			<input type="button" name="" value="保存">
		</div>
	</div>
	<div>
		<input type="button" name="" value="閉じる" onclick="window.close();">
	</div>
</body>
</html>