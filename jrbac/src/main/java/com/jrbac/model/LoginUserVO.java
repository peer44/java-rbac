package com.jrbac.model;

import java.util.Date;

public class LoginUserVO {
	/**
	 * 主键
	 */
	private String id;
	/**
	 * 用户名
	 */
	private String username;
	/**
	 * 昵称
	 */
	private String nickname;
	/**
	 * 电话号码
	 */
	private String telephone;
	/**
	 * 电子邮件
	 */
	private String email;
	/**
	 * 创建时间
	 */
	private Date createTime;
	/**
	 * 更新时间
	 */
	private Date updateTime;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	@Override
	public String toString() {
		return "LoginUserVO [id=" + id + ", username=" + username + ", nickname=" + nickname + ", telephone="
				+ telephone + ", email=" + email + ", createTime=" + createTime + ", updateTime=" + updateTime + "]";
	}
	
	
}
