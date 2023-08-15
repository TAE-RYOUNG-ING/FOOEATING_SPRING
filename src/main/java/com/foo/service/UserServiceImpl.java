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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.foo.domain.UserVO;
import com.foo.persistence.UserDAO;



@Service
public class UserServiceImpl implements UserService {

	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	// 객체 주입 (DI)
	@Autowired
	private UserDAO udao;


	
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
	
	

}
