<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.info {
	margin-top: -3px;
	margin-bottom: 7px;
	font-size: 0.7em;
	color: red;
}

h1{
	text-align: center;
}

#center{
	position: absolute;
	width: 400px;
	height: 400px;
	text-align: center;
	margin-left: -200px;
	margin-top: -285px;
	left: 50%;
	top: 50%;
}

.width {
	width: 200px;
	height: 25px;
	margin-bottom: 10px;
}

.searchInfo {
	text-decoration: none;
	color: black;
}

.searchInfo:hover {
	color: gray;
	cursor: pointer;
}

.cookie {
	margin-bottom: 5px;
}

.cookie:hover > label {
	color: gray;
	cursor: pointer;
}

.btn {
	width: 265px;
	height: 40px;
	margin: auto;
	margin-bottom: 10px;
	display: block;
	cursor: pointer;
	border-radius: 15px;
	border: none;
	font-size: 14px;
}



/* ㅡㅡㅡㅡㅡ 카카오 로그인 ㅡㅡㅡㅡㅡ */
a {
	text-decoration: none;
}

.kakaoLogin {
	width: 265px;
 	height: 40px;
	margin: auto;
	margin-bottom: 10px;
	display: block;
	cursor: pointer;
	border: solid 1px #FEE500;
	background: #FEE500;
	color: black;
	font-size: 14px;
	border-radius: 15px;
}

img {
	margin-top: 11px;
	display: inline-block;
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
            $('#divPw').html("　비밀번호를 입력하세요.");
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
	아이디 &nbsp;&nbsp;&nbsp;&nbsp;
	<input type="text" name="userId" id="userId" class="width"> <br>
	<div id="divId" class="info"></div>
	
	비밀번호 &nbsp;
	<input type="password" name="userPw" class="width">
	<div id="divPw" class="info"></div>
	<br>
	
	
	
	<!-- 쿠키에 7일동안 아이디 저장 -->
	<div class="cookie">
		<input type="checkbox" id="idSaveCheck" >
		<label for="idSaveCheck">아이디 기억하기</label><br>
	</div>
	
	
	
	<!-- 아이디 / 비밀번호 찾기 -->
	<a href="/user/searchID" class="searchInfo"
	   onclick="window.open(this.href, '_blank', 'width=500, height=300, left=510, top=365'); return false;">
	   아이디 찾기 &nbsp;</a>
	   |
	<a href="/user/searchPW" class="searchInfo"
  	   onclick="window.open(this.href, '_blank', 'width=500, height=300, left=510, top=365'); return false;">
       &nbsp; 비밀번호 찾기</a> <br><br>
	
	
	
	<input type="submit" class="btn" value="로그인" >
	
	<!-- 카카오 로그인 -->
	<a href="https://kauth.kakao.com/oauth/authorize?client_id=76611d9594b317e8ca73f2ddcaf03839&redirect_uri=http://localhost:8088/user/kakaoLogin&response_type=code">
		<div class="kakaoLogin">
			<img src="${pageContext.request.contextPath}/resources/img/kakaoSymbol.png" width="18px" height="18px">
			<span>&nbsp;카카오 간편 로그인</span>
		</div>
	</a>
	
	<input type="button" class="btn" value="회원가입" onclick="location.href='/user/join';">
	</form>
</div>



</body>
</html>