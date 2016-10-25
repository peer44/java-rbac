package com.jrbac.model;

import java.io.Serializable;

import com.jrbac.enums.StateEnum;


/**
 * 操作返回结果
 * 
 * @author 程高伟
 *
 * @param <T>
 * @date 2016年6月22日 上午10:19:28
 */
public class OperationResult<T> implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -7948750646496148299L;
	// 错误信息 0表示正确，非零表示错误
	private int code;
	// 状态 success,invalidate 之类的信息
	private String message;
	// 返回的数据
	private T data;

	public OperationResult(int code, String message) {
		super();
		this.code = code;
		this.message = message;
	}

	public OperationResult(StateEnum stateEnum) {
		super();
		this.code = stateEnum.getCode();
		this.message = stateEnum.getMessage();
	}

	public OperationResult(StateEnum stateEnum, T data) {
		super();
		this.code = stateEnum.getCode();
		this.message = stateEnum.getMessage();
		this.data = data;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	@Override
	public String toString() {
		return "OperationResult [code=" + code + ", message=" + message + ", data=" + data + "]";
	}

}
