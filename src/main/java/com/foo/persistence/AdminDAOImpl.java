package com.foo.persistence;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	// 로거 생성 
	private static final Logger logger = LoggerFactory.getLogger(AdminDAOImpl.class);
	
	// 의존성 주입
	@Autowired
	private SqlSession sqlSession;
	
	// Mapper 식별 NAMESPACE
	private static final String NAMESPACE = "com.foo.mappers.BusinessMapper";
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	// 
	
}
