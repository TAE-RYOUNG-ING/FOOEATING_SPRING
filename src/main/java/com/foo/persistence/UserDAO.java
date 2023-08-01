package com.foo.persistence;
import com.foo.domain.UserVO;



public interface UserDAO {

	// 1-1. 회원 가입
	public void insertUser(UserVO vo) throws Exception;
	
	// 1-2. 아이디 중복 체크
	public UserVO idOverlap(String userId) throws Exception;
	
	
	
	// 2. 로그인
	public UserVO loginUser(UserVO vo) throws Exception;
	
	
}
