package com.foo.controller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.foo.service.UserService;



@Controller
@RequestMapping(value = "/user/*")
public class UserFrontController {
	
	// http://localhost:8088/user/list
	
	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(UserFrontController.class);
	
	// 객체 주입 (DI)
	@Autowired
	private UserService uService;
	

	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	// 1. 회원 로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login() {
		
		logger.debug("@@@@@@@@@@@@@@@ login_호출");
		
	}
	
	
	
	
	
	
}
