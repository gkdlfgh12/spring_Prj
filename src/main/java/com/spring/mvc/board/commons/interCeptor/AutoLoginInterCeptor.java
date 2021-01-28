package com.spring.mvc.board.commons.interCeptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.spring.mvc.user.model.UserVO;
import com.spring.mvc.user.service.IUserService;

public class AutoLoginInterCeptor extends HandlerInterceptorAdapter{

		@Autowired
		IUserService service;
	
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {

			System.out.println("자동 로그인 인터셉터 발동!");
			//서버에 생성된 세션이 있다면 세션을 반환하고, 없다면 새 세션을 생성하여 반환한다.
			HttpSession session = request.getSession();
			
			//브라우저의 쿠키 값을 보내는 코드
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if(loginCookie != null) {
				
				//getValue()는 해당 이름에 저장된 데이터 값(세션id) 스트링 형태로 가져온다.
				UserVO user = service.getUserWithSessionId(loginCookie.getValue());
				
				//DB에 동일한 세션ID가 존재한다면 세션에 유저 정보 저장
				if(user != null){
					session.setAttribute("login", user);
					System.out.println("세션 정보 : "+user);
					System.out.println("자동 로그인으로 세션 제작 완료!");
				}
			}
			
			return true;
		}
}
