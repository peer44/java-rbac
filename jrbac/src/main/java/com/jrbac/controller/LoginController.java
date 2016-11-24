package com.jrbac.controller;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jrbac.context.BaseReturn;
import com.jrbac.context.ErrorCode;
import com.jrbac.context.Param;
import com.jrbac.entity.LoginUser;
import com.jrbac.service.LoginUserService;
import com.jrbac.service.SessionService;
import com.jrbac.util.DESUtil;
import com.jrbac.util.UUIDGenerator;

/**
 * 登录
 * 
 * @author 程高伟
 * @date 2016年11月15日 上午9:44:57
 */
@Controller
public class LoginController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private LoginUserService loginUserService;
	@Autowired
	private SessionService sessionService;

	/**
	 * 登录页面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/login.html", method = RequestMethod.GET)
	public String login(Model model, HttpSession session) {
		LoginUser loginUser = (LoginUser) session.getAttribute(Param.SESSION_LOGIN_USER);
		if (null != loginUser) {
			return "redirect:admin/home/index.html";
		}
		logger.debug("-----登录页面-----");
		session.setAttribute(Param.SESSION_LOGIN_DES_KEY, UUIDGenerator.getUUID());
		model.addAttribute("title", "用户登录");
		return "admin/login";
	}

	/**
	 * 处理用户登录
	 * 
	 * @param model
	 * @param session
	 * @param request
	 * @param redirectAttributes
	 * @param username
	 * @param password
	 * @return
	 */
	@RequestMapping("/doLogin.html")
	public String doLogin(Model model, HttpSession session, HttpServletRequest request,
			RedirectAttributes redirectAttributes, @RequestParam("usernamePost") String username,
			@RequestParam("passwordPost") String password) {
		// 得到加密密钥
		logger.debug("-----原始数据：username:{} password:{}-----", username, password);
		String key = session.getAttribute(Param.SESSION_LOGIN_DES_KEY) + "";
		if (StringUtils.isBlank(key)) {
			redirectAttributes.addFlashAttribute("msg", BaseReturn.response(ErrorCode.FAILURE, "请刷新页面后重试"));
			redirectAttributes.addFlashAttribute("username", username);
			return "redirect:/login.html";
		}
		logger.debug("-----加解密key:{}-----", key);
		try {
			username = DESUtil.decryption(username, key);
		} catch (Exception e) {
			logger.error("-----解密出错：{}-----", e.getMessage());
		}
		logger.debug("-----解密后：username:{} password:{}-----", username, password);
		// 下面就是shiro的登录了
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);
		Subject subject = SecurityUtils.getSubject();
		try {
			// 登录
			subject.login(token);
			if (subject.isAuthenticated()) {
				LoginUser loginUser = loginUserService.login(username, password);
				if (null != loginUser) {
					// 将用户的所能看到的菜单更新到session中
					sessionService.setMenuInSession(session, loginUser);
					// 将登录用户信息保存到session中
					/*
					 * LoginUserVO loginUserVo = new LoginUserVO();
					 * BeanUtils.copyProperties(loginUser, loginUserVo);
					 */
					session.setAttribute(Param.SESSION_LOGIN_USER, loginUser);
					// ckfinder的权限
					session.setAttribute(Param.SESSION_CKFINDER_USERROLE, "admin");
				}
				SavedRequest savedRequest = WebUtils.getSavedRequest(request);
				// 获取保存的URL
				if (savedRequest == null || savedRequest.getRequestUrl() == null) {
					// 没有上一次的路径，进入主页
					return "redirect:admin/home/index.html";
				} else { // 如果有上一次的路径，跳转到上一次访问的页面
					String basePath = request.getContextPath();
					logger.info("-----上一次的请求路径:{}-----", savedRequest.getRequestUrl());
					String preUrl = savedRequest.getRequestUrl().split(basePath)[1];
					return "redirect:" + preUrl;
				}
			} else {// 这个感觉永远不会执行到这里
				redirectAttributes.addFlashAttribute("msg", BaseReturn.response(ErrorCode.FAILURE, "请先登录"));
				redirectAttributes.addFlashAttribute("username", username);
				return "redirect:/login.html";
			}
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("msg", BaseReturn.response(ErrorCode.FAILURE, "用户名密码错误"));
			redirectAttributes.addFlashAttribute("username", username);
			return "redirect:/login.html";
		}

	}

	/**
	 * 退出登录
	 * 
	 * @param model
	 * @param session
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "/logout.html", method = RequestMethod.GET)
	public String logout(Model model, HttpSession session, RedirectAttributes redirectAttributes) {
		LoginUser loginUser = (LoginUser) session.getAttribute(Param.SESSION_LOGIN_USER);
		if (null != loginUser) {
			logger.info("-----用户{}退出登录-----", loginUser.getUsername());
			Enumeration<?> e = session.getAttributeNames();
			while (e.hasMoreElements()) {
				String sessionName = (String) e.nextElement();
				session.removeAttribute(sessionName);
			}
		}
		redirectAttributes.addFlashAttribute("msg", BaseReturn.response("您已安全退出"));
		return "redirect:/login.html";
	}

}
