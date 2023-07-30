<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	// 각 step 숨기기
	$("#step1").show();
	$("#step2").hide();
	$("#step3").hide();
	$("#step4").hide();
	
	// 작성 정보를 저장할 객체
	var registInfo = {};
	
	
	
	// --------------------- step1 ----------------------------
	
	// 약관 전체 동의
	$("#chkTermsAll").click(function() {
		var isChecked = $(this).prop('checked');
		$("[id^=chkTerms]").prop('checked', isChecked);
	});
	
	// 약관 체크 개수에 따른 chkTermsAll 상태 조절
	$("[id^=chkTerms]").click(function() {
		var allChecked = $("[id^=chkTerms]").length === $("[id^=chkTerms]:checked").length;
		$("#chkTermsAll").prop('checked', allChecked);
	});
	
	
	
	// --------------------- step2 ----------------------------
	
	// next 클릭 시
	$("#btn-next2").click(function() {
		// 작성된 데이터 객체에 저장
		registInfo.restName = $("#restName").val();		// 상호명
		registInfo.restCategory = $("#restCategory").val();		// 업종
		registInfo.restAddr = $("#restAddr_postcode").val() + " " + $("#restAddr1").val() + " " + $("#restAddr2").val();	// 주소
		registInfo.restTel = $("#restTel").val();	// 전화번호
		
		
		var runtime = { 1 : "휴무", 2 : "휴무", 3 : "휴무", 4 : "휴무", 5 : "휴무", 6 : "휴무", 7 : "휴무" };
		var daysArr = [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ];
		var dayRuntime = "";
		for (var i = 1; i <= 7; i++) {
			if (document.getElementById("time" + i + "1").value !== "" && document.getElementById("time" + i + "2").value !== "") {
				runtime[i] = document.getElementById("time" + i + "1").value + "~" + document.getElementById("time" + i + "2").value
			}
			dayRuntime += daysArr[i - 1] + " " + runtime[i] + " ";
		}
		if ($("#time8").val()) { dayRuntime += "기타 " + $("#time8").val(); }
		registInfo.restRuntime = dayRuntime;	// 영업시간
		
		
		var conv = "";
		$('input[name="restConv"]:checked').each(function() {
			conv += this.value + " ";
		});
		registInfo.restConvenience = conv;		// 편의시설
	});
	
	
	
	// --------------------- step3 ----------------------------
	
	// next 클릭 시
	$("#btn-next4").click(function() {
		
	});
	
	
	
	// --------------------- step4 ----------------------------addMenu
	
});
	
function showStep(stepId) {
	var stepNum = Number.parseInt(stepId.substring(5));
	var stepNext = "#step" + (stepNum + 1);
	var stepPrev = "#step" + (stepNum - 1);
	
	if (stepNum !== 4 || stepNum !== 1) {
		$(stepPrev).hide();
		$(stepId).show();
		$(stepNext).hide();
	}
	
	// step1의 필수 약관 동의하지 않을 경우 alert창
	if (!$("#chkTerms1").prop('checked')) {
		alert("필수 약관에 동의해야합니다.");
		$("#chkTerms1").focus();
		$("#step1").show();
		$("#step2").hide();
	}
}

</script>

