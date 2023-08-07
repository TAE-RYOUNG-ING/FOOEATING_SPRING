package com.foo.controller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.foo.service.UserService;



@RestController
@RequestMapping(value = "/user/*")
public class UserRestController {

	
	
	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(UserFrontController.class);
	
	// 객체 주입 (DI)
	@Autowired
	private UserService uService;
	

	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	

	
	// 1-1. 회원 가입 - 아이디 중복 체크
	@RequestMapping(value = "/idOverlap", method = RequestMethod.POST)
	public String idOverlapPOST(@RequestParam("userId") String userId) throws Exception {
		
		logger.debug("@@@@@@@@@@@@@@@ idOverlapPOST_호출");
		
		String result = uService.idOverlap(userId);
		
		return result;
	}
	
	// 1-2. 회원 가입 - 이메일 중복 체크
	@RequestMapping(value = "/emailOverlap", method = RequestMethod.POST)
	public String emailOverlapPOST(@RequestParam("userEmail") String userEmail) throws Exception {
		
		logger.debug("@@@@@@@@@@@@@@@ emailOverlapPOST_호출");
		
		String result = uService.emailOverlap(userEmail);
		
		return result;
	}
	
	// 1-3. 회원 가입 - 전화번호 중복 체크
	@RequestMapping(value = "/telOverlap", method = RequestMethod.POST)
	public String telOverlapPOST(@RequestParam("userTel") String userTel) throws Exception {
		
		logger.debug("@@@@@@@@@@@@@@@ telOverlapPOST_호출");
		
		String result = uService.telOverlap(userTel);
		
		return result;
	}

	
	

	
	
	
	
}
