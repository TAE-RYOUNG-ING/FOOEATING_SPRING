package com.foo.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.foo.domain.BusinessusersVO;
import com.foo.domain.RestaurantsVO;
import com.foo.domain.UserVO;
import com.foo.service.AdminService;

@Controller
@RequestMapping(value = "/admin")
public class AdminFrontController {
	
	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(AdminFrontController.class);
	
	// 의존성 주입
	@Autowired
	private AdminService aService;
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	// http://localhost:8088/admin/dashboard
	// 1. 관리자 대시보드
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String adminDashboard(Model model) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@관리자 페이지 - adminDashboard() 실행");
		
		return "/admin/dashboard";
	}
	
	
	
	// 2. 관리자 일반회원 관리
	@RequestMapping(value = "/userGeneral", method = RequestMethod.GET)
	public String adminManagementUser(Model model) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@관리자 페이지 - adminManagementUser() 실행");
		
		List<UserVO> userList = aService.getUsersList();
		model.addAttribute("userList", userList);
		logger.debug("userList : {}", userList);
		
		return "/admin/userGeneral";
	}
	
	
	
	// 3. 관리자 사업자회원 관리
	@RequestMapping(value = "/userBusiness", method = RequestMethod.GET)
	public String adminManagementBUser(Model model) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@관리자 페이지 - adminManagementBUser() 실행");

		List<BusinessusersVO> buList = aService.getBusinessusersList();
		model.addAttribute("buList", buList);
		
		return "/admin/userBusiness";
	}
	
	
	
	// 4. 관리자 입점 가게 관리
	@RequestMapping(value = "/restaurants/regist", method = RequestMethod.GET)
	public String adminManagementRegist(Model model) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@관리자 페이지 - adminManagementRegist() 실행");

		List<RestaurantsVO> registList = aService.getRegistList();
		model.addAttribute("registList", registList);
		
		return "/admin/restaurants/regist";
	}
	
	
	
	// 5. 관리자 입점 대기 가게 관리
	@RequestMapping(value = "/restaurants/nonregist", method = RequestMethod.GET)
	public String adminManagementNonregist(Model model) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@관리자 페이지 - adminManagementNonregist() 실행");

		List<RestaurantsVO> nonregistList = aService.getNonregistList();
		model.addAttribute("nonregistList", nonregistList);
		
		return "/admin/restaurants/nonregist";
	}
	
	
	
	// 6. 관리자 블랙리스트 가게 관리
	@RequestMapping(value = "/restaurants/blacklist", method = RequestMethod.GET)
	public String adminManagementBlacklistRest(Model model) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@관리자 페이지 - adminManagementBlacklistRest() 실행");

		List<RestaurantsVO> blackList = aService.getBlackList();
		model.addAttribute("blackList", blackList);
		
		return "/admin/restaurants/blacklist";
	}
	
}