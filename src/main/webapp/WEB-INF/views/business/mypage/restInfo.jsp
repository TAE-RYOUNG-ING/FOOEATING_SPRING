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

td {
	box-sizing: border-box;
	padding-right: 20px;
	padding-bottom: 20px;
}

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
	box-sizing: border-box;
}

.main {
	width: 75%;
	float: right;
	box-sizing: border-box;
}

</style>



<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	
	
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


<div class="main">
	
<!-- 입점신청 X -->
	<c:if test="${restInfo == null}">
	
		등록된 가게가 없습니다. <br>
		<button type="button" id="goRegistration" onclick="location.href = '/business/registration';">&gt; 입점 신청하기</button>
	
	</c:if>
<!-- 입점신청 X -->



<!-- 상단 탭 -->
	<div class="nav-tab">
		<ul>
			<li id="restInfoTab" onclick="location.href = '${contextPath}/business/mypage/restInfo';">나의 가게 정보</li>
			<li id="restModifyTab" onclick="location.href = '${contextPath}/business/mypage/restModify';">정보 수정</li>
			<li id="restDeleteTab" onclick="location.href = '${contextPath}/business/mypage/restDelete';">가게 삭제</li>
		</ul>
	</div>
<!-- 상단 탭 -->



<!-- 입점신청 O -->
	<c:if test="${restInfo != null}">
		
		<div id="myRestInfo">
			
			<div id="myRestFile">
				<c:forEach var="restImg" items="${fn:split(restInfo.restFile, '/')}">
					<img src="/business/showImg?img=${restImg}" width="200px" height="200px"> 
				</c:forEach>
			</div>
			
			<table>
				<tr>
					<td>상호명</td>
					<td>${restInfo.restName}</td>
				</tr>
				<tr>
					<td>업종</td>
					<td>${restInfo.restCategory}</td>
				</tr>
				<tr>
					<td>소개</td>
					<td>${restInfo.restDescription}</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>${fn:split(restInfo.restAddr, '/')[0]} ${fn:split(restInfo.restAddr, '/')[1]} ${fn:split(restInfo.restAddr, '/')[2]}</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>${restInfo.restTel}</td>
				</tr>
				<tr>
					<td>사업자번호</td>
					<td>${restInfo.restId}</td>
				</tr>
				<tr>
					<td>영업시간</td>
					<td>
						<c:forEach var="runt" items="${fn:split(restInfo.restRuntime, '/')}">
							${runt}
							<c:if test="${runt == ' '}">기타 </c:if> <br>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td>편의시설</td>
					<td>
						<c:forEach var="con" items="${fn:split(restInfo.restConvenience, '/')}" varStatus="no">
							<img src="${pageContext.request.contextPath}/resources/img/${con}.png" width="70px"> 
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td>대표 메뉴</td>
					<td><del>수정 예정!!</del></td>
				</tr>
				<tr>
					<td>영업 상태</td>
					<td>
						<c:choose>
							<c:when test="${restInfo.restStatus == 0}">입점 승인 대기 중입니다.</c:when>
							<c:when test="${restInfo.restStatus == 1}">
								${restInfo.restOnoff == 0 ? '영업 전<button type="button" id="btn-onoff">OPEN</button>' : '영업 중<button type="button" id="btn-onoff">CLOSE</button>'}
							</c:when>
							<c:when test="${restInfo.restStatus == 2}">관리자에 의해 제한되어있습니다. 문의 부탁드립니다.</c:when>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td>공지사항</td>
					<td>${restInfo.restNotice}</td>
				</tr>
			</table>
		</div>
		
	</c:if>
<!-- 입점신청 O -->
	
</div>



</body>
</html>