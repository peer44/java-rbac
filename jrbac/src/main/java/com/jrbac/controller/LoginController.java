package com.jrbac.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jrbac.context.SessionParam;
import com.jrbac.entity.LoginUser;
import com.jrbac.enums.StateEnum;
import com.jrbac.model.LoginUserVO;
import com.jrbac.model.OperationResult;
import com.jrbac.service.LoginUserService;
import com.jrbac.util.DESUtil;
import com.jrbac.util.UUIDGenerator;

/**
 * @author 程高伟
 *
 * @date 2016年6月17日 下午3:41:15
 */
@Controller
public class LoginController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	private final Gson gson = new GsonBuilder().disableHtmlEscaping().create();
	@Autowired
	private LoginUserService loginUserService;

	/*
	 * @Autowired private MenuService menuService;
	 */
	/**
	 * 登录页面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/login.html", method = RequestMethod.GET)
	public String login(Model model, HttpSession session) {
		logger.info("登录页面");
		session.setAttribute(SessionParam.LOGIN_KEY, UUIDGenerator.getUUID());
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
	public String doLogin(Model model, HttpSession session, HttpServletRequest request,
			RedirectAttributes redirectAttributes, @RequestParam("usernamePost") String username,
			@RequestParam("passwordPost") String password) {
		// 得到加密密钥
		logger.info("-----原始数据：username:{} password:{}-----", username, password);
		String key = session.getAttribute(SessionParam.LOGIN_KEY) + "";
		logger.info("-----加解密key:{}-----", key);
		try {
			username = DESUtil.decryption(username, key);
		} catch (Exception e) {
			logger.info("-----解密出错：{}-----", e.getMessage());
		}
		logger.info("解密后：username:{} password:{}", username, password);

		OperationResult<?> loginResult = null;
		// 下面就是shiro的登录了
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);
		Subject subject = SecurityUtils.getSubject();
		try {
			// 登录
			subject.login(token);
			if (subject.isAuthenticated()) {
				LoginUser loginUser = loginUserService.login(username, password);
				if (null != loginUser) {
					/*
					 * // 查询用户拥有的权限列表 // 用户的标志为1表示超级管理员，把所有的菜单都查出来
					 * OperationResult<List<Menu>> menuResult = null; menuResult
					 * = menuService.queryMenuList(0, Integer.MAX_VALUE,
					 * loginUser);
					 * 
					 * List<Menu> menuList = menuResult.getData(); //
					 * 将权限列表保存到session中
					 * 
					 * session.setAttribute("menuList", menuList);
					 */
					// 将登录用户信息保存到session中
					LoginUserVO loginUserVO = new LoginUserVO();
					BeanUtils.copyProperties(loginUser, loginUserVO);
					session.setAttribute(SessionParam.LOGIN_USER, loginUserVO);
					// ckfinder的权限
					session.setAttribute(SessionParam.CKFINDER_USERROLE, "admin");
				}
				SavedRequest savedRequest = WebUtils.getSavedRequest(request);
				// 获取保存的URL
				if (savedRequest == null || savedRequest.getRequestUrl() == null) {
					// 没有上一次的路径，进入主页
					return "redirect:admin/home/index.html";
				} else { // 如果有上一次的路径，跳转到上一次访问的页面
					// 得到服务器的路径
					String basePath = request.getContextPath();
					logger.info("上一次的请求路径:{}", savedRequest.getRequestUrl());
					String url = savedRequest.getRequestUrl().split(basePath)[1];
					return "redirect:" + url;
				}
			} else {
				loginResult = new OperationResult<>(StateEnum.INVALIDATE_USERNAME_PASSWORD);
				redirectAttributes.addFlashAttribute("msg", gson.toJson(loginResult));
				redirectAttributes.addFlashAttribute("username", username);
				return "admin/login";
			}
		} catch (Exception e) {
			loginResult = new OperationResult<>(StateEnum.INVALIDATE_USERNAME_PASSWORD);
			redirectAttributes.addFlashAttribute("msg", gson.toJson(loginResult));
			redirectAttributes.addFlashAttribute("username", username);
			return "redirect:/login.html";
		}

	}

}
