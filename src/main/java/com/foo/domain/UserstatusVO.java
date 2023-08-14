package com.foo.domain;

public class UserstatusVO {
	
	private String userId;
	private String buId;
	private int userStatus;
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ Getter & Setter ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	public String getUserId() {
		return userId;
	}
	public String getBuId() {
		return buId;
	}
	public int getUserStatus() {
		return userStatus;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setBuId(String buId) {
		this.buId = buId;
	}
	public void setUserStatus(int userStatus) {
		this.userStatus = userStatus;
	}

	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ toString ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	@Override
	public String toString() {
		return "UserstatusVO [userId=" + userId + ", buId=" + buId + ", userStatus=" + userStatus + "]";
	}
	
}