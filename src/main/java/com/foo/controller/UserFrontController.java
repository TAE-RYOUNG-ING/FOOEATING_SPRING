package com.foo.controller;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.foo.domain.BusinessusersVO;
import com.foo.domain.UserVO;
import com.foo.service.BusinessService;
import com.foo.service.UserService;



@Controller
@RequestMapping(value = "/user/*")
public class UserFrontController {
	
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
	public void joinUserPOST(UserVO vo) throws Exception {
		
		logger.debug("@@@@@@@@@@@@@@@ joinUserPOST_호출");
		
		uService.joinUser(vo);
		logger.debug("@@@@@@@@@@@@@@@ 회원가입 완료");
		
		// 회원 상태 저장
		bService.insertUserstatus(vo.getUserId(), null);
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
	
	
	
	// 3-1. 카카오 간편 로그인 및 회원가입
	@RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
	public void kakaoLogin(@RequestParam(value = "code", required = false) String code, 
							               HttpServletRequest request) throws Exception {
		// 1번
		// 카카오톡에 사용자 코드 받기 (jsp의 a태그 href에 경로 있음)
		logger.debug("@@@@@@@@@@@@@@@ code : " + code);
		
		// 2번
		// 받은 code를 service 메서드로 보내서 accessToken값 출력
		String access_Token = uService.getAccessToken(code);
		logger.debug("@@@@@@@@@@@@@@@ access_Token : " + access_Token);
		
		// 3번
		// 받은 accessToken를 getUserInfo로 보내서 정보를 받아옴
		// userInfo에 이름, 이메일 정보가 저장됨
		HashMap<String, Object> userInfo = uService.getUserInfo(access_Token);
		
		UserVO vo = new UserVO();
		vo.setUserId((String)userInfo.get("email"));
		vo.setUserName((String)userInfo.get("nickname"));
		vo.setUserEmail((String)userInfo.get("email"));
		
		logger.debug("@@@@@@@@@@@@@@@ 아이디 : " + vo.getUserId());
		logger.debug("@@@@@@@@@@@@@@@ 이름 : " + vo.getUserName());
		logger.debug("@@@@@@@@@@@@@@@ 이메일 : " + vo.getUserEmail());
		
		request.setAttribute("vo", vo);
	}
	
	// 3-2. 카카오 로그인 회원 정보 저장
	@RequestMapping(value = "/getInfoKuser",method = RequestMethod.POST)
	public String getInfoKuser(@RequestParam("userId") String userId, 
						     @RequestParam("userName") String userName,
						     HttpSession session) {
		
		logger.debug("@@@@@@@@@@@@@@@ getInfoKuser_호출");
		
		session.setAttribute("userId", userId);
		session.setAttribute("userName", userName);
		
		return "redirect:/main";
	}
	
	
	
	// 4. 아이디 & 비밀번호 찾기
	@RequestMapping(value = "/searchInfo",method = RequestMethod.GET)
	public void searchInfoGET() {
		
		logger.debug("@@@@@@@@@@@@@@@ searchInfoGET_호출");
	}
	
	
	
	// 5. 회원 로그아웃
	@RequestMapping(value = "/logout",method = RequestMethod.GET)
	public String logoutGET(HttpSession session) {
		logger.debug("@@@@@@@@@@@@@@@ logoutGET_호출");
		
		// 세션정보 초기화
		session.invalidate();
		
		return "redirect:/main";
	}
	

	
	
	
}
