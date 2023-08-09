package com.foo.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class MainFrontController {

	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(MainFrontController.class);
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	// 1. 메인 페이지
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(HttpServletRequest request, Model model) throws Exception {
		
		logger.debug("@@@@@@@@@@@@@@@ main_호출");
		
		// 세션에서 ID값 가져오기
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		
		// model에 ID값 저장
		model.addAttribute("userId", userId);
		model.addAttribute("userName", userName);
		return "main/main";
	}



}
