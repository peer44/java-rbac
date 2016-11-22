package com.jrbac.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jrbac.dao.MenuDao;
import com.jrbac.entity.LoginUser;
import com.jrbac.entity.Menu;
import com.jrbac.service.MenuService;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuDao menuDao;

	@Override
	public int addOrUpdateMenu(Menu menu) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMenu(String[] menuIds) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Menu> queryAll(LoginUser loginUser) {
		// 用户所能看到的菜单数据
		List<Menu> rootMenu = menuDao.queryAll(loginUser);
		return rootMenu;
	}

}
