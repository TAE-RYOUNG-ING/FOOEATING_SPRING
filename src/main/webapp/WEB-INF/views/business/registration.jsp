<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div id="step1">
		<h1>step 1</h1>
	
		<input type="checkbox" id="chkAll"> 전체 동의하기 <br>
		위치기반서비스 이용약관(선택), 이벤트·혜택 정보 수신(선택) 동의를 포함합니다.
			
		<fieldset>
			<legend>약관</legend>
			[필수] 제1조 블라블라 <br>
			<input type="checkbox" id="chk1"> [필수] FOOEATING 이용약관 <br>
			[선택] 제1조 웅앵웅앵 <br>
			<input type="checkbox" id="chk2"> [선택] 위치기반서비스 이용약관 <br>
			[선택] 제1조 초키포키 <br>
			<input type="checkbox" id="chk3"> [선택] 이벤트·혜택 정보 수신 <br>
		</fieldset>
		
		<input type="button" id="btn-next1" value="다음">
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
			
			영업시간 <br>
			<input type="checkbox" id="chkRun1"> 
			일요일 <input type="time" id="restRuntime11"> ~ <input type="time" id="restRuntime12"> <br>
			<input type="checkbox" id="chkRun2"> 
			월요일 <input type="time" id="restRuntime21"> ~ <input type="time" id="restRuntime22"> <br>
			<input type="checkbox" id="chkRun3"> 
			화요일 <input type="time" id="restRuntime31"> ~ <input type="time" id="restRuntime32"> <br>
			<input type="checkbox" id="chkRun4"> 
			수요일 <input type="time" id="restRuntime41"> ~ <input type="time" id="restRuntime42"> <br>
			<input type="checkbox" id="chkRun5"> 
			목요일 <input type="time" id="restRuntime51"> ~ <input type="time" id="restRuntime52"> <br>
			<input type="checkbox" id="chkRun6"> 
			금요일 <input type="time" id="restRuntime61"> ~ <input type="time" id="restRuntime62"> <br>
			<input type="checkbox" id="chkRun7"> 
			토요일 <input type="time" id="restRuntime71"> ~ <input type="time" id="restRuntime72"> <br>
			<input type="checkbox" id="chkRun8"> 
			기타 <input type="text" id="restRuntime8" placeholder="기타 공휴일을 입력하세요."> <br>
			
			편의시설 <br>
			<input type="checkbox" id="chkConWifi"> 무료 와이파이
			<input type="checkbox" id="chkConToilet"> 남/녀 화장실 분리 <br>
			<input type="checkbox" id="chkConNokids"> 노키즈존
			<input type="checkbox" id="chkConGroup"> 단체석 <br>
			<input type="checkbox" id="chkConAnimal"> 반려동물
			<input type="checkbox" id="chkConParking"> 주차 <br>
			<input type="checkbox" id="chkConPackup"> 포장
		</fieldset>
		
		<input type="button" id="btn-prev1" value="이전">
		<input type="button" id="btn-next2" value="다음">
	</div>
	
	<div id="step3">
		<h1>step 3</h1>
	
		<fieldset>
			<legend>사업장 정보 [필수]</legend>
			가게 소개 <br>
			<textarea rows="7" cols="50" id="restDescription">가게 소개글을 입력하세요.</textarea> 0/300 <br>
			
			외관 <input type="file" id="restExterior"> <br>
			
			내부 <input type="file" id="restInterior"> <br>
			
			기타 <input type="file" id="restInterior"> <br>
		</fieldset>
		
		<input type="button" id="btn-prev2" value="이전">
		<input type="button" id="btn-next3" value="다음">
	</div>
	
	<div id="step4">
		<h1>step 4</h1>
	
		<fieldset>
			<legend>사업장 정보 [선택]</legend>
			메뉴 이름 <br>
			<input type="text" id="menuName1"> <br>
			메뉴 설명 <br>
			<input type="text" id="menuDescription1"> <br>
			메뉴 가격 <br>
			<input type="number" id="menuPrice1" min="0">원 <br>
			메뉴 사진 <br>
			<input type="file" id="menuFile1"> <br>
			
			메뉴 이름 <br>
			<input type="text" id="menuName2"> <br>
			메뉴 설명 <br>
			<input type="text" id="menuDescription2"> <br>
			메뉴 가격 <br>
			<input type="number" id="menuPrice2" min="0">원 <br>
			메뉴 사진 <br>
			<input type="file" id="menuFile2"> <br>
			
			메뉴 이름 <br>
			<input type="text" id="menuName3"> <br>
			메뉴 설명 <br>
			<input type="text" id="menuDescription3"> <br>
			메뉴 가격 <br>
			<input type="number" id="menuPrice3" min="0">원 <br>
			메뉴 사진 <br>
			<input type="file" id="menuFile3"> <br>
		</fieldset>
		
		<input type="button" id="btn-prev3" value="이전">
		<input type="button" id="btn-next4" value="신청">
	</div>
	
</body>
</html>