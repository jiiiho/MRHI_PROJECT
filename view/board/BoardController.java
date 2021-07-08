package com.sushidoku.view.board;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.sushidoku.biz.board.BoardService;
import com.sushidoku.biz.board.BoardVO;
import com.sushidoku.biz.common.PagingVO;

@Controller
@SessionAttributes("board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	/*@RequestMapping("/dataTransform.do")
	@ResponseBody
	public BoardListVO dataTransform(BoardVO vo){
		vo.setSearchCondition("TITLE");
		vo.setSearchKeyword("");
		List<BoardVO> boardList = boardService.getBoardList(vo);
		BoardListVO boardListVO = new BoardListVO();
		boardListVO.setBoardList(boardList);
		return boardListVO;
	}*/
	
	// 검색 조건 목록 설정
	/*@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		return conditionMap;
	}*/
	
	// 글 등록
	@RequestMapping("/insertBoard.do")
	public String insertBoard(BoardVO vo) throws IOException{
		System.out.println("글 등록  처리");
		
		boardService.insertBoard(vo);
		return "notice.do";
	}
	
	// 글 수정
	@RequestMapping("/updateBoard.do")
	public String updateBoard(@ModelAttribute("board") BoardVO vo) {
		System.out.println("글 수정 처리");
		
		// 3. 화면 네비게이션
		boardService.updateBoard(vo);
		return "notice.do";
	}
	
	// 글 삭제
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo) {
		System.out.println("글 삭제 처리");

		// 3. 화면 네비게이션
		boardService.deleteBoard(vo);
		return "notice.do";
	}
	
	// 글 상세 조회
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, Model model) {
		System.out.println("글 상세 조회 처리");

		// 3. 검색 결과를 세션에 저장하고 상세 화면을 리턴
		model.addAttribute("board", boardService.getBoard(vo));
		return "getBoard.jsp";
	}
	
	// 글 목록 검색
	/*@RequestMapping("/notice.do")
	public String getBoardList(BoardVO vo, Model model) {
		System.out.println("글 목록 검색 처리");
		
		// NULL CHECK
		if(vo.getSearchCondition() == null)
			vo.setSearchCondition("TITLE");
		if(vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");

		// MODEL 정보 저장
		model.addAttribute("boardList", boardService.getBoardList(vo));
		return "notice.jsp";
	}*/
	
	// 글 목록 검색
	@RequestMapping("/notice.do")
	public String getList(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = boardService.getBoardListCnt();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("boardList", boardService.getList(vo));
		return "notice.jsp";
	}
}
