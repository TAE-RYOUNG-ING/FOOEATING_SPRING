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
	
	// 1-2. 사업자번호 중복 체크
	public String bnumOverlap(String buNum) throws Exception;
	
	// 1-3. 휴대폰 인증
	public String sendSMS(String buTel) throws Exception;
	
	// 1-4. 회원 상태 저장
	public void insertUserstatus(String userId, String buId) throws Exception;
	
	
	
	// 2. 로그인
	public BusinessusersVO loginBUser(BusinessusersVO buvo) throws Exception;
	
	
	
	// 3. 입점 신청
	public void registRestaurant(RestaurantsVO revo) throws Exception;
	
	// 3-1. 메뉴 등록
	public void addMenu(RestaurantmenusVO rmvo) throws Exception;
	
	
	
	// 4. 나의 가게 정보
	public RestaurantsVO readMyRestaurantInfo(String restId) throws Exception;
	
	// 4-1. 가게 수정
	public void modifyRestaurant(RestaurantsVO revo) throws Exception;
	
	// 4-2. 가게 삭제
	public int deleteRestaurant(BusinessusersVO buvo) throws Exception;
	
	// 4-3. 가게 영업 상태 변경
	public void modifyRestaurantOnoff(RestaurantsVO revo) throws Exception;
	
}