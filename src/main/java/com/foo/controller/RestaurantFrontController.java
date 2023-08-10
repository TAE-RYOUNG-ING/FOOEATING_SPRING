package com.foo.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.foo.domain.RestaurantsVO;
import com.foo.service.RestaurantService;

@Controller
@RequestMapping(value = "/restaurant")
public class RestaurantFrontController {
	
	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(RestaurantRestController.class);
	
	// 의존성 주입
	@Autowired
	private RestaurantService rService;
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	// http://localhost:8088/restaurant/list
	// 1. 입점 가게 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getRestaurantList(Model model) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@ getRestaurantList() 실행");
		
		List<RestaurantsVO> restList = rService.getRestaurantList();
		model.addAttribute("restList", restList);
		
		return "/restaurant/list";
	}
	
}