package com.jrbac.util;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.jrbac.entity.Menu;

public class MenuUtil {
	/**
	 * 递归查找子菜单
	 * 
	 * @param id
	 *            当前菜单id
	 * @param rootMenu
	 *            要查找的列表
	 * @return
	 */
	public static List<Menu> getChild(String id, List<Menu> rootMenu) {
		// 子菜单
		List<Menu> childList = new ArrayList<>();
		for (Menu menu : rootMenu) {
			// 遍历所有节点，将父菜单id与传过来的id比较
			if (StringUtils.isNotBlank(menu.getParentId())) {
				if (menu.getParentId().equals(id)) {
					childList.add(menu);
				}
			}
		}
		// 把子菜单的子菜单再循环一遍
		for (Menu menu : childList) {// 没有url子菜单还有子菜单
			if (StringUtils.isBlank(menu.getUrl())) {
				// 递归
				menu.setChildren(getChild(menu.getId(), rootMenu));
			}
		} // 递归退出条件
		if (childList.size() == 0) {
			return null;
		}
		return childList;
	}
}
