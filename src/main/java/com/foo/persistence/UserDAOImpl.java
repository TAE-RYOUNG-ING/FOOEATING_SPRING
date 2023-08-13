package com.foo.persistence;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.foo.domain.UserVO;



@Repository
public class UserDAOImpl implements UserDAO {
	
	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);

	// 객체 주입 (DI)
	@Autowired
	private SqlSession sqlSession;
	
	// Mapper 식별 NAMESPACE
	private static final String NAMESPACE = "com.foo.mappers.userMapper";


	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	// 1. 회원 가입
	@Override
	public void insertUser(UserVO vo) throws Exception {
		logger.debug("############### insertUser_호출");
		sqlSession.insert(NAMESPACE + ".insertUser", vo);
	}
	
	
	
	// 2-1. 아이디 중복 체크
	@Override
	public UserVO idOverlap(String userId) throws Exception {
		logger.debug("############### idOverlap_호출");
		return sqlSession.selectOne(NAMESPACE + ".idOverlap", userId);
	}
	
	// 2-2. 이메일 중복 체크
	@Override
	public UserVO emailOverlap(String userEmail) throws Exception {
		logger.debug("############### emailOverlap_호출");
		return sqlSession.selectOne(NAMESPACE + ".emailOverlap", userEmail);
	}

	// 2-3. 전화번호 중복 체크
	@Override
	public UserVO telOverlap(String userTel) throws Exception {
		logger.debug("############### telOverlap_호출");
		return sqlSession.selectOne(NAMESPACE + ".telOverlap", userTel);
	}

	
	
	// 3. 로그인
	@Override
	public UserVO loginUser(UserVO vo) throws Exception {
		logger.debug("############### loginUser_호출");
		return sqlSession.selectOne(NAMESPACE + ".loginUser", vo);
	}

	
	
	// 4-1. 카카오 유저 정보 비교
	@Override
	public UserVO kUserOverlap(String userName) throws Exception {
		logger.debug("############### kUserOverlap_호출");
		return sqlSession.selectOne(NAMESPACE + ".kUserOverlap", userName);
	}

	// 4-2. 카카오 유저 정보 가져오기
	@Override
	public UserVO getKUserInfo(String userName) throws Exception {
		logger.debug("############### getKUserInfo_호출");
		return sqlSession.selectOne(NAMESPACE + ".getKUserInfo", userName);
	}
	



}
