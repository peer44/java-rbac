package com.jrbac.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Role implements Serializable {
	private static final long serialVersionUID = -669346228586070211L;
	// id
	private String id;
	// 名称
	private String name;
	// 创建时间，主要用来排序
	private Date createTime;
	// 一对多一个角色有多个权限
	private List<Menu> menuList;
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
	public List<Menu> getMenuList() {
		return menuList;
	}
	public void setMenuList(List<Menu> menuList) {
		this.menuList = menuList;
	}
	@Override
	public String toString() {
		return "Role [id=" + id + ", name=" + name + ", createTime=" + createTime + ", menuList=" + menuList + "]";
	}
	
	
	

}
