package com.spring.mvc.board.service;

import java.util.List;

import com.spring.mvc.board.commons.PageVO;
import com.spring.mvc.board.model.ReplyVO;

public interface IReplyService {

	//댓글 리스트 출력
	public List<ReplyVO> getReplyList(PageVO repage, int no);
	
	//조건에 해당하는 댓글 갯수 확인
	public int getRow(int no);
	
	//댓글 작성
	public int write(ReplyVO reply);
	
	//댓글 업데이트
	public void update(ReplyVO reply);
	
	//댓글 삭제
	public int delete(ReplyVO reply);
}
