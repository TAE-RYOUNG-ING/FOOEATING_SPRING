package com.foo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
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
		
		// 회원 가입
		bService.joinBuser(buvo);
		logger.debug("@@@@@@@@@@@@@@@ 회원가입 완료");
		
		// 회원 상태 저장
		bService.insertUserstatus(null, buvo.getBuId());
		
		return "ok";
	}
	
	// 1-2. 사업자번호 중복 체크
	@RequestMapping(value = "/bnumOverlap", method = RequestMethod.POST)
	public String bnumOverlap(@RequestParam("buNum") String buNum) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@@@@@@ bnumOverlap() 호출");
		
		String result = bService.bnumOverlap(buNum);
		logger.debug("사업자번호 중복 결과 : " + result);
		
		return result;
	}
	
	// 1-3. 휴대폰 인증
	@RequestMapping(value = "/sendSMS", method = RequestMethod.POST)
	public String sendSMS(@ModelAttribute("buTel") String buTel) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@@@@@@ sendSMS() 호출");
		
		String ranStr = bService.sendSMS(buTel);
		logger.debug("인증번호를 보낼 buTel : " + buTel + " / 생성된 인증코드 : " + ranStr);
		
		return ranStr;
	}
	
	
	
	// http://localhost:8088/business/registration
	// 2. 입점 신청
	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String registRestaurant(@ModelAttribute RestaurantsVO revo, @RequestPart MultipartFile[] files) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@@@@@@ registRestaurant() 호출");
		logger.debug("revo : {}", revo);
		logger.debug("files : {}", files);
		
		String uploadFolder = "C:\\fooeating_upload";
		String uploadFile = ""; 
		
		for(MultipartFile multi : files) {
			logger.debug("upload_file_name : " + multi.getOriginalFilename());
			logger.debug("upload_file_size : " + multi.getSize());
			
			File savefile = new File(uploadFolder, multi.getOriginalFilename());
			multi.transferTo(savefile);
			
			uploadFile += multi.getOriginalFilename() + "/";
		}
		if (uploadFile != "") {
			revo.setRestFile(uploadFile.substring(0, uploadFile.length() - 1));
		}
		
		bService.registRestaurant(revo);
		
		return "ok";
	}
	
	// http://localhost:8088/business/addMenu
	// 2-1. 메뉴 등록
//	@RequestMapping(value = "/addMenu", method = RequestMethod.POST)
//	public String addRestaurantMenu(@RequestBody RestaurantmenusVO rmvo) throws Exception {
//		logger.debug("@@@@@@@@@@@@@@@@@@@@@ addRestaurantMenu() 호출");
//		logger.debug("rmvo : {}", rmvo);
//		
//		return "ok";
//	}
	
	
	
	// 3. 사업자 회원 마이페이지
	// 3-1. 사진 출력
	@RequestMapping(value = "/showImg", method = RequestMethod.GET)
	public byte[] showImg(@ModelAttribute("img") String img) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@@@@@@ showImg() 호출");
		logger.debug("img : " + img);
		
		InputStream is = new FileInputStream("C:\\fooeating_upload\\" + img);
		byte[] bArr = IOUtils.toByteArray(is);
		is.close();
		
		return bArr;
	}
	
	// 3-2. 가게 정보 수정
	@RequestMapping(value = "/infoModify", method = RequestMethod.POST)
	public String updateRestaurant(@ModelAttribute RestaurantsVO revo, @RequestPart MultipartFile[] files) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@@@@@@ updateRestaurant() 호출");
		logger.debug("revo : {}", revo);
		logger.debug("files : {}", files);
		
		String uploadFolder = "C:\\fooeating_upload";
		String uploadFile = ""; 
		
		for(MultipartFile multi : files) {
			logger.debug("upload_file_name : " + multi.getOriginalFilename());
			logger.debug("upload_file_size : " + multi.getSize());
			
			File savefile = new File(uploadFolder, multi.getOriginalFilename());
			multi.transferTo(savefile);
			
			uploadFile += multi.getOriginalFilename() + "/";
		}
		if (uploadFile != "") {
			revo.setRestFile(uploadFile.substring(0, uploadFile.length() - 1));
		}
		
		bService.modifyRestaurant(revo);
		
		return "ok";
	}
	
	// 3-3. 가게 삭제
	@RequestMapping(value = "/infoDelete", method = RequestMethod.POST)
	public String deleteRestaurant(@ModelAttribute BusinessusersVO buvo) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@@@@@@ deleteRestaurant() 호출");
		logger.debug("buvo : {}", buvo);
		
		int result = bService.deleteRestaurant(buvo);
		
		if (result == 1) {
			logger.debug("result : 삭제 완료");
			return "ok";
		} else {
			logger.debug("result : 삭제 실패");
			return "fail";
		}
		
	}
	
	
	
	// 4. 이메일 인증
	@RequestMapping(value = "/emailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String emailCheck(@ModelAttribute("email") String email) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@@@@@@ emailCheck() 호출");
		
		String ranStr = bService.writeEmail(email);		// 해당 메일로 전송된 인증 번호 저장
		logger.debug("인증번호를 보낼 email : " + email + " / 생성된 인증코드 : " + ranStr);
		
		return ranStr;
	}
	
}