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
	

	
	// 1. 회원 가입 - 아이디 중복 체크
	@RequestMapping(value = "/idOverlap", method = RequestMethod.POST)
	public String idOverlapPOST(@RequestParam("userId") String userId) throws Exception {
		
		logger.debug("@@@@@@@@@@@@@@@ idOverlap_호출");
		logger.debug("@@@@@@@@@@@@@@@ userId = " + userId);
		
		String result = uService.idOverlap(userId);
		logger.debug("@@@@@@@@@@@@@@@ 아이디 중복일 경우 '0' : " + result);
		
		return result;
	}
}
