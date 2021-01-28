package com.spring.mvc.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.mvc.admin.commons.UserPageCreator;
import com.spring.mvc.admin.commons.UserPageVO;
import com.spring.mvc.admin.model.UserVO;
import com.spring.mvc.admin.service.IAdminService;



@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	IAdminService service;
	
	//유저 리스트
	@GetMapping("/user")
	public String userManage(UserPageVO userPaging, Model model) {
		
		System.out.println(userPaging.getCondition()+userPaging.getKeyword());
		
		//List<UserVO> users= service.userManage();
		List<UserVO> list = service.userManage(userPaging);
		
		UserPageCreator upc = new UserPageCreator();
		upc.setPaging(userPaging);
		upc.setArticleTotalCount(service.countUser(userPaging));
		System.out.println("리스트 목록 화긴이요"+list);
		System.out.println("리스트 갯수우~~"+service.countUser(userPaging));
		model.addAttribute("list",list);
		model.addAttribute("upc",upc);
		model.addAttribute("uservo",userPaging);
		
		return "/admin/user_manage/user";
	}
	
	//유저 상세보기
	@GetMapping("/user/content")
	public String usercontent(UserVO user, Model model, UserPageVO userPaging) {
		model.addAttribute("user",service.userContent(user));
		model.addAttribute("uservo",userPaging);
		
		return "/admin/user_manage/content";
	}
	
	//유저정보 변경
	@GetMapping("/user/update")
	public String userUpdate(UserVO user, RedirectAttributes ra) {
		System.out.println("여기는 admincontroller 의 정보"+user);
		ra.addFlashAttribute("suc","success");
		service.userChange(user);
		
		return "redirect:/admin/user/content?account="+user.getAccount();
	}
	
	
}
