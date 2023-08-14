package com.foo.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foo.domain.BusinessusersVO;
import com.foo.domain.RestaurantsVO;
import com.foo.domain.UserVO;
import com.foo.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {
	
	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	// 의존성 주입
	@Autowired
	private AdminDAO adao;


	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	// 1. 일반회원 목록
	@Override
	public List<UserVO> getUsersList() throws Exception {
		return adao.getUsersList();
	}
	
	
	
	// 2. 사업자회원 목록
	@Override
	public List<BusinessusersVO> getBusinessusersList() throws Exception {
		return adao.getBusinessusersList();
	}
	
	
	
	// 3. 입점 가게 목록
	@Override
	public List<RestaurantsVO> getRegistList() throws Exception {
		return adao.getRegistList();
	}
	
	
	
	// 4. 입점 대기 가게 목록
	@Override
	public List<RestaurantsVO> getNonregistList() throws Exception {
		return adao.getNonregistList();
	}
	
	
	
	// 5. 블랙리스트 가게 목록 
	@Override
	public List<RestaurantsVO> getBlackList() throws Exception {
		return adao.getBlackList();
	}
	
}