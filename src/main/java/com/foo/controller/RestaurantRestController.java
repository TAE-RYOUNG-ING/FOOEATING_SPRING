package com.foo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/restaurant")
public class RestaurantRestController {
	
	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(RestaurantRestController.class);
	
	// 의존성 주입
	

	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	// http://localhost:8088/restaurant/information/{}
	// 1. 특정 가게 상세 페이지
	@RequestMapping(value = "/information/{rest}", method = RequestMethod.GET)
	public String getRestaurantInfo(@PathVariable("rest") String rest) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@ getRestaurantInfo() 실행");
		
		return "";
	}
	
}