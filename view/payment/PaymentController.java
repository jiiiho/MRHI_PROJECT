package com.sushidoku.view.payment;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.sushidoku.biz.cart.CartService;
import com.sushidoku.biz.cart.CartVO;
import com.sushidoku.biz.payment.PaymentService;
import com.sushidoku.biz.payment.PaymentVO;
import com.sushidoku.biz.user.UserVO;

@Controller
@SessionAttributes("payment")
public class PaymentController {
	@Autowired
	private CartService cartService;
	
	@Autowired
	private PaymentService paymentService;

	// 결제목록 갱신
	@RequestMapping(value="/insertPayment.do")
	public String insertPayment(@RequestParam(value="menu_list") List<String> menu_list, PaymentVO vo) {
		for(int i = 0; i < menu_list.size(); i += 3) {
			vo.setCart_no(Integer.parseInt(menu_list.get(i)));
			vo.setMenu_no(Integer.parseInt(menu_list.get(i+1)));
			vo.setQuantity(Integer.parseInt(menu_list.get(i+2)));
			
			paymentService.insertPayment(vo);
		}
		return "index.jsp";
	}
	
	@RequestMapping("/deletePaymentCart.do")
	public String deleteCart(CartVO vo) throws IOException{
		System.out.println("장바구니 삭제  처리");
		
		cartService.deleteCart(vo);
		return "payment.do";
	}
	
	@RequestMapping("/deletePayment.do")
	public String deletePayment(PaymentVO vo, HttpSession session) throws IOException{
		paymentService.deletePayment(vo);
		
		UserVO uvo = (UserVO) session.getAttribute("user");
		String id = uvo.getId();
		
		if(id.equals("admin"))
			return "payment.do";
		else
			return "cart.do";
	}
	
	@RequestMapping("/payment.do")
	public String getCartList(PaymentVO pvo, CartVO cvo, HttpSession session, Model model) {
		System.out.println("글 목록 검색 처리");
		
		model.addAttribute("cartList", cartService.getCartList(cvo));
		model.addAttribute("paymentList", paymentService.getPaymentList(pvo));

		return "payment.jsp";
	}
}
