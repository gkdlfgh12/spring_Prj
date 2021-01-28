package com.spring.mvc.user.commons.email;

import java.io.UnsupportedEncodingException;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

@Service
public class MailSendService {
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	private int size;
	
	private String getKey(int size) {
		this.size = size;
		return getAuthCode();
	}
	
	//이메일 회원가입 인증 코드
	private String getAuthCode() {
		
		Random random = new Random();
		StringBuffer buffer = new StringBuffer();
		int num=0;
		
		while(buffer.length() < size) {
			num = random.nextInt(10);
			buffer.append(num);
		}
		
		return buffer.toString();
	};
	
	//임시 비밀번호 생성
	private String getTmpPw() {
		
		Random random = new Random();
		StringBuffer buffer = new StringBuffer();
		int index;
		char password;
		
		//랜덤한 임시 비밀번호 생성	
		char[] charPw=new char[] {
				'0','1','2','3','4','5','6','7','8','9',
				'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'
		};
		
		char[] charSpPw=new char[] {
				'!','@','#','$','%','^','&','*','?','~','_'	
		};
		
			for(int i=0;i<8;i++) {
				index = random.nextInt(charPw.length);
				password = charPw[index];
				buffer.append(password);
			}
			for(int i=0;i<2;i++) {
				index = random.nextInt(charSpPw.length);
				password = charSpPw[index];
				buffer.append(password);
			}
			System.out.println("무한?" +buffer.toString());
			
		return buffer.toString();
	}

	//회원가입 인증 이메일
	public String sendAuthMail(String email) {
		//6자리 크기의 난수 생성
		String authKey = getKey(6);
		
		//인증메일 전송 + 키 값 리턴
		try{
			MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject("회원가입 이메일 인증");
			sendMail.setText(new StringBuffer().append("<h1>[MU 홈페이지 회원가입 이메일 인증]</h1>")
					.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
					.append("<a href='http://localhost/user/emailcheck?userEmail="+email)
		            //.append(email)
		            .append("&setAuthKey="+authKey)
		            //.append(authKey)
		            .append("'>이메일 인증 확인</a>")
		            .toString());
			sendMail.setFrom("emailAddress","admin");
			sendMail.setTo(email);
			sendMail.send();
			
		}catch(MessagingException e) {
			 e.printStackTrace();
		}catch(UnsupportedEncodingException e) {
			 e.printStackTrace();
		}
		
		return authKey;
	}
	
	//id찾기
	public void sendIdFindMail(String email, String account) {
		//인증메일 전송 + 키 값 리턴
		try{
			MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject("MU 홈페이지 아이디 전송");
			sendMail.setText(new StringBuffer().append("<h1>[MU 홈페이지 아이디]</h1>")
					.append("<p>회원님의 아이디</p>")
					.append("<p>ID : "+account+"</p>")
		            .append("<a>이메일 인증 확인</a>")
		            .toString());
			sendMail.setFrom("emailAddress","admin");
			sendMail.setTo(email);
			sendMail.send();
			
		}catch(MessagingException e) {
			 e.printStackTrace();
		}catch(UnsupportedEncodingException e) {
			 e.printStackTrace();
		}
	}
	
	//pw찾기
	public String sendPwFindMail(String email) {
		//인증메일 전송 + 키 값 리턴
		String tmpPw = getTmpPw();
		try{
			MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject("MU 홈페이지 임시 비밀번호 전송");
			sendMail.setText(new StringBuffer().append("<h1>[MU 홈페이지 임시 비밀번호]</h1>")
					.append("<p>회원님의 비밀번호</p>")
					.append("<p>임시 비밀번호 : "+tmpPw+"</p>")
		            .append("<a>이메일 인증 확인</a>")
		            .toString());
			sendMail.setFrom("emailAddress","admin");
			sendMail.setTo(email);
			sendMail.send();
		}catch(MessagingException e) {
			 e.printStackTrace();
		}catch(UnsupportedEncodingException e) {
			 e.printStackTrace();
		}
		
		return tmpPw;
	}
	
}
