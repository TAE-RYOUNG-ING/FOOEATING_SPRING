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
	

	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	// http://localhost:8088/business/join
	// 1. 사업자 회원 가입
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String businessusersJoin(Model model) {
		logger.debug("@@@@@@@@@@@@@@@@사업자 회원가입 - businessusersJoin() 실행");
		
		return "/business/join";
	}
	
	
	
	// http://localhost:8088/business/registration
	// 2. 입점 신청
	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public String businessusersRegistration(Model model) {
		logger.debug("@@@@@@@@@@@@@@@@사업자 입점 신청 - businessusersRegistration() 실행");
		
		return "/business/registration";
	}
	
	
	
	// http://localhost:8088/business/mypage/dashboard
	// 3. 사업자 회원 마이 페이지
	// 3-1. 대시보드
	@RequestMapping(value = "/mypage/dashboard", method = RequestMethod.GET)
	public String businessusersDash(Model model) {
		logger.debug("@@@@@@@@@@@@@@@@사업자 마이페이지 대시보드 - businessusersDash() 실행");
		
		return "/business/mypage/dashboard";
	}
	
	// http://localhost:8088/business/mypage/restInfo
	// 3-2. 나의 가게 정보
	@RequestMapping(value = "/mypage/restInfo", method = RequestMethod.GET)
	public String businessusersRestInfo(Model model) {
		logger.debug("@@@@@@@@@@@@@@@@사업자 마이페이지 나의 가게 정보 - businessusersRestInfo() 실행");
		
		return "/business/mypage/restInfo";
	}
	
}