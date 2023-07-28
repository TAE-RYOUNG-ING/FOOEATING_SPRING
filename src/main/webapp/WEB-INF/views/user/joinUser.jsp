<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>JoinUser</h1>



<form action="/user/join" method="post">
	아이디 : <input type="text" name="userId"> <br>
	비밀번호 : <input type="password" name="userPw"> <br>
	이름 : <input type="text" name="userName"> <br>
	이메일 : <input type="text" name="userEmail"> <br>
	전화번호 : <input type="text" name="userTel"> <br><br>
	
	FOOEATING 사이트 회원가입 약관에 동의하십니까? <input type="checkbox"> 
	<a href="#">[약관보기]</a> <!-- 팝업창 -->
	<hr>
	
	<input type="submit" value="회원가입">
</form>



</body>
</html>