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
	
	// DB에서 ID값 비교
	$.ajax({
		url :'/user/idOverlap',
		type : 'post',
		data : {"userId" : userId},
		dataType : "json",
		success : function(data){
			// ID 없음 & 추가정보 입력
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
						alert("찐성공 kakaoLogin.jsp line34 수정");
					},
					error: function(){
						alert("join ajax Error / 실패지만 진행한다");						
						location.href = "/main";
					}
				}); // join_ajax
				
			}
			// ID 있음 & 로그인
			else if(data === 0){
				// 세션에 데이터 저장, 메인페이지 이동
				$.ajax({
					url: '/user/getInfoKuser',
					type: 'post',
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