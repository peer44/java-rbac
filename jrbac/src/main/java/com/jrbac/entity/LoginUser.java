package com.jrbac.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 登录用户
 * 
 * @author 程高伟
 *
 * @date 2016年10月25日 下午10:15:45
 */
public class LoginUser implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -41821327887067726L;
	/**
	 * 主键
	 */
	private String id;
	/**
	 * 用户名
	 */
	private String username;
	/**
	 * 密码
	 */
	private String password;
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
	/**
	 * 账户状态，被锁定之类的，默认为0，表示正常
	 */
	private int accountStatus;
	/**
	 * 状态,默认为0，普通用户，1为超级管理员
	 */
	private int status;

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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public int getAccountStatus() {
		return accountStatus;
	}

	public void setAccountStatus(int accountStatus) {
		this.accountStatus = accountStatus;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "LoginUser [id=" + id + ", username=" + username + ", password=" + password + ", nickname=" + nickname
				+ ", telephone=" + telephone + ", email=" + email + ", createTime=" + createTime + ", updateTime="
				+ updateTime + ", accountStatus=" + accountStatus + ", status=" + status + "]";
	}

}
