package com.sushidoku.view.cart;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.sushidoku.biz.cart.CartService;
import com.sushidoku.biz.cart.CartVO;
import com.sushidoku.biz.payment.PaymentService;
import com.sushidoku.biz.payment.PaymentVO;
import com.sushidoku.biz.user.UserVO;

@Controller
@SessionAttributes("cart")
public class CartController {
	@Autowired
	private CartService cartService;
	
	@Autowired
	private PaymentService paymentService;

	@RequestMapping("/insertCart.do")
	public String insertCart(CartVO vo) throws IOException{
		System.out.println("글 등록  처리");
		
		cartService.insertCart(vo);
		return "menu.do";
	}
	
	@RequestMapping("/updateCart.do")
	public String updateCart(CartVO vo) throws IOException{
		System.out.println("글 등록  처리");
		
		cartService.updateCart(vo);
		return "cart.do";
	}
	
	@RequestMapping("/deleteCart.do")
	public String deleteCart(CartVO vo) throws IOException{
		System.out.println("장바구니 삭제  처리");
		
		cartService.deleteCart(vo);
		return "cart.do";
	}
	
	@RequestMapping("/deleteAll.do")
	public String deleteAll(CartVO vo, HttpSession session) throws IOException{
		System.out.println("장바구니 삭제  처리");
		
		UserVO uvo = (UserVO) session.getAttribute("user");
		String id = uvo.getId();
		vo.setId(id);
		
		cartService.deleteAll(vo);
		return "index.jsp";
	}
	
	// 글 상세 조회
	@RequestMapping("/getCart.do")
	public String getCart(CartVO vo, Model model) {
		System.out.println("글 상세 조회 처리");

		// 3. 검색 결과를 세션에 저장하고 상세 화면을 리턴
		model.addAttribute("cart", cartService.getCart(vo));
		return "cart.do";
	}
	
	@RequestMapping("/cart.do")
	public String getCartList(CartVO cvo, PaymentVO pvo, Model model) {
		System.out.println("글 목록 검색 처리");
		
		model.addAttribute("cartList", cartService.getCartList(cvo));
		model.addAttribute("paymentList", paymentService.getPaymentList(pvo));
		return "cart.jsp";
	}
}
