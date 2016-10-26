package com.jrbac.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jrbac.util.PasswordUtil;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:spring/spring-core.xml" })
public class LoginUserDaoTest {

	@Autowired
	private LoginUserDao loginUserDao;
	@Test
	public void testLogin() {
		String username="chenggaowei";
		String password="12345678";
		password = PasswordUtil.getPassword(password);
		System.out.println(loginUserDao.login(username, password));
		
	}

}
