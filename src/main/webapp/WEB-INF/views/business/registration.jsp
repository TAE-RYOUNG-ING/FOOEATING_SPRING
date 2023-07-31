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
	
	// 작성 정보를 저장할 객체
	var registInfo = {};
	
	
	
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
		registInfo.restName = $("#restName").val();		// 상호명
		registInfo.restCategory = $("#restCategory").val();		// 업종
		registInfo.restAddr = $("#restAddrPostcode").val() + " " + $("#restAddr1").val() + " " + $("#restAddr2").val();	// 주소
		registInfo.restTel = $("#restTel").val();	// 전화번호
		registInfo.restRuntime = "";	// 영업시간
		
		var runtime = [ "일요일 휴무", "월요일 휴무", "화요일 휴무", "수요일 휴무", "목요일 휴무", "금요일 휴무", "토요일 휴무" ];
		if ($("#time8기타").val() !== false) { runtime.push($("#time8기타").val()); }
		$.each(runtime, function(idx, el) {
			$("input[name='restRuntime']:checked").each(function() {
				dayValue = $(this).val();
				
				if (el.includes(dayValue)) {
					runtime[idx] = dayValue + " " + document.getElementById("time1" + dayValue).value + " ~ " + document.getElementById("time2" + dayValue).value;
				}
			});
			registInfo.restRuntime += (idx !== runtime.length - 1 ? runtime[idx] + ", " : runtime[idx]);		// 영업시간 상세
		});
		console.log($("#time8" + dayValue).val());
		console.log(runtime);
		
		var conv = "";
		$('input[name="restConv"]:checked').each(function() {
			conv += this.value + " ";
		});
		registInfo.restConvenience = conv;		// 편의시설
		
		console.log(registInfo);
	});
	
	
	
	// --------------------- step2 ----------------------------
	
	// next 클릭 시 객체 정보 저장
	$("#btn-next2").click(function() {
		
	});
	
	
	
	// --------------------- step3 ----------------------------addMenu
	
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
<h6>※ 미작성 시, 입점 승인이 어려울 수 있습니다.</h6> <br>

<div>
	가게 소개 <br>
	<textarea rows="7" cols="50" id="restDescription" placeholder="가게 소개글을 입력하세요."></textarea> 0/300 <br>
	
	외관 <input type="file" id="restExterior"> <br>
	내부 <input type="file" id="restInterior"> <br>
	기타 <input type="file" id="restInterior"> <br>
</div>

<input type="button" id="btn-prev1" class="btn" value="이전" onclick="showStep('#step1');">
<input type="button" id="btn-next2" class="btn" value="다음" onclick="showStep('#step3');">

</div>		<!-- step2 끝 -->

<div id="step3">

<h1>메뉴 등록 [선택]</h1>
<h6>※ 최대 3개 입력 가능합니다.</h6> <br>

<div>
	이름 <input type="text" id="menuName1"> <br>
	설명 <input type="text" id="menuDescription1"> <br>
	가격 <input type="number" id="menuPrice1" min="0">원 <br>
	사진 <input type="file" id="menuFile1"> <br>
	
	<button type="button" id="addMenu">추가</button>
</div>

<input type="button" id="btn-prev2" class="btn" value="이전" onclick="showStep('#step2');">
<input type="button" id="btn-next3" class="btn" value="신청">

</div>		<!-- step2 끝 -->

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>				<!-- kakao 우편번호 api -->
	
</body>
</html>