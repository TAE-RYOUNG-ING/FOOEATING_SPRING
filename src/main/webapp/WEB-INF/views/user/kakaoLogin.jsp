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
	
	// DB 비교해서 ID 있으면 로그인, 없으면 회원가입 후 로그인
	$.ajax({
		url :'/user/idOverlap',
		type : 'post',
		data : {"userId" : userId},
		dataType : "json",
		success : function(data){
			// ID 없음
			if(data === 1){ 
				$.ajax({
					url: '/user/join',
					type: 'post',
					data: {
						"userId" : userId,
						"userName" : userName,
						"userEmail" : userEmail
					},
					success: function(){
						alert("찐성공 kakaoLogin.jsp line34 고치세용");
					},
					error: function(){
						alert("join ajax Error / 실패지만 진행한다");
						// 세션에 데이터 저장, 메인페이지 이동
						sessionStorage.setItem("userId", userId);
						sessionStorage.setItem("userName", userName);
						sessionStorage.setItem("userEmail", userEmail);
						location.href = "/main";
					}
				}); // join_ajax
				
			}
			// ID 있음
			else if(data === 0){
				// 세션에 데이터 저장, 메인페이지 이동
				sessionStorage.setItem("userId", userId);
				sessionStorage.setItem("userName", userName);
				sessionStorage.setItem("userEmail", userEmail);
				location.href = "/main";
			}
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