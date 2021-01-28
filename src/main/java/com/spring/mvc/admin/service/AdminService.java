package com.spring.mvc.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.mvc.admin.commons.UserPageVO;
import com.spring.mvc.admin.commons.UserSearchVO;
import com.spring.mvc.admin.model.UserVO;
import com.spring.mvc.admin.repository.IAdminMapper;

@Service
public class AdminService implements IAdminService{

	@Autowired
	IAdminMapper mapper;
	
	//회원 전체 검색
	@Override
	public List<UserVO> userManage(UserPageVO userPaging) {

		return mapper.userManage(userPaging);
	}

	//회원 수 찾기
	@Override
	public int countUser(UserPageVO userPaging) {
		return mapper.countUser(userPaging);
	}
	
	//회원 상세
	@Override
	public UserVO userContent(UserVO user) {
		 
		return mapper.userContent(user);
	}

	//회원 정보 변경
	@Override
	public void userChange(UserVO user) {
		
		System.out.println(user);
		
		if(user.getPassword() != null) {
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			user.setPassword(encoder.encode(user.getPassword()));
			System.out.println(user);
			mapper.userChange(user);
		}else { //비밀번호 변경 X
			mapper.userChangeNonp(user);
		}
		//mapper.userChange(user);
		
	}

	




	
	
}
