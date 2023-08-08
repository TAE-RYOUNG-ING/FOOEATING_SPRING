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

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

let userId = sessionStorage.getItem("userId");
let userName = sessionStorage.getItem("userName");

document.getElementById('kakaoId').innerHTML(userId);
document.getElementById('kakaoName').innerHTML(userName);

alert(userId);
alert(userName);

</script>
</head>
<body>



<div class="center">
	<a href="/main">
		<img src="${pageContext.request.contextPath}/resources/img/logo.png" width="200px" height="200px">
	</a>
	<h1>FOOEATING_Main</h1>
</div>

<!-- 카카오 로그인 사용자 아이디 및 이름 가져오기 -->
<div id="kakaoId"></div>
<div id="kakaoName"></div>


<!-- 로그인 여부에 따른 버튼 활성화 -->
<div class="btn">
	<c:choose>
		<c:when test="${empty sessionScope.userId && empty sessionScope.buId }">
			<input type="button" class="btnstyle" value="로그인" onclick="location.href='/user/login';">
			<input type="button" class="btnstyle" value="회원가입" onclick="location.href='/user/join';">
		</c:when>
		<c:when test="${!empty sessionScope.userId && empty sessionScope.buId && !sessionScope.userId.equals('admin000') }">
			<h3>${sessionScope.userName }님, 안녕하세요 :)</h3>
			<input type="button" class="btnstyle" value="로그아웃" onclick="location.href='/user/logout';">
		</c:when>
		<c:when test="${empty sessionScope.userId && !empty sessionScope.buId }">
			<h3>${sessionScope.buName }(사업자)님, 안녕하세요 :)</h3>
			<input type="button" class="btnstyle" value="로그아웃" onclick="location.href='/user/logout';">
			<input type="button" class="btnstyle" value="마이페이지" onclick="location.href='/business/mypage/dashboard';">
		</c:when>
		<c:when test="${!empty sessionScope.userId && empty sessionScope.buId && sessionScope.userId.equals('admin000')}">
			<h3>${sessionScope.userName } 님</h3>
			<input type="button" class="btnstyle" value="로그아웃" onclick="location.href='/user/logout';">
			<input type="button" class="btnstyle" value="관리자페이지" onclick="location.href='/admin/dashboard';">
		</c:when>
	</c:choose>
</div>



</body>
</html>