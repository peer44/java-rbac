package com.jrbac.shiro;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jrbac.dao.LoginUserDao;
import com.jrbac.entity.LoginUser;

@Service
public class UserAuthServiceImpl implements UserAuthService {

	@Autowired
	LoginUserDao loginUserDao;

	/**
	 * 验证登录
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public LoginUser login(String username, String password) {

		return loginUserDao.login(username, password);
	}

	public Set<String> findRoles(LoginUser user) {
		/*
		 * Set<String> roles = new HashSet<>(); roles.add("user");
		 */
		return null;
		// return loginUserDao.findRoles(userid);
	}

	public Set<String> findPermissions(LoginUser user) {
		return loginUserDao.findPermissions(user);
	}

}
