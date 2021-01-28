package com.spring.mvc.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.spring.mvc.user.commons.email.MailSendService;
import com.spring.mvc.user.model.UserVO;
import com.spring.mvc.user.service.IUserService;

@RestController
@RequestMapping("/user")
public class RestUserController {

	@Autowired
	MailSendService mss;
	@Autowired
	IUserService service;
	
	//유저 마이페이지로 이동
	@GetMapping("/mypage")
	public ModelAndView Mypage(@RequestParam("account") String account) {
		
		UserVO userInfo = service.myPage(account);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("userInfo",userInfo);
		mav.setViewName("users/mypage");
		return mav;
	}
	
	//유저 마이페이지에서 변경 페이지로
	@GetMapping("/mypageChForm")
	public ModelAndView MypageChForm(@RequestParam("account") String account) {
				
		ModelAndView mav = new ModelAndView();
		UserVO userInfo = service.myPage(account);
		mav.addObject("userInfo", userInfo);
		//System.out.println("여기는 마패첸폼 : "+userVO);
		mav.setViewName("users/mypage_change");
		return mav;
	}
	
	//유저 마이페이지에서 변경 페이지로
	@GetMapping("/mypageChAction")
	public ModelAndView MypageChAction(UserVO userVO) {
		
		ModelAndView mav = new ModelAndView();
		System.out.println("여기는 마패첸액션(전) : "+userVO);
		service.userChInfo(userVO);
		
		System.out.println("여기는 마패첸액션 : "+userVO);
		mav.setViewName("redirect:/user/mypage?account="+userVO.getAccount());
		
		return mav;
	}
	
	//회원 탈퇴
	@GetMapping("/memWithdrawal")
	public ModelAndView memWithdrawal(@RequestParam("account") String account, RedirectAttributes ra, HttpServletResponse response) throws IOException {
		
		ModelAndView mav = new ModelAndView();
		service.memWithdrawal(account);
		
		mav.setViewName("redirect:/user/logout");
		
		return mav;
	}
	
	//id 중복 체크
	@PostMapping("/idCheck")
	public String idCheck(@RequestBody String account) {
		
		int checkNum = service.idCheck(account);
		if(checkNum == 1) {
			return "NO";
		}else {
			return "OK";
		}
		
	}
	
	//이메일 중복 체크
	@PostMapping("/emailCheck")
	public String emailCheck(@RequestBody String user_email) {
		
		if(service.emailCheck(user_email) == 1) {
			return "NO";
		}
		
		return "OK";
	}
	
	
	//회원가입
	@PostMapping("/register")
	public String register(@RequestBody UserVO user) {
		
		//이메일 전송 후, 인증 키 반환
		String authKey= mss.sendAuthMail(user.getUserEmail());
		user.setSetAuthKey(authKey);
		
		//회원등록
		service.register(user);
		
		return "joinSuccess";
	}
	
	
	//로그인
	@PostMapping("/loginCheck")
	public String loginCheck(@RequestBody UserVO inputData, HttpSession session, HttpServletResponse response) {
		
		String result = null;
		System.out.println("/user/loginCheck요청!: POST");
		System.out.println("param: " + inputData);
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		//encoder
		
		UserVO dbData = service.selectOne(inputData.getAccount());
		System.out.println(dbData.getUserGrade()); 
		if(dbData != null) {
			if(encoder.matches(inputData.getPassword(), dbData.getPassword())) {
				if(!dbData.getSetAuthKey().equals("YES")) {
				
					return "EmailCheckPls";
				}
				session.setAttribute("login", dbData);
				result = "loginSuccess";
				
				long limitTime = 60 * 60 * 24 * 90;
				
				//로그인시 자동로그인 체크를 했을 때 실행
				if(inputData.isAutoLogin()) {
					
					System.out.println("자동 로그인 쿠키 생성 중...");
				
					//이 코드는 서버가 생성한 세션 아이디에 경로와, 만료시간을 채운 후 쿠키에 담아 클라이언트에 보내준다.
					Cookie loginCookie = new Cookie("loginCookie",session.getId());
					
					//브라우저가 서버로 /또는 /하위 디렉터리로 요청하면 쿠키값을 전달해주게 설정한 것 (브라우저->서버)
					loginCookie.setPath("/");
					loginCookie.setMaxAge((int) limitTime);
					response.addCookie(loginCookie);
					
					//로그인 유지 시간을 현재 시간과 더하기 위해서 밀리초로 바꾼 후 
					//로그인 유지 시간을 밀리초로 구하고 그 값을 날짜로 재변경
					long expiredDate = System.currentTimeMillis() + (limitTime * 1000);
					Date limitDate = new Date(expiredDate);
					
					service.keepLogin(session.getId(), limitDate, inputData.getAccount());
					
				}
				
			} else {
				result = "pwFail";
			}
		} else {
			result = "idFail";
		}
		return result;
	}
	
	
	//로그아웃 처리
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
			
		System.out.println("/user/logout 요청!");
		UserVO vo = (UserVO) session.getAttribute("login");
		
		if(vo != null) {
			session.removeAttribute("login");
			session.invalidate();
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if(loginCookie != null){
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin("none", new Date(), vo.getAccount());
			}
			
		}
		return new ModelAndView("redirect:/");
	}
	
	//id찾기
	@PostMapping("/idfind")
	public String idfind(@RequestBody UserVO inputUser) {
		
		UserVO dbUser = service.findId(inputUser);
		//입력한 이메일, 이름과 db의 email, 이름을 비교후 정상이면 해당 이메일로 아이디 전송
		if(dbUser.getName().equals(inputUser.getName()) ) {
			if(dbUser.getUserEmail().equals(inputUser.getUserEmail())) {
				//여기서 이메일 전송
				mss.sendIdFindMail(dbUser.getUserEmail(), dbUser.getAccount());
				return "same";
			}
		}
		return "differnt";
		
	}
	
	//pw찾기
	@PostMapping("/pwfind")
	public String pwfind(@RequestBody UserVO inputUser) {
			
		UserVO dbUser = service.findPw(inputUser);
		//입력한 이메일, 이름과 db의 email, 이름을 비교후 정상이면 해당 이메일로 아이디 전송
		if(dbUser.getAccount().equals(inputUser.getAccount()) ) {
			if(dbUser.getUserEmail().equals(inputUser.getUserEmail())) {
				//여기서 이메일 전송
				dbUser.setPassword(mss.sendPwFindMail(dbUser.getUserEmail()));
				service.updateTmpPw(dbUser);
				return "same";
			}
		}
		return "differnt";
		}
	
	//회원가입 이메일 인증
	@GetMapping("/emailcheck")
	public ModelAndView emailcheck(UserVO inputUser) {
		
		UserVO dbUser = service.emailChSearch(inputUser);
		if(dbUser != null){
			service.emailChUpdate(inputUser);
			return new ModelAndView("redirect:/");
		}else {
			return new ModelAndView("redirect:/");
		}
		
	}
	
	
	
	
}
