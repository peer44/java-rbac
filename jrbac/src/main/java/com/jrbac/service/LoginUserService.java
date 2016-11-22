package com.jrbac.service;

import java.util.List;

import com.jrbac.entity.LoginUser;
import com.jrbac.model.LoginUserVO;

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
	public LoginUser getById(String id);

	/**
	 * 检测用户名是否可用
	 * 
	 * @param username
	 * @return true,可用，false不可用
	 */
	public boolean checkUsername(String username);

	/**
	 * 登录密码修改
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public int updatePwd(String id, String password);

	/**
	 * 个人信息修改
	 * 
	 * @param user
	 * @return
	 */
	public int updateUserInfo(LoginUserVO user);

	/**
	 * 查看所有的用户
	 * 
	 * @param user
	 * @return
	 */
	public List<LoginUser> queryAll(LoginUser user);

	/**
	 * 根据用户id返回他所有的角色
	 * 
	 * @param offset
	 * @param limit
	 * @param userIds
	 * @return
	 */
	public List<LoginUserVO> queryRoleListByUserId(int offset, int limit, String[] userIds);

	/**
	 * 管理员添加或修改用户
	 * 
	 * @param loginUser
	 * @param split
	 * @return
	 */
	public int addOrUpdate(LoginUser loginUser, String[] roleIds);

	/**
	 * 修改密码
	 * 
	 * @param userId
	 * @param password
	 * @return
	 */
	public int updatePassword(String userId, String password);

	/**
	 * 删除用户
	 * 
	 * @param id
	 * @return
	 */
	public int delete(String id);
}
