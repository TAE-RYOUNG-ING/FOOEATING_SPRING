<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Login</h1>



<form action="/user/login" method="post">

아이디 <input type="text" name="userId" id="id" placeholder="아이디를 입력해주세요 :)"> <br>
비밀번호 <input type="password" name="userPw" placeholder="비밀번호를 입력해주세요 :)"> <hr>

<!-- 체크하고 로그인 할 경우 쿠키에 7일동안 아이디 저장 -->
<input type="checkbox" id="cookie"> <label for="cookie">아이디 기억하기</label> <br>

<input type="submit" value="로그인" >
<input type="button" value="회원가입" onclick="location.href='/user/agreeTerms';">

</form>



</body>
</html>