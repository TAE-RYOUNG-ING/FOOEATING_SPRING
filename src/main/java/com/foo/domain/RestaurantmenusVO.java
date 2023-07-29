package com.foo.domain;

public class RestaurantmenusVO {
	
	private int menuId;
	private String menuName;
	private String menuDescription;
	private int menuPrice;
	private String menuFile;
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ Getter & Setter ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	public int getMenuId() {
		return menuId;
	}
	public String getMenuName() {
		return menuName;
	}
	public String getMenuDescription() {
		return menuDescription;
	}
	public int getMenuPrice() {
		return menuPrice;
	}
	public String getMenuFile() {
		return menuFile;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public void setMenuDescription(String menuDescription) {
		this.menuDescription = menuDescription;
	}
	public void setMenuPrice(int menuPrice) {
		this.menuPrice = menuPrice;
	}
	public void setMenuFile(String menuFile) {
		this.menuFile = menuFile;
	}

	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ toString ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	@Override
	public String toString() {
		return "RestaurantmenusVO [menuId=" + menuId + ", menuName=" + menuName + ", menuDescription=" + menuDescription
				+ ", menuPrice=" + menuPrice + ", menuFile=" + menuFile + "]";
	}
	
}