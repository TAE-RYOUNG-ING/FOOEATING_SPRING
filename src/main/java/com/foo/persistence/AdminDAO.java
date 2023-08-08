package com.foo.persistence;

import java.util.List;

import com.foo.domain.BusinessusersVO;
import com.foo.domain.RestaurantsVO;
import com.foo.domain.UserVO;

public interface AdminDAO {
	
	// 1. 일반회원 목록
	public List<UserVO> getUsersList() throws Exception;
	
	
	
	// 2. 사업자회원 목록
	public List<BusinessusersVO> getBusinessusersList() throws Exception;
	
	
	
	// 3. 입점 가게 목록
	public List<RestaurantsVO> getRegistList() throws Exception;
	
	
	
	// 4. 입점 대기 가게 목록
	public List<RestaurantsVO> getNonregistList() throws Exception;
	
	
	
	// 5. 블랙리스트 가게 목록
	public List<RestaurantsVO> getBlackList() throws Exception;
	
}