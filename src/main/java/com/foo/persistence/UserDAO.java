package com.foo.persistence;
import com.foo.domain.UserVO;



public interface UserDAO {

	// 1. 회원 가입
	public void insertUser(UserVO vo) throws Exception;
	
	
	
	// 2-1. 아이디 중복 체크
	public UserVO idOverlap(String userId) throws Exception;
	
	// 2-2. 이메일 중복 체크
	public UserVO emailOverlap(String userEmail) throws Exception;
	
	// 2-3. 전화번호 중복 체크
	public UserVO telOverlap(String userTel) throws Exception;
	
	
	
	// 3. 로그인
	public UserVO loginUser(UserVO vo) throws Exception;
	
	
	
	// 4-1. 카카오 유저 정보 비교
	public UserVO kUserOverlap(String userName) throws Exception;
	
	// 4-2. 카카오 유저 정보 가져오기
	public UserVO getKUserInfo(String userName) throws Exception;
	
	
}
