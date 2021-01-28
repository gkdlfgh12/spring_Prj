package com.spring.mvc.user.repository;

import java.util.List;
import java.util.Map;

import com.spring.mvc.user.model.UserVO;

public interface IUserMapper {

	//id 중복값 체크
	int idCheck(String account);
	
	//email 중복값 체크
	int emailCheck(String userEmail);
	
	//회원 가입 기능
	void register(UserVO user);

	//회원 탈퇴 기능
	void delete(String account);

	//회원 정보 조회 기능
	UserVO selectOne(String account);

	//회원 정보 전체 조회 기능
	List<UserVO> selectAll();

	//자동 로그인 쿠키값 DB저장 처리.
	void keepLogin(Map<String, Object> datas);

	//세션아이디를 통한 회원 정보 조회 기능
	UserVO getUserWithSessionId(String sessionId);
	
	//아이디 찾기
	UserVO findId(UserVO user);
	
	//비밀번호 찾기 
	UserVO findPw(UserVO user);
	
	//임시 비밀번호 삽입
	void updateTmpPw(UserVO user);
	
	//이메일 인증을 위한 서치
	UserVO emailChSearch(UserVO user);
	
	//이메일 인증 후 email_check 업데이트
	void emailChUpdate(UserVO user);
	
	
	
	
	//////////
	
	//mypage 정보 변경 - 비번 포함
	UserVO myPage(String account);
	
	//mypage 정보 변경 action
	void userChInfo(UserVO userVO);
	//mypage 정보 변경 action
	void userChInfoNonp(UserVO userVO);
	
	//회원탈퇴
	int memWithdrawal(String account);
}







