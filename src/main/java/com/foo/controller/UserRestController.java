package com.foo.controller;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.foo.domain.UserVO;
import com.foo.service.BusinessService;
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
	
	

	// 3. 카카오 유저 정보 비교
	@RequestMapping(value = "/kUserOverlap", method = RequestMethod.POST)
	public String kUserOverlapPOST(@RequestParam("userName") String userName) throws Exception {
		
		logger.debug("@@@@@@@@@@@@@@@ kUserOverlapPOST_호출");
		
		String result = uService.kUserOverlap(userName);
		
		return result;
	}

	
	
	// 4-1. 이메일 인증 코드 생성 및 전송
	@RequestMapping(value = "/emailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String emailCheck(@ModelAttribute("email") String email) throws Exception {
		
		logger.debug("@@@@@@@@@@@@@@@@@@@@@ emailCheck_호출");
		
		// 해당 메일로 전송된 인증 번호 저장
		String ranStr = uService.writeEmail(email);		
		logger.debug("인증번호를 보낼 email : " + email + " / 생성된 인증코드 : " + ranStr);
		
		return ranStr;
	}
	
	// 4-2. 이메일 인증 ID & PW 정보
	@RequestMapping(value = "/noticeInfo", method = RequestMethod.POST)
	public String noticeInfoPOST(@RequestParam("userEmail") String userEmail,
							   @RequestParam("checkData") String checkData) throws Exception {
		
		logger.debug("@@@@@@@@@@@@@@@@@@@@@ noticeInfoPOST_호출");
		logger.debug("@@@@@@@@@@@@@@@@@@@@@ userEmail : " + userEmail);
		logger.debug("@@@@@@@@@@@@@@@@@@@@@ checkData : " + checkData);
		
		// ID정보인지 PW정보인지 구분해서 알려주기
		String data = "";
		UserVO vo = new UserVO();
		vo = uService.searchIDPW(userEmail);
		
		if(checkData.equals("ID")) {
			data = vo.getUserId();
		}
		else if(checkData.equals("PW")) {
			// 비밀번호 약갼의 암호화
			String userPw = vo.getUserPw().substring(0, 3) + "**" + vo.getUserPw().substring(5);
			logger.debug("@@@@@@@@@@@@@@@@@@@@@ userPw : " + userPw);
			data = userPw;
		}
		
		return data;
		
	}
	
	
	
	
	
	
	
	
	
}
