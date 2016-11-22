package com.jrbac.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jrbac.entity.LoginUser;
import com.jrbac.entity.Role;

public interface RoleDao {

	/**
	 * 查询所有的角色
	 * 
	 * @return
	 */
	public List<Role> queryAll(@Param("user") LoginUser loginUser);

	/**
	 * 添加角色
	 * 
	 * @param role
	 * @return
	 */
	public int add(@Param("role") Role role);

	/**
	 * 修改角色
	 * 
	 * @param role
	 * @return
	 */
	public int update(@Param("role") Role role);

	/**
	 * 为角色添加菜单
	 * 
	 * @param roleid
	 * @param menuids
	 * @return
	 */
	public int addRoleMenu(@Param("roleId") String roleId, @Param("menuIds") String[] menuIds);

	/**
	 * 删除角色的所有菜单
	 * 
	 * @param roleid
	 * @return
	 */
	public int deleteRoleMenuByRoleId(@Param("roleId") String roleId);

	/**
	 * 根据id删除角色，删除角色后，角色对应的菜单也会被从角色菜单表里删除
	 * 
	 * @param id
	 * @return
	 */
	public int delete(@Param("id") String id);

	/**
	 * 查询出用户所拥有分配的角色
	 * 
	 * @param userid
	 * @return
	 */
	public List<Role> queryByUserId(@Param("userId") String userId);

}
