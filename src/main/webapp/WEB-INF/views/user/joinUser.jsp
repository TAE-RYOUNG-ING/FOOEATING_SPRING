<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.inputStyle {
	width: 230px;
	height: 25px;
	margin-bottom: 10px;
}

.center {
	text-align: center;
}

.btn {
	width: 250px;
	height: 40px;
	margin: auto;
	display: block;
}

.space {
	margin-bottom: 10px;
	margin-left: 190px;
}

img{
	margin: auto;
	display: block;
	margin-bottom: 20px;
}

.info {
	font-size: 0.7em;
	color: red;
}

</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

$(function(){
	
	// 비밀번호 확인 일치 여부
// 	$('#fr').on('submit', function(e) {
// 	    if(fr.userPw.value != fr.userPwChk.value){
// 	        e.preventDefault();
// 	        $('.info').html("비밀번호가 일치하지 않습니다.");
// 	    } else{
// 	        $('.info').html("");
// 	    }

});



// 회원가입란 유효성 검사
function checkForm(){
	
	if(fr.userId.value === ""){
		fr.userId.focus();
		alert("아이디를 입력해주세요.");
		return false;
	}else if(fr.userPw.value === ""){
		fr.userPw.focus();
		alert("비밀번호를 입력해주세요.");
		return false;
	}else if(fr.userName.value === ""){
		fr.userName.focus();
		alert("이름을 입력해주세요.");
		return false;
	}else if(fr.userEmail.value === ""){
		fr.userEmail.focus();
		alert("이메일을 입력해주세요.");
		return false;
	}else if(fr.userTel.value === ""){
		fr.userTel.focus();
		alert("전화번호를 입력해주세요.");
		return false;
	}else{
		alert("회원가입이 완료되었습니다!");
	}
	
}

</script>
</head>
<body>

<img src="${pageContext.request.contextPath}/resources/img/logo.png" width="200px" height="200px">

<div class="center">
	<form action="/user/join" method="post" name="fr" id="fr" onSubmit="return checkForm();">
		아이디 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" name="userId" id="userId" class="inputStyle" placeholder="영문과 숫자 조합하여 8~16자"> <br>
		비밀번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="password" name="userPw" id="userPw" class="inputStyle" placeholder="영문, 숫자, 특수문자 조합하여 8~16자"> <br>
		비밀번호 확인 
		<input type="password" name="userPwChk" id="userPwChk" class="inputStyle"> <br>
		<div class="info"></div>
		이름 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" name="userName" id="userName" class="inputStyle"> <br>
		
		이메일 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="email" name="userEmail" id="userEmail" class="inputStyle"> <br>
		<div class="space">
			<input type="button" value="인증코드발송" onclick="">
			<input type="button" value="인증하기" onclick=""> &nbsp; <br>
		</div>
		
		전화번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="tel" name="userTel" id="userTel" class="inputStyle"> <br><br>
		
		<input type="submit" value="회원가입" class="btn">
	</form>
</div>


</body>
</html>