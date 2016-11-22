package com.jrbac.entity;

import java.io.Serializable;
import java.util.List;

/**
 * 菜单类
 * 
 * @author 程高伟
 * @date 2016年11月11日 下午6:48:40
 */
public class Menu implements Serializable {
	private static final long serialVersionUID = 8216261873077615072L;
	// 菜单id
	private String id;
	// 父菜单id
	private String parentId;
	// 菜单名称
	private String name;
	// 菜单url
	private String url;
	// 菜单图标
	private String icon;
	// 菜单顺序
	private int order;
	// 子菜单
	private List<Menu> children;
	// 父菜单
	private Menu parent;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public List<Menu> getChildren() {
		return children;
	}

	public void setChildren(List<Menu> children) {
		this.children = children;
	}

	public Menu getParent() {
		return parent;
	}

	public void setParent(Menu parent) {
		this.parent = parent;
	}

	@Override
	public String toString() {
		return "Menu [id=" + id + ", parentId=" + parentId + ", name=" + name + ", url=" + url + ", icon=" + icon
				+ ", order=" + order + ", children=" + children + ", parent=" + parent + "]";
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Menu) {
			Menu menu = (Menu) obj;
			return (id.equals(menu.id));
		}
		return super.equals(obj);
	}

}
