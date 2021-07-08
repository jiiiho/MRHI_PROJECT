package com.sushidoku.view.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sushidoku.biz.user.UserService;
import com.sushidoku.biz.user.UserVO;

@Controller
public class LoginController{
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginView(UserVO vo) {
		return "login.jsp";
	}

	// 로그인
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(UserVO vo, Model model, HttpSession session) {
		UserVO user = userService.login(vo);
		
		if (user != null) {
			session.setAttribute("user", user);
			return "index.jsp";
		} else {
			model.addAttribute("check", 1);
			model.addAttribute("message", "아이디와 비밀번호를 확인해주세요.");
			return "login.jsp";
		}
	}
}
