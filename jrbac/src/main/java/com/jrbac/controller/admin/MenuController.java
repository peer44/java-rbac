package com.jrbac.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jrbac.context.Param;
import com.jrbac.context.SessionParam;
import com.jrbac.entity.LoginUser;
import com.jrbac.entity.Menu;
import com.jrbac.service.MenuService;

@Controller
@RequestMapping(value = "/admin/menu")
public class MenuController {
	@Autowired
	private MenuService menuService;

	/**
	 * 菜单管理
	 * 
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/index.html")
	public String index(Model model, HttpSession session) {
		String title = "菜单管理";
		LoginUser loginUser = (LoginUser) session.getAttribute(SessionParam.LOGIN_USER);
		if (null != loginUser) {
			List<Menu> menuList = menuService.queryAll(loginUser);
			model.addAttribute(Param.MENU_LIST, menuList);
		}
		model.addAttribute("title", title);
		return "/admin/menu/index";
	}

}
