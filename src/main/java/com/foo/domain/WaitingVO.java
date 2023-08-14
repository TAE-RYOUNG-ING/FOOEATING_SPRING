package com.foo.domain;

public class WaitingVO {
	
	private int waitId;
	private int waitPeople;
	private int waitStatus;
	private String regdate;
	private int reviewCheck;
	private String userId;
	private String restId;
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ Getter & Setter ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	public int getWaitId() {
		return waitId;
	}
	public int getWaitPeople() {
		return waitPeople;
	}
	public int getWaitStatus() {
		return waitStatus;
	}
	public String getRegdate() {
		return regdate;
	}
	public int getReviewCheck() {
		return reviewCheck;
	}
	public String getUserId() {
		return userId;
	}
	public String getRestId() {
		return restId;
	}
	public void setWaitId(int waitId) {
		this.waitId = waitId;
	}
	public void setWaitPeople(int waitPeople) {
		this.waitPeople = waitPeople;
	}
	public void setWaitStatus(int waitStatus) {
		this.waitStatus = waitStatus;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public void setReviewCheck(int reviewCheck) {
		this.reviewCheck = reviewCheck;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setRestId(String restId) {
		this.restId = restId;
	}

	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ toString ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	@Override
	public String toString() {
		return "WaitingVO [waitId=" + waitId + ", waitPeople=" + waitPeople + ", waitStatus=" + waitStatus
				+ ", regdate=" + regdate + ", reviewCheck=" + reviewCheck + ", userId=" + userId + ", restId=" + restId
				+ "]";
	}
	
}