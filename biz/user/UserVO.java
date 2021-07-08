package com.sushidoku.biz.user;

import java.sql.Date;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;

//VO(Value Object)
@XmlAccessorType(XmlAccessType.FIELD)
public class UserVO {
	private String id;
	private String password;
	private String name;
	private String gender;
	private String tel;
	private String e_id;
	private String e_domain;
	private String zipcode;
	private String faddr;
	private String laddr;
	private Date regDate;
	
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", password=" + password + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getE_id() {
		return e_id;
	}

	public void setE_id(String e_id) {
		this.e_id = e_id;
	}

	public String getE_domain() {
		return e_domain;
	}

	public void setE_domain(String e_domain) {
		this.e_domain = e_domain;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getFaddr() {
		return faddr;
	}

	public void setFaddr(String faddr) {
		this.faddr = faddr;
	}

	public String getLaddr() {
		return laddr;
	}

	public void setLaddr(String laddr) {
		this.laddr = laddr;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

}
