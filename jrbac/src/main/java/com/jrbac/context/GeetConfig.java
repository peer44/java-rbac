package com.jrbac.context;

/**
 * 验证码配置文件
 * 
 *
 */
public class GeetConfig {

	// 填入自己的captcha_id和private_key
	private static final String captcha_id = "84fd748e0aae022ef5d727e5e5120425";
	private static final String private_key = "abc36eef9a53fa4f557436da3eb991e3";

	public static final String getCaptcha_id() {
		return captcha_id;
	}

	public static final String getPrivate_key() {
		return private_key;
	}

}
