package com.foo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/business")
public class BusinessRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(BusinessRestController.class);
	

	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	// http://localhost:8088/business/join
	// 1. 사업자 회원가입
//	@RequestMapping(value = "", method = RequestMethod.GET)
//	public String join() {
//		logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//		return "사업자 회원가입";
//	}
	
}