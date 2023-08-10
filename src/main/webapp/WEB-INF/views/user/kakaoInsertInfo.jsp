<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

h1{
	text-align: center;
}

td {
	display: block;
	padding-bottom: 5px;
}

tr>td:nth-child(2), span {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.step-form {
	width: 600px;
	margin: auto;
}

.inputStyle {
	width: 280px;
	height: 25px;
}

.space {
	text-align: right;
}

img{
	margin: auto;
	display: block;
}

.btn {
	width: 290px;
	height: 40px;
	margin: auto;
	display: block;
}

</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	
});

</script>
</head>
<body>

<img src="${pageContext.request.contextPath}/resources/img/logo.png" width="150px" height="150px">
<h1>FOOEATING 추가 정보 입력 안내</h1>
<div style="text-align: center;">원할한 FOOEATING 서비스 사용을 위해서 반드시 필요한 정보입니다.</div>

<div class="step-form">
	<table style="margin: 40px auto;">
		<c:choose>
			<c:when test="${sessionScope.userId eq 'noData'}">
				<!-- 아이디 & 전화번호 입력 -->
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userId" id="userId" class="inputStyle" placeholder="영문과 숫자 조합하여 8~12자"> <br></td>
					<td id="idchk"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="tel" name="userTel" id="userTel" class="inputStyle" placeholder="ex) 000-0000-0000"> <br></td>
					<td id="telchk"></td>
					<td class="space"><button type="button" id="btnTelSend">코드발송</button> <br></td>
				</tr>
				<tr>
					<td>전화번호 인증</td>
					<td><input type="text" id="checkCode" maxlength="10" class="inputStyle" placeholder="인증코드 입력" disabled> <br></td>
					<td id="authchk"></td>
					<td class="space"><button type="button" id="btnTelCheck">인증하기</button></td>
				</tr>
			</c:when>
			
			<c:otherwise>
				<!-- 전화번호 입력 -->
				<tr>
					<td>전화번호</td>
					<td><input type="tel" name="userTel" id="userTel" class="inputStyle" placeholder="ex) 000-0000-0000"> <br></td>
					<td id="telchk"></td>
					<td class="space"><button type="button" id="btnTelSend">코드발송</button> <br></td>
				</tr>
				<tr>
					<td>전화번호 인증</td>
					<td><input type="text" id="checkCode" maxlength="10" class="inputStyle" placeholder="인증코드 입력" disabled> <br></td>
					<td id="authchk"></td>
					<td><button type="button" id="btnTelCheck">인증하기</button></td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
</div>

<input type="button" class="btn" id="btn-submit" value="입력완료" >

</body>
</html>