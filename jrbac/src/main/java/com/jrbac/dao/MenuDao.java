package com.jrbac.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jrbac.entity.LoginUser;
import com.jrbac.entity.Menu;

public interface MenuDao {

	/**
	 * 查找用户所拥有的所有菜单
	 * 
	 * @param user
	 * @return
	 */
	public List<Menu> queryAll(@Param("user") LoginUser loginUser);

	/**
	 * 根据角色id查询角色所拥有的菜单
	 * 
	 * @param roleId
	 * @return
	 */
	public List<Menu> queryByRoleId(@Param("roleId") String roleId);
}
