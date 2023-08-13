package com.foo.service;
import java.util.HashMap;

import com.foo.domain.UserVO;



public interface UserService {

	// 1-1. 회원 가입
	public void joinUser(UserVO vo) throws Exception;
	
	
	
	// 2-1. 아이디 중복 체크
	public String idOverlap(String userId) throws Exception;
	
	// 2-2. 이메일 중복 체크
	public String emailOverlap(String userEmail) throws Exception;
	
	// 2-3. 전화번호 중복 체크
	public String telOverlap(String userTel) throws Exception;
	
	
	
	// 3. 로그인
	public UserVO loginUser(UserVO vo) throws Exception;
	
	
	
	// 4. 카카오 간편 로그인
	public String getAccessToken(String authorize_code) throws Exception;
	
	// 4-1. 로그인 유저 정보 가져오기
	public HashMap<String, Object> getUserInfo(String access_Token) throws Exception;
	
	// 4-2. 유저 정보 비교하기
	public String kUserOverlap(String userName) throws Exception;
	
	// 4-3. 기존 유저 정보 가져오기
	public UserVO getKUserInfo(String userName) throws Exception;
	
	
	
	
	
}
