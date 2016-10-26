package com.jrbac.service;

import java.util.List;

import com.jrbac.entity.LoginUser;
import com.jrbac.model.LoginUserVO;
import com.jrbac.model.OperationResult;


public interface LoginUserService {

	/**
	 * 登录
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public LoginUser login(String username, String password);

	/**
	 * 根据id查询一个登录用户
	 * 
	 * @param userid
	 * @return
	 */
	public OperationResult<LoginUserVO> getLoginUserById(String userid);

	/**
	 * 检测用户名是否可用
	 * 
	 * @param username
	 * @return
	 */
	public OperationResult<Boolean> checkUsername(String username);

	/**
	 * 登录密码修改
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public OperationResult<?> updatePwd(String userid, String password);

	/**
	 * 个人信息修改
	 * 
	 * @param user
	 * @return
	 */
	public OperationResult<?> updateUserInfo(LoginUserVO user);

	/**
	 * 管理员添加或修改用户
	 * 
	 * @param user
	 * @param roleIds
	 * @return
	 */
	public OperationResult<Integer> addOrUpdateUser(LoginUserVO user, String[] roleIds);

	/**
	 * 根据偏移量查询用户所管理的用户列表
	 * 
	 * @param offset
	 * @param limit
	 * @param user
	 * @return
	 */
	public OperationResult<List<LoginUserVO>> queryUserList(int offset, int limit, LoginUserVO user);

	/**
	 * 根据用户id返回他所有的角色
	 * 
	 * @param offset
	 * @param limit
	 * @param userIds
	 * @return
	 */
	public OperationResult<List<LoginUserVO>> queryRoleListByUserId(int offset, int limit, String[] userIds);
	
	/**
	 * 批量删除用户
	 * @param roleIds
	 * @return
	 */
	public OperationResult<?> deleteLoginUser(String[] userIds);
}
