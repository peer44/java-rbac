package com.jrbac.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jrbac.context.BaseReturn;
import com.jrbac.context.ErrorCode;
import com.jrbac.context.Param;
import com.jrbac.context.SessionParam;
import com.jrbac.entity.LoginUser;
import com.jrbac.entity.Menu;
import com.jrbac.service.MenuService;
import com.jrbac.service.SessionService;

@Controller
@RequestMapping(value = "/admin/menu")
public class MenuController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private MenuService menuService;
	@Autowired
	private SessionService sessionService;

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

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public String add(Menu menu, HttpSession session) {
		LoginUser loginUser = (LoginUser) session.getAttribute(SessionParam.LOGIN_USER);
		logger.info("-----正在更新菜单,传过来的数据：{}-----", menu.toString());
		int count = menuService.addOrUpdateMenu(menu);
		logger.info("----------更新数据：{}----------", count);
		if (count > 0) {
			sessionService.setMenuInSession(session, loginUser);
			return BaseReturn.response(ErrorCode.SUCCESS);
		} else {
			return BaseReturn.response(ErrorCode.FAILURE);
		}

	}

	@RequestMapping(value = "/detial/{id}", method = RequestMethod.GET)
	@ResponseBody
	public String detial(@PathVariable String id) {
		logger.info("-----正在查询菜单详情：{}-----", id);
		if (StringUtils.isBlank(id)) {
			return BaseReturn.response(ErrorCode.PARAM_ERROR, "id不能为空");
		}
		Menu menu = menuService.queryById(id);
		logger.info("-----查找到的菜单：{}-----", menu);
		if (null == menu) {
			return BaseReturn.response(ErrorCode.RECORD_NULL);
		} else {
			return BaseReturn.response(ErrorCode.SUCCESS, menu);
		}
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
	@ResponseBody
	public String delete(@PathVariable String id, HttpSession session) {
		LoginUser loginUser = (LoginUser) session.getAttribute(SessionParam.LOGIN_USER);
		logger.debug("-----删除菜单-----");
		logger.info("-----传过来的id:{}-----", id);
		if (StringUtils.isBlank(id)) {
			return BaseReturn.response(ErrorCode.PARAM_ERROR, "id不能为空");
		} else {
			int deleteCount = menuService.delete(id);
			if (deleteCount > 0) {
				sessionService.setMenuInSession(session, loginUser);
				return BaseReturn.response(ErrorCode.SUCCESS,deleteCount);
			} else {
				return BaseReturn.response(ErrorCode.FAILURE);
			}
		}

	}

}
