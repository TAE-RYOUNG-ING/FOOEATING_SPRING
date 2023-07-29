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



<form action="/login" method="post">

아이디 <input type="text" name="id" id="id" placeholder="아이디를 입력해주세요 :)"> <br>
비밀번호 <input type="password" name="pw" id="pw" placeholder="비밀번호를 입력해주세요 :)"> <hr>

<input type="checkbox"> 아이디 기억하기
<!-- 체크하고 로그인 할 경우 쿠키에 7일동안 아이디 저장 BURADER_MAIN 참고 -->

<input type="submit" value="로그인">
<input type="button" value="회원가입" onclick="location.href='/user/agreeTerms';">

</form>



</body>
</html>