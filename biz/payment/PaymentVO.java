package com.sushidoku.biz.payment;

import java.sql.Date;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;

//VO(Value Object)
@XmlAccessorType(XmlAccessType.FIELD)
public class PaymentVO {
	@XmlAttribute
	private int seq;
	private int cart_no;
	private int menu_no;
	private String user_id;
	private String user_name;
	private String user_zipcode;
	private String user_faddr;
	private String user_laddr;
	private String user_tel;
	private String user_message;
	private String chk_info;
	private String credit;
	private String totalPrice;
	private Date payDate;
	private int quantity;
	
	private String name;
	private String info;
	private int price;
	private String imgname;
	private String type;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_zipcode() {
		return user_zipcode;
	}
	public void setUser_zipcode(String user_zipcode) {
		this.user_zipcode = user_zipcode;
	}
	public String getUser_faddr() {
		return user_faddr;
	}
	public void setUser_faddr(String user_faddr) {
		this.user_faddr = user_faddr;
	}
	public String getUser_laddr() {
		return user_laddr;
	}
	public void setUser_laddr(String user_laddr) {
		this.user_laddr = user_laddr;
	}
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	public String getUser_message() {
		return user_message;
	}
	public void setUser_message(String user_message) {
		this.user_message = user_message;
	}
	public String getChk_info() {
		return chk_info;
	}
	public void setChk_info(String chk_info) {
		this.chk_info = chk_info;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public int getMenu_no() {
		return menu_no;
	}
	public void setMenu_no(int menu_no) {
		this.menu_no = menu_no;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImgname() {
		return imgname;
	}
	public void setImgname(String imgname) {
		this.imgname = imgname;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
