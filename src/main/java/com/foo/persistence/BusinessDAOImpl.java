package com.foo.persistence;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.foo.domain.BusinessusersVO;
import com.foo.domain.RestaurantmenusVO;
import com.foo.domain.RestaurantsVO;

@Repository
public class BusinessDAOImpl implements BusinessDAO {
	
	// 로거 생성 
	private static final Logger logger = LoggerFactory.getLogger(BusinessDAOImpl.class);
	
	// 의존성 주입
	@Autowired
	private SqlSession sqlSession;
	
	// Mapper 식별 NAMESPACE
	private static final String NAMESPACE = "com.foo.mappers.BusinessMapper";
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	// 1. 사업자 회원 가입
	@Override
	public void insertBuser(BusinessusersVO buvo) throws Exception {
		logger.debug("############### insertBuser 호출");
		sqlSession.insert(NAMESPACE + ".insertBusinessuser", buvo);
	}
	
	// 1-1. 아이디 중복 체크
	@Override
	public String idOverlap(String buId) throws Exception {
		logger.debug("############### idOverlap 호출");
		return sqlSession.selectOne(NAMESPACE + ".idOverlap", buId);
	}
	
	// 1-2. 사업자번호 중복 체크
	@Override
	public String bnumOverlap(String buNum) throws Exception {
		logger.debug("############### bnumOverlap 호출");
		return sqlSession.selectOne(NAMESPACE + ".bnumOverlap", buNum);
	}
	
	
	
	// 2. 입점 신청
	@Override
	public void registRestaurant(RestaurantsVO revo) throws Exception {
		logger.debug("############### registRestaurant 호출");
		sqlSession.insert(NAMESPACE + ".insertRestaurant", revo);
		
	}
	
	// 2-1. 메뉴 등록
	@Override
	public void insertMenu(RestaurantmenusVO rmvo) throws Exception {
		logger.debug("############### insertMenu 호출");
		
	}
	
	
}
