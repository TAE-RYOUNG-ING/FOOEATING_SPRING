package com.foo.domain;

public class ReviewsVO {
	
	private int reviewId;
	private String reviewContent;
	private String reviewFile;
	private String regdate;
	private int reviewGrade;
	private int waitId;
	private String userId;
	private String buId;
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ Getter & Setter ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	public int getReviewId() {
		return reviewId;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public String getReviewFile() {
		return reviewFile;
	}
	public String getRegdate() {
		return regdate;
	}
	public int getReviewGrade() {
		return reviewGrade;
	}
	public int getWaitId() {
		return waitId;
	}
	public String getUserId() {
		return userId;
	}
	public String getBuId() {
		return buId;
	}
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public void setReviewFile(String reviewFile) {
		this.reviewFile = reviewFile;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public void setReviewGrade(int reviewGrade) {
		this.reviewGrade = reviewGrade;
	}
	public void setWaitId(int waitId) {
		this.waitId = waitId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setBuId(String buId) {
		this.buId = buId;
	}

	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ toString ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	@Override
	public String toString() {
		return "ReviewsVO [reviewId=" + reviewId + ", reviewContent=" + reviewContent + ", reviewFile=" + reviewFile
				+ ", regdate=" + regdate + ", reviewGrade=" + reviewGrade + ", waitId=" + waitId + ", userId=" + userId
				+ ", buId=" + buId + "]";
	}
	
}