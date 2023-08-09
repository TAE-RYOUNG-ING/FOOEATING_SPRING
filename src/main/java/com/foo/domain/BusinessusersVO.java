package com.foo.domain;

public class BusinessusersVO {
	
	private String buId;
	private String buPw;
	private String buNum;
	private String buName;
	private String buEmail;
	private String buTel;
	private String regdate;
	
	// 회원 상태 정보 객체
	private UserstatusVO userstatusVO;
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ Getter & Setter ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	public String getBuId() {
		return buId;
	}
	public String getBuPw() {
		return buPw;
	}
	public String getBuNum() {
		return buNum;
	}
	public String getBuName() {
		return buName;
	}
	public String getBuEmail() {
		return buEmail;
	}
	public String getBuTel() {
		return buTel;
	}
	public String getRegdate() {
		return regdate;
	}
	public UserstatusVO getUserstatusVO() {
		return userstatusVO;
	}
	public void setBuId(String buId) {
		this.buId = buId;
	}
	public void setBuPw(String buPw) {
		this.buPw = buPw;
	}
	public void setBuNum(String buNum) {
		this.buNum = buNum;
	}
	public void setBuName(String buName) {
		this.buName = buName;
	}
	public void setBuEmail(String buEmail) {
		this.buEmail = buEmail;
	}
	public void setBuTel(String buTel) {
		this.buTel = buTel;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public void setUserstatusVO(UserstatusVO userstatusVO) {
		this.userstatusVO = userstatusVO;
	}

	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ toString ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	@Override
	public String toString() {
		return "BusinessusersVO [buId=" + buId + ", buPw=" + buPw + ", buNum=" + buNum + ", buName=" + buName
				+ ", buEmail=" + buEmail + ", buTel=" + buTel + ", regdate=" + regdate + " / (userstatusVO=" + userstatusVO + ")]";
	}
	
}