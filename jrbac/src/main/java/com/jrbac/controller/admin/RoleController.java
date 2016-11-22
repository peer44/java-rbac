package com.jrbac.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import com.jrbac.entity.Role;
import com.jrbac.model.Ztree;
import com.jrbac.service.RoleService;
import com.jrbac.service.ZtreeService;

@Controller
@RequestMapping(value = "/admin/role")
public class RoleController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private RoleService roleService;
	@Autowired
	private ZtreeService ztreeService;

	/**
	 * 角色管理
	 * 
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/index.html")
	public String index(Model model, HttpSession session) {
		String title = "角色管理";
		LoginUser loginUser = (LoginUser) session.getAttribute(SessionParam.LOGIN_USER);
		if (null != loginUser) {
			List<Role> roleList = roleService.queryAll(loginUser);
			model.addAttribute(Param.Role_LIST, roleList);
		}

		model.addAttribute("title", title);
		return "/admin/role/index";
	}

	/**
	 * 分配权限的时候加载的ztree
	 * 
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/menuZtree", method = RequestMethod.GET)
	@ResponseBody
	public String menuZtree(Model model, HttpSession session, String roleId) {
		LoginUser loginUser = (LoginUser) session.getAttribute(SessionParam.LOGIN_USER);
		if (null != loginUser) {
			List<Ztree> ztree = new ArrayList<>();
			if (StringUtils.isNoneBlank(roleId)) {
				ztree = ztreeService.getMenuZtreeByRoleId(loginUser, roleId);

			} else {
				ztree = ztreeService.getMenuZtree(loginUser);
			}
			logger.info("-----返回的ztree:{}-----", BaseReturn.response(ztree));
			return BaseReturn.response(ztree);
		} else {
			return BaseReturn.response(ErrorCode.NOT_LOGGIN);
		}
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public String add(Role role, String menuIds) {
		logger.info("-----正在更新角色,传过来的数据：{}-----", role.toString());
		logger.info("----------菜单id：{}----------", menuIds);
		int count = roleService.addOrUpdateRole(role, menuIds.split(","));
		logger.info("----------更新数据：{}----------", count);
		if (count > 0) {
			return BaseReturn.response(ErrorCode.SUCCESS);
		} else {
			return BaseReturn.response(ErrorCode.FAILURE);
		}

	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
	@ResponseBody
	public String delete(@PathVariable String id, HttpServletRequest request) {

		logger.debug("-----删除角色-----");
		logger.info("-----传过来的id:{}-----", id);
		if (StringUtils.isBlank(id)) {
			return BaseReturn.response(ErrorCode.PARAM_ERROR, "id不能为空");
		} else {
			int deleteCount = 0;
			deleteCount = roleService.delete(id);
			if (deleteCount > 0) {
				return BaseReturn.response(ErrorCode.SUCCESS, deleteCount);
			} else {
				return BaseReturn.response(ErrorCode.FAILURE, "删除数据失败");
			}
		}

	}

}
