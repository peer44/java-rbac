package com.jrbac.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:spring/spring-core.xml" })
public class LoginUserServiceTest {

	@Autowired
	private LoginUserService loginUserService;
	
	@Test
	public void testCheckUsername() {
		System.out.println(loginUserService.checkUsername("111"));
	}

}
