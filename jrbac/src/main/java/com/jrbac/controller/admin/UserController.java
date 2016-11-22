package com.jrbac.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
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
import com.jrbac.model.Ztree;
import com.jrbac.service.LoginUserService;
import com.jrbac.service.ZtreeService;

@Controller
@RequestMapping(value = "/admin/user")
public class UserController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private LoginUserService userService;
	@Autowired
	private ZtreeService ztreeService;

	/**
	 * 个人设置
	 * 
	 * @param model
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping("/setting.html")
	public String setting(Model model) {
		String title = "个人设置";
		model.addAttribute("title", title);
		return "/admin/user/setting";
	}

	/**
	 * 用户管理
	 * 
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/index.html")
	public String index(Model model, HttpSession session) {
		String title = "用户管理";
		LoginUser loginUser = (LoginUser) session.getAttribute(SessionParam.LOGIN_USER);
		if (null != loginUser) {
			List<LoginUser> menuList = userService.queryAll(loginUser);
			model.addAttribute(Param.USER_LIST, menuList);
		}

		model.addAttribute("title", title);
		return "/admin/user/index";
	}

	/**
	 * 检查用户名是否可用
	 * 
	 * @param username
	 * @return
	 */
	@RequestMapping(value = "/checkUsername", method = RequestMethod.GET)
	@ResponseBody
	public String checkUsername(String username) {
		if (StringUtils.isBlank(username)) {
			return BaseReturn.response(ErrorCode.PARAM_ERROR, "username不能为空");
		} else {
			return BaseReturn.response(userService.checkUsername(username));
		}

	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public String add(LoginUser loginUser, String roleIds) {
		logger.info("-----正在更新用户,传过来的数据：{}-----", loginUser.toString());
		logger.info("----------角色id：{}----------", roleIds);
		int count = userService.addOrUpdate(loginUser, roleIds.split(","));
		logger.info("----------更新数据：{}条----------", count);
		if (count > 0) {
			return BaseReturn.response(ErrorCode.SUCCESS);
		} else {
			return BaseReturn.response(ErrorCode.FAILURE);
		}

	}

	/**
	 * 更新登录密码
	 * 
	 * @param userId
	 * @param password
	 * @return
	 */
	@RequestMapping(value = "/updatepassword", method = RequestMethod.POST)
	@ResponseBody
	public String updatepassword(String userId, String password) {
		if (StringUtils.isBlank(userId)) {
			return BaseReturn.response(ErrorCode.PARAM_ERROR, "userId不能为空");
		}
		int count = userService.updatePassword(userId, password);
		logger.info("----------更新数据：{}条----------", count);
		if (count > 0) {
			return BaseReturn.response(ErrorCode.SUCCESS);
		} else {
			return BaseReturn.response(ErrorCode.FAILURE);
		}

	}

	/**
	 * 删除用户
	 * 
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
	@ResponseBody
	public String delete(@PathVariable String id) {

		logger.debug("-----删除用户-----");
		logger.info("-----传过来的id:{}-----", id);
		if (StringUtils.isBlank(id)) {
			return BaseReturn.response(ErrorCode.PARAM_ERROR, "id不能为空");
		} else {
			int deleteCount = 0;
			deleteCount = userService.delete(id);
			if (deleteCount > 0) {
				return BaseReturn.response(ErrorCode.SUCCESS, deleteCount);
			} else {
				return BaseReturn.response(ErrorCode.FAILURE, "删除数据失败");
			}
		}

	}

	/**
	 * 分配权限的时候加载的ztree
	 * 
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/roleZtree", method = RequestMethod.GET)
	@ResponseBody
	public String roleZtree(Model model, HttpSession session, String userId) {
		LoginUser loginUser = (LoginUser) session.getAttribute(SessionParam.LOGIN_USER);
		if (null != loginUser) {
			List<Ztree> ztree = new ArrayList<>();
			if (StringUtils.isNoneBlank(userId)) {
				ztree = ztreeService.getRoleZtree(loginUser, userId);
			} else {
				ztree = ztreeService.getRoleZtree(loginUser);
			}
			logger.info("-----返回的ztree:{}-----", BaseReturn.response(ztree));
			return BaseReturn.response(ztree);
		} else {
			return BaseReturn.response(ErrorCode.NOT_LOGGIN);
		}
	}

}
