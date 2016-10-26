package com.jrbac.context;

/**
 * session中存在的参数
 * 
 * @author 程高伟
 *
 * @date 2016年10月24日 下午4:47:21
 */
public interface SessionParam {

	/**
	 * 滑动验证码 sessionid
	 */
	String GEET_USERID = "geetUserid";

	/**
	 * 登录页面的key
	 */
	String LOGIN_KEY = "loginKey";

	/**
	 * 登录用户在session中的key
	 */
	String LOGIN_USER = "user";

	/**
	 * ckfinder用户在session中的key
	 */
	String CKFINDER_USERROLE = "CKFinder_UserRole";

}
