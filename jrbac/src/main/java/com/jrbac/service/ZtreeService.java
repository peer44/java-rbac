package com.jrbac.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jrbac.dao.MenuDao;
import com.jrbac.dao.RoleDao;
import com.jrbac.entity.LoginUser;
import com.jrbac.entity.Menu;
import com.jrbac.entity.Role;
import com.jrbac.model.Ztree;

@Service
public class ZtreeService {
	@Autowired
	private MenuDao menuDao;
	@Autowired
	private RoleDao roleDao;

	/**
	 * 查询登录用户所拥有的菜单树
	 * 
	 * @param loginUser
	 * @return
	 */
	public List<Ztree> getMenuZtree(LoginUser loginUser) {
		List<Menu> menuList = menuDao.queryAll(loginUser);
		List<Ztree> ztreeList = new ArrayList<>();
		for (Menu menu : menuList) {
			Ztree ztree = new Ztree();
			ztree.setId(menu.getId());
			ztree.setpId(menu.getParentId());
			ztree.setName(menu.getName());
			if (menu.getName().equals("个人设置") || menu.getName().equals("后台首页")) {
				ztree.setChecked(true);
				ztree.setChkDisabled(true);
			}
			if (StringUtils.isNotBlank(menu.getIcon())) {
				ztree.setOpen(true);
			}
			ztreeList.add(ztree);

		}
		return ztreeList;

	}

	/**
	 * 根据角色id查询角色所拥有的菜单
	 * 
	 * @param loginUser
	 * @param roleId
	 * @return
	 */
	public List<Ztree> getMenuZtreeByRoleId(LoginUser loginUser, String roleid) {
		// 1 查询出用户所拥有的权限
		List<Menu> menuList = menuDao.queryAll(loginUser);
		// 2 查询出角色所拥有的权限
		List<Menu> roleMenuList = menuDao.queryByRoleId(roleid);
		List<Ztree> ztreeList = new ArrayList<>();
		for (Menu menu : menuList) {
			Ztree ztree = new Ztree();
			ztree.setId(menu.getId());
			ztree.setpId(menu.getParentId());
			ztree.setName(menu.getName());
			if (menu.getName().equals("个人设置") || menu.getName().equals("后台首页")) {
				ztree.setChecked(true);
				ztree.setChkDisabled(true);
			}
			for (Menu roleMenu : roleMenuList) {
				if (menu.equals(roleMenu)) {
					ztree.setChecked(true);
					continue;
				}
			}
			if (StringUtils.isNotBlank(menu.getIcon())) {
				ztree.setOpen(true);
			}
			ztreeList.add(ztree);

		}
		return ztreeList;
	}

	/**
	 * 查询登录用户所拥有的角色树
	 * 
	 * @param loginUser
	 * @return
	 */
	public List<Ztree> getRoleZtree(LoginUser loginUser) {
		List<Role> roleList = roleDao.queryAll(loginUser);
		List<Ztree> ztreeList = new ArrayList<>();
		for (Role role : roleList) {
			Ztree ztree = new Ztree();
			ztree.setId(role.getId());
			ztree.setName(role.getName());
			ztreeList.add(ztree);
		}
		return ztreeList;
	}
	
	public List<Ztree> getRoleZtree(LoginUser loginUser,String userid) {
		List<Role> roleList = roleDao.queryAll(loginUser);
		List<Role> userRoleList = roleDao.queryByUserId(userid);
		List<Ztree> ztreeList = new ArrayList<>();
		for (Role role : roleList) {
			Ztree ztree = new Ztree();
			ztree.setId(role.getId());
			ztree.setName(role.getName());
			for (Role userRole : userRoleList) {
				if (role.equals(userRole)) {
					ztree.setChecked(true);
					continue;
				}
			}
			ztreeList.add(ztree);
		}
		return ztreeList;

	}
}
