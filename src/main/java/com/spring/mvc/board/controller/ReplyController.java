package com.spring.mvc.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.mvc.board.commons.PageCreator;
import com.spring.mvc.board.commons.PageVO;
import com.spring.mvc.board.model.ReplyVO;
import com.spring.mvc.board.service.IReplyService;

@RestController
@RequestMapping("/ajax")
public class ReplyController {

	@Autowired
	private IReplyService service;
	
	//ResponseEntity : 데이터와 서버의 처리 상태를 함께 넘겨준다.
	
	@PostMapping(value="/replyWrite.do",		
			//헤더를 확인해서 contentType에 application/json가 붙어있는 넘을 찾는다!는 의미
			consumes = "application/json", 
			//리턴해 주는 타입은 MediaType.TEXT_PLAIN_VALUE로 정한다.
			produces = MediaType.TEXT_PLAIN_VALUE) //아래 리턴 값  Http...로 시작하는 리턴값의 타입을 지정
	//@ResponseBody와 의미는 똑같지만 흐름이 다르다. 서버쪽으로 데이터 그대로 처리
	//데이터를 그대로 받아서 처리하기 위해 (@RequestBody ReplyVO vo)로 선언  13-06강
	//@RequestBody 어노테이션을 이용하면 HTTP 요청 몸체를 자바 객체로 전달받을 수 있다.
	public ResponseEntity<String> write(@RequestBody ReplyVO vo){  //커맨드 객체가 안되나?
		//System.out.println(vo);
		
		int insertCount = service.write(vo);
		System.out.println("ajax 입력 리턴 값"+insertCount);
		
		
		return (insertCount == 1) //데이터와 함께 상태를 보내주는 것이 바로 ResponseEntity이다.
				? new ResponseEntity<String>("server.success.write",HttpStatus.OK) 
				: new ResponseEntity<String>("server.fail.write",HttpStatus.INTERNAL_SERVER_ERROR) 
					;
	}
	
	//댓글 리스트
	@GetMapping(value="/replyList.do",
			//헤더를 확인해서 contentType에 application/json가 붙어있는 넘을 찾는다!는 의미
			//consumes = "application/json", // get일때는 헤더를 확인 안하므로 필요 x
			produces = {MediaType.APPLICATION_XML_VALUE, //아래 리턴 값  Http...로 시작하는 리턴값의 타입을 지정
					MediaType.APPLICATION_JSON_UTF8_VALUE  //XML이나 JSON-UTF8로 데이터 타입을 정해서 리턴해 주겠다. 받는쪽에서는 XML이나 JSON으로 받는다.
					
					} 
	) 
	public Map<String, Object> list(PageVO repage, int no){ 
		System.out.println("ssssssssssssssssssssssssssss"+no);
		
		//댓글 list 뽑아오기
		List<ReplyVO> list = service.getReplyList(repage, no);
		
		//페이징을 위한 데이터 객체 생성
		PageCreator rpc = new PageCreator();
		rpc.setPaging(repage);
		rpc.setArticleTotalCount(service.getRow(no));
		
		Map<String, Object> remap = new HashMap<String, Object>();
		remap.put("rpc", rpc);
		remap.put("list", list);
		
		//return (list != null && list.size() >= 0 )//&& list.isEmpty()) //데이터와 함께 상태를 보내주는 것이 바로 ResponseEntity이다.
			//	? new ResponseEntity<>(remap, HttpStatus.OK)   //리턴 타입 비워나도 위에 리턴 타입이랑 매칭되서 적용됨
				//: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		return remap;
	}
	
	@RequestMapping(
			method= {RequestMethod.PUT, RequestMethod.PATCH},
			value = "/replyUpdate.do",
			consumes = "application/json",
			produces=MediaType.TEXT_PLAIN_VALUE
			)
	public void replyUpdate(@RequestBody ReplyVO reply) {
		
		System.out.println("여기는 replyupdate 입니다이 :  "+reply);
		service.update(reply);
		
	}
	
	@RequestMapping(
			method= {RequestMethod.DELETE},
			//consumes = "application/json",
			value="replyDelete.do"
			)
	public void replyDelete(@RequestBody ReplyVO reply) {
		service.delete(reply);
		
	}
	
}




















