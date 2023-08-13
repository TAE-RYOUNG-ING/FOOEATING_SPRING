package com.foo.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.foo.domain.RestaurantsVO;

@RestController
@RequestMapping(value = "/restaurant")
public class RestaurantRestController {
	
	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(RestaurantRestController.class);
	
	// 의존성 주입
	

	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	// 1. 가게 검색
	@RequestMapping(value = "/search", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
	public List<RestaurantsVO> searchRestList(@ModelAttribute("category") String category, @ModelAttribute("city") String city, 
			@ModelAttribute("query") String query) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@ 가게 검색 - searchRestList() 실행");
		logger.debug("category : " + category + " / city : " + city + " / query : " + query);
		
		return null;
	}
	
}