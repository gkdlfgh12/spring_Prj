package com.spring.mvc.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mvc.board.commons.PageVO;
import com.spring.mvc.board.model.ReplyVO;
import com.spring.mvc.board.repository.IReplyMapper;

@Service
public class ReplyService implements IReplyService{
	
	@Autowired
	private IReplyMapper mapper;

	@Override
	public List<ReplyVO> getReplyList(PageVO repage, int no) {
		//전체 데이터를 가져오기 위해서 getRow()가 필요
		
		//mybatis에서는 데이터를 한개만 받도록 설계됨
		Map<String, Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("repage",repage);
		pageInfo.put("no",no);

		return mapper.getReplyList(pageInfo);
	}
	
	@Override
	public int getRow(int no) {
		return mapper.getCount(no);
	}

	@Override
	public int write(ReplyVO reply) {
		System.out.println(reply+"log 확인");
		return mapper.write(reply);
	}

	@Override
	public void update(ReplyVO reply) {
		//mapper.update(reply);
		mapper.update(reply);
	}

	@Override
	public int delete(ReplyVO reply) {
		return mapper.delete(reply);
	}
	
}
