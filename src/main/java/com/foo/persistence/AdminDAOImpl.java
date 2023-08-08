package com.foo.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.foo.domain.BusinessusersVO;
import com.foo.domain.RestaurantsVO;
import com.foo.domain.UserVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	// 로거 생성 
	private static final Logger logger = LoggerFactory.getLogger(AdminDAOImpl.class);
	
	// 의존성 주입
	@Autowired
	private SqlSession sqlSession;
	
	// Mapper 식별 NAMESPACE
	private static final String NAMESPACE = "com.foo.mappers.AdminMapper";
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	// 1. 일반회원 목록
	@Override
	public List<UserVO> getUsersList() throws Exception {
		logger.debug("############### getUsersList 호출");
		return sqlSession.selectList(NAMESPACE + ".getUsersList");
	}
	
	
	
	// 2. 사업자회원 목록
	@Override
	public List<BusinessusersVO> getBusinessusersList() throws Exception {
		logger.debug("############### getBusinessusersList 호출");
		return sqlSession.selectList(NAMESPACE + ".getBusinessusersList");
	}
	
	
	
	// 3. 입점 가게 목록
	@Override
	public List<RestaurantsVO> getRegistList() throws Exception {
		logger.debug("############### getRegistList 호출");
		return sqlSession.selectList(NAMESPACE + ".getRegistList");
	}
	
	
	
	// 4. 입점 대기 가게 목록
	@Override
	public List<RestaurantsVO> getNonregistList() throws Exception {
		logger.debug("############### getNonregistList 호출");
		return sqlSession.selectList(NAMESPACE + ".getNonregistList");
	}
	
	
	
	// 5. 블랙리스트 가게 목록 
	@Override
	public List<RestaurantsVO> getBlackList() throws Exception {
		logger.debug("############### getBlackList 호출");
		return sqlSession.selectList(NAMESPACE + ".getBlackList");
	}
	
}