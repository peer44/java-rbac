package com.jrbac.context;

/**
 * 错误返回码
 * @author 程高伟
 * @date 2016年11月11日 下午10:36:21
 */
public enum ErrorCode {
	SUCCESS("0","success"),
	FAILURE("1","failure"),
	RECORD_NULL("10000","record is null"), 
	SERVER_BUSY("-1","server is busy, please try later"),
	INTERNAL_ERROR("-2","server internal error"),
	PARAM_ERROR("-3","param error"), 
	UNSUPPORTED_TYPE("-4","unsupported type"), 
	NOT_LOGGIN("41000","not login"), 
	USER_FROZEN("41001","user was frozen"), 
	NOT_AUTHORIZED("42000","not authorized"),
	JSON_ERROR("47001","JSON/XML parse error"),
	PERMISSION_DENIED("004","permission denied");
	private String code; //error code
	private String message;  //error message
	private ErrorCode(String code,String message){
		this.code = code;
		this.message = message;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
