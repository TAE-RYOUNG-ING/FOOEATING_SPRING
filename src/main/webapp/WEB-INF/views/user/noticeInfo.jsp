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

<h1>ID정보</h1>
userId = ${param.data } <br>

<!-- 로그인하러가기 버튼 -->
<input type="button" value="메인 페이지" onclick="location.href='/main';">
<input type="button" value="로그인 페이지" onclick="location.href='/user/login';">

</body>
</html>