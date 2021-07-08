package com.sushidoku.biz.user.impl;

import org.bouncycastle.jcajce.provider.digest.SHA3;
import org.bouncycastle.util.encoders.Hex;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sushidoku.biz.user.UserService;
import com.sushidoku.biz.user.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDAO userDAO;
	
	// 패스워드 암호화
	public void securityPW(UserVO vo) {
		SHA3.DigestSHA3 digestSHA3 = new SHA3.DigestSHA3(512);
		byte[] digest = digestSHA3.digest(vo.getPassword().getBytes());
		String securitypw = Hex.toHexString(digest);
		vo.setPassword(securitypw);
	}
	
	public void imsiPW(UserVO vo) {
		char[] charSet = new char[] { 
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 
				'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
				'U', 'V', 'W', 'X', 'Y', 'Z' };
		int idx = 0;
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 10; i++) {
			idx = (int) (charSet.length * Math.random());
			sb.append(charSet[idx]);
		}
		String imPW = sb.toString();
	}
	
	@Override
	public UserVO checkId(String id) {
		return userDAO.checkId(id);
	}
	
	@Override
	public UserVO forgotID(UserVO vo) {
		return userDAO.forgotID(vo);
	}

	@Override
	public UserVO forgotPW(UserVO vo) {
		return userDAO.forgotPW(vo);
	}
	
	@Override
	public void updatePassword(UserVO vo) {
		securityPW(vo);
		userDAO.updatePassword(vo);
	}
	
	// 회원가입
	public void insertUser(UserVO vo) {
		securityPW(vo);
		userDAO.insertUser(vo);
	}
	
	public void updateUser(UserVO vo) {
		securityPW(vo);
		userDAO.updateUser(vo);
	}
	
	public void deleteUser(UserVO vo) {
		userDAO.deleteUser(vo);
	}

	// 로그인
	public UserVO login(UserVO vo) {
		securityPW(vo);
		return userDAO.login(vo);
	}
}
