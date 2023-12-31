<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

h1{
	text-align: center;
}

img{
	margin: auto;
	display: block;
}

fieldset{
	width: 600px;
	height: 150px;
	overflow: scroll;
	margin-bottom: 20px;
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
	width: 100px;
	height: 30px;
	margin: auto;
	display: block;
}

.space {
	text-align: right;
}

#confirmMsg {
	font-size: 0.7em;
	color: red;
}

</style>
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	// 각 step 숨기기
	$("#step1").show();
	$("#step2").css("display", "none");
	
	// 사용자가 입력한 회원 정보를 저장할 객체
	var buserInfo = {};
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ step1 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	// 약관 전체 동의
	$("#chkTermsAll").click(function() {
		var isChecked = $(this).prop('checked');
		$(".chkTerms").prop('checked', isChecked);
	});
	
	// 약관 체크 개수에 따른 chkTermsAll 상태 조절
	$(".chkTerms").click(function() {
		var allChecked = $(".chkTerms").length === $(".chkTerms:checked").length;
		$("#chkTermsAll").prop('checked', allChecked);
	});
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ step2 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	// 0. 조건 부합 상태를 저장하는 변수
	let isIdChecked = false;
	let isPwChecked = false;
	let isPwChecked2 = false;
	let isbnumChecked = false;
	let isNameChecked = false;
	let isEmailChecked = false;
	let isTelChecked = false;
	
	// 1. 아이디 조건 및 중복 체크
	$('#buId').keyup(function(){
		let buId = $('#buId').val();
		let trueId = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,12}$/;
		
		if(buId === ""){
			$('#idchk').html("");
		}
		// 조건 O
		else if(trueId.test(buId)){
			$('#idchk').html("");
			
			// 중복 체크
			$.ajax({
				url :'/user/idOverlap',
				type : 'post',
				data : {"userId" : buId},
				dataType : "json",
				success : function(data){
					console.log(data);
					if(data === 1){
						isIdChecked = true;
						$('#idchk').html("사용 가능한 아이디 입니다.");
						$('#idchk').css('color', 'green');
						$('#idchk').css('font-size', '10px');
					}else if(data === 0){
						isIdChecked = false;
						$('#idchk').html("이미 존재하는 아이디 입니다.");
						$('#idchk').css('color', 'red');
						$('#idchk').css('font-size', '10px');
						$('#buId').focus();
					}
				},
				error : function(){
					alert("ajax Error");
				}
			}); // ajax
		
		} 
		// 조건 X
		else if(!trueId.test(buId)){
			isIdChecked = false;
			$('#idchk').html("영문과 숫자를 조합하여 8~12자로 작성해 주세요.");
			$('#idchk').css('color', 'red');
			$('#idchk').css('font-size', '10px');
		}
	}); // buId.keyup
	
	
	
	// 2-1. 비밀번호 조건 체크
	$('#buPw').keyup(function(){
		let buPw = $('#buPw').val();
		let buPwChk = $('#buPwChk').val();
		let truePw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,12}$/;
		
		if(buPw === ""){
			$('#pwchk1').html("");
		}
		// 조건 O
		else if(truePw.test(buPw)){
			isPwChecked = true;
			$('#pwchk1').html("");
			$('#pwchk2').html("");
			
			// 비밀번호 일치 여부
			if(buPw === buPwChk && buPwChk !== ""){
				isPwChecked = true;
				isPwChecked2 = true;
				$('#pwchk1').html("");
				$('#pwchk2').html("");
			}
			else if(buPw !== buPwChk && buPwChk !== ""){
				isPwChecked2 = false;
				$('#pwchk2').html("비밀번호가 일치하지 않습니다.");
				$('#pwchk2').css('color', 'red');
				$('#pwchk2').css('font-size', '10px');
			}
		}
		// 조건 X
		else if(!truePw.test(buPw)){
			isPwChecked = false;
			$('#pwchk1').html("영문, 숫자, 특수문자를 조합하여 8~12자로 작성해 주세요.");
			$('#pwchk1').css('color', 'red');
			$('#pwchk1').css('font-size', '10px');
			
			// 비밀번호 일치 여부
			if(buPw !== buPwChk && buPwChk !== ""){
				$('#pwchk2').html("비밀번호가 일치하지 않습니다.");
				$('#pwchk2').css('color', 'red');
				$('#pwchk2').css('font-size', '10px');
			}
		}
	}); // buPw.keyup
	
	
	
	// 2-2. 비밀번호 크로스 체크
	$('#buPwChk').keyup(function(){
		let buPw = $('#buPw').val();
		let buPwChk = $('#buPwChk').val();
		
		if(buPwChk === ""){
			$('#pwchk2').html("");
		}
		// 조건 O
		else if(buPw === buPwChk){
			isPwChecked2 = true;
			$('#pwchk2').html("");
		}
		// 조건 X
		else if(buPw !== buPwChk && buPwChk !== ""){
			isPwChecked2 = false;
			$('#pwchk2').html("비밀번호가 일치하지 않습니다.");
			$('#pwchk2').css('color', 'red');
			$('#pwchk2').css('font-size', '10px');
		}
	}); // buPwChk.keyup
	
	
	
	// 3. 사업자번호 조건 체크
	$('#buNum').keyup(function(){
		let buNum = $('#buNum').val();
		let trueNum = /^\d{3}-\d{2}-\d{5}$/;
		
		if(buNum === ""){
			$('#bnumchk').html("");
		}
		// 조건 O
		else if(trueNum.test(buNum)){
			$('#buNum').html("");
			
			// 중복 체크
			$.ajax({
				url :'/business/bnumOverlap',
				type : 'post',
				data : {"buNum" : buNum},
				dataType : "json",
				success : function(data){
					if(data === 1){
						isbnumChecked = true;
						$('#bnumchk').html("등록 가능한 사업자번호 입니다.");
						$('#bnumchk').css('color', 'green');
						$('#bnumchk').css('font-size', '10px');
					}else if(data === 0){
						isbnumChecked = false;
						$('#bnumchk').html("이미 등록된 사업자번호 입니다.");
						$('#bnumchk').css('color', 'red');
						$('#bnumchk').css('font-size', '10px');
						$('#buNum').focus();
					}
				},
				error : function(){
					alert("ajax Error");
				}
			}); // ajax
		
		} 
		// 조건 X
		else if(!trueNum.test(buNum)){
			isbnumChecked = false;
			$('#bnumchk').html("사업자번호 형식에 맞지 않습니다.");
			$('#bnumchk').css('color', 'red');
			$('#bnumchk').css('font-size', '10px');
		}
	}); // buNum.keyup
	
	
	
	// 4. 이름 조건 체크
	$('#buName').keyup(function(){
		let buName = $('#buName').val();
		let trueName = /^[가-힣a-zA-Z]{2,10}$/;
		
		if(buName === ""){
			$('#namechk').html("");
		}
		// 조건 O
		else if(trueName.test(buName)){
			isNameChecked = true;
			$('#namechk').html("");
		}
		// 조건 X
		else if(!trueName.test(buName)){
			isNameChecked = false;
			$('#namechk').html("최소 2글자~최대 10글자, 한글 또는 영어로 입력해 주세요.");
			$('#namechk').css('color', 'red');
			$('#namechk').css('font-size', '10px');
		}
	}); // buName.keyup
	
	
	
	// 5. 이메일 조건 체크
	$('#buEmail').keyup(function(){
		let buEmail = $('#buEmail').val();
		let trueEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		
		if(buEmail === ""){
			$('#emailchk').html("");
		}
		// 조건 O
		else if(trueEmail.test(buEmail)){
			$('#emailchk').html("");
			
			// 중복 체크
			$.ajax({
				url :'/user/emailOverlap',
				type : 'post',
				data : {"userEmail" : buEmail},
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
		else if(!trueEmail.test(buEmail)){
			isEmailChecked = false;
			$('#emailchk').html("잘못된 이메일 형식입니다.");
			$('#emailchk').css('color', 'red');
			$('#emailchk').css('font-size', '10px');
		}
	}); // buEmail.keyup
	
	
	
	// 6. 전화번호 조건 체크
	$('#buTel').keyup(function(){
		let buTel = $('#buTel').val();
		let trueTel = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
		
		if(buTel === ""){
			$('#telchk').html("");
		}
		// 조건 O
		else if(trueTel.test(buTel)){
			$('#telchk').html("");
			
			// 중복 체크
			$.ajax({
				url :'/user/telOverlap',
				type : 'post',
				data : {"userTel" : buTel},
				dataType : "json",
				success : function(data){
					if(data === 1){
						isTelChecked = true;
						$('#telchk').html("사용 가능한 전화번호 입니다.");
						$('#telchk').css('color', 'green');
						$('#telchk').css('font-size', '10px');
					}else if(data === 0){
						isTelChecked = false;
						$('#telchk').html("이미 존재하는 전화번호 입니다.");
						$('#telchk').css('color', 'red');
						$('#telchk').css('font-size', '10px');
						$('#telchk').focus();
					}
				},
				error : function(){
					alert("ajax Error");
				}
			}); // ajax
		}
		// 조건 X
		else if(!trueTel.test(buTel)){
			isTelChecked = false;
			$('#telchk').html("연락처 형식에 맞지 않습니다.");
			$('#telchk').css('color', 'red');
			$('#telchk').css('font-size', '10px');
		}
	}); // buTel.keyup
	
	
	
	// 인증코드 저장 변수
	let ranStr;
	let isCodeChecked = false;
	
	// 인증코드 발송 버튼
	$("#btnTelSend").click(function() {
		let tel = $("#buTel").val();			// 사용자가 입력한 전화번호
		
		// 인증코드 발송 ajax
		$.ajax({
			url : "${contextPath}/business/sendSMS",
			type : "POST",
			data : { buTel : tel },
			cache : false,
			success : function(msg) {
				alert("인증코드가 전송되었습니다.\n※인증번호가 오지 않는다면 입력하신 번호를 확인해주세요.");
				$("#checkCode").attr("disabled", false);	// 인증코드 전성 후 입력성 활성화
				ranStr = msg;								// 전송한 인증코드 저장
			},
			error : function() {
				alert("ajax Error");
			}
		});
	});
	
	// 인증버튼 클릭
	$("#btnTelCheck").click(function() {
		let inputCode = $("#checkCode").val();		// 사용자가 입력한 인증코드
		
		// 인증코드 일치
		if (inputCode === ranStr) {
			isCodeChecked = true;
			$('#authchk').html("휴대폰 인증이 완료되었습니다.");
			$('#authchk').css('color', 'green');
			$('#authchk').css('font-size', '10px');
			
			$("#btnTelSend").attr("disabled", true);	// 재인증 제한
			$("#btnTelCheck").attr("disabled", true);
			$("#checkCode").attr("readonly", true);		// 인증코드 수정 제한
			$("#buTel").attr("readonly", true);			// 인증 후 전화번호 변경 제한
		} 
		// 인증코드 불일치
		else {
			$('#authchk').html("인증코드가 일치하지 않습니다! 다시 확인해 주세요.");
			$('#authchk').css('color', 'red');
			$('#authchk').css('font-size', '10px');
			inputCode.focus();
		}
	});
	
	// 회원가입 버튼 클릭 시
	$("#btn-submit").click(function() {
		// 사용자 정보 저장
		buserInfo.buId = $("#buId").val();			// 아이디 저장
		buserInfo.buPw = $("#buPw").val();			// 비밀번호 저장
		buserInfo.buNum = $("#buNum").val();		// 사업자번호 저장
		buserInfo.buName = $("#buName").val();		// 이름 저장
		buserInfo.buEmail = $("#buEmail").val();	// 이메일 저장
		buserInfo.buTel = $("#buTel").val();		// 전화번호 저장
		
		// step2 유효성 검사
		if ($("#buId").val() === "") {
			alert("아이디를 입력해주세요.");
			$("#buId").focus();
			return false;
		} else if ($("#buPw").val() === "") {
			alert("비밀번호를 입력해주세요.");
			$("#buPw").focus();
			return false;
		} else if ($("#buNum").val() === "") {
			alert("사업자번호를 입력해주세요.");
			$("#buNum").focus();
			return false;
		} else if ($("#buName").val() === "") {
			alert("이름을 입력해주세요.");
			$("#buName").focus();
			return false;
		} else if ($("#buTel").val() === "") {
			alert("전화번호를 입력해주세요.");
			$("#buTel").focus();
			return false;
		} else if (!$("#checkCode").attr("readonly")) {
			alert("휴대폰 인증을 완료해주세요.");
			$("#buTel").focus();
			return false;
		} else {
			console.log(buserInfo);
			
			// businessuser 정보
			$.ajax({
				url : "${contextPath}/business/join",
				type : "POST",
				contentType : "application/json",
				data : JSON.stringify(buserInfo),
				success : function(msg) {
					alert("회원가입이 완료되었습니다!");
					location.href = "/user/login";
				},
				error : function() {
					alert("ajax Error");
				}
			});
		}
	});
	
});

// next 클릭 시
function showStep() {
	// step1 비활성화 & step2 활성화
	$("#step1").css("display", "none");
	$("#step2").show();
	
	// 필수 약관 동의하지 않을 경우 alert창
	if (!$("#chkTerms1").prop('checked')) {
		alert("[필수] FOOEATING 이용약관에 동의해 주세요.");
		$("#step1").show();
		$("#step2").css("display", "none");
		return false;
	}
	if (!$("#chkTerms2").prop('checked')) {
		alert("[필수] 개인정보 수집 및 이용약관에 동의해 주세요.");
		$("#step1").show();
		$("#step2").css("display", "none");
		return false;
	}
}

</script>

</head>
<body>



<img src="${pageContext.request.contextPath}/resources/img/logo.png" width="200px" height="200px">
	
<!-- ㅡㅡㅡㅡ step 1 ㅡㅡㅡㅡ -->
<div id="step1">

	<div class="step-form">
		<h1>FOOEATING 회원약관 동의</h1> <br>
		
		<label><input type="checkbox" name="terms" id="chkTermsAll"> <b>전체 동의하기</b></label> <br>
		위치기반서비스 이용약관(선택), 이벤트・혜택 정보 수신(선택) 동의를 포함합니다. <br><br><br>
	
		<label><input type="checkbox" name="terms" id="chkTerms1" class="chkTerms"> <b><font color="red">[필수]</font> FOOEATING 이용약관</b></label>
		<fieldset>
			&nbsp; 제1조 (목적) <br>
			1.이 약관은 FOOEATING(이하 "회사"라 함)이 운영하는 식상 대기 예약 사이트(이하 "서비스"라 함) 이용과 관련하여 회사와 회원 간의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다. <br>
			<br>
			&nbsp; 제2조 (정의) <br>
			1. "회원"이란 회사와 서비스 이용계약을 체결하고 회사가 제공하는 서비스를 이용하는 자를 의미합니다. <br>
			2. "사이트"란 회사가 제공하는 FOOEATING 웹사이트 및 모바일 애플리케이션을 말합니다. <br>
			<br>
			&nbsp; 제3조 (이용계약의 성립) <br>
			1. 회원으로 가입하고자 하는 자는 본 약관을 읽고 동의한 후, 회원가입 신청을 해야 합니다. <br>
			2. 회사는 회원으로 가입하고자 하는 자의 신청에 대해 승낙함으로써 이용계약이 성립됩니다. <br>
			<br>
			&nbsp; 제4조 (서비스의 제공 및 변경) <br>
			1. 회사는 회원에게 식상 대기 예약 서비스를 제공합니다. <br>
			2. 회사는 사전 고지 후, 필요한 경우 언제든지 서비스의 내용을 변경하거나 중단할 수 있으며, 이로 인해 회원에게 발생한 손해에 대해 책임지지 않습니다. <br>
			<br>
			&nbsp; 제5조 (회원정보의 관리) <br>
			1. 회원은 서비스 가입 시 기재한 개인정보의 정확성과 최신성을 유지해야 합니다. <br>
			2. 회사는 회원의 개인정보를 본인의 승낙 없이 제3자에게 제공하지 않으며, 개인정보 보호 관련 법령과 회사의 개인정보 처리 방침에 따라 관리합니다. <br>
			<br>
			&nbsp; 제6조 (회원의 이용제한) <br>
			- 회원은 다음 각 호에 해당하는 경우 회사의 서비스 이용을 제한 받을 수 있습니다. <br>
			가. 타인의 정보 도용 및 부정한 이용 행위 <br>
			나. 회사의 운영진 및 직원을 사칭하여 정보를 유출하는 행위 <br>
			다. 회사의 서비스 운영에 지장을 주거나, 서비스의 안정성을 저해하는 행위 <br>
			라. 회사의 서비스를 상업적으로 이용하는 행위 <br>
			마. 기타 관련 법령 및 약관을 위반하는 행위 <br>
			<br>
			&nbsp; 제7조 (서비스 이용의 중지) <br>
			1. 회원이 약관에 위반되는 행위를 하거나 서비스 이용에 있어서 직원, 타 회원 등에게 피해를 주는 경우, 회사는 해당 회원의 서비스 이용을 일시적으로 중지할 수 있습니다. <br>
			<br>
			&nbsp; 제8조 (게시물의 관리) <br>
			1. 회원이 사이트에 게시하는 게시물은 공서양속에 반하거나 법령을 위반하는 내용이 없어야 하며, 회사는 회원이 게시하는 게시물을 사전 승인 없이 삭제 또는 수정할 수 있습니다. <br>
			<br>
			&nbsp; 제9조 (책임의 제한) <br>
			1. 회사는 회원의 귀책사유로 인한 서비스 이용의 장애에 대해 책임을 지지 않습니다. <br>
			2. 회사는 무료로 제공되는 서비스 이용과 관련하여 발생하는 손해에 대해 책임을 지지 않습니다. <br>
			<br>
			&nbsp; 제10조 (분쟁의 해결) <br>
			1. 본 약관은 대한민국의 법령에 의하여 해석되며, 서비스 이용과 관련하여 발생한 분쟁에 대해서는 민사소송법상의 주소지를 관할하는 법원을 관할 법원으로 합니다. <br>
			2. 위 회원약관은 FOOEATING의 서비스 이용과 관련하여 회원과 회사 간의 권리와 의무를 명확히 규정하기 위해 작성되었습니다. 회원은 이 약관을 준수하며 식상 대기 예약 서비스를 즐겁고 편리하게 이용하실 수 있습니다. <br>
		</fieldset>
		
		<br>
		<label><input type="checkbox" name="terms" id="chkTerms2" class="chkTerms"> <b><font color="red">[필수]</font> 개인정보 수집 및 이용약관</b></label> 
		<fieldset>
			1. 수집하는 개인정보 항목 <br>
			&nbsp; - 회원가입 시: 이름, 연락처(휴대전화번호), 이메일 주소 <br>
			<br>
			2. 개인정보의 수집 및 이용목적 <br>
			&nbsp; - 회원 가입 및 관리 <br>
			&nbsp; - 서비스 제공과 이용자 본인인증 <br>
			&nbsp; - 고객상담 및 문의응대 <br>
			<br>
			3. 개인정보의 보유기간 <br>
			&nbsp; - 회원탈퇴 시 또는 서비스 이용 목적 달성 후, 해당 정보를 즉시 파기합니다. <br>
			<br>
			4. 개인정보의 제공 <br>
			&nbsp; - 회사는 회원의 개인정보를 본인의 동의 없이 외부에 제공하지 않습니다. <br>
			<br>
			5. 개인정보의 파기 <br>
			&nbsp; - 개인정보 수집 및 이용목적이 달성되거나 회원탈퇴 시에는 해당 정보를 즉시 파기합니다. <br>
			<br>
			6. 개인정보의 안전성 확보 <br>
			&nbsp; - 개인정보의 안전성 확보를 위해 기술적, 관리적 대책을 강구하고 있으며, 외부로부터의 무단 접근, 유출, 변조 등을 방지하기 위해 최선을 다하고 있습니다. <br>
			<br>
			7. 이용자의 권리와 행사 방법 <br>
			&nbsp; - 이용자는 언제든지 자신의 개인정보를 조회하거나 수정할 수 있으며, 개인정보 삭제를 요청할 수 있습니다. <br>
			&nbsp; - 개인정보 조회, 수정, 삭제를 위해서는 사이트 내 "개인정보 수정"을 이용하거나, 고객센터를 통해 요청하실 수 있습니다. <br>
			<br>
			8. 개인정보 처리방침 변경 <br>
			&nbsp; - 본 개인정보 처리방침은 법령의 변경이나 회사의 정책 변경에 따라 수정될 수 있으며, 변경 시에는 사이트를 통해 공지합니다. <br>
			<br>
			위 개인정보 수집 및 이용안내는 이용자의 개인정보를 보호하기 위해 마련되었습니다. 이용자는 본 안내 내용에 동의하고 회원가입 절차를 진행하여 FOOEATING의 서비스를 이용하실 수 있습니다. <br>
		</fieldset>
		
		<br>
		<label><input type="checkbox" name="terms" class="chkTerms"> <b><font color="blue">[선택]</font> 위치기반서비스 이용약관</b></label>
		<fieldset>
			제1조 (목적) <br>
			1. 본 약관은 FOOEATING(이하 "회사"라 함)이 제공하는 위치기반서비스(이하 "서비스"라 함)와 관련하여 회사와 이용자 간의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다. <br>
			<br>
			제2조 (정의) <br>
			1. "서비스"란 회사가 위치정보를 이용하여 이용자에게 제공하는 식당 대기 예약 서비스를 말합니다. <br>
			2. "이용자"란 본 약관에 따라 회사가 제공하는 서비스를 이용하는 자를 말합니다. <br>
			<br>
			제3조 (위치정보 이용) <br>
			1. 회사는 위치정보를 이용하여 식당 대기 예약 서비스를 제공하며, 이용자는 서비스 이용을 위해 위치정보를 제공합니다. <br>
			2. 위치정보는 이용자의 동의 없이 제3자에게 제공되지 않으며, 개인정보 처리 방침에 따라 안전하게 관리됩니다. <br>
			<br>
			제4조 (위치정보 이용 동의) <br>
			1. 이용자는 서비스 이용을 위해 위치정보를 제공하기 전에 개인정보 처리 방침 및 위치기반서비스 이용약관에 대해 동의해야 합니다. <br>
			2. 위치정보 제공에 동의하지 않을 경우, 일부 서비스 이용이 제한될 수 있습니다. <br>
			<br>
			제5조 (서비스 제공과 변경) <br>
			1. 회사는 위치정보를 기반으로 이용자에게 식당 대기 예약 서비스를 제공합니다. <br>
			2. 회사는 사전 고지 후, 필요한 경우 언제든지 서비스의 내용을 변경하거나 중단할 수 있으며, 이로 인해 이용자에게 발생한 손해에 대해 책임지지 않습니다. <br>
			<br>
			제6조 (책임의 제한) <br>
			1. 회사는 이용자의 귀책사유로 인한 서비스 이용의 장애에 대해 책임을 지지 않습니다. <br>
			2. 회사는 무료로 제공되는 서비스 이용과 관련하여 발생하는 손해에 대해 책임을 지지 않습니다. <br>
			<br>
			제7조 (분쟁의 해결) <br>
			1. 본 약관은 대한민국의 법령에 의하여 해석되며, 위치기반서비스 이용과 관련하여 발생한 분쟁에 대해서는 민사소송법상의 주소지를 관할하는 법원을 관할 법원으로 합니다. <br>
			<br>
			위 위치기반서비스 이용약관은 FOOEATING의 위치정보 기반 서비스를 이용하는 이용자와 회사 간의 권리와 의무를 명확히 규정하기 위해 작성되었습니다. 이용자는 본 약관을 준수하며 위치정보 기반 서비스를 안전하고 편리하게 이용하실 수 있습니다. <br>
		</fieldset>
		
		<br>
		<label><input type="checkbox" name="terms" class="chkTerms"> <b><font color="blue">[선택]</font> 이벤트・혜택 정보 수신</b></label>
		<fieldset>
			제1조 (목적) <br>
			1. 본 약관은 FOOEATING(이하 "회사"라 함)이 제공하는 이벤트 및 혜택 정보 수신 서비스(이하 "서비스"라 함)와 관련하여 회사와 이용자 간의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다. <br>
			<br>
			제2조 (정의) <br>
			1. "서비스"란 회사가 이용자에게 이벤트 및 혜택 정보를 제공하는 서비스를 말합니다. <br>
			2. "이용자"란 본 약관에 따라 회사가 제공하는 서비스를 이용하는 자를 말합니다. <br>
			<br>
			제3조 (정보 수신 동의) <br>
			1. 이용자는 이벤트 및 혜택 정보 수신을 위해 개인정보 처리 방침 및 이벤트 및 혜택 정보 수신 약관에 대해 동의해야 합니다. <br>
			2. 이벤트 및 혜택 정보 수신에 동의하지 않을 경우, 해당 서비스의 정보를 수신할 수 없습니다. <br>
			<br>
			제4조 (정보 수신 취소) <br>
			1. 이용자는 언제든지 이벤트 및 혜택 정보 수신을 취소할 수 있습니다. <br>
			2. 이벤트 및 혜택 정보 수신 취소를 원할 경우, 회사의 웹사이트 또는 모바일 애플리케이션 내 설정에서 취소할 수 있습니다. <br>
			<br>
			제5조 (정보 제공 및 변경) <br>
			1. 회사는 이용자에게 이벤트 및 혜택 정보를 제공합니다. <br>
			2. 회사는 사전 고지 후, 필요한 경우 언제든지 이벤트 및 혜택 정보의 내용을 변경할 수 있으며, 변경된 내용은 이용자에게 공지합니다. <br>
			<br>
			제6조 (책임의 제한) <br>
			1. 회사는 이용자의 귀책사유로 인한 이벤트 및 혜택 정보 수신의 장애에 대해 책임을 지지 않습니다. <br>
			2. 회사는 무료로 제공되는 서비스 이용과 관련하여 발생하는 손해에 대해 책임을 지지 않습니다. <br>
			<br>
			제7조 (분쟁의 해결) <br>
			1. 본 약관은 대한민국의 법령에 의하여 해석되며, 이벤트 및 혜택 정보 수신과 관련하여 발생한 분쟁에 대해서는 민사소송법상의 주소지를 관할하는 법원을 관할 법원으로 합니다. <br>
			<br>
			위 이벤트 및 혜택 정보 수신 약관은 FOOEATING의 이벤트 및 혜택 정보를 수신하는 이용자와 회사 간의 권리와 의무를 명확히 규정하기 위해 작성되었습니다. 이용자는 본 약관을 준수하며 이벤트 및 혜택 정보를 편리하게 수신하실 수 있습니다. <br>
		</fieldset>
	</div>
		
	<input type="button" id="btn-next1" class="btn" value="다음" onclick="showStep();">

</div>
<!-- ㅡㅡㅡㅡ step 1 ㅡㅡㅡㅡ -->



<!-- ㅡㅡㅡㅡ step 2 ㅡㅡㅡㅡ -->
<div id="step2">
	
	<div class="step-form">
		<table style="margin: 40px auto;">
			<tr>
				<td>아이디</td>
				<td><input type="text" id="buId" class="inputStyle" placeholder="영문과 숫자 조합하여 8~12자"></td>
				<td id="idchk"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="buPw" class="inputStyle" placeholder="영문, 숫자, 특수문자 조합하여 8~16자"></td>
				<td id="pwchk1"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="buPwChk" id="buPwChk" class="inputStyle"></td>
				<td id="pwchk2"></td>
			</tr>
			<tr>
				<td>사업자번호</td>
				<td><input type="text" id="buNum" class="inputStyle" placeholder="ex) 000-00-00000"></td>
				<td id="bnumchk"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" id="buName" class="inputStyle"></td>
				<td id="namechk"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" id="buEmail" class="inputStyle" placeholder="이메일"></td>
				<td id="emailchk"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" id="buTel" class="inputStyle" placeholder="ex) 000-0000-0000"></td>
				<td id="telchk"></td>
				<td class="space"><button type="button" id="btnTelSend">코드발송</button></td>
			</tr>
			<tr>
				<td>전화번호 인증</td>
				<td><input type="text" id="checkCode" class="inputStyle" maxlength="10" placeholder="인증코드 입력" disabled></td>
				<td id="authchk"></td>
				<td class="space"><button type="button" id="btnTelCheck">인증하기</button></td>
			</tr>
		</table>
	</div>
	
	<input type="button" class="btn" id="btn-submit" value="회원가입" style="width: 290px; height: 40px;">

</div>
<!-- ㅡㅡㅡㅡ step 2 ㅡㅡㅡㅡ -->
	
	
	
</body>
</html>