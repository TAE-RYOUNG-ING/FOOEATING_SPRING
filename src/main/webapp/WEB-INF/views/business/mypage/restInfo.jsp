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

.sidebar {
	width: 25%;
	float: left;
}

.main {
	width: 75%;
	float: right;
	background-color: aqua;
}

</style>



<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	// 특정 가게 정보 조회
// 	$.ajax({
// 		url : "${contextPath}/restInfo/" + ${sessionScope.buNum},
// 		type : "GET",
// 		success : function(data) {
// 			console.log(data);
// 			alert(data.restId + " 가져오기 성공!");
// 			$("#restName").html(data.restName);
// 			$("#restCategory").html(data.restCategory);
// 			$("#restAddr").html(data.restAddr);
// 			$("#restTel").html(data.restTel);
// 			$("#restId").html(data.restId);
// 			$("#restConvenience").html(data.restConvenience);
// 			$("#restNotice").html(data.restNotice);
// 			$("#restOnoff").html(data.restOnoff);
// 		}
// 	});
	
});

</script>

</head>
<body>



<c:if test="${empty sessionScope.buId}">
	<c:redirect url="/main"/>
</c:if>



<!-- 헤더 -->
<div class="center">
	<a href="/main">
		<img src="${pageContext.request.contextPath}/resources/img/logo.png" width="200px" height="200px">
	</a>
	<h1>FOOEATING_Mypage_RestaurantInfo</h1>
</div>
<!-- 헤더 -->



<!-- 사이드바_사업자 -->
<div class="sidebar">
	<c:import url="sidebarB.jsp" />
</div>
<!-- 사이드바_사업자 -->



<div class="main" id="notRegistRest">

	등록된 가게가 없습니다. <br>
	<button type="button" id="goRegistration" onclick="location.href = '/business/registration';">&gt; 입점 신청하기</button>
	
</div>



<div class="main" id="restInfo">

	<div id="myRestInfo">
		<div id="myRestFile"></div>
		
		<table>
			<tr>
				<td>상호명</td>
				<td id="restName">${restInfo.restName}</td>
			</tr>
			<tr>
				<td>업종</td>
				<td id="restCategory">${restInfo.restCategory}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td id="restAddr">${restInfo.restAddr}</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td id="restTel">${restInfo.restTel}</td>
			</tr>
			<tr>
				<td>사업자번호</td>
				<td id="restId">${restInfo.restId}</td>
			</tr>
			<tr>
				<td>대표 메뉴</td>
				<td id="Menu">수정 예정!!</td>
			</tr>
			<tr>
				<td>편의시설</td>
				<td id="restConvenience">${restInfo.restConvenience}</td>
			</tr>
			<tr>
				<td>공지사항</td>
				<td id="restNotice">${restInfo.restNotice}</td>
			</tr>
			<tr>
				<td>영업 상태</td>
				<td id="restOnoff">${restInfo.restOnoff}</td>
			</tr>
		</table>
	</div>

</div>



</body>
</html>