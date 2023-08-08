package com.foo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String adminDashboard() throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@관리자 페이지 - adminDashboard() 실행");
		
		return "/admin/dashboard";
	}
	
	
	
	// 2. 관리자 회원 관리
	@RequestMapping(value = "/userGeneral", method = RequestMethod.GET)
	public String adminManagementUser() throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@관리자 페이지 - adminManagementUser() 실행");
		
		return "/admin/userGeneral";
	}
	
}