package com.sushidoku.biz.user;

public interface UserService {
	
	// ID 중복확인
	UserVO checkId(String id);
	
	UserVO forgotID(UserVO vo);
	
	UserVO forgotPW(UserVO vo);
	
	void updatePassword(UserVO vo);
	
	// 회원가입
	void insertUser(UserVO vo);
	
	// 회원정보 수정
	void updateUser(UserVO vo);
	
	// 회원정보 삭제
	void deleteUser(UserVO vo);
	
	// 로그인
	UserVO login(UserVO vo);
}
