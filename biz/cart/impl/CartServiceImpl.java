package com.sushidoku.biz.cart.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sushidoku.biz.cart.CartService;
import com.sushidoku.biz.cart.CartVO;

@Service("cartService")
public class CartServiceImpl implements CartService{
	@Autowired
	private CartDAO cartDAO;
	
	public void insertCart(CartVO vo) {
		cartDAO.insertCart(vo);
	}
	
	public void updateCart(CartVO vo) {
		cartDAO.updateCart(vo);
	}
	
	public void deleteCart(CartVO vo) {
		cartDAO.deleteCart(vo);
	}
	
	public void deleteAll(CartVO vo) {
		cartDAO.deleteAll(vo);
	}
	
	public CartVO getCart(CartVO vo) {
		return cartDAO.getCart(vo);
	}
	
	public List<CartVO> getCartList(CartVO vo){
		return cartDAO.getCartList(vo);
	}
}
