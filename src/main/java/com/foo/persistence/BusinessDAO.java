package com.foo.persistence;

import com.foo.domain.BusinessusersVO;
import com.foo.domain.RestaurantmenusVO;
import com.foo.domain.RestaurantsVO;

public interface BusinessDAO {
	
	// 1. 사업자 회원 가입
	public void insertBuser(BusinessusersVO buvo) throws Exception;
	
	// 1-1. 사업자번호 중복 체크
	public BusinessusersVO bnumOverlap(String buNum) throws Exception;
	
	// 1-2. 회원 상태 저장
	public void insertUserstatus(String userId, String buId) throws Exception;
	
	
	
	// 2. 로그인
	public BusinessusersVO loginBUser(BusinessusersVO buvo) throws Exception;
	
	
	
	// 3. 입점 신청
	public void registRestaurant(RestaurantsVO revo) throws Exception;
	
	// 3-1. 메뉴 등록
	public void insertMenu(RestaurantmenusVO rmvo) throws Exception;
	
	
	
	// 4. 나의 가게 정보
	public RestaurantsVO readMyRestaurantInfo(String restId) throws Exception;
	
	// 4-1. 가게 수정
	public void updateRestaurant(RestaurantsVO revo) throws Exception;
	
	// 4-2. 가게 삭제
	public int deleteRestaurant(BusinessusersVO buvo) throws Exception;
	
	// 4-3. 가게 영업 상태 변경
	public void updateRestaurantOnoff(RestaurantsVO revo) throws Exception;
	
}