package com.sushidoku.biz.inquiry;

import java.util.List;

public interface InquiryService {
	//CRUD 기능의 메소드 구현
	// 글 등록
	void insertInquiry(InquiryVO vo);
	
	void deleteInquiry(InquiryVO vo);
	
	// 글 상세 조회
	InquiryVO getInquiry(InquiryVO vo);
		
	// 글 목록 조회
	List<InquiryVO> getInquiryList(InquiryVO vo);
}
