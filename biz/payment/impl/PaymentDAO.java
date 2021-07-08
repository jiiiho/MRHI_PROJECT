package com.sushidoku.biz.payment.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sushidoku.biz.payment.PaymentVO;

@Repository
public class PaymentDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertPayment(PaymentVO vo) {
		System.out.println("==> Mybatis로 insertPayment() 기능 처리");
		mybatis.insert("PaymentDAO.insertPayment", vo);
	}
	
	public void deletePayment(PaymentVO vo) {
		System.out.println("==> Mybatis로 deletePayment() 기능 처리");
		mybatis.delete("PaymentDAO.deletePayment", vo);
	}
	
	public List<PaymentVO> getPaymentList(PaymentVO vo){
		System.out.println("==> Mybatis로 getPaymentList() 기능 처리");
		return mybatis.selectList("PaymentDAO.getPaymentList", vo);
	}
}
