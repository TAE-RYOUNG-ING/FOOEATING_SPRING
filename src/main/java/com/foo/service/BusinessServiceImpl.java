package com.foo.service;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.foo.domain.BusinessusersVO;
import com.foo.domain.RestaurantmenusVO;
import com.foo.domain.RestaurantsVO;
import com.foo.persistence.BusinessDAO;

@Service
public class BusinessServiceImpl implements BusinessService {
	
	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(BusinessServiceImpl.class);
	
	// 의존성 주입
	@Autowired
	private BusinessDAO bdao;


	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	// 1. 사업자 회원 가입
	@Override
	public void joinBuser(BusinessusersVO buvo) throws Exception {
	}
	
	// 1-1. 이메일 인증
	// 1-1-1. 랜덤 문자열 생성
	@Override
	public String randomString(int strLength) throws Exception {
		Random ran = new Random();
		StringBuffer buf = new StringBuffer();
		
		for (int i = 0; i < strLength; i++) {
			if (ran.nextBoolean()) {	// 랜덤으로 뽑은 boolean 값이 true면 소문자 하나를 buffer에 추가
				buf.append((char)((ran.nextInt(26) + 1) + 97));		// a ~ z 까지 소문자 랜덤
			} else {	// 랜덤으로 뽑은 boolean 값이 false면 숫자 하나를 buffer에 추가
				buf.append(ran.nextInt(10));						// 0 ~ 9 까지 숫자 랜덤
			}
		}
		
		return buf.toString();
	}
	
	// 1-1-2. 이메일 양식
	@Override
	public String writeEmail(String email) throws Exception {
		String fromEmail = "mogwa.sitter@gmail.com";		// 보내는 메일(회사)
		String toEmail = email;								// 받는 메일
		String title = "FOOEATING 가입 인증 메일입니다.";	// 이메일 제목
		String ranStr = randomString(10);
		String content = 
				"<h1>FOOEATING 홈페이지를 방문해주셔서 감사합니다.</h1><br><br>" +
				"인증 번호는 " + ranStr + "입니다.<br>" +
				"해당 인증번호를 인증번호 확인란에 기입하여 주십시오.";		// 이메일 내용
		
		sendEmail(fromEmail, toEmail, title, content);
		return ranStr;
	}
	
	// 1-1-3. 이메일 전송
	@Override
	public void sendEmail(String fromEmail, String toEmail, String title, String content) throws Exception {
		JavaMailSender emailSender = new JavaMailSenderImpl();
		MimeMessage message = emailSender.createMimeMessage();
		
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		helper.setFrom(fromEmail);
		helper.setTo(toEmail);
		helper.setSubject(title);
		helper.setText(content, true);		// true로 설정 해야만 html 형식으로 전송. 작성하지 않으면 단순 텍스트로 전송됨.
		emailSender.send(message);
	}
	
	
	
	// 2. 입점 신청
	@Override
	public void registRestaurant(RestaurantsVO revo) throws Exception {
	}
	
	// 2-1. 메뉴 등록
	@Override
	public void addMenu(RestaurantmenusVO rmvo) throws Exception {
	}

}