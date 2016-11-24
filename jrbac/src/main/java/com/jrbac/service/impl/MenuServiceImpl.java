package com.jrbac.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jrbac.dao.MenuDao;
import com.jrbac.entity.LoginUser;
import com.jrbac.entity.Menu;
import com.jrbac.service.MenuService;
import com.jrbac.util.UUIDGenerator;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuDao menuDao;

	@Override
	public int addOrUpdateMenu(Menu menu) {
		if(StringUtils.isBlank(menu.getId())){
			menu.setId(UUIDGenerator.getUUID());
			return menuDao.add(menu);
		}else{
			return menuDao.update(menu);
		}
	}

	@Override
	public int delete(String id) {
		return menuDao.delete(id);
	}

	@Override
	public List<Menu> queryAll(LoginUser loginUser) {
		// 用户所能看到的菜单数据
		List<Menu> rootMenu = menuDao.queryAll(loginUser);
		return rootMenu;
	}

	@Override
	public Menu queryById(String id) {
		return menuDao.queryById(id);
	}

}
