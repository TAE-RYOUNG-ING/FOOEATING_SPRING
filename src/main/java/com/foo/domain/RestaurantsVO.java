package com.foo.domain;

public class RestaurantsVO {
	
	private String restId;
	private String restName;
	private String restTel;
	private String restAddr;
	private String regdate;
	private String restDescription;
	private String restRuntime;
	private String restCategory;
	private String restConvenience;
	private String restFile;
	private String restNotice;
	private int restStatus;
	private int restOnoff;
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ Getter & Setter ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	public String getRestId() {
		return restId;
	}
	public String getRestName() {
		return restName;
	}
	public String getRestTel() {
		return restTel;
	}
	public String getRestAddr() {
		return restAddr;
	}
	public String getRegdate() {
		return regdate;
	}
	public String getRestDescription() {
		return restDescription;
	}
	public String getRestRuntime() {
		return restRuntime;
	}
	public String getRestCategory() {
		return restCategory;
	}
	public String getRestConvenience() {
		return restConvenience;
	}
	public String getRestFile() {
		return restFile;
	}
	public String getRestNotice() {
		return restNotice;
	}
	public int getRestStatus() {
		return restStatus;
	}
	public int getRestOnoff() {
		return restOnoff;
	}
	public void setRestId(String restId) {
		this.restId = restId;
	}
	public void setRestName(String restName) {
		this.restName = restName;
	}
	public void setRestTel(String restTel) {
		this.restTel = restTel;
	}
	public void setRestAddr(String restAddr) {
		this.restAddr = restAddr;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public void setRestDescription(String restDescription) {
		this.restDescription = restDescription;
	}
	public void setRestRuntime(String restRuntime) {
		this.restRuntime = restRuntime;
	}
	public void setRestCategory(String restCategory) {
		this.restCategory = restCategory;
	}
	public void setRestConvenience(String restConvenience) {
		this.restConvenience = restConvenience;
	}
	public void setRestFile(String restFile) {
		this.restFile = restFile;
	}
	public void setRestNotice(String restNotice) {
		this.restNotice = restNotice;
	}
	public void setRestStatus(int restStatus) {
		this.restStatus = restStatus;
	}
	public void setRestOnoff(int restOnoff) {
		this.restOnoff = restOnoff;
	}

	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ toString ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	@Override
	public String toString() {
		return "RestaurantsVO [restId=" + restId + ", restName=" + restName + ", restTel=" + restTel + ", restAddr="
				+ restAddr + ", regdate=" + regdate + ", restDescription=" + restDescription + ", restRuntime="
				+ restRuntime + ", restCategory=" + restCategory + ", restConvenience=" + restConvenience
				+ ", restFile=" + restFile + ", restNotice=" + restNotice + ", restStatus=" + restStatus + ", restOnoff=" + restOnoff + "]";
	}
	
}