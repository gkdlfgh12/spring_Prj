package com.spring.mvc.admin.commons;

public class UserPageVO extends UserSearchVO{
	
	private int page; //사용자가 요청한 페이지 번호
	private int countPerPage; //한 페이지당 들어갈 게시물의 수.


	public UserPageVO() {
		this.page = 1;
		this.countPerPage = 10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getCountPerPage() {
		return countPerPage;
	}

	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}

	@Override
	public String toString() {
		return "PageVO [page=" + page + ", countPerPage=" + countPerPage + "]";
	}
	
	

}
