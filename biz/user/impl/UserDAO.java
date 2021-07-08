package com.sushidoku.biz.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sushidoku.biz.user.UserVO;

// DAO(Data Access Object)
@Repository
public class UserDAO {
	// JDBC 관련 변수
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// ID 중복 확인
	public UserVO checkId(String id) {
		System.out.println("==> Mybatis로 checkId() 기능 처리");

		return (UserVO) mybatis.selectOne("UserDAO.checkId", id);
	}
	
	public UserVO forgotID(UserVO vo) {
		System.out.println("==> Mybatis로 forgotID() 기능 처리");
		return mybatis.selectOne("UserDAO.forgotID", vo);
	}

	public UserVO forgotPW(UserVO vo) {
		System.out.println("==> Mybatis로 forgotPW() 기능 처리");
		return mybatis.selectOne("UserDAO.forgotPW", vo);
	}
	
	public void updatePassword(UserVO vo) {
		System.out.println("==> Mybatis로 updatePassword() 기능 처리");
		mybatis.update("UserDAO.updatePassword", vo);
	}
	
	// 회원가입
	public void insertUser(UserVO vo) {
		mybatis.insert("UserDAO.insertUser", vo);
	}
	
	public void updateUser(UserVO vo) {
		mybatis.update("UserDAO.updateUser",vo);
	}
	
	public void deleteUser(UserVO vo) {
		mybatis.delete("UserDAO.deleteUser",vo);
	}
	
	// 로그인
	public UserVO login(UserVO vo) {
		return (UserVO) mybatis.selectOne("UserDAO.login", vo);
	}

}
