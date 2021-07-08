package com.sushidoku.view.inquiry;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.sushidoku.biz.inquiry.InquiryService;
import com.sushidoku.biz.inquiry.InquiryVO;

@Controller
@SessionAttributes("inquiry")
public class InquiryController {
	@Autowired
	private InquiryService inquiryService;

	@RequestMapping("/insertInquiry.do")
	public String insertInquiry(InquiryVO vo) throws IOException{
		System.out.println("글 등록  처리");
		
		inquiryService.insertInquiry(vo);
		return "inquiry.do";
	}
	
	@RequestMapping("/deleteInquiry.do")
	public String deleteInquiry(InquiryVO vo) throws IOException{
		System.out.println("글 등록  처리");
		
		inquiryService.deleteInquiry(vo);
		return "inquiry.do";
	}
	
	// 글 상세 조회
	@RequestMapping("/getInquiry.do")
	public String getInquiry(InquiryVO vo, Model model) {
		System.out.println("글 상세 조회 처리");

		// 3. 검색 결과를 세션에 저장하고 상세 화면을 리턴
		model.addAttribute("inquiry", inquiryService.getInquiry(vo));
		return "inquiry.jsp";
	}
	
	@RequestMapping("/inquiry.do")
	public String getInquiryList(InquiryVO vo, Model model) {
		System.out.println("글 목록 검색 처리");
		
		model.addAttribute("inquiryList", inquiryService.getInquiryList(vo));
		return "inquiry.jsp";
	}
}
