package com.jrbac.service;

import java.util.List;

import com.jrbac.entity.LoginUser;
import com.jrbac.entity.Menu;
import com.jrbac.model.OperationResult;


/**
 * @author 程高伟
 *
 * @date 2016年6月16日 下午9:27:47
 */
public interface MenuService {
	/**
	 * 添加菜单
	 * 
	 * @param menu
	 * @return
	 */
	public OperationResult<?> addOrUpdateMenu(Menu menu);

	/**
	 * 根据id删除菜单
	 * 
	 * @param menuIds
	 * @return
	 */
	public OperationResult<?> deleteMenu(String[] menuIds);

	
	/**
	 * 根据偏移量查询用户所分配的菜单
	 * @param offset
	 * @param limit
	 * @param user
	 * @return
	 */
	public OperationResult<List<Menu>> queryMenuList(int offset, int limit, LoginUser user);
}
