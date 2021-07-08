package com.sushidoku.biz.inquiry.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sushidoku.biz.inquiry.InquiryService;
import com.sushidoku.biz.inquiry.InquiryVO;

@Service("inquiryService")
public class InquiryServiceImpl implements InquiryService {
	@Autowired
	private InquiryDAO inquiryDAO;
	
	public void insertInquiry(InquiryVO vo) {
		inquiryDAO.insertInquiry(vo);
	}
	
	public void deleteInquiry(InquiryVO vo) {
		inquiryDAO.deleteInquiry(vo);
	}
	
	public InquiryVO getInquiry(InquiryVO vo) {
		return inquiryDAO.getInquiry(vo);
	}
	
	public List<InquiryVO> getInquiryList(InquiryVO vo){
		return inquiryDAO.getInquiryList(vo);
	}
}
