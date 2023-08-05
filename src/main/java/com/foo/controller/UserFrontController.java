package com.foo.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.foo.domain.BusinessusersVO;
import com.foo.domain.UserVO;
import com.foo.service.BusinessService;
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
	@Autowired
	private BusinessService bService;
	

	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	// 1-1. 회원 가입
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinUserGET() throws Exception {
		
		logger.debug("@@@@@@@@@@@@@@@ joinUserGET_호출");
		
		return "/user/joinUser";
	}

	// 1-2. 회원 가입 - 데이터 처리
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinUserPOST(UserVO vo) throws Exception {
		
		logger.debug("@@@@@@@@@@@@@@@ joinUserPOST_호출");
		
		uService.joinUser(vo);
		logger.debug("@@@@@@@@@@@@@@@ 회원가입 완료");
		
		return "redirect:/user/login";
	}
	
	
	
	// 2-1. 회원 로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginUserGET(UserVO vo, BusinessusersVO bvo) throws Exception {
		
		logger.debug("@@@@@@@@@@@@@@@ loginUserGET_호출");
	}
	
	// 2-2. 회원 로그인 - 데이터 처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginUserPOST(UserVO vo, HttpSession session, HttpServletRequest request) throws Exception {
		
		logger.debug("@@@@@@@@@@@@@@@ loginUserPOST_호출");
		
		UserVO resultVO = uService.loginUser(vo);
		logger.debug(resultVO + "");
		
		// 로그인 성공 - 메인페이지 이동
		if(resultVO != null) {											// users 정보 O
			session.setAttribute("userId", resultVO.getUserId());
			session.setAttribute("userName", resultVO.getUserName());
			logger.debug("@@@@@@@@@@@@@@@ 일반회원 로그인 성공");
			return "redirect:/main";
		}else {															// users 정보 X -> businessusers 확인
			BusinessusersVO bvo = new BusinessusersVO();
			bvo.setBuId(vo.getUserId());
			bvo.setBuPw(vo.getUserPw());
			BusinessusersVO bResultVO = bService.loginBUser(bvo);
			logger.debug(bResultVO + "");
			
			if(bResultVO != null) {										// businessusers 정보 O
				session.setAttribute("buId", bResultVO.getBuId());
				session.setAttribute("buName", bResultVO.getBuName());
				session.setAttribute("buNum", bResultVO.getBuNum());
				logger.debug("@@@@@@@@@@@@@@@ 사업자회원 로그인 성공");
				return "redirect:/main";
			}else {														// users 정보 X && businessusers 정보 X
				logger.debug("@@@@@@@@@@@@@@@ 로그인 실패");
				request.setAttribute("msg", "아이디 또는 비밀번호를 잘못 입력했습니다.");
				request.setAttribute("url", "/user/login");
				return "user/loginError";
			}
		}
	}
	
	
	
	// 3. 회원 로그아웃
	@RequestMapping(value = "/logout",method = RequestMethod.GET)
	public String logoutGET(HttpSession session) {
		logger.debug("@@@@@@@@@@@@@@@ logoutGET_호출");
		
		// 세션정보 초기화
		session.invalidate();
		
		return "redirect:/main";
	}
	

	
	
	
	
	
}
