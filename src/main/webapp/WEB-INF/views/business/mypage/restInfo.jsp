<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
// 	// 특정 가게 정보 조회
// 	$.ajax({
// 		url : "${contextPath}/restInfo/" + "000-00-00000",		// 세션에 담긴 restId 사용 예정
// 		type : "GET",
// 		success : function(data) {
// 			alert("가져오기 성공!");
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



<h1>나의 가게 정보</h1>

<div id="notRegistRest">

	등록된 가게가 없습니다. <br>
	<button type="button" id="goRegistration" onclick="location.href = '/business/registration';">&gt; 입점 신청하기</button>
	
</div>



<div id="">

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