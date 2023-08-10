package com.foo.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foo.domain.RestaurantsVO;
import com.foo.persistence.RestaurantDAO;

@Service
public class RestaurantServiceImpl implements RestaurantService {
	
	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(RestaurantServiceImpl.class);
	
	// 의존성 주입
	@Autowired
	private RestaurantDAO rdao;


	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	// 1. 입점 중인 가게 목록
	@Override
	public List<RestaurantsVO> getRestaurantList() throws Exception {
		return rdao.getRestaurantList();
	}
	
}