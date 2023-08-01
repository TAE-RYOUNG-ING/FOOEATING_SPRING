package com.foo.service;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.foo.domain.UserVO;
import com.foo.persistence.UserDAO;



@Service
public class UserServiceImpl implements UserService {

	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	// 객체 주입 (DI)
	@Autowired
	private UserDAO udao;


	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	// 1-1. 회원 가입
	@Override
	public void joinUser(UserVO vo) throws Exception {
		udao.insertUser(vo);
	}

	// 1-2. 아이디 중복 체크
	@Override
	public void idOverlap(String userId, HttpServletResponse response) throws Exception {
		UserVO resultVO = new UserVO();
		resultVO = udao.idOverlap(userId);
		
		if(resultVO == null) {
			response.getWriter().print("1");
		}else {
			response.getWriter().print("0");
		}
	}
	

	
	// 2. 로그인
	@Override
	public UserVO loginUser(UserVO vo) throws Exception {
		return udao.loginUser(vo);
	}




	
	



}
