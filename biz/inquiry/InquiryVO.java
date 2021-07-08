package com.sushidoku.biz.inquiry;

import java.sql.Date;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;

//VO(Value Object)
@XmlAccessorType(XmlAccessType.FIELD)
public class InquiryVO {
	@XmlAttribute
	private int seq;
	private String title;
	private String writer;
	private String tel;
	private String email;
	private String type;
	private String content;
	private Date regDate;
	
	@Override
	public String toString() {
		return "InquiryVO [seq=" + seq + ", title=" + title + ", writer=" + writer + ", tel=" + tel + ", email=" + email + ", type=" + type + ", content=" + content + ", regDate=" + regDate + "]";
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}
