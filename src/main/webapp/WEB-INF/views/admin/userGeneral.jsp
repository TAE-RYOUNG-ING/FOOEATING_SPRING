<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

.center {
	text-align: center;
}

.btn {
	text-align: right;
}

.btnstyle {
	width: 100px;
	height: 30px;
}

.sidebar {
	width: 25%;
	float: left;
}

.main {
	width: 75%;
	float: right;
}

.tabs { 
 	display: flex;
 	justify-content: left;
 	width: 100%;
 	background-color: #fff;
 	margin-bottom: 30px;
}

.tabs>* {
	margin: 0;
	padding: 0;
	list-style-type: none;
	box-sizing: border-box;
}

.tab-nav {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 20px;
}

.tab {
	position: relative;
	padding: 10px 15px;
	color: #151b26;
	background-color: transparent;
	cursor: pointer;
}

.tab::after {
	content: "";
	position: absolute;
	bottom: 0;
	left: 0;
	width: 0;
	height: 2px;
	background-color: #1ede9e;
	transition: width 300ms ease-out;
}

.tab:hover::after {
	width: 100%;
}

</style>



<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	
	
});

</script>

</head>
<body>
	
	
	
<c:if test="${empty sessionScope.buId && sessionScope.buId('admin000')}">
	<c:redirect url="/main"/>
</c:if>



<!-- 헤더 -->
<div class="center">
	<a href="/main">
		<img src="${pageContext.request.contextPath}/resources/img/logo.png" width="200px" height="200px">
	</a>
	<h1>FOOEATING_Admin</h1>
</div>
<!-- 헤더 -->



<!-- 사이드바_사업자 -->
<div class="sidebar">
	<c:import url="sidebarA.jsp" />
</div>
<!-- 사이드바_사업자 -->



<!-- 회원 목록 -->
<div class="main">
	
	<table border="1">
		<tr>
			<td>No.</td>
			<td>ID</td>
			<td>NAME</td>
			<td>E-MAIL</td>
			<td>TEL</td>
			<td>REGIST DATE</td>
			<td>BLACKLIST</td>
		</tr>
	</table>
	
</div>
<!-- 회원 목록 -->
	
	
	
</body>
</html>