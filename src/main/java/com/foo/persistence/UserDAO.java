package com.foo.persistence;
import com.foo.domain.UserVO;



public interface UserDAO {

	// 1-1. 회원 가입
	public void insertUser(UserVO vo) throws Exception;
	
	// 1-2. 아이디 중복 체크
	public UserVO idOverlap(String userId) throws Exception;
	
	// 1-3. 이메일 중복 체크
	public UserVO emailOverlap(String userEmail) throws Exception;
	
	// 1-4. 전화번호 중복 체크
	public UserVO telOverlap(String userTel) throws Exception;
	
	
	
	// 2. 로그인
	public UserVO loginUser(UserVO vo) throws Exception;
	
	
	
	// 3. 카카오 유저 정보 비교
	public UserVO kUserOverlap(String userName) throws Exception;
	
	
}
