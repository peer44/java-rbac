package com.jrbac.context;

/**
 * 系统参数和session参数
 * 
 * @author 程高伟
 * @date 2016年11月14日 上午10:43:44
 */
public interface Param {

	/**
	 * 滑动验证码session中userid的key
	 */
	String SESSION_GEET_USERID = "geetUserid";

	/**
	 * 登录页面session中对数据进行des加密的key
	 */
	String SESSION_LOGIN_DES_KEY = "loginDesKey";

	/**
	 * 登录用户在session中的key
	 */
	String SESSION_LOGIN_USER = "loginUser";

	/**
	 * 登录用户所具有的菜单在session中的key
	 */
	String SESSION_USER_MENU = "userMenuList";

	/**
	 * ckfinder用户在session中的key
	 */
	String SESSION_CKFINDER_USERROLE = "CKFinder_UserRole";
	
	/**
	 * 管理员在修改菜单的时候session中的key
	 */
	String MENU_LIST = "menuList";
	/**
	 * 管理员在修改角色的时候session中的key
	 */
	String Role_LIST = "roleList";
	/**
	 * 管理员在修改用户的时候session中的key
	 */
	String USER_LIST = "userList";

}
