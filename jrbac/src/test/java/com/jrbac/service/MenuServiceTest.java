package com.jrbac.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jrbac.context.BaseReturn;
import com.jrbac.entity.LoginUser;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:spring/spring-core.xml" })
public class MenuServiceTest {

	//@Autowired
	//private MenuService menuService;
	@Autowired
	private ZtreeService ztreeService;
	@Test
	public void testQueryAll() {
		LoginUser loginUser = new LoginUser();
		loginUser.setStatus(1);
		System.out.println(ztreeService.getMenuZtree(loginUser));
		System.out.println(BaseReturn.response(ztreeService.getMenuZtreeByRoleId(loginUser, "1c9d1a0ef4114d2598aab4e0fee49bb9")));
	}

}
