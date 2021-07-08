package com.sushidoku.biz.menu;

import java.util.List;

public interface MenuService {
	//CRUD 기능의 메소드 구현
	// 글 등록
	void insertMenu(MenuVO vo);
	
	// 글 수정
	void updateMenu(MenuVO vo);
	
	// 글 삭제
	void deleteMenu(MenuVO vo);
	
	// 글 상세 조회
	MenuVO getMenu(MenuVO vo);
	
	// 글 목록 조회
	List<MenuVO> getMenuList(MenuVO vo);
}
