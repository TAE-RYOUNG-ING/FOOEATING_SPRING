package com.foo.service;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.foo.domain.UserVO;
import com.foo.persistence.UserDAO;

import net.nurigo.sdk.message.service.DefaultMessageService;



@Service
public class UserServiceImpl implements UserService {

	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	// 객체 주입 (DI)
	@Autowired
	private UserDAO udao;
	@Autowired
	private JavaMailSender mailSender;
	private DefaultMessageService messageService;


	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	// 1. 회원 가입
	@Override
	public void joinUser(UserVO vo) throws Exception {
		udao.insertUser(vo);
	}

	
	
	// 2-1. 아이디 중복 체크
	@Override
	public String idOverlap(String userId) throws Exception {
		UserVO resultVO = new UserVO();
		resultVO = udao.idOverlap(userId);
		
		if(resultVO == null) {
			logger.debug("$$$$$$$$$$$$$$$ 아이디 중복 X");
			return "1";
		}else {
			logger.debug("$$$$$$$$$$$$$$$ 아이디 중복 O");
			return "0";
		}
	}
	
	// 2-2. 이메일 중복 체크
	@Override
	public String emailOverlap(String userEmail) throws Exception {
		UserVO resultVO = new UserVO();
		resultVO = udao.emailOverlap(userEmail);
		
		if(resultVO == null) {
			logger.debug("$$$$$$$$$$$$$$$ 이메일 중복 X");
			return "1";
		}else {
			logger.debug("$$$$$$$$$$$$$$$ 이메일 중복 O");
			return "0";
		}
	}
	
	// 2-3. 전화번호 중복 체크
	@Override
	public String telOverlap(String userTel) throws Exception {
		UserVO resultVO = new UserVO();
		resultVO = udao.telOverlap(userTel);
		
		if(resultVO == null) {
			logger.debug("$$$$$$$$$$$$$$$ 전화번호 중복 X");
			return "1";
		}else {
			logger.debug("$$$$$$$$$$$$$$$ 전화번호 중복 O");
			return "0";
		}
	}

	
	
	// 3. 로그인
	@Override
	public UserVO loginUser(UserVO vo) throws Exception {
		return udao.loginUser(vo);
	}
	
	
	
	// 4. 카카오 간편 로그인
	@Override
	public String getAccessToken(String authorize_code) throws Exception {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");

			// 내가 발급 받은 REST_API 키
			sb.append("&client_id=76611d9594b317e8ca73f2ddcaf03839");
			// 내가 설정한 REDIRECT_URI
			sb.append("&redirect_uri=http://localhost:8088/user/kakaoLogin"); 

			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			logger.debug("############### responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			logger.debug("############### response body : " + result);

			// jackson objectmapper 객체 생성
			ObjectMapper objectMapper = new ObjectMapper();
			// JSON String -> Map
			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() { });

			access_Token = jsonMap.get("access_token").toString();
			refresh_Token = jsonMap.get("refresh_token").toString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}
	
	// 4-1. 로그인한 유저 정보 가져오기
	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, Object> getUserInfo(String access_Token) throws Exception {
		
		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			logger.debug("############### responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			logger.debug("############### response body : " + result);
			logger.debug("############### result type : " + result.getClass().getName()); // java.lang.String

			try {
				// jackson objectmapper 객체 생성
				ObjectMapper objectMapper = new ObjectMapper();
				// JSON String -> Map
				Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() { });

				logger.debug("############### jasonMap.get('properties')" + jsonMap.get("properties"));

				Map<String, Object> properties = (Map<String, Object>) jsonMap.get("properties");
				Map<String, Object> kakao_account = (Map<String, Object>) jsonMap.get("kakao_account");
				
				
				// nickname & email 정보 저장
				String nickname = properties.get("nickname").toString();
				String email = null;
				
				// email 동의하지 않았을 경우
				if(kakao_account.get("email") == null) {
					email = "noData";
				}
				else {
					email = kakao_account.get("email").toString();
				}

				logger.debug("############### nickname : " + nickname);
				logger.debug("############### email : " + email);
				
				userInfo.put("nickname", nickname);
				userInfo.put("email", email);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}

	// 4-2. 유저 정보 비교하기
	@Override
	public String kUserOverlap(String userName) throws Exception {
		UserVO resultVO = new UserVO();
		resultVO = udao.kUserOverlap(userName);
		
		if(resultVO == null) {
			logger.debug("$$$$$$$$$$$$$$$ 신규 유저");
			return "0";
		}else {
			logger.debug("$$$$$$$$$$$$$$$ 기존 유저");
			return "1";
		}
	}

	// 4-3. 기존 유저 정보 가져오기
	@Override
	public UserVO getKUserInfo(String userName) throws Exception {
		return udao.getKUserInfo(userName);
	}
	
	
	
	// 5-1. 이메일 인증_랜덤 문자열 생성
	@Override
	public String randomString(int strLength) throws Exception {
		Random ran = new Random();
		StringBuffer buf = new StringBuffer();
		
		// 문자 인증
		if (strLength == 6) {
			String ranStr = "";
			for (int i = 0; i < strLength; i++) {
				ranStr += Integer.toString(ran.nextInt(10));
			}
			return ranStr;
		} 
		// 이메일 인증 (10자 이상)
		else {
			for (int i = 0; i < strLength; i++) {
				if (ran.nextInt(3) == 0) {	// 랜덤으로 뽑은 값이 0면 숫자 하나를 buffer에 추가
					buf.append(ran.nextInt(10));						// 0 ~ 9 까지 숫자 랜덤
				} else if (ran.nextInt(3) == 1) {
					buf.append((char)(ran.nextInt(26) + 65));		// A ~ Z 까지 소문자 랜덤
				} else {	// 랜덤으로 뽑은 boolean 값이 false면 숫자 하나를 buffer에 추가
					buf.append((char)(ran.nextInt(26) + 97));		// a ~ z 까지 소문자 랜덤
				}
			}
			
			return buf.toString();
		}
	}
	
	// 5-2. 이메일 인증_양식 설정
	@Override
	public void sendEmail(String fromEmail, String toEmail, String title, String content) throws Exception {
		MimeMessage message = mailSender.createMimeMessage();
		
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		helper.setFrom(fromEmail);
		helper.setTo(toEmail);
		helper.setSubject(title);
		helper.setText(content, true);		
		// true로 설정 해야만 html 형식으로 전송
		mailSender.send(message);
	}
	
	// 5-3. 이메일 인증_전송
	@Override
	public String writeEmail(String email) throws Exception {
		String fromEmail = "mogwa.sitter@gmail.com";		// 보내는 메일(회사)
		String toEmail = email;								// 받는 메일
		String title = "FOOEATING 인증번호 메일입니다.";	// 이메일 제목
		String ranStr = randomString(10);
		String content = 
				"<h1>FOOEATING 홈페이지를 방문해주셔서 감사합니다.</h1><br><br>" +
				"인증 번호는 " + ranStr + " 입니다.<br>" +
				"해당 인증번호를 인증번호 확인란에 기입하여 주십시오.";		// 이메일 내용
		
		sendEmail(fromEmail, toEmail, title, content);
		return ranStr;
	}



	// 6. ID & PW 찾기
	@Override
	public UserVO searchIDPW(String userEmail) throws Exception {
		return udao.searchIDPW(userEmail);
	}
	
	
	
	
	
}
