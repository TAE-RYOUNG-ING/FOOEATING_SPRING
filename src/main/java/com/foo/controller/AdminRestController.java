package com.foo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.foo.service.AdminService;

@RestController
@RequestMapping(value = "/admin")
public class AdminRestController {
	
	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(AdminRestController.class);
	
	// 의존성 주입
	@Autowired
	private AdminService aService;
	

	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	//
	
}