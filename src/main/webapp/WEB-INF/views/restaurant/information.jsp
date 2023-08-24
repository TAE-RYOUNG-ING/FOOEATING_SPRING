<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

td {
	box-sizing: border-box;
	padding-right: 20px;
	padding-bottom: 20px;
}

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
	box-sizing: border-box;
}

.main {
	width: 75%;
	float: right;
	box-sizing: border-box;
}

.space {
	text-align: right;
}

</style>



<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
</script>

</head>
<body>



<!-- 헤더 -->
<div class="center">
	<a href="/main">
		<img src="${pageContext.request.contextPath}/resources/img/logo.png" width="200px" height="200px">
	</a>
	<h1>FOOEATING_Restaurant_Info</h1>
</div>
<!-- 헤더 -->



<!-- 상단 : 가게 이름, 별점, 찜 -->
<div>
	<h2>${restInfo.restName}</h2>
	<div>
		<div>별점 ⭐⭐⭐⭐⭐</div>
		<div>좋아요 ♥️</div>
	</div>
</div>
<!-- 상단 -->

<hr>

<!-- 중단 : 가게 정보, 메뉴/리뷰/공지사항 탭 -->
<div>
	<div>
		<div>${restInfo.restCategory}</div>
		<div>${restInfo.restAddr}</div>
		<div>${restInfo.restTel}</div>
		<div>${restInfo.restRuntime}</div>
	</div>
	
	<div>
		<ul>
			<li>MENU</li>
			<li>REVIEW</li>
			<li>NOTICE</li>
		</ul>
	</div>
</div>
<!-- 중단 -->

<hr>

<!-- 하단 : 지도 -->
<div>
	<div id="map" style="width:100%; height:300px;"></div>
</div>
<!-- 하단 -->



<!-- 카카오맵 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=02702b58782cdab139188ebec921d82e&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">

var mapContainer = document.getElementById('map'),
	mapOption = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3
	};

var map = new kakao.maps.Map(mapContainer, mapOption);

let addr = "${fn:split(restInfo.restAddr, '/')[1]}";

var geocoder = new kakao.maps.services.Geocoder();

geocoder.addressSearch(addr, function(result, status) {
	if (status === kakao.maps.services.Status.OK) {
		var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		var marker = new kakao.maps.Marker({
			map: map,
			position: coords
		});
		
		mapOpiton.center = coords;
	}
});

</script>



</body>
</html>