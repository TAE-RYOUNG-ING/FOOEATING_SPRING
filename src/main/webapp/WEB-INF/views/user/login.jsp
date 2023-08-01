<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

div {
	font-size: 0.7em;
	color: red;
}

</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

$(function(){
	
	// ID & PW 값 입력하지 않았을 때
    $('#fr').on('submit', function(e) {
        if(fr.userId.value === ""){
            e.preventDefault();
            $('#divId').html("아이디를 입력하세요.");
        } else{
            $('#divId').html("");
        }
        
        if(fr.userPw.value === ""){
            e.preventDefault();
            $('#divPw').html("비밀번호를 입력하세요.");
        } else{
            $('#divPw').html("");
        }
        
    }); 
	
});

</script>
</head>
<body>

<h1>FOOEATING_Login</h1>



<form action="/user/login" method="post" id="fr">

아이디 &nbsp;&nbsp;&nbsp;<input type="text" name="userId" placeholder="아이디를 입력해주세요 :)"> <br>
<div id="divId"></div>
비밀번호 <input type="password" name="userPw" placeholder="비밀번호를 입력해주세요 :)"> 
<div id="divPw"></div>
<hr>

<!-- 체크하고 로그인 할 경우 쿠키에 7일동안 아이디 저장 -->
<input type="checkbox" id="cookie"> <label for="cookie">아이디 기억하기</label> <br>
<a href="#">아이디 찾기</a>
<a href="#">비밀번호 찾기</a> <br><br>

<input type="submit" value="로그인" >
<input type="button" value="회원가입" onclick="location.href='/user/agreeTerms';">

</form>



</body>
</html>