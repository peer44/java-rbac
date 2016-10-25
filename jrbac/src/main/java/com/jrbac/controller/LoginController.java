package com.jrbac.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jrbac.enums.StateEnum;
import com.jrbac.model.OperationResult;


/**
 * @author 程高伟
 *
 * @date 2016年6月17日 下午3:41:15
 */
@Controller
public class LoginController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	private final Gson gson = new GsonBuilder().disableHtmlEscaping().create();
	/**
	 * 登录页面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/login.html")
	public String login(Model model) {
		logger.info("登录页面");
		model.addAttribute("title", "用户登录");
		return "admin/login";
	}

	/**
	 * 处理登录
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/doLogin.html")
	public String doLogin(Model model,RedirectAttributes redirectAttributes, @RequestParam("usernamePost") String username,
			@RequestParam("passwordPost") String password) {
		logger.info("username:{} password:{}",username,password);
		
		OperationResult<?> loginResult = new OperationResult<>(StateEnum.INVALIDATE_USERNAME_PASSWORD);
		redirectAttributes.addFlashAttribute("msg", gson.toJson(loginResult));
		redirectAttributes.addFlashAttribute("username", username);
		return "redirect:/login.html";
	}

}
