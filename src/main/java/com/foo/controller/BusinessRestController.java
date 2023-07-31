package com.foo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.foo.domain.RestaurantsVO;

@RestController
@RequestMapping(value = "/business")
public class BusinessRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(BusinessRestController.class);
	

	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	// http://localhost:8088/business/join
	// 1. 사업자 회원가입
//	@RequestMapping(value = "/join", method = RequestMethod.GET)
//	public String join() {
//		logger.debug("@@@@@@@@@@@@@@@@@@@@@");
//		return "사업자 회원가입";
//	}
	
	
	
	// http://localhost:8088/business/registration
	// 2. 사업자 입점 신청
	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String registRestaurant(@RequestBody RestaurantsVO revo) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@@@@@@ registRestaurant() 호출");
		logger.debug("revo : {}", revo);
		
		// sevice 추가 해야함!
		
		return "ok";
	}
	
	
	
	// http://localhost:8088/business/addMenu
	// 3. 메뉴 등록
//	@RequestMapping(value = "/addMenu", method = RequestMethod.POST)
//	public String addRestaurantMenu(@RequestBody RestaurantmenusVO rmvo) throws Exception {
//		logger.debug("@@@@@@@@@@@@@@@@@@@@@ addRestaurantMenu() 호출");
//		logger.debug("rmvo : {}", rmvo);
//		
//		return "ok";
//	}
	
}