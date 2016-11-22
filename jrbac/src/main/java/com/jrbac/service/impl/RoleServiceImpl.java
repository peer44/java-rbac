package com.jrbac.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jrbac.dao.RoleDao;
import com.jrbac.entity.LoginUser;
import com.jrbac.entity.Role;
import com.jrbac.service.RoleService;
import com.jrbac.util.UUIDGenerator;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleDao roleDao;

	@Override
	public List<Role> queryAll(LoginUser loginUser) {
		return roleDao.queryAll(loginUser);
	}

	@Transactional
	@Override
	public int addOrUpdateRole(Role role, String[] menuIds) {
		int updateCount = 0;
		int deleteRoleMenu = 0;
		int updateRoleMenu = 0;
		if (StringUtils.isBlank(role.getId())) {// 新增
			role.setId(UUIDGenerator.getUUID());
			updateCount = roleDao.add(role);
			// 插入角色权限
			updateRoleMenu = roleDao.addRoleMenu(role.getId(), menuIds);
			if (updateCount == 0 || updateRoleMenu == 0) {
				return 0;
			} else {
				return 1;
			}
		} else {// 修改
				// 修改角色名称，修改权限列表
			updateCount = roleDao.update(role);
			deleteRoleMenu = roleDao.deleteRoleMenuByRoleId(role.getId());
			updateRoleMenu = roleDao.addRoleMenu(role.getId(), menuIds);
			if (updateCount == 0 || deleteRoleMenu == 0 || updateRoleMenu == 0) {
				return 0;
			} else {
				return 1;
			}
		}

	}

	@Override
	public int delete(String id) {
		return roleDao.delete(id);
	}

}
