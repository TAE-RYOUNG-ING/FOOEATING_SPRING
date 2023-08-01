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
	height: 25px;
	margin: auto;
	margin-bottom: 10px;
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
        
    }); // fr.on
    
    
    
    // 쿠키에 ID값 저장
    let key = getCookie('key');
    $('#userId').val(key); 
      
    if($('#userId').val() != ""){
        $('#idSaveCheck').attr('checked', true); 
    }
      
    $('#idSaveCheck').change(function(){ 
        if($('#idSaveCheck').is(':checked')){ 
            setCookie('key', $('#userId').val(), 7); 
        }else{ 
            deleteCookie('key');
        }
    });
      
    $('#userId').keyup(function(){ 
        if($('#idSaveCheck').is(':checked')){ 
            setCookie('key', $('#userId').val(), 7); 
        }
    });
	
}); // JQuery



// 쿠키에 ID값 저장
function setCookie(cookieName, value, exdays){
	let exdate = new Date();
	exdate.setDate(exdate.getDate() + exdays);
	let cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	document.cookie = cookieName + "=" + cookieValue;
}

function deleteCookie(cookieName){
	let expireDate = new Date();
	expireDate.setDate(expireDate.getDate() - 1);
	document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
  
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    let cookieData = document.cookie;
    let start = cookieData.indexOf(cookieName);
    let cookieValue = '';
    
    if(start != -1){
		start += cookieName.length;
		let end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
		cookieValue = cookieData.substring(start, end);
    }
	return unescape(cookieValue);
}

</script>
</head>
<body>

<div id="center">
	<img src="${pageContext.request.contextPath}/resources/img/logo.png" width="200px" height="200px"> <br>
	
	<form action="/user/login" method="post" id="fr" onsubmit="saveId()">
	아이디 &nbsp;&nbsp;&nbsp;<input type="text" name="userId" id="userId"> <br>
	<div id="divId" class="info"></div>
	비밀번호 <input type="password" name="userPw">
	<div id="divPw" class="info"></div>
	<br>
	
	
	
	<!-- 쿠키에 7일동안 아이디 저장 -->
	<input type="checkbox" id="idSaveCheck" >
	<label for="idSaveCheck">아이디 기억하기</label><br>
	
	
	
	
	<!-- 아이디 / 비밀번호 찾기 -->
	<a href="#">아이디 / 비밀번호 찾기</a> <br><br>
	
	
	
	<input type="submit" class="btn" value="로그인" >
	<input type="button" class="btn" value="회원가입" onclick="location.href='/user/agreeTerms';">
	</form>
</div>



</body>
</html>