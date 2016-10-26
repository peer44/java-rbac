package com.jrbac.dao;

import java.util.Set;

import org.apache.ibatis.annotations.Param;

import com.jrbac.entity.LoginUser;

public interface LoginUserDao {

	/**
	 * 登录方法
	 * 
	 * @param username
	 * @param password
	 * @return 返回找到的用户
	 */
	public LoginUser login(@Param("username") String username, @Param("password") String password);

	/**
	 * shiro的根据用户id查找其角色
	 * 
	 * @param user
	 * @return
	 */
	public Set<String> findRoles(@Param("user") LoginUser user);

	/**
	 * shiro的根据用户id查找其权限
	 * 
	 * @param user
	 * @return
	 */
	public Set<String> findPermissions(@Param("user") LoginUser user);

}
