<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<h1>Main</h1>

<!-- 로그인 여부에 따른 버튼 활성화 -->
<c:choose>
	<c:when test="${empty sessionScope.userId }">
		<input type="button" value="로그인" onclick="location.href='/user/login';">
	</c:when>
	<c:when test="${!empty sessionScope.userId }">
		<h3>${sessionScope.userName }님, 안녕하세요 :)</h3>
		<input type="button" value="로그아웃" onclick="location.href='/user/logout';">
	</c:when>
</c:choose>



</body>
</html>