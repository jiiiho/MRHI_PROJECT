package com.sushidoku.biz.inquiry.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sushidoku.biz.inquiry.InquiryVO;

@Repository
public class InquiryDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertInquiry(InquiryVO vo) {
		System.out.println("==> Mybatis로 insertInquiry() 기능 처리");
		mybatis.insert("InquiryDAO.insertInquiry", vo);
	}
	
	public void deleteInquiry(InquiryVO vo) {
		System.out.println("==> Mybatis로 deleteInquiry() 기능 처리");
		mybatis.delete("InquiryDAO.deleteInquiry", vo);
	}
	
	public InquiryVO getInquiry(InquiryVO vo) {
		System.out.println("==> Mybatis로 getInquiry() 기능 처리");
		return (InquiryVO) mybatis.selectOne("InquiryDAO.getInquiry",vo);
	}
	
	public List<InquiryVO> getInquiryList(InquiryVO vo){
		System.out.println("==> Mybatis로 getInquiryList() 기능 처리");
		return mybatis.selectList("InquiryDAO.getInquiryList", vo);
	}
}
