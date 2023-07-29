package com.foo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/business")
public class BusinessFrontController {
	
	private static final Logger logger = LoggerFactory.getLogger(BusinessFrontController.class);
	
	
	
	// http://localhost:8088/business/join
	// 1. 사업자 회원가입
//	@RequestMapping(value = "/join", method = RequestMethod.GET)
//	public String businessUsersJoin(Model model) {
//		logger.debug("@@@@@@@@@@@@@@@@사업자 회원가입 - businessUsersJoin() 실행");
//		
//		return "/business/join";
//	}
	
	
	
	// http://localhost:8088/business/registration
	// 2. 사업자 입점 신청
	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public String businessUsersRegistration(Model model) {
		logger.debug("@@@@@@@@@@@@@@@@사업자 입점 신청 - businessUsersRegistration() 실행");
		
		return "/business/registration";
	}
	
}