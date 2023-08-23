package com.foo.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	public String getRestaurantList(Model model, @ModelAttribute("category") String category, @ModelAttribute("sido") String sido, 
			@ModelAttribute("sigungu") String sigungu, @ModelAttribute("query") String query) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@ getRestaurantList() 실행");
		logger.debug("category : " + category + " / sido : " + sido + " / sigungu : " + sigungu + " / query : " + query);
		
		List<RestaurantsVO> restList = null;
		
		// 검색 키워드가 하나라도 있을 경우
		if (category != null || sido != null || sigungu != null || query != null) {
			logger.debug("category : " + category + " / sido : " + sido + " / sigungu : " + sigungu + " / query : " + query);
			
			String city = sido + (sigungu != null ? " " + sigungu : "");
			restList = rService.getRestaurantList(category, city, query);
		}
		
		// 검색어 없을 경우
		else {
			logger.debug("all restaurant list");
			restList = rService.getRestaurantList();
		}
		
		model.addAttribute("restList", restList);
		
		return "/restaurant/list";
	}
	
	
	
	// http://localhost:8088/restaurant/information
	// 2. 가게 상세 페이지
	@RequestMapping(value = "/information", method = RequestMethod.GET)
	public String getRestaurantInfo(Model model, @ModelAttribute("rest") String rest) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@ getRestaurantInfo() 실행");
		logger.debug(rest + " : 상세 페이지");
		
		if (rest == null || rest == "") {
			return "redirect:/restaurant/list";
		}
		
		RestaurantsVO restInfo = rService.getRestaurantInfo(rest);
		model.addAttribute("restInfo", restInfo);
		
		return "/restaurant/information";
	}
	
}