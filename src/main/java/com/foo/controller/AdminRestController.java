package com.foo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.foo.domain.RestaurantsVO;
import com.foo.service.AdminService;
import com.foo.service.BusinessService;

@RestController
@RequestMapping(value = "/admin")
public class AdminRestController {
	
	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(AdminRestController.class);
	
	// 의존성 주입
//	@Autowired
//	private AdminService aService;
	@Autowired
	private BusinessService bService;
	

	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	// 1. 일반회원 상세보기
	@RequestMapping(value = "/detailU", method = RequestMethod.GET)
	public RestaurantsVO getUserDetailInfo(@ModelAttribute("userId") String userId) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@사업자회원 - getUserDetailInfo() 실행");
		logger.debug("userId : " + userId);
		
		
		
		return null;
	}
	
	
	
	// 2. 사업자회원 상세보기
	@RequestMapping(value = "/detailB", method = RequestMethod.GET)
	public RestaurantsVO getBuserDetailInfo(@ModelAttribute("buNum") String buNum) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@사업자회원 - getBuserDetailInfo() 실행");
		logger.debug("buNum : " + buNum);
		
		RestaurantsVO restInfo = bService.readMyRestaurantInfo(buNum);
		logger.debug("restInfo : {}", restInfo);
		
		return restInfo;
	}
	
}