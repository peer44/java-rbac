package com.jrbac.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jrbac.dao.LoginUserDao;
import com.jrbac.entity.LoginUser;
import com.jrbac.model.LoginUserVO;
import com.jrbac.model.OperationResult;
import com.jrbac.service.LoginUserService;

@Service
public class LoginUserServiceImpl implements LoginUserService {

	@Autowired
	private LoginUserDao loginUserDao;

	@Override
	public LoginUser login(String username, String password) {
		return loginUserDao.login(username, password);
	}

	@Override
	public OperationResult<LoginUserVO> getLoginUserById(String userid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OperationResult<Boolean> checkUsername(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OperationResult<?> updatePwd(String userid, String password) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OperationResult<?> updateUserInfo(LoginUserVO user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OperationResult<Integer> addOrUpdateUser(LoginUserVO user, String[] roleIds) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OperationResult<List<LoginUserVO>> queryUserList(int offset, int limit, LoginUserVO user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OperationResult<List<LoginUserVO>> queryRoleListByUserId(int offset, int limit, String[] userIds) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OperationResult<?> deleteLoginUser(String[] userIds) {
		// TODO Auto-generated method stub
		return null;
	}

}
