package com.foo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.foo.domain.BusinessusersVO;
import com.foo.domain.RestaurantsVO;
import com.foo.service.BusinessService;

@RestController
@RequestMapping(value = "/business")
public class BusinessRestController {
	
	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(BusinessRestController.class);
	
	// 의존성 주입
	@Autowired
	private BusinessService bService;
	

	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	// http://localhost:8088/business/join
	// 1. 사업자 회원 가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinBusinessuser(@RequestBody BusinessusersVO buvo) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@@@@@@ joinBusinessuser() 호출");
		logger.debug("buvo : {}", buvo);
		
		// service 추가 해야함!
		
		return "ok";
	}
	
	// 1-1. 이메일 인증
	@RequestMapping(value = "/emailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String emailCheck(@ModelAttribute("email") String email) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@@@@@@ emailCheck() 호출");
		logger.debug("인증번호를 보낼 email : " + email);
		
		String ranStr = bService.writeEmail(email);		// 해당 메일로 전송된 인증 번호 저장
		
		return ranStr;
	}
	
	
	
	// http://localhost:8088/business/registration
	// 2. 입점 신청
	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String registRestaurant(@RequestBody RestaurantsVO revo) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@@@@@@ registRestaurant() 호출");
		logger.debug("revo : {}", revo);
		
		// sevice 추가 해야함!
		
		return "ok";
	}
	
	// http://localhost:8088/business/addMenu
	// 2-1. 메뉴 등록
//	@RequestMapping(value = "/addMenu", method = RequestMethod.POST)
//	public String addRestaurantMenu(@RequestBody RestaurantmenusVO rmvo) throws Exception {
//		logger.debug("@@@@@@@@@@@@@@@@@@@@@ addRestaurantMenu() 호출");
//		logger.debug("rmvo : {}", rmvo);
//		
//		return "ok";
//	}
	
}