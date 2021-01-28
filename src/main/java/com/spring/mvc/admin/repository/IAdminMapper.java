package com.spring.mvc.admin.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.mvc.admin.commons.UserPageVO;
import com.spring.mvc.admin.commons.UserSearchVO;
import com.spring.mvc.admin.model.UserVO;

public interface IAdminMapper {

	//회원 관리를 위한 회원 전체 검색
	public List<UserVO> userManage(UserPageVO userPaging);
	
	//검색 회원 수
	public int countUser(UserPageVO userPaging);
	
	//회원 상세 검색
	public UserVO userContent(UserVO user);
	
	//회원정보 변경
	public void userChange(UserVO user);
	//회원정보 변경 - pw미포함
	public void userChangeNonp(UserVO user);
	
}
