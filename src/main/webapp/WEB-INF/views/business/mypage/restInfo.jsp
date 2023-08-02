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
				<td></td>
			</tr>
			<tr>
				<td>업종</td>
				<td></td>
			</tr>
			<tr>
				<td>주소</td>
				<td></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td></td>
			</tr>
			<tr>
				<td>사업자번호</td>
				<td></td>
			</tr>
			<tr>
				<td>메뉴</td>
				<td></td>
			</tr>
			<tr>
				<td>편의시설</td>
				<td></td>
			</tr>
			<tr>
				<td>공지사항</td>
				<td></td>
			</tr>
			<tr>
				<td>영업 상태</td>
				<td></td>
			</tr>
		</table>
	</div>

</div>



</body>
</html>