package com.spring.mvc.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mvc.board.commons.PageVO;
import com.spring.mvc.board.commons.SearchVO;
import com.spring.mvc.board.model.BoardVO;
import com.spring.mvc.board.repository.IBoardMapper;

@Service
public class BoardService implements IBoardService {

	@Autowired
	private IBoardMapper mapper;
	
	@Override
	public List<BoardVO> getArticleList(PageVO paging, SearchVO search) {
		
		List<BoardVO> list = mapper.getArticleList(paging, search);
		
		for(BoardVO article : list ) {
			long now = System.currentTimeMillis();//현재 시간을 밀리초로 리턴하는 메서드, long 타입으로 리턴함
			long regTime = article.getRegDate().getTime();//각 게시물들을 시간을 밀리초로 읽어오기
			
			if(now - regTime < 60 * 60 * 24 * 1000) {
				article.setNewMark(true);
			}
		}
		
		return list;
	}
	
	@Override
	public void insert(BoardVO article) {
		mapper.insert(article);
	}

	@Override
	public BoardVO getArticle(int boardNo) {
		mapper.updateViewCnt(boardNo);
		return mapper.getArticle(boardNo);
	}

	@Override
	public void update(BoardVO article) {
		mapper.update(article);
	}

	@Override
	public void delete(int boardNo) {
		System.out.println("service= "+boardNo);
		mapper.replyDel(boardNo);
		mapper.delete(boardNo);
	}
	
	@Override
	public int countArticles(SearchVO search) {
		return mapper.countArticles(search);
	}
	
	

}









