package com.sushidoku.view.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sushidoku.biz.user.UserService;
import com.sushidoku.biz.user.UserVO;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;

	// ID 중복확인	
	@RequestMapping(value = "/checkId.do")
	public String checkIdFormView(@RequestParam(value = "id", defaultValue = "", required = false) String id, Model model) {
		model.addAttribute("id", id);
		return "checkId.jsp";
	}
	
	// 아이디 찾기 페이지 이동
	@RequestMapping(value="forgorID_form")
	public String findIdView() {
		return "forgorID.jsp";
	}
		
    // 아이디 찾기 실행
	@RequestMapping(value="/forgotID.do", method=RequestMethod.POST)
	public String forgotID(UserVO vo, Model model) {
		UserVO user = userService.forgotID(vo);
		
		if(user == null) { 
			model.addAttribute("check", 1);
		} else { 
			model.addAttribute("check", 0);
			model.addAttribute("id", user.getId());
		}
		
		return "forgotID.jsp";
	}
		
    // 비밀번호 찾기 페이지로 이동
	@RequestMapping(value="find_password_form")
	public String findPasswordView() {
		return "member/findPassword";
	}
		
    // 비밀번호 찾기 실행
	@RequestMapping(value="/forgotPW.do", method=RequestMethod.POST)
	public String forgotPW(UserVO vo, Model model) {
		UserVO user = userService.forgotPW(vo);
		
		if(user == null) { 
			model.addAttribute("check", 1);
		} else { 
			model.addAttribute("check", 0);
			model.addAttribute("updateid", user.getId());
		}
		
		return "forgotPW.jsp";
	}
	
	// 비밀번호 바꾸기 실행
	@RequestMapping(value="updatePassword.do", method=RequestMethod.POST)
	public String updatePasswordAction(@RequestParam(value="updateid", defaultValue="", required=false) String id,
											UserVO vo) {
		vo.setId(id);
		System.out.println(vo);
		userService.updatePassword(vo);
		return "login.jsp";
	}
	
	@RequestMapping(value = "/checkId.do", method = RequestMethod.POST)
	public String checkIdAction(HttpServletRequest request, Model model, UserVO user) {
		String id = request.getParameter("id");
		UserVO vo = userService.checkId(id);
		
		if(vo == null) {
			model.addAttribute("check", 0);
		}else {
			model.addAttribute("check", 1);
			model.addAttribute("message", "아이디가 존재합니다 !");
		}
		
		model.addAttribute("id", id);
		return "checkId.jsp";
	}
	
	// 회원가입
	@RequestMapping("/register.do")
	public String register(UserVO vo) {
		System.out.println("가입 성공....");
		
		userService.insertUser(vo);
		return "index.jsp";
	}	
	
	// 회원정보 수정
	@RequestMapping("/updateUser.do")
	public String updateUser(@ModelAttribute("user") UserVO vo) {
		System.out.println("회원정보 수정 처리");
		
		// 3. 화면 네비게이션
		userService.updateUser(vo);
		return "index.jsp";
	}
	
	// 회원 탈퇴
	@RequestMapping("/deleteUser.do")
	public String deleteUser(UserVO vo, HttpSession session) {
		System.out.println("회원 삭제 처리");
			// 3. 화면 네비게이션
		userService.deleteUser(vo);
		session.invalidate();
		return "index.jsp";
	}
}
