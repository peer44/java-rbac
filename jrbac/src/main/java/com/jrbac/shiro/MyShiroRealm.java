package com.jrbac.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.jrbac.entity.LoginUser;

public class MyShiroRealm extends AuthorizingRealm {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private UserAuthService userAuthService;

	/***
	 * 获取授权信息，也就是看有没有权限操作
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		logger.info("-----授权-----");
		LoginUser user = (LoginUser) principals.getPrimaryPrincipal();
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		authorizationInfo.setRoles(userAuthService.findRoles(user));
		authorizationInfo.setStringPermissions(userAuthService.findPermissions(user));
		return authorizationInfo;
	}

	/***
	 * 获取认证信息，也就是用户登录
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken)
			throws AuthenticationException {
		logger.info("-----认证-----");
		// 将AuthenticationToken转化为UsernamePasswordToken
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		// 从token中得到用户名和密码
		String username = token.getUsername().trim();
		String password = "";
		if (token.getPassword() != null) {
			password = new String(token.getPassword());
		}
		logger.info("-----username:{},password:{}-----", username, password);
		LoginUser user = userAuthService.login(username, password);
		if (user != null) {
			SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user, password.toCharArray(), getName());
			return info;
		}
		return null;

	}

}
