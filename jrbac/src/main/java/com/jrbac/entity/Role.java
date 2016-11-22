package com.jrbac.entity;

import java.util.Date;
import java.util.List;

public class Role {
	// id
	private String id;
	// 名称
	private String name;
	// 创建时间，主要用来排序
	private Date createTime;
	// 一对多一个角色有多个权限
	private List<Menu> menus;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public List<Menu> getMenus() {
		return menus;
	}

	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}

	@Override
	public String toString() {
		return "Role [id=" + id + ", name=" + name + ", createTime=" + createTime + ", menus=" + menus + "]";
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Role) {
			Role role = (Role) obj;
			return (id.equals(role.id));
		}
		return super.equals(obj);
	}

}
