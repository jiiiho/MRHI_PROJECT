package com.sushidoku.biz.cart.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sushidoku.biz.cart.CartVO;

@Repository
public class CartDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertCart(CartVO vo) {
		System.out.println("==> Mybatis로 insertCart() 기능 처리");
		mybatis.insert("CartDAO.insertCart", vo);
	}
	
	public void updateCart(CartVO vo) {
		System.out.println("==> Mybatis로 updateCart() 기능 처리");
		mybatis.update("CartDAO.updateCart",vo);
	}
	
	public void deleteCart(CartVO vo) {
		System.out.println("==> Mybatis로 deleteCart() 기능 처리");
		mybatis.delete("CartDAO.deleteCart", vo);
	}
	
	public void deleteAll(CartVO vo) {
		System.out.println("==> Mybatis로 deleteAll() 기능 처리");
		mybatis.delete("CartDAO.deleteAll", vo);
	}
	
	public CartVO getCart(CartVO vo) {
		System.out.println("==> Mybatis로 getCart() 기능 처리");
		return (CartVO) mybatis.selectOne("CartDAO.getCart",vo);
	}
	
	public List<CartVO> getCartList(CartVO vo){
		System.out.println("==> Mybatis로 getCartList() 기능 처리");
		return mybatis.selectList("CartDAO.getCartList", vo);
	}
}
