package com.jrbac.model;

public class Ztree {
	// id
	private String id;
	// 父id
	private String pId;
	// 名称
	private String name;
	// 图标
	private String icon;
	// 是否被选中
	private boolean checked;
	// 是否禁用
	private boolean chkDisabled;
	// 是否展开
	private boolean open;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public boolean isChkDisabled() {
		return chkDisabled;
	}
	public void setChkDisabled(boolean chkDisabled) {
		this.chkDisabled = chkDisabled;
	}
	public boolean isOpen() {
		return open;
	}
	public void setOpen(boolean open) {
		this.open = open;
	}
	@Override
	public String toString() {
		return "Ztree [id=" + id + ", pId=" + pId + ", name=" + name + ", icon=" + icon + ", checked=" + checked
				+ ", chkDisabled=" + chkDisabled + ", open=" + open + "]";
	}
	

}
