package com.foo.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foo.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {
	
	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	// 의존성 주입
	@Autowired
	private AdminDAO adao;


	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	// 
	
}