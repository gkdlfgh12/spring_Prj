package com.spring.mvc.user.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.mvc.user.model.UserVO;
import com.spring.mvc.user.repository.IUserMapper;

@Service
public class UserService implements IUserService{

	@Autowired
	IUserMapper mapper;
	
	//id 중복값 체크
	public int idCheck(String account) {
		
		return mapper.idCheck(account);
	}
	
	//email 중복값 체크
	@Override
	public int emailCheck(String userEmail) {
		return mapper.emailCheck(userEmail);
	}

	@Override
	public void register(UserVO user) {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		user.setPassword(encoder.encode(user.getPassword()));   // 비밀번호 암호화 하여 저장
		mapper.register(user);
	}

	@Override
	public UserVO selectOne(String account) {
		return mapper.selectOne(account);
	}

	

	@Override
	public void keepLogin(String sessionId, Date limitDate, String account) {

		Map<String, Object> datas = new HashMap<String, Object>();
		datas.put("sessionId", sessionId);
		datas.put("limitDate", limitDate);
		datas.put("account", account);
		
		mapper.keepLogin(datas);
	}

	@Override
	public UserVO getUserWithSessionId(String sessionId) {
		return mapper.getUserWithSessionId(sessionId);
	}

	//id찾기
	@Override
	public UserVO findId(UserVO inputUser) {
		
		return mapper.findId(inputUser);
	}
	
	//pw찾기
	@Override
	public UserVO findPw(UserVO inputUser) {
			
		return mapper.findPw(inputUser);
	}
	//pw찾은 후 db에 임시 비밀번호 삽입
	@Override
	public void updateTmpPw(UserVO dbUser) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		dbUser.setPassword(encoder.encode(dbUser.getPassword()));
		mapper.updateTmpPw(dbUser);
	}
	
	//이메일 인증을 위한 서치
	@Override
	public UserVO emailChSearch(UserVO user) {
		return mapper.emailChSearch(user);
	}

	//이메일 인증 후 mail_check를 YES로 업데이트
	@Override
	public void emailChUpdate(UserVO user) {
		mapper.emailChUpdate(user);
	}

	
	///////////////////
	
	//mypage 정보 변경
	@Override
	public UserVO myPage(String account) {
		return mapper.myPage(account);
	}

	//mypage 정보 변경 action
	@Override
	public void userChInfo(UserVO userVO) {
		System.out.println("서비스에서 네임 체크"+userVO.getName());
		
		if(userVO.getPassword() != null) {
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			userVO.setPassword(encoder.encode(userVO.getPassword()));   // 비밀번호 암호화 하여 저장
			mapper.userChInfo(userVO);
		}else {
			mapper.userChInfoNonp(userVO);
		}
		
	}

	//회원 탈퇴
	@Override
	public int memWithdrawal(String account) {
		
		return mapper.memWithdrawal(account);
	}
	

}
