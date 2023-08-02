package com.foo.service;
import com.foo.domain.UserVO;



public interface UserService {

	// 1-1. 회원 가입
	public void joinUser(UserVO vo) throws Exception;
	
	// 1-2. 아이디 중복 체크
	public String idOverlap(String userId) throws Exception;
	
	
	
	// 2. 로그인
	public UserVO loginUser(UserVO vo) throws Exception;
	
}
