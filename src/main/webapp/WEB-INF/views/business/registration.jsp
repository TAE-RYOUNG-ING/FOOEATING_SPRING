<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
h1{
	text-align: center;
}

h6{
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
}

#div{
	width: 600px;
	margin:auto;
}

#btn{
	width: 100px;
	margin: auto;
	display: block;
}
</style>
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	// 각 step 숨기기
	$("#step1").show();
	$("#step2").hide();
	$("#step3").hide();
	
	// 사용자가 입력한 사업장 정보를 저장할 formData 객체
	var formData = new FormData();
	var registInfo = {};
	formData.append("restId", "000-00-00001");			// 세션에 저장된 회원 정보에서 가져오기 (회원이 사업자일 경우 restId도 같이 저장 예정)
	
	// 사용자가 입력한 메뉴 정보를 저장할 객체 (없을 수도 있음)
	var registMenu = {};
	
	
	
	// --------------------- step1 ----------------------------
	
	// 영업시간 요일 변수
	var dayValue;
	
	// 영업시간 요일 체크 시 시간 작성 활성화
	$("input[name='restRuntime']").click(function() {
		dayValue = $(this).val();
		
		if ($(this).prop('checked')) {
			$("#time1" + dayValue).prop('disabled', false);
			$("#time2" + dayValue).prop('disabled', false);
			$("#time8" + dayValue).prop('disabled', false);
		} else {
			$("#time1" + dayValue).prop('disabled', true);
			$("#time2" + dayValue).prop('disabled', true);
			$("#time8" + dayValue).prop('disabled', true);
		}
	});
	
	// next 클릭 시 객체 정보 저장
	$("#btn-next1").click(function() {
		formData.append("restName", $("#restName").val());							// 상호명
		formData.append("restCategory", $("#restCategory").val());					// 업종
		var restAddr = $("#restAddrPostcode").val() + "/" + $("#restAddr1").val();
		if ($("#restAddr2").val()) { restAddr +=  "/" + $("#restAddr2").val(); }
		formData.append("restAddr", restAddr);										// 주소
		
		formData.append("restTel", $("#restTel").val());							// 전화번호
		
		var restRuntime = "";
		var runtime = [ "일요일 휴무", "월요일 휴무", "화요일 휴무", "수요일 휴무", "목요일 휴무", "금요일 휴무", "토요일 휴무" ];
		if ($("#time8기타").val()) { runtime.push($("#time8기타").val()); }
		$.each(runtime, function(idx, el) {
			$("input[name='restRuntime']:checked").each(function() {
				dayValue = $(this).val();
				
				if (el.includes(dayValue)) {
					runtime[idx] = dayValue + " " + document.getElementById("time1" + dayValue).value + " ~ " + document.getElementById("time2" + dayValue).value;
				}
			});
			restRuntime += (idx !== runtime.length - 1 ? runtime[idx] + "/" : runtime[idx]);
		});
		formData.append("restRuntime", restRuntime);								// 영업시간
		
		var conv = "";
		$('input[name="restConv"]:checked').each(function() {
			conv += this.value + "/";
		});
		formData.append("restConvenience", conv.slice(0, -1));						// 편의시설
	});
	
	
	
	// --------------------- step2 ----------------------------
	
	// next 클릭 시 객체 정보 저장
	$("#btn-next2").click(function() {
		formData.append("restDescription", $("#restDescription").val());			// 가게 소개
		
		var files = $("#restFile")[0].files;
		console.log(files);
		
		for (var i = 0; i < files.length; i++) {
			formData.append("files", files[i]);
		}																			// 사진
	});
	
	
	
	// --------------------- step3 ----------------------------
	
	// 메뉴추가 버튼 클릭
	var cnt = 2;
	$("#btnAddMenu").click(function(event) {
		if (cnt <= 3) {
			$("#divAddMenu").append("<b>메뉴 " + cnt + "</b> <br>");
			$("#divAddMenu").append("이름 <input type='text' id='menuName" + cnt + "' placeholder='메뉴 이름'> <br>");
			$("#divAddMenu").append("설명 <input type='text' id='menuDescription" + cnt + "' placeholder='메뉴 설명'> <br>");
			$("#divAddMenu").append("가격 <input type='number' id='menuPrice" + cnt + "' min='0' placeholder='메뉴 가격'>원 <br>");
			$("#divAddMenu").append("사진 <input type='file' id='menuFile" + cnt + "'> <br>");
		}
		
		if (cnt > 3) {
			alert("메뉴는 최대 3개까지 입력 가능합니다.");
			return false;
		}
		
		cnt++;
	});
	
	
	
	// --------------------- 신청 버튼 ----------------------------
	
	$("#btn-submit").click(function() {
		console.log(registInfo);
		
		// 가게 정보 저장
		$.ajax({
			url : "${contextPath}/business/registration",
			method : "POST",
			data : formData,
			contentType : false,
			processData : false,
			enctype : "multipart/form-data",
			success : function(msg) {
				alert("입점 신청이 완료되었습니다. :)");
			},
			error : function() {
				alert("실패 ㅜㅜ");
			}
		});
		
		// menu 관련 정보가 있다면 전송
		// push안됨 ㅜㅜ
	});
	
});

