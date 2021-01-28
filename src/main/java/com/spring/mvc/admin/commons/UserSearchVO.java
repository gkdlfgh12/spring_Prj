package com.spring.mvc.admin.commons;

public class UserSearchVO{
	private String keyword;
	private String condition;
	
	
	
	
	public UserSearchVO() {
		this.keyword = "";
		this.condition = "";
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	
	
}
