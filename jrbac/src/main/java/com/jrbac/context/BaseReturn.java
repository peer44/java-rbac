package com.jrbac.context;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * 返回数据的json格式
 * 
 * @author 程高伟
 * @date 2016年11月14日 上午10:37:51
 */
public class BaseReturn {
	private static final Gson gson = new GsonBuilder().disableHtmlEscaping().create();

	/**
	 * 返回错误码
	 * 
	 * @param errorCode
	 * @return
	 */
	public static String response(ErrorCode errorCode) {
		return returnJsonStr(errorCode, null).toString();
	}

	/**
	 * 返回一个对象,并返回成功
	 * 
	 * @param obj
	 * @return
	 */
	public static String response(Object obj) {
		return returnJsonStr(ErrorCode.SUCCESS, obj).toString();
	}

	/**
	 * 返回错误码和对象
	 * 
	 * @param errorCode
	 * @param obj
	 * @return
	 */
	public static String response(ErrorCode errorCode, Object obj) {
		return returnJsonStr(errorCode, obj).toString();
	}

	public static String returnJsonStr(ErrorCode errorCode, Object obj) {
		GsonObject gsonObj = new GsonObject();
		gsonObj.setCode(errorCode.getCode());
		gsonObj.setMessage(errorCode.getMessage());
		gsonObj.setData(obj);
		return gson.toJson(gsonObj).toString();
	}

	public static class GsonObject {
		private String code;
		private String message;
		private Object data;

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

		public Object getData() {
			return data;
		}

		public void setData(Object data) {
			this.data = data;
		}

	}

}
