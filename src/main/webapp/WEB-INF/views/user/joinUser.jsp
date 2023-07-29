<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

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

<h1>JoinUser</h1>



<form action="/user/join" method="post" name="fr" onSubmit="return checkForm();">
	아이디 : <input type="text" name="userId" id="userId"> <br>
	비밀번호 : <input type="password" name="userPw" id="userPw"> <br>
	이름 : <input type="text" name="userName" id="userName"> <br>
	
	이메일 : <input type="text" name="userEmail" id="userEmail"> &nbsp;
	<input type="button" value="인증코드발송" onclick="">
	<input type="button" value="인증하기" onclick=""> &nbsp; <br>
	
	전화번호 : <input type="text" name="userTel" id="userTel"> <br>
	<hr>
	
	<input type="submit" value="회원가입">
</form>



</body>
</html>