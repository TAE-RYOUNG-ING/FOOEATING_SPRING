package com.foo.persistence;

import com.foo.domain.BusinessusersVO;
import com.foo.domain.RestaurantmenusVO;
import com.foo.domain.RestaurantsVO;

public interface BusinessDAO {
	
	// 1. 사업자 회원 가입
	public void insertBuser(BusinessusersVO buvo) throws Exception;
	
	// 1-1. 사업자번호 중복 체크
	public BusinessusersVO bnumOverlap(String buNum) throws Exception;
	
	
	
	// 2. 로그인
	public BusinessusersVO loginBUser(BusinessusersVO buvo) throws Exception;
	
	
	
	// 3. 입점 신청
	public void registRestaurant(RestaurantsVO revo) throws Exception;
	
	// 3-1. 메뉴 등록
	public void insertMenu(RestaurantmenusVO rmvo) throws Exception;
	
	
	
	// 4. 나의 가게 정보
	public RestaurantsVO readMyRestaurantInfo(String restId) throws Exception;
	
}