package com.sushidoku.biz.payment.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sushidoku.biz.payment.PaymentService;
import com.sushidoku.biz.payment.PaymentVO;

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService{
	@Autowired
	private PaymentDAO paymentDAO;

	public void insertPayment(PaymentVO vo) {
		paymentDAO.insertPayment(vo);
	}
	
	public void deletePayment(PaymentVO vo) {
		paymentDAO.deletePayment(vo);
	}
	
	public List<PaymentVO> getPaymentList(PaymentVO vo){
		return paymentDAO.getPaymentList(vo);
	}
}
