package com.jrbac.service;

import java.util.List;

import com.jrbac.entity.LoginUser;
import com.jrbac.entity.Menu;

/**
 * @author 程高伟
 *
 * @date 2016年6月16日 下午9:27:47
 */
public interface MenuService {
	/**
	 * 添加菜单或修改菜单
	 * 
	 * @param menu
	 * @return
	 */
	public int addOrUpdateMenu(Menu menu);

	/**
	 * 根据id批量删除菜单
	 * 
	 * @param menuIds
	 * @return
	 */
	public int delete(String id);

	/**
	 * 查询为用户所分配的菜单
	 * 
	 * @param user
	 * @return
	 */
	public List<Menu> queryAll(LoginUser loginUser);
	
	/**
	 * 根据id查询一个菜单
	 * 
	 * @param id
	 * @return
	 */
	public Menu queryById(String id);
}
