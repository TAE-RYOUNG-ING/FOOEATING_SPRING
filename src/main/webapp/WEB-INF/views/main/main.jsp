<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

</style>
</head>
<body>



<div class="center">
	<a href="/main">
		<img src="${pageContext.request.contextPath}/resources/img/logo.png" width="200px" height="200px">
	</a>
	<h1>FOOEATING_Main</h1>
</div>



<!-- 로그인 여부에 따른 버튼 활성화 -->
<div class="btn">
	<c:choose>
		<c:when test="${empty sessionScope.userId }">
			<input type="button" class="btnstyle" value="로그인" onclick="location.href='/user/login';">
			<input type="button" class="btnstyle" value="회원가입" onclick="location.href='/user/join';">
		</c:when>
		<c:when test="${!empty sessionScope.userId }">
			<h3>${sessionScope.userName }님, 안녕하세요 :)</h3>
			<input type="button" class="btnstyle" value="로그아웃" onclick="location.href='/user/logout';">
		</c:when>
	</c:choose>
</div>



</body>
</html>