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
	position: absolute;
	width: 400px;
	height: 400px;
	text-align: center;
	margin-left: -200px;
	margin-top: -300px;
	left: 50%;
	top: 50%;
}

.btn {
	width: 250px;
	height: 40px;
	margin: auto;
	display: block;
}

.space {
	margin-bottom: 10px;
	margin-left: 185px;
}

.space2 {
	margin-bottom: 10px;
	margin-left: 270px;
}

#confirmMsg {
	font-size: 0.7em;
	color: red;
}

</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

$(function(){
	
	// 비밀번호 크로스 체크
	$('#fr').on('submit', function(e) {
        
        if(fr.userPw.value !== fr.userPwChk.value){
            e.preventDefault();
            $('#confirmMsg').html("비밀번호가 일치하지 않습니다.");
        }else{
            $('#confirmMsg').html("");
        }
        
    });
	
});



// 회원가입란 유효성 검사
function checkForm() {
	
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
	}
	
}



// 아이디 중복 체크
function idOverlap() {
	alert("아이디 입력 값 : " + fr.userId.value);
	
	$.ajax({
		url :'/idOverlap',
		type : 'post',
		data : {"userId" : fr.userId.value},
		dataType : "text",
		success : function(data){	
			if(data === "1"){
				alert("이 아이디는 사용 가능합니다.");
			}else{
				alert("이 아이디는 사용 불가능합니다.");
			}
		},
		error : function(){
			alert("ajax Error");
		}
		
	}); // ajax
		
}

</script>
</head>
<body>

<div class="center">

	<img src="${pageContext.request.contextPath}/resources/img/logo.png" width="200px" height="200px">

	<form action="/user/join" method="post" name="fr" id="fr" onSubmit="return checkForm();">
		아이디 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" name="userId" id="userId" class="inputStyle" placeholder="영문과 숫자 조합하여 8~16자"> <br>
		<input type="button" class="space2" value="중복확인" onclick="return idOverlap();"> <br>
		
		비밀번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="password" name="userPw" id="userPw" class="inputStyle" placeholder="영문, 숫자, 특수문자 조합하여 8~16자"> <br>
		비밀번호 확인 
		<input type="password" name="userPwChk" id="userPwChk" class="inputStyle"> <br>
		&nbsp;&nbsp;&nbsp; <span id="confirmMsg"></span> <br>
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