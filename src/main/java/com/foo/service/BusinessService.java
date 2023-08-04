package com.foo.service;

import com.foo.domain.BusinessusersVO;
import com.foo.domain.RestaurantmenusVO;
import com.foo.domain.RestaurantsVO;

public interface BusinessService {
	
	// 1. 사업자 회원 가입
	public void joinBuser(BusinessusersVO buvo) throws Exception;
	
	// 1-1. 이메일 인증
	// 1-1-1. 랜덤 문자열 생성
	public String randomString(int strLength) throws Exception;
	
	// 1-1-2. 이메일 양식
	public String writeEmail(String email) throws Exception;
	
	// 1-1-3. 이메일 전송
	public void sendEmail(String fromEmail, String toEmail, String title, String content) throws Exception;
	
	// 1-2. 아이디 중복 체크
	public String idOverlap(String buId) throws Exception;
	
	// 1-3. 사업자번호 중복 체크
	public String bnumOverlap(String buNum) throws Exception;
	
	// 2. 입점 신청
	public void registRestaurant(RestaurantsVO revo) throws Exception;
	
	// 2-1. 메뉴 등록
	public void addMenu(RestaurantmenusVO rmvo) throws Exception;
	
}