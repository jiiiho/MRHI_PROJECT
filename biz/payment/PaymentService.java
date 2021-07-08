package com.sushidoku.biz.payment;

import java.util.List;

public interface PaymentService {
	//CRUD 기능의 메소드 구현
	// 글 등록
	void insertPayment(PaymentVO vo);
	
	void deletePayment(PaymentVO vo);
	
	List<PaymentVO> getPaymentList(PaymentVO vo);
}
