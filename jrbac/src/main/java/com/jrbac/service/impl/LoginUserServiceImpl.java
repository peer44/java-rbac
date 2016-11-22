package com.jrbac.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jrbac.dao.LoginUserDao;
import com.jrbac.entity.LoginUser;
import com.jrbac.model.LoginUserVO;
import com.jrbac.service.LoginUserService;
import com.jrbac.util.PasswordUtil;
import com.jrbac.util.UUIDGenerator;

@Service
public class LoginUserServiceImpl implements LoginUserService {

	@Autowired
	private LoginUserDao loginUserDao;

	@Override
	public LoginUser login(String username, String password) {
		return loginUserDao.login(username, password);
	}

	@Override
	public LoginUser getById(String userid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean checkUsername(String username) {
		LoginUser loginUser = loginUserDao.checkUsername(username);
		if (null == loginUser) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public int updatePwd(String userid, String password) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateUserInfo(LoginUserVO user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addOrUpdate(LoginUser loginUser, String[] roleids) {
		int updateCount = 0;
		int deleteUserRole = 0;
		int updateUserRole = 0;
		if (StringUtils.isBlank(loginUser.getId())) {// 新增
			loginUser.setId(UUIDGenerator.getUUID());
			loginUser.setPassword(PasswordUtil.getPassword(loginUser.getPassword()));
			updateCount = loginUserDao.add(loginUser);
			// 插入角色
			updateUserRole = loginUserDao.addUserRole(loginUser.getId(), roleids);
			if (updateCount == 0 || updateUserRole == 0) {
				return 0;
			} else {
				return 1;
			}
		} else {// 修改
				// 修改用户信息，修改用户角色表
			updateCount = loginUserDao.update(loginUser);
			deleteUserRole = loginUserDao.deleteUserRoleByUserId(loginUser.getId());
			updateUserRole = loginUserDao.addUserRole(loginUser.getId(), roleids);
			if (updateCount == 0 || deleteUserRole == 0 || updateUserRole == 0) {
				return 0;
			} else {
				return 1;
			}
		}

	}

	@Override
	public List<LoginUser> queryAll(LoginUser user) {
		return loginUserDao.queryAll(user);
	}

	@Override
	public List<LoginUserVO> queryRoleListByUserId(int offset, int limit, String[] userIds) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String id) {
		return loginUserDao.delete(id);
	}

	@Override
	public int updatePassword(String userId, String password) {
		if(StringUtils.isBlank(password)){
			password=PasswordUtil.getPassword("12345678");
		}else{
			password=PasswordUtil.getPassword(password);
		}
		return loginUserDao.updatePassword(userId, password);
	}

	

}
