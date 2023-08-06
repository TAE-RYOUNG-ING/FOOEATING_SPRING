package com.foo.controller;
import java.util.HashMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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
	
	
	
	// 2. 카카오 연동 로그인
	@RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
	public ModelAndView kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {

		// 1번
		// 카카오톡에 사용자 코드 받기 (jsp의 a태그 href에 경로 있음)
		logger.debug("@@@@@@@@@@@@@@@ code : " + code);
		
		// 2번
		// 받은 code를 service 메서드로 보내서 accessToken값 출력
		String access_Token = uService.getAccessToken(code);
		logger.debug("@@@@@@@@@@@@@@@ access_Token : " + access_Token);
		
		// 3번
		// 받은 accessToken를 getUserInfo로 보내서 정보를 받아옴
		// userInfo에 이름, 이메일 정보가 저장됨
		HashMap<String, Object> userInfo = uService.getUserInfo(access_Token);
		logger.debug("@@@@@@@@@@@@@@@ 이름 : " + userInfo.get("nickname"));
		logger.debug("@@@@@@@@@@@@@@@ 이메일 : " + userInfo.get("email"));
		
		return null;	
		// 여기서는 코드가 넘어오는지만 확인
	}

	
	
	
	
}
