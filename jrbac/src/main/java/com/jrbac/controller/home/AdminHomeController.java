package com.jrbac.controller.home;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jrbac.context.SessionParam;
import com.jrbac.util.UUIDGenerator;

/**
 * 后台首页
 * 
 * @author 程高伟
 *
 * @date 2016年10月26日 下午5:40:54
 */

@Controller
@RequestMapping(value = "/admin/home")
public class AdminHomeController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	/**
	 * 登录页面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/index.html", method = RequestMethod.GET)
	public String login(Model model, HttpSession session) {
		logger.info("-----后台首页-----");
		session.setAttribute(SessionParam.LOGIN_KEY, UUIDGenerator.getUUID());
		model.addAttribute("title", "管理控制台");
		return "admin/home/index";
	}

}
