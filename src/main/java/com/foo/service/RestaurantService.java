package com.foo.service;

import java.util.List;

import com.foo.domain.RestaurantsVO;

public interface RestaurantService {
	
	// 1. 입점 중인 가게 목록
	public List<RestaurantsVO> getRestaurantList() throws Exception;
	
	// 1-1. 가게 검색
	public List<RestaurantsVO> getRestaurantList(String category, String city, String query) throws Exception;
	
}