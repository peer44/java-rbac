package com.jrbac.enums;

public enum StateEnum {
	NOT_BIND(4, "未绑定身份，无法操作"),
	NOT_IN_WECHAT(3, "未在微信客户端打开"),
	REPEAT_OPERATE(2, "重复绑定"),
	NULL_RESULT(1, "结果为空"), 
	INVALIDATE_USERNAME_PASSWORD(400,"用户名密码错误"),
	SUCCESS(0, "操作成功"), 
	FAILURE(-1, "操作失败"),
	INCORRECT_PARAM(-2, "参数不正确");
	private int code;
	private String message;

	private StateEnum(int code, String message) {
		this.code = code;
		this.message = message;
	}

	public int getCode() {
		return code;
	}

	public String getMessage() {
		return message;
	}

	public static StateEnum stateOf(int index) {
		for (StateEnum code : values()) {
			if (code.getCode() == index) {
				return code;
			}

		}
		return null;
	}

}
