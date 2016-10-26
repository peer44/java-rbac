package com.jrbac.entity;

import java.io.Serializable;

public class Menu implements Serializable {
	private static final long serialVersionUID = 7612086538358581928L;
	// 菜单id
	private String id;
	// 菜单名称
	private String name;
	// 菜单url
	private String url;
	// 菜单图标
	private String icon;
	// 菜单顺序
	private int order;
	// 菜单类型
	private int type;
	// 父菜单id
	private String fatherId;

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

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getFatherId() {
		return fatherId;
	}

	public void setFatherId(String fatherId) {
		this.fatherId = fatherId;
	}

	@Override
	public String toString() {
		return "Menu [id=" + id + ", name=" + name + ", url=" + url + ", icon=" + icon + ", order=" + order + ", type="
				+ type + ", fatherId=" + fatherId + "]";
	}

}
