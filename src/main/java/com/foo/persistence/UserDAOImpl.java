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
	
	
	
	// 1-1. 회원 가입
	@Override
	public void insertUser(UserVO vo) throws Exception {
		logger.debug("############### insertUser_호출");
		sqlSession.insert(NAMESPACE + ".insertUser", vo);
	}
	
	// 1-2. 아이디 중복 체크
	@Override
	public UserVO idOverlap(String userId) throws Exception {
		logger.debug("############### idOverlap_호출");
		return sqlSession.selectOne(NAMESPACE + ".idOverlap", userId);
	}
	
	// 1-3. 이메일 중복 체크
	@Override
	public UserVO emailOverlap(String userEmail) throws Exception {
		logger.debug("############### emailOverlap_호출");
		return sqlSession.selectOne(NAMESPACE + ".emailOverlap", userEmail);
	}

	// 1-4. 전화번호 중복 체크
	@Override
	public UserVO telOverlap(String userTel) throws Exception {
		logger.debug("############### telOverlap_호출");
		return sqlSession.selectOne(NAMESPACE + ".telOverlap", userTel);
	}

	
	
	// 2. 로그인
	@Override
	public UserVO loginUser(UserVO vo) throws Exception {
		logger.debug("############### loginUser_호출");
		return sqlSession.selectOne(NAMESPACE + ".loginUser", vo);
	}





}
