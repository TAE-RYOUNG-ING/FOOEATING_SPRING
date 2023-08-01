<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.info {
	font-size: 0.7em;
	color: red;
}

h1{
	text-align: center;
}

img{
	margin: auto;
	display: block;
}

#center{
	text-align: center;
}

.btn{
	width: 250px;
	margin: auto;
	display: block;
}

</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

$(function(){
	
	// ID & PW 값 입력하지 않았을 때
    $('#fr').on('submit', function(e) {
        if(fr.userId.value === ""){
            e.preventDefault();
            $('#divId').html("　아이디를 입력하세요.");
        } else{
            $('#divId').html("");
        }
        
        if(fr.userPw.value === ""){
            e.preventDefault();
            $('#divPw').html("　　비밀번호를 입력하세요.");
        } else{
            $('#divPw').html("");
        }
        
    }); 
	
});

</script>
</head>
<body>

<div id="center">
	<img src="${pageContext.request.contextPath}/resources/img/logo.png" width="200px" height="200px"> <br>
	
	<form action="/user/login" method="post" id="fr">
	아이디 &nbsp;&nbsp;&nbsp;<input type="text" name="userId" > <br>
	<div id="divId" class="info"></div>
	비밀번호 <input type="password" name="userPw" > 
	<div id="divPw" class="info"></div>
	<br>
	
	
	
	<!-- 쿠키에 7일동안 아이디 저장 -->
	<div class="form-check-label">
		<label class="form-check-label text-muted">
			<input type="checkbox" class="form-check-input" id="rememberId" onclick="toggleRememberId()">
			아이디 기억하기
		</label>
	 </div>
	
	
	
	<!-- 아이디 / 비밀번호 찾기 -->
	<a href="#">아이디 / 비밀번호 찾기</a> <br><br>
	
	
	
	<input type="submit" class="btn" value="로그인" >
	<input type="button" class="btn" value="회원가입" onclick="location.href='/user/agreeTerms';">
	</form>
</div>



</body>
</html>