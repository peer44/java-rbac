package com.jrbac.dao;

import java.util.List;
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

	/**
	 * 查询用户所管理的用户
	 * 
	 * @param user
	 * @return
	 */
	public List<LoginUser> queryAll(LoginUser user);

	/**
	 * 检查用户名是否可用
	 * 
	 * @param username
	 * @return
	 */
	public LoginUser checkUsername(@Param("username") String username);

	/**
	 * 管理员添加用户
	 * 
	 * @param loginUser
	 * @return
	 */
	public int add(@Param("user") LoginUser loginUser);

	/**
	 * 修改个人信息,不包括密码和角色
	 * 
	 * @param loginUser
	 * @return
	 */
	public int update(@Param("user") LoginUser loginUser);

	/**
	 * 修改登录密码
	 * 
	 * @param userId
	 * @param password
	 * @return
	 */
	public int updatePassword(@Param("userId") String userId, @Param("password") String password);

	/**
	 * 插入用户角色
	 * 
	 * @param userid
	 * @param roleIds
	 * @return
	 */
	public int addUserRole(@Param("userId") String userId, @Param("roleIds") String[] roleIds);

	/**
	 * 根据用户id删除用户角色表中的数据
	 * 
	 * @param userid
	 * @return
	 */
	public int deleteUserRoleByUserId(@Param("userId") String userId);

	/**
	 * 删除用户
	 * 
	 * @param id
	 * @return
	 */
	public int delete(String id);

}
