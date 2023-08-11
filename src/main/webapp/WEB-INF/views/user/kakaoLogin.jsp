<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

$(function(){
	
	let userId = "${vo.userId}";
	let userName = "${vo.userName}";
	let userEmail = "${vo.userEmail}";
	
	alert("userId : " + userId);		// noData
	alert("userName : " + userName);	// 링링
	alert("userEmail : " + userEmail);	// noData
	
	// DB에서 비교
	$.ajax({
		url :'/user/kUserOverlap',
		type : 'post',
		data : {"userName" : userName},
		dataType : "json",
		success : function(data){
			// 신규 유저 & 추가정보 입력
			if(data === 0){ 
				$.ajax({
					url: '/user/kakaoInsertInfo',
					type: 'post',
					data: {
						"userId" : userId,
						"userName" : userName,
						"userEmail" : userEmail
					},
					success: function(){
						location.href = "/user/kakaoInsertInfo";
					},
					error: function(){
						alert("insertInfoKuser ajax Error");
					}
				});
			}
			
			// 기존 유저 & 로그인
			else if(data === 1){
				// 세션에 데이터 저장, 메인페이지 이동
				$.ajax({
					url: '/user/getInfoKuser',
					type: 'get',
					data: {
					"userId" : userId,
					"userName" : userName,
					},
					success: function(){
						location.href="/main";
					},
					error: function(){
						alert("ajax Error");
					}
				}); // getInfoKuser_ajax
			} // else-if
		},
		error : function(){
			alert("idOverlap ajax Error");
		}
	}); // idOverlap_ajax
	
});

</script>
</head>
<body>
</body>
</html>