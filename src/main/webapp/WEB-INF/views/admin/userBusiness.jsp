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

table {
	text-align: center;
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

#modal-popup {
	position: absolute;
	width: 100%; height: 100%;
	background-color: rgba(0,0,0,0.6);
	top: 0; left: 0;
	display: none;
}

#modal-content{
	width:600px; height:500px;
	background-color:#fff; border-radius:10px;
	position:relative; top:50%; left:50%;
	margin-top:-220px; margin-left:-270px;
 	text-align:center;
	box-sizing:border-box; padding:50px;
	line-height:23px; cursor:pointer;
}

</style>



<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	// 모달창 닫기
	$("#modal-close").click(function() {
		$("#modal-popup").fadeOut();
	});
	
});



// 행 클릭 시 모달창 띄우기
function modalOpen(buNum) {
	$("#modal-popup").fadeIn();
	
	
}

</script>

</head>
<body>
	
	
	
<c:if test="${empty sessionScope.userId || sessionScope.userId != 'admin000'}">
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
	
	<table style="width: 100%;">
		<tr>
			<th>No.</th>
			<th>ID</th>
			<th>BUSINESS</th>
			<th>NAME</th>
			<th>E-MAIL</th>
			<th>TEL</th>
			<th>REGIST DATE</th>
			<th>STATE</th>
		</tr>
		
		<c:forEach var="bu" items="${buList}" varStatus="no">
			<tr onclick="modalOpen('${bu.buNum}');">
				<td>${no.count}</td>
				<td>${bu.buId}</td>
				<td>${bu.buNum}</td>
				<td>${bu.buName}</td>
				<td>${bu.buEmail}</td>
				<td>${bu.buTel}</td>
				<td>${bu.regdate}</td>
				<td>${bu.userstatusVO.userStatus == 0 ? "탈퇴" : (bu.userstatusVO.userStatus == 2 ? "블랙리스트" : "정상")}</td>
			</tr>
		</c:forEach>
	</table>
	
</div>
<!-- 회원 목록 -->



<!-- 특정 사업자의 가게 상세 정보 -->
<div id="modal-popup">
	<div id="modal-content">
		<div id="modal-close" style="text-align: right;"> ❌ </div>
		
		
		
		<c:if test="${restInfo.restFile != null}">
			<c:forEach var="restImg" items="${fn:split(restInfo.restFile, '/')}">
				<img src="/business/showImg?img=${restImg}" width="200px" height="200px"> 
			</c:forEach>
		</c:if>
	
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
			<tr>
				<td>영업 상태</td>
				<td>
					<c:choose>
						<c:when test="${restInfo.restStatus == 0}">입점 승인 대기 중입니다.</c:when>
						<c:when test="${restInfo.restStatus == 1}">
							<c:if test="${restInfo.restOnoff == 0}">
								<span style="color: red; font-weight: bold;">영업 전</span>
							</c:if>
							<c:if test="${restInfo.restOnoff != 0}">
								<span style="color: blue; font-weight: bold;">영업 중</span>
							</c:if>
						</c:when>
						<c:when test="${restInfo.restStatus == 2}">영업 정지</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>별점</td>
				<td>해당 가게 별점</td>
			</tr>
			<tr>
				<td>최근 리뷰</td>
				<td>리뷰1</td>
				<td>리뷰2</td>
			</tr>
		</table>
		
	</div>
</div>
<!-- 가게 상세 정보 -->
	
	
	
</body>
</html>