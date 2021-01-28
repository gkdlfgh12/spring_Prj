package com.spring.mvc.board.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.mvc.board.commons.PageVO;
import com.spring.mvc.board.commons.SearchVO;
import com.spring.mvc.board.model.BoardVO;

public interface IBoardMapper {

	//게시글 등록 기능
	void insert(BoardVO article);
	
	//게시글 상세 조회 기능
	BoardVO getArticle(int boardNo);
	
	//게시물 조회수 상승 처리
	void updateViewCnt(int boardNo);
	
	//게시글 수정 기능
	void update(BoardVO article);
	
	//게시글 삭제 기능
	void delete(int boardNo);
	//게시글 삭제에 따른 댓글 삭제
	void replyDel(int boardNo);
	
	//게시글 목록 조회 기능
	List<BoardVO> getArticleList(@Param("paging") PageVO paging, @Param("search") SearchVO search);
	
	//총 게시물의 개수를 구하는 메서드
	int countArticles(@Param("search") SearchVO search);
	
}























