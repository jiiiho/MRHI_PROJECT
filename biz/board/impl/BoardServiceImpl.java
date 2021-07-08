package com.sushidoku.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sushidoku.biz.board.BoardService;
import com.sushidoku.biz.board.BoardVO;
import com.sushidoku.biz.common.PagingVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDAOMybatis boardDAO;

	public void insertBoard(BoardVO vo) {
		boardDAO.insertBoard(vo);
	}
	
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
	}
	
	public void deleteBoard(BoardVO vo) {
		boardDAO.deleteBoard(vo);
	}
	
	public BoardVO getBoard(BoardVO vo) {
		return boardDAO.getBoard(vo);
	}
	
	/*public List<BoardVO> getBoardList(BoardVO vo){
		return boardDAO.getBoardList(vo);
	}*/
	
	public List<BoardVO> getList(PagingVO vo){
		return boardDAO.getList(vo);
	}
	
	public int getBoardListCnt() {
		return boardDAO.getBoardListCnt();
	}
}
