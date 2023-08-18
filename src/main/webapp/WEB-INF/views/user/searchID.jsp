<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

h1, h3{
	text-align: center;
}

img{
	margin: auto;
	display: block;
}

td {
	display: block;
	padding-bottom: 5px;
}

tr>td:nth-child(2), span {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.step-form {
	width: 600px;
	margin: auto;
}

.inputStyle {
	width: 280px;
	height: 25px;
}

.btn {
	width: 290px;
	height: 40px;
	margin: auto;
	display: block;
}

.space {
	text-align: right;
}

</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

$(function(){
	
	let ranStr;
	let isCodeChecked = false;
	
	// 1. 이메일 코드발송 버튼 클릭
	$('#btnEmailSend').click(function() {
		let userEmail = $('#userEmail').val();		// 사용자가 입력한 이메일
		
		// 인증코드 발송
		$.ajax({
			url : '${contextPath}/business/emailCheck?email=' + userEmail,
			type : 'get',
			success : function(msg) {
				$('#checkCode').attr('disabled', false);	// 인증코드 전송 후 입력창 활성화
				ranStr = msg;								// 전송한 인증코드 저장
				alert("인증코드가 전송되었습니다.");
			},
			error : function() {
				alert("ajax Error");
			}
			
		}); // ajax
		
	}); // btnEmailSend.click
	
	
	
	// 2. 인증하기 버튼 클릭
	$('#btnEmailCheck').click(function() {
		let inputCode = $('#checkCode').val();			// 사용자가 입력한 인증코드
		
		// 인증코드 일치
		if(inputCode === ranStr) {
			isCodeChecked = true;
			$('#authchk').html("이메일 인증이 완료되었습니다.");
			$('#authchk').css('color', 'green');
			$('#authchk').css('font-size', '10px');
			
			$('#btnEmailSend').attr('disabled', true);	// 재인증 제한
			$('#btnEmailCheck').attr('disabled', true);
			$('#checkCode').attr('readonly', true);		// 인증코드 수정 제한
			$('#userEmail').attr('readonly', true);		// 인증 후 메일 변경 제한
		} 
		// 인증코드 불일치
		else{
			$('#authchk').html("인증코드가 일치하지 않습니다! 다시 확인해 주세요.");
			$('#authchk').css('color', 'red');
			$('#authchk').css('font-size', '10px');
			inputCode.focus();
		}
	});

	

	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 정규 표현식 & 중복 체크 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	// + 정규 표현식 조건 제어
	// + 인증완료 하지 않거나 값이 다를 경우 못 넘어가게 제어
	
	// 1. 조건 부합 상태를 저장하는 변수
	let isEmailChecked = false;
	
	
	
	// 2. 이메일 조건 체크
	$('#userEmail').keyup(function(){
		let userEmail = $('#userEmail').val();
		let trueEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		
		if(userEmail === ""){
			$('#emailchk').html("");
		}
		// 조건 O
		else if(trueEmail.test(userEmail)){
			$('#emailchk').html("");
			
			// 중복 체크
			$.ajax({
				url :'/user/emailOverlap',
				type : 'post',
				data : {"userEmail" : userEmail},
				dataType : "json",
				success : function(data){
					if(data === 1){
						isEmailChecked = true;
						$('#btnEmailSend').attr('disabled', false);
						$('#emailchk').html("사용 가능한 이메일 입니다.");
						$('#emailchk').css('color', 'green');
						$('#emailchk').css('font-size', '10px');
					}else if(data === 0){
						isEmailChecked = false;
						$('#emailchk').html("이미 존재하는 이메일 입니다.");
						$('#emailchk').css('color', 'red');
						$('#emailchk').css('font-size', '10px');
						$('#emailchk').focus();
					}
				},
				error : function(){
					alert("ajax Error");
				}
			}); // ajax
		}
		// 조건 X
		else if(!trueEmail.test(userEmail)){
			isEmailChecked = false;
			$('#emailchk').html("잘못된 이메일 형식입니다.");
			$('#emailchk').css('color', 'red');
			$('#emailchk').css('font-size', '10px');
		}
	}); // userEmail.keyup
	
	
	
	// 3. 제출 시 유효성 체크
	$('#submit').click(function(e) {
		if($('#userEmail').val() === ""){
			$('#userEmail').focus();
			alert("이메일을 입력해 주세요.");
			return false;
		}
        else if($('#checkCode').val() === ""){
			$('#checkCode').focus();
			alert("이메일 인증 코드를 입력해 주세요.");
			return false;
		}
		else if(!isEmailChecked){
			$('#userEmail').focus();
			return false;
		}
		else if(!isCodeChecked){
			$('#authchk').html("이메일을 인증해 주세요.");
			$('#authchk').css('color', 'red');
			$('#authchk').css('font-size', '10px');
			$('#authchk').focus();
			return false;
		}
		else{
			// 모든 조건 통과 시 데이터 전송
// 			$.ajax({
// 				url: '/user/join',
// 				type: 'post',
// 				data: {
// 					"userId" : $('#userId').val(),
// 					"userPw" : $('#userPw').val(),
// 					"userName" : $('#userName').val(),
// 					"userEmail" : $('#userEmail').val(),
// 					"userTel" : $('#userTel').val(),
// 				},
// 				success: function(){
// 					alert("회원가입이 완료되었습니다.");
// 					location.href = "/user/login";
// 				},
// 				error: function(){
// 					alert("ajax Error");
// 				}
// 			}); // ajax

	    } // else

	}); // submit.click
	
});

</script>
</head>
<body>

<div class="step-form">

	<h1>FOOEATING</h1>
	<h3>회원정보에 등록된 이메일을 인증해 주세요.</h3>

	<table style="margin: 40px auto;">
		<tr>
			<td>이메일</td>
			<td><input type="email" name="userEmail" id="userEmail" class="inputStyle"></td>
			<td id="emailchk"></td>
			<td class="space"><input type="button" id="btnEmailSend" value="코드발송" disabled></td>
		<tr>	
			<td>이메일 인증</td>
			<td><input type="text" id="checkCode" class="inputStyle" maxlength="10" placeholder="인증코드 입력" disabled></td>
			<td id="authchk"></td>
			<td class="space"><input type="button" id="btnEmailCheck" value="인증하기"></td>
		</tr>	
	</table>
	
	<input type="button" id="submit" class="btn" value="다음" >

</div>

</body>
</html>