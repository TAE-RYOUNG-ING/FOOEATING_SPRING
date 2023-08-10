<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

.center {
	text-align: center;
}

.btn {
	text-align: right;
}

.btnstyle {
	width: 100px;
	height: 30px;
}

.sidebar {
	width: 25%;
	float: left;
}

.main {
	width: 75%;
	float: right;
}

.tabs { 
 	display: flex;
 	justify-content: left;
 	width: 100%;
 	background-color: #fff;
 	margin-bottom: 30px;
}

.tabs>* {
	margin: 0;
	padding: 0;
	list-style-type: none;
	box-sizing: border-box;
}

.tab-nav {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 20px;
}

.tab {
	position: relative;
	padding: 10px 15px;
}

.tab::after {
	content: "";
	position: absolute;
	bottom: 0;
	left: 0;
	width: 0;
	height: 2px;
}

</style>

</head>
<body>



<!-- 헤더 -->
<div class="center">
	<a href="/main">
		<img src="${pageContext.request.contextPath}/resources/img/logo.png" width="200px" height="200px">
	</a>
	<h1>FOOEATING_Admin</h1>
</div>
<!-- 헤더 -->


<!-- 검색 -->
<div class="tabs">
	<div class="tab-nav">
		<div class="tab">업종
			<select id="category">
				<option value="none">업종을 선택해주세요.</option>
				<option value="한식">한식</option>
				<option value="중식">중식</option>
				<option value="양식">양식</option>
				<option value="일식">일식</option>
				<option value="기타">기타</option>
				<option value="디저트">디저트</option>
			</select>
		</div>
		<div class="tab">
			도시
			<select id="city">
				<option value="none">도시를 선택해주세요.</option>
				<option value="서울">서울특별시</option>
				<option value="인천">인천광역시</option>
				<option value="부산">부산광역시</option>
				<option value="대전">대전광역시</option>
				<option value="대구">대구광역시</option>
				<option value="울산">울산광역시</option>
				<option value="광주">광주광역시</option>
				<option value="제주">제주특별자치도</option>
				<option value="세종">세종특별자치시</option>
				<option value="경기">경기도</option>
				<option value="강원">강원도</option>
				<option value="경북">경상북도</option>
				<option value="경남">경상남도</option>
				<option value="전북">전라북도</option>
				<option value="전남">전라남도</option>
				<option value="충북">충청북도</option>
				<option value="충남">충청남도</option>
			</select>
			지역
			<select id="city">
				<option value="none">지역을 선택해주세요.</option>
			</select>
		</div>
		<div class="tab"> 
			<input type="text" name="search" placeholder="상호명 또는 메뉴를 입력하세요.">
		</div>
	</div>
</div>
<!-- 검색 -->



${restList}



</body>
</html>