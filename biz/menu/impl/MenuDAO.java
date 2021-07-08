package com.sushidoku.biz.menu.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sushidoku.biz.menu.MenuVO;

@Repository
public class MenuDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertMenu(MenuVO vo) {
		System.out.println("==> Mybatis로 insertMenu() 기능 처리");
		mybatis.insert("MenuDAO.insertMenu", vo);
	}
	
	public void updateMenu(MenuVO vo) {
		System.out.println("==> Mybatis로 updateMenu() 기능 처리");
		mybatis.update("MenuDAO.updateMenu",vo);
	}
	
	public void deleteMenu(MenuVO vo) {
		System.out.println("==> Mybatis로 deleteMenu() 기능 처리");
		mybatis.delete("MenuDAO.deleteMenu", vo);
	}
	
	public MenuVO getMenu(MenuVO vo) {
		System.out.println("==> Mybatis로 getMenu() 기능 처리");
		return (MenuVO) mybatis.selectOne("MenuDAO.getMenu",vo);
	}
	
	public List<MenuVO> getMenuList(MenuVO vo){
		System.out.println("==> Mybatis로 getMenuList() 기능 처리");
		return mybatis.selectList("MenuDAO.getMenuList", vo);
	}
}
