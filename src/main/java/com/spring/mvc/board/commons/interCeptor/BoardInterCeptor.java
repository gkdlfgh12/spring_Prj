package com.spring.mvc.board.commons.interCeptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class BoardInterCeptor extends HandlerInterceptorAdapter{

	//게시판 입장시 체크
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
				
		HttpSession session = request.getSession();
		System.out.println("request.getSession() 에 뭐가 들어갔나? "+session);
		
		if(session.getAttribute("login") == null) {
			System.out.println("비로그인");
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원제 게시판입니다.'); history.go(-1);</script>");
			return false;
		}
		
		System.out.println("회원 인증 성공!");
		return true;
	}
	
}
