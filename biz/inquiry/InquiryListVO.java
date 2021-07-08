package com.sushidoku.biz.inquiry;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "inquiryList")
@XmlAccessorType(XmlAccessType.FIELD)
public class InquiryListVO {
	@XmlElement(name = "inquiry")
	private List<InquiryVO> inquiryList;
	
	public List<InquiryVO>getInquiryList(){
		return inquiryList;
	}
	
	public void setInquiryList(List<InquiryVO> inquiryList) {
		this.inquiryList = inquiryList;
	}
}