// next 클릭 시, step 활성화&비활성화 및 유효성 검사
function showStep(stepId) {
	var stepNum = Number.parseInt(stepId.substring(5));
	var stepNext = "#step" + (stepNum + 1);
	var stepPrev = "#step" + (stepNum - 1);
	
	if (stepNum !== 3 || stepNum !== 1) {
		$(stepPrev).hide();
		$(stepId).show();
		$(stepNext).hide();
	}
	
	// step1 유효성 검사
	if (stepNum === 2) {
		var runtimeCheckbox = [];
		var convCheckbox = $("input[name='restConv']:checked");
		$("input[name='restRuntime']:checked").each(function() {
			runtimeCheckbox.push($(this).val());
		});
		
		if ($("#restName").val() === "") {
			alert("상호명을 입력해주세요.");
			$("#restName").focus();
			$("#step1").show();
			$("#step2").hide();
			return false;
		} else if ($("#restCategory").val() === "none") {
			alert("업종을 선택해주세요.");
			$("#restCategory").focus();
			$("#step1").show();
			$("#step2").hide();
			return false;
		} else if ($("#restAddrPostcode").val() === "") {
			alert("주소를 입력해주세요.");
			$("#restAddrPostcode").focus();
			$("#step1").show();
			$("#step2").hide();
			return false;
		} else if ($("#restAddr1").val() === "") {
			alert("주소를 입력해주세요.");
			$("#restAddr1").focus();
			$("#step1").show();
			$("#step2").hide();
			return false;
		} else if ($("#restTel").val() === "") {
			alert("전화번호를 입력해주세요.");
			$("#restTel").focus();
			$("#step1").show();
			$("#step2").hide();
			return false;
		} else if (runtimeCheckbox.length === 0) {
			alert("영업일을 선택해주세요.");
			$("#step1").show();
			$("#step2").hide();
			return false;
		} else if (convCheckbox.length === 0) {
			alert("편의시설을 하나 이상 선택해주세요.");
			$("#step1").show();
			$("#step2").hide();
			return false;
		}
		
		$.each(runtimeCheckbox, function(idx, el) {
			if ($("#time1" + el).val() === "" || $("#time2" + el).val() === "") {
				alert("영업시간을 선택해주세요.");
				$("#step1").show();
				$("#step2").hide();
				return false;
			}
		});
	}
	
	// step2 경고창
	if (stepNum === 3) {
		if ($("#restDescription").val() === "" || $("#restExterior").val() === "" || $("#restInterior").val() === "") {
			alert("미작성 시 입점 승인이 어려울 수 있으므로, [마이페이지]에서 추가로 수정해주세요.");
		}
	}
}

// step1 우편번호 찾기 API
function kakaoPostcodeAPI() {
	new daum.Postcode({
		oncomplete: function(data) {
			var addr = '';		// 주소 변수
			var extraAddr = '';	// 참고항목 변수	ex) (ㅇㅇ동, ㅇㅇㅇ빌딩)
			
			// 사용자의 선택에 따라 주소 가져오기
			if (data.userSelectedType === 'R') {	// 도로명 주소를 선택
				addr = data.roadAddress;
			} else {								// 지번 주소를 선택
				addr = data.jibunAddress;
			}
			
			// 도로명 타입이 선택된 경우 참고항목 조합
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				
				// 건물명이 있고 공동주택일 경우 추가
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열 생성
				if(extraAddr !== '') {
					extraAddr = ' (' + extraAddr + ')';
				}
				
				// 참고항목을 주소에 추가
				addr += extraAddr;
			}
			
			// 해당 input 태그에 값 추가
			document.getElementById("restAddrPostcode").value = data.zonecode;	// 우편번호 추가
			document.getElementById("restAddr1").value = addr;	// 주소 추가
			
			// 커서 상세주소로 이동
			document.getElementById("restAddr2").focus();
		}			// oncomplete 끝
	}).open();		// daum.Postcode() 끝
}

