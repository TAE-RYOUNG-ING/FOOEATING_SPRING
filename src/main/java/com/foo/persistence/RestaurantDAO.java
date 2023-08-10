package com.foo.persistence;

import java.util.List;

import com.foo.domain.RestaurantsVO;

public interface RestaurantDAO {
	
	// 1. 입점 중인 가게 목록
	public List<RestaurantsVO> getRestaurantList() throws Exception;
	
}