package com.foo.service;
import java.util.HashMap;

import com.foo.domain.UserVO;



public interface UserService {

	// 1-1. 회원 가입
	public void joinUser(UserVO vo) throws Exception;
	
	// 1-2. 아이디 중복 체크
	public String idOverlap(String userId) throws Exception;
	
	// 1-3. 이메일 중복 체크
	public String emailOverlap(String userEmail) throws Exception;
	
	// 1-4. 전화번호 중복 체크
	public String telOverlap(String userTel) throws Exception;
	
	
	
	// 2. 로그인
	public UserVO loginUser(UserVO vo) throws Exception;
	
	
	
	// 3. 카카오 간편 로그인
	public String getAccessToken(String authorize_code) throws Exception;
	
	// 3-1. 유저 정보 가져오기
	public HashMap<String, Object> getUserInfo(String access_Token) throws Exception;
	
	
	
	
}
