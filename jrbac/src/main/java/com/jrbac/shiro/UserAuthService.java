package com.jrbac.shiro;

import java.util.Set;

import com.jrbac.entity.LoginUser;


public interface UserAuthService {

	/**
	 * 登录
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public LoginUser login(String username, String password);

	/**
	 * 根据用户id查找其角色
	 * 
	 * @param user
	 * @return
	 */
	public Set<String> findRoles(LoginUser user);

	/**
	 * 根据用户id查找其权限
	 * 
	 * @param user
	 * @return
	 */
	public Set<String> findPermissions(LoginUser user);

}
