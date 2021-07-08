package com.sushidoku.biz.payment;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement(name = "paymentList")
@XmlAccessorType(XmlAccessType.FIELD)
public class PaymentListVO {
	@XmlElement(name = "payment")
	private List<PaymentVO> paymentList;
	
	public List<PaymentVO>getPaymentList(){
		return paymentList;
	}
	
	public void setPaymentList(List<PaymentVO> paymentList) {
		this.paymentList = paymentList;
	}
}
