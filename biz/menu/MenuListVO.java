package com.sushidoku.biz.menu;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "menuList")
@XmlAccessorType(XmlAccessType.FIELD)
public class MenuListVO {
	
	@XmlElement(name = "menu")
	private List<MenuVO> menuList;
	
	public List<MenuVO>getMenuList(){
		return menuList;
	}
	
	public void setMenuList(List<MenuVO> menuList) {
		this.menuList = menuList;
	}
}
