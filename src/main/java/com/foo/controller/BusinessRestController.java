package com.foo.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.foo.domain.BusinessusersVO;
import com.foo.domain.RestaurantsVO;
import com.foo.service.BusinessService;

@RestController
@RequestMapping(value = "/business")
public class BusinessRestController {
	
	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(BusinessRestController.class);
	
	// 의존성 주입
	@Autowired
	private BusinessService bService;
	

	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	// http://localhost:8088/business/join
	// 1. 사업자 회원 가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinBusinessuser(@RequestBody BusinessusersVO buvo) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@@@@@@ joinBusinessuser() 호출");
		logger.debug("buvo : {}", buvo);
		
		bService.joinBuser(buvo);
		
		return "ok";
	}
	
	// 1-1. 이메일 인증
	@RequestMapping(value = "/emailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String emailCheck(@ModelAttribute("email") String email) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@@@@@@ emailCheck() 호출");
		
		String ranStr = bService.writeEmail(email);		// 해당 메일로 전송된 인증 번호 저장
		logger.debug("인증번호를 보낼 email : " + email + " / 생성된 인증코드 : " + ranStr);
		
		return ranStr;
	}
	
	// 1-2. 아이디 중복 체크
	@RequestMapping(value = "/idOverlap", method = RequestMethod.POST)
	public String idOverlap(@RequestParam("buId") String buId) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@@@@@@ idOverlap() 호출");
		
		String result1 = bService.idOverlap(buId);
		logger.debug("아이디 중복 결과 : " + result1);
		
		return result1;
	}
	
	// 1-3. 사업자번호 중복 체크
	@RequestMapping(value = "/bnumOverlap", method = RequestMethod.POST)
	public String bnumOverlap(@RequestParam("buNum") String buNum) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@@@@@@ bnumOverlap() 호출");
		
		String result2 = bService.bnumOverlap(buNum);
		logger.debug("사업자번호 중복 결과 : " + result2);
		
		return result2;
	}
	
	
	
	// http://localhost:8088/business/registration
	// 2. 입점 신청
	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String registRestaurant(@RequestBody RestaurantsVO revo) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@@@@@@ registRestaurant() 호출");
		logger.debug("revo : {}", revo);
		
		bService.registRestaurant(revo);
		
		return "ok";
	}
	
	// 2-1. 사진 업로드
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String upload(@RequestPart MultipartFile[] files) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@@@@@@ upload() 호출");
		logger.debug("files : {}", files);
		
		RestaurantsVO revo = new RestaurantsVO();
		
		String uploadFolder = "C:\\fooeating_upload";
		String uploadFile = ""; 
		
		for(MultipartFile multi : files) {
			logger.debug("upload_file_name : " + multi.getOriginalFilename());
			logger.debug("upload_file_size : " + multi.getSize());
			
			File savefile = new File(uploadFolder, multi.getOriginalFilename());
			multi.transferTo(savefile);
			
			uploadFile += multi.getOriginalFilename() + "/";
		}
		revo.setRestFile(uploadFile.substring(0, uploadFile.length() - 1));
		// 사진 정보는 '가게 수정' 메서드 사용 예정
		
		return "upload_ok";
	}
	
	// http://localhost:8088/business/addMenu
	// 2-2. 메뉴 등록
//	@RequestMapping(value = "/addMenu", method = RequestMethod.POST)
//	public String addRestaurantMenu(@RequestBody RestaurantmenusVO rmvo) throws Exception {
//		logger.debug("@@@@@@@@@@@@@@@@@@@@@ addRestaurantMenu() 호출");
//		logger.debug("rmvo : {}", rmvo);
//		
//		return "ok";
//	}
	
	
	
	// http://localhost:8088/business/mypage/dashboard
	// 3. 사업자 회원 마이 페이지
	// 3-1. 대시보드
//	@RequestMapping(value = "/mypage/dashboard/{buNum}", method = RequestMethod.GET)
//	public void getDashboard(@PathVariable("buNum") String buNum) throws Exception {
//		logger.debug("@@@@@@@@@@@@@@@@@@@@@ getDashboard() 호출");
//		logger.debug("buNum : " + buNum);
//		
//		// bnNum과 일치하는 restaurants 데이터가 있으면 대시보드 출력
//	}
	
	// 3-2. 나의 가게 정보
//	@RequestMapping(value = "/mypage/restInfo/{buNum}")
//	public List<RestaurantsVO> getRestInfo(@PathVariable("buNum") String buNum) throws Exception{
//		logger.debug("@@@@@@@@@@@@@@@@@@@@@ getRestInfo() 호출");
//		logger.debug("buNum : " + buNum);
//		
//		// bnNum과 일치하는 restaurants 데이터가 있으면 해당 데이터를 리스트로 넘기기 -> 없으면 null 리턴
//		
//		return null;
//	}
	
}