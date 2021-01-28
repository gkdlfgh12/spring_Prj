package com.spring.mvc.admin.service;

import java.util.List;

import com.spring.mvc.admin.commons.UserPageVO;
import com.spring.mvc.admin.commons.UserSearchVO;
import com.spring.mvc.admin.model.UserVO;

public interface IAdminService {
	
	//회원 관리를 위한 회원 전체 검색
	public List<UserVO> userManage(UserPageVO userPaging);
	
	//검색 회원 수
	public int countUser(UserPageVO userPaging);
	
	//회원 상세 검색
	public UserVO userContent(UserVO user);
	
	//회원정보 변경
	public void userChange(UserVO user);
	
	

}
