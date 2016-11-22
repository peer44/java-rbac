package com.jrbac.controller.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 后台首页
 * 
 * @author 程高伟
 *
 * @date 2016年10月26日 下午5:40:54
 */

@Controller
@RequestMapping(value = "/admin/home")
public class HomeController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping(value = "/index.html", method = RequestMethod.GET)
	public String index(Model model) {
		logger.debug("-----后台首页-----");
		model.addAttribute("title", "后台首页");
		return "admin/home/index";
	}

}