</head>
<body>
	
	<div id="step1">
		<h1>step 1</h1>
	
		<input type="checkbox" name="terms" id="chkTermsAll"> 전체 동의하기 (<small>위치기반서비스 이용약관(선택), 이벤트·혜택 정보 수신(선택) 동의를 포함합니다.</small>)
			
		<fieldset>
			<legend>약관</legend>
			<textarea rows="7" cols="100" readonly>
	제 1조 (목적)
	
	본 이용약관은 FOOEATING 사이트(이하 "서비스")의 이용조건 및 절차에 관한 사항을 규정함을 목적으로 합니다.
	
	제 2조 (약관의 효력과 변경)
	
	이용자는 본 약관에 동의함으로써 서비스를 이용할 수 있습니다.
	회사는 필요한 경우 약관을 변경할 수 있으며, 변경된 약관은 서비스 내 공지사항 등을 통해 공지됩니다.
	
	제 3조 (서비스 이용)
	
	서비스 이용을 위해서는 사업자 등록 및 별도의 승인 절차가 필요할 수 있습니다.
	이용자는 본인의 책임 하에 서비스를 이용해야 하며, 타인에게 서비스 이용을 제공할 수 없습니다.
	
	제 4조 (계정 관리)
	
	이용자는 서비스 이용을 위해 개인 계정을 생성해야 합니다.
	계정의 관리 및 비밀번호 보호는 이용자 본인의 책임입니다.
	
	제 5조 (서비스의 제공 및 중지)
	
	회사는 정상적인 서비스 제공을 위해 최선을 다합니다.
	서비스 운영에 필요한 사유가 발생할 경우, 사전 공지 후 서비스를 일시적으로 중지할 수 있습니다.
	
	제 6조 (책임과 면책)
	
	회사는 무료로 제공되는 서비스에 대해서는 어떠한 책임도 지지 않습니다.
	이용자의 귀책사유로 인한 서비스 이용상의 손해에 대해 회사는 책임지지 않습니다.
			</textarea> <br>
			<input type="checkbox" name="terms" id="chkTerms1"> [필수] FOOEATING 이용약관 <br><br>
			<textarea rows="7" cols="100" readonly>
	제 1조 (목적)
	
	본 약관은 FOOEATING 사이트에서 제공되는 위치기반서비스의 이용조건 및 절차에 관한 사항을 규정합니다.
	
	제 2조 (서비스 내용)
	
	위치기반서비스는 사용자의 현재 위치를 기반으로 한 정보를 제공합니다.
	위치기반서비스 제공을 위해서는 사용자의 위치 정보 수집에 대한 동의가 필요합니다.
	
	제 3조 (개인 위치 정보 보호)
	
	회사는 사용자의 위치 정보를 철저히 보호하며, 무단으로 제3자에게 제공하지 않습니다.
	위치기반서비스 이용을 원치 않는 사용자는 언제든지 위치 정보 수집을 거부할 수 있습니다.
			</textarea> <br>
			<input type="checkbox" name="terms" id="chkTerms2"> [선택] 위치기반서비스 이용약관 <br><br>
			<textarea rows="7" cols="100" readonly>
	제 1조 (목적)
	
	본 약관은 FOOEATING 사이트에서 제공되는 이벤트·혜택 정보 수신에 관한 사항을 규정합니다.
	
	제 2조 (정보 수신 동의)
	
	사업자는 이벤트 및 혜택 정보를 수신할지 여부를 결정할 수 있습니다.
	이벤트·혜택 정보 수신에 동의한 사업자는 해당 정보를 받아볼 수 있습니다.
	
	제 3조 (정보 수신 거부)
	
	정보 수신에 동의한 사업자라도 언제든지 정보 수신을 거부할 수 있습니다.
	거부 시, 추가적인 정보 수신은 이루어지지 않습니다.
			</textarea> <br>
			<input type="checkbox" name="terms" id="chkTerms3"> [선택] 이벤트·혜택 정보 수신 <br>
		</fieldset>
		
		<input type="button" id="btn-next1" value="다음" onclick="showStep('#step2');">
	</div>
	
	<div id="step2">
		<h1>step 2</h1>
			
		<fieldset>
			<legend>사업장 정보 [필수]</legend>
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
			<input type="text" id="restAddr_postcode" placeholder="우편번호">
			<input type="button" onclick="" value="우편번호 찾기"> <br>
			<input type="text" id="restAddr1" placeholder="주소">
			<input type="text" id="restAddr2" placeholder="상세주소"> <br>
			
			대표 전화 <br>
			<input type="text" id="restTel" placeholder="- 를 포함하여 입력하세요."> <br>
			
			<%	
				String[] days = { "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" };
				session.setAttribute("days", days);
			%>
			
			영업시간 <br>
			<c:forEach var="day" items="${days}" varStatus="no">
				<input type="checkbox" name="restRuntime" value="${day}"> ${day} 
				<input type="time" id="time${no.count}1"> ~ <input type="time" id="time${no.count}2"> <br>
			</c:forEach>
			<input type="checkbox" name="restRuntime" id="chkRun8" value="기타"> 기타 
			<input type="text" name="restRuntime" id="time8" placeholder="기타 공휴일을 입력하세요."> <br>
			
			편의시설 <br>
			<input type="checkbox" name="restConv" id="chkConWifi" value="와이파이"> 무료 와이파이
			<input type="checkbox" name="restConv" id="chkConToilet" value="화장실분리"> 남/녀 화장실 분리 <br>
			<input type="checkbox" name="restConv" id="chkConNokids" value="노키즈존"> 노키즈존
			<input type="checkbox" name="restConv" id="chkConGroup" value="단체석"> 단체석 <br>
			<input type="checkbox" name="restConv" id="chkConAnimal" value="반려동물"> 반려동물
			<input type="checkbox" name="restConv" id="chkConParking" value="주차"> 주차 <br>
			<input type="checkbox" name="restConv" id="chkConPackup" value="포장"> 포장
		</fieldset>
		
		<input type="button" id="btn-prev1" value="이전" onclick="showStep('#step1');">
		<input type="button" id="btn-next2" value="다음" onclick="showStep('#step3');">
	</div>
	
	<div id="step3">
		<h1>step 3</h1>
	
		<fieldset>
			<legend>사업장 정보 [선택]</legend>
			<small>※ 미작성 시, 입점 승인이 어려울 수 있습니다.</small> <br>
			
			가게 소개 <br>
			<textarea rows="7" cols="50" id="restDescription" placeholder="가게 소개글을 입력하세요."></textarea> 0/300 <br>
			
			외관 <input type="file" id="restExterior"> <br>
			
			내부 <input type="file" id="restInterior"> <br>
			
			기타 <input type="file" id="restInterior"> <br>
		</fieldset>
		
		<input type="button" id="btn-prev2" value="이전" onclick="showStep('#step2');">
		<input type="button" id="btn-next3" value="다음" onclick="showStep('#step4');">
	</div>
	
	<div id="step4">
		<h1>step 4</h1>
	
		<fieldset>
			<legend>메뉴 등록 [선택]</legend>
			<small>※ 최대 3개 입력 가능합니다.</small> <br>
			
			이름 <input type="text" id="menuName1"> <br>
			설명 <input type="text" id="menuDescription1"> <br>
			가격 <input type="number" id="menuPrice1" min="0">원 <br>
			사진 <input type="file" id="menuFile1"> <br>
			
			<button type="button" id="addMenu">추가</button>
		</fieldset>
		
		<input type="button" id="btn-prev3" value="이전" onclick="showStep('#step3');">
		<input type="button" id="btn-next4" value="신청">
	</div>
	
</body>
</html>