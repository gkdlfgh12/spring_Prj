package com.spring.mvc.board.repository;

import java.util.List;
import java.util.Map;

import com.spring.mvc.board.model.ReplyVO;

public interface IReplyMapper {
		// 등록 기능
		int write(ReplyVO reply);
		
		// 수정 기능
		void update(ReplyVO reply);
		
		// 삭제 기능
		int delete(ReplyVO reply);
		
		// 목록 조회 기능
		List<ReplyVO> getReplyList(Map<String, Object> pageInfo);
		
		//총 게시물의 개수를 구하는 메서드
		int getCount(int no);
}
