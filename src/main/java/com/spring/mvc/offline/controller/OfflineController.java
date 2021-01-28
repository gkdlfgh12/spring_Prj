package com.spring.mvc.offline.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/off")
@Controller
public class OfflineController {

	
	//오프라인 매장 보기
	@GetMapping("/load")
	public String offline() {
			
		return "/offline/offline_load";
	}
	
}
