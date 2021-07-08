package com.sushidoku.view.menu;
import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.sushidoku.biz.menu.MenuService;
import com.sushidoku.biz.menu.MenuVO;

@Controller
@SessionAttributes("menu")
public class MenuController {
	@Autowired
	private MenuService menuService;
	
	// 글 등록
	@RequestMapping("/insertMenu.do")
	public String insertMenu(MenuVO vo) throws IOException{
		System.out.println("메뉴 등록  처리");
		
		// File Upload 처리
		MultipartFile uploadFile = vo.getUploadFile();
		String path = vo.getImgname();
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File("C:/sts-bundle/stswk/BoardWeb/src/main/webapp/" + path));
		}
		
		menuService.insertMenu(vo);
		return "menu.do";
	}
	
	// 글 수정
	@RequestMapping("/updateMenu.do")
	public String updateMenu(@ModelAttribute("menu") MenuVO vo) {
		System.out.println("글 수정 처리");
		
		//  화면 네비게이션
		menuService.updateMenu(vo);
		return "menu.do";
	}
	
	// 글 삭제
	@RequestMapping("/deleteMenu.do")
	public String deleteMenu(MenuVO vo) {
		System.out.println("글 삭제 처리");

		// 3. 화면 네비게이션
		menuService.deleteMenu(vo);
		return "menu.do";
	}
	
	// 글 상세 조회
	@RequestMapping("/getMenu.do")
	public String getMenu(MenuVO vo, Model model) {
		System.out.println("글 상세 조회 처리");

		// 3. 검색 결과를 세션에 저장하고 상세 화면을 리턴
		model.addAttribute("menu", menuService.getMenu(vo));
		return "getMenu.jsp";
	}
	
	// 글 목록 검색
	@RequestMapping("/menu.do")
	public String getMenuList(MenuVO vo, Model model) {
		System.out.println("글 목록 검색 처리");
		
		// MODEL 정보 저장
		model.addAttribute("menuList", menuService.getMenuList(vo));
		return "menu.jsp";
	}
}