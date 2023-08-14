package com.foo.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.foo.domain.RestaurantsVO;

@Repository
public class RestaurantDAOImpl implements RestaurantDAO {
	
	// 로거 생성 
	private static final Logger logger = LoggerFactory.getLogger(RestaurantDAOImpl.class);
	
	// 의존성 주입
	@Autowired
	private SqlSession sqlSession;
	
	// Mapper 식별 NAMESPACE
	private static final String NAMESPACE = "com.foo.mappers.RestaurantMapper";
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	// 1. 입점 중인 가게 목록
	@Override
	public List<RestaurantsVO> getRestaurantList() throws Exception {
		logger.debug("############### getRestaurantList 호출");
		return sqlSession.selectList(NAMESPACE + ".getRestaurantList");
	}
	
	// 1-1. 가게 검색
	@Override
	public List<RestaurantsVO> getRestaurantList(String category, String city, String query) throws Exception {
		logger.debug("############### getRestaurantList(검색) 호출");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("category", category);
		paramMap.put("city", city);
		paramMap.put("query", query);
		
		return sqlSession.selectList(NAMESPACE + ".getRestaurantList", paramMap);
	}
	
}