package com.sushidoku.biz.cart;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import com.sushidoku.biz.cart.CartVO;


@XmlRootElement(name = "cartList")
@XmlAccessorType(XmlAccessType.FIELD)
public class CartListVO {
	@XmlElement(name = "cart")
	private List<CartVO> cartList;
	
	public List<CartVO>getCartList(){
		return cartList;
	}
	
	public void setCartList(List<CartVO> cartList) {
		this.cartList = cartList;
	}
}