</script>

</head>
<body>

<div id="step1">

<h1>사업장 정보 (필수)</h1>
	
<div>
	상호명 <br>
	<input type="text" id="restName"> <br>
	
	업종 <br>
	<select id="restCategory">
		<option value="none">업종을 선택해주세요.</option>
		<option value="한식">한식</option>
		<option value="중식">중식</option>
		<option value="양식">양식</option>
		<option value="일식">일식</option>
		<option value="기타">기타</option>
		<option value="디저트">디저트</option>
	</select> <br>
	
	주소 <br>
	<input type="text" id="restAddrPostcode" placeholder="우편번호">
	<input type="button" onclick="kakaoPostcodeAPI();" value="우편번호 찾기"> <br>
	<input type="text" id="restAddr1" placeholder="주소">
	<input type="text" id="restAddr2" placeholder="상세주소"> <br>
	
	대표 전화 <br>
	<input type="text" id="restTel" placeholder="- 를 포함하여 입력하세요."> <br>
	
	<%	
		String[] days = { "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" };
		session.setAttribute("days", days);
	%>
	
	영업시간 <br>
	<c:forEach var="day" items="${days}">
		<input type="checkbox" name="restRuntime" value="${day}"> ${day} 
		<input type="time" id="time1${day}" disabled> ~ <input type="time" id="time2${day}" disabled> <br>
	</c:forEach>
	<input type="checkbox" name="restRuntime" value="기타"> 기타 
	<input type="text" id="time8기타" placeholder="기타 공휴일을 입력하세요." disabled> <br>
	
	편의시설 <br>
	<input type="checkbox" name="restConv" id="chkConWifi" value="와이파이"> 무료 와이파이
	<input type="checkbox" name="restConv" id="chkConToilet" value="화장실분리"> 남/녀 화장실 분리 <br>
	<input type="checkbox" name="restConv" id="chkConNokids" value="노키즈존"> 노키즈존
	<input type="checkbox" name="restConv" id="chkConGroup" value="단체석"> 단체석 <br>
	<input type="checkbox" name="restConv" id="chkConAnimal" value="반려동물"> 반려동물
	<input type="checkbox" name="restConv" id="chkConParking" value="주차"> 주차 <br>
	<input type="checkbox" name="restConv" id="chkConPackup" value="포장"> 포장
</div>

<input type="button" id="btn-next1" class="btn" value="다음" onclick="showStep('#step2');">

</div>		<!-- step1 끝 -->



<div id="step2">

<h1>사업장 정보 (선택)</h1>
<h6>※ 추후 [마이페이지] - [내 가게 정보] 에서 추가 가능합니다.</h6> <br>

<div>
	가게 소개 <br>
	<textarea rows="7" cols="50" id="restDescription" placeholder="가게 소개글을 입력하세요."></textarea> 0/300 <br>
	
	사진 <input type="file" id="restFile" multiple> <br>
</div>

<input type="button" id="btn-prev1" class="btn" value="이전" onclick="showStep('#step1');">
<input type="button" id="btn-next2" class="btn" value="다음" onclick="showStep('#step3');">

</div>		<!-- step2 끝 -->



<div id="step3">

<h1>메뉴 등록 [선택]</h1>
<h6>※ 추후 [마이페이지] - [나의 가게 정보] 에서 추가 가능합니다.</h6> <br>

<div>
	<button type="button" id="btnAddMenu">메뉴 추가</button> <br>
	
	<b>메뉴 1</b> <br>
	이름 <input type="text" id="menuName1" placeholder="메뉴 이름"> <br>
	설명 <input type="text" id="menuDescription1" placeholder="메뉴 설명"> <br>
	가격 <input type="number" id="menuPrice1" min="0" placeholder="메뉴 가격">원 <br>
	사진 <input type="file" id="menuFile1"> <br>
	
	<div id="divAddMenu"></div>
</div>

<input type="button" id="btn-prev2" class="btn" value="이전" onclick="showStep('#step2');">
<input type="button" id="btn-submit" class="btn" value="신청">

</div>		<!-- step2 끝 -->



<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>				<!-- kakao 우편번호 api -->
	
</body>
</html>