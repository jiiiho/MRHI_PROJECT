package com.sushidoku.biz.cart;

import java.util.List;

public interface CartService {
	//CRUD 기능의 메소드 구현
	// 글 등록
	void insertCart(CartVO vo);
	
	void updateCart(CartVO vo);
	
	// 글 삭제
	void deleteCart(CartVO vo);
	
	// 글 삭제
	void deleteAll(CartVO vo);
	
	// 글 상세 조회
	CartVO getCart(CartVO vo);
		
	// 글 목록 조회
	List<CartVO> getCartList(CartVO vo);
}
