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
	width: 100%;
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

#modal-popup {
	position: absolute;
	width: 100%; height: 100%;
	background-color: rgba(0,0,0,0.6);
	top: 0; left: 0;
	display: none;
}

#modal-content {
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
	// buNum에 해당하는 가게 정보 조회 ajax
	$.ajax({
		url : "${contextPath}/admin/detailB",
		type : "GET",
		data : { "buNum" : buNum },
		success : function(info) {
			console.log(info);
			// 입점한 가게가 없을 경우
			if (info === null) {
				$("#modal-info").remove();
			}
			
			// 입점한 가게가 있는 경우
			else {
				$("#restName").html(info.restName);
				$("#restTel").html(info.restTel);
				$("#restId").html(info.restId);
				// 영업 상태
				if (info.restStatus === 0) {
					$("#restStatus").html("입점 대기");
					$("#btnBlacklist").html("블랙리스트 처리");
				} else if (info.restStatus === 2) {
					$("#restStatus").html("영업 정지");
					$("#btnBlacklist").html("블랙리스트 해제");
				} else if (info.restStatus === 1 && info.restOnoff === 0) {
					$("#restStatus").html("영업 전");
					$("#btnBlacklist").html("블랙리스트 처리");
				} else if (info.restStatus === 1 && info.restOnoff === 1) {
					$("#restStatus").html("영업 중");
					$("#btnBlacklist").html("블랙리스트 처리");
				}
			}
		},
		error : function() {
			alert("ajax Error");
		}
	});		// ajax
	
	$("#modal-popup").fadeIn();
}

</script>

</head>
<body>
	
	
	
<c:if test="${empty sessionScope.userId || sessionScope.userId != 'admin'}">
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
	
	<table>
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



<!-- 특정 사업자의 가게 정보 -->
<div id="modal-popup">
	<div id="modal-content">
		<div id="modal-close" style="text-align: right;"> ❌ </div>
		
		
		
		<div id="modal-info">
			<div id="restName"></div>
			<div id="restTel"></div>
			<div id="restId"></div>
			<div id="restStatus"></div>
			<div id="restGrade">해당 가게 별점</div>
			<div id="restReview">리뷰</div>
		</div>
		
		
		
		<div id="modal-btn">
			<button type="button" id="btnBlacklist"></button>
		</div>
		
	</div>
</div>
<!-- 가게 정보 -->
	
	
	
</body>
</html>