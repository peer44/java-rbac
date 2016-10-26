package com.jrbac.test;

import org.springframework.beans.BeanUtils;

import com.jrbac.entity.LoginUser;
import com.jrbac.model.LoginUserVO;
import com.jrbac.util.UUIDGenerator;

public class BeanCopy {
	public static void main(String[] args) {
		
		LoginUser loginUser = new LoginUser();
		loginUser.setId(UUIDGenerator.getUUID());
		loginUser.setNickname("程高伟");
		loginUser.setStatus(1);
		LoginUserVO loginUserVO = new LoginUserVO();
		BeanUtils.copyProperties(loginUser, loginUserVO);
		System.out.println(loginUserVO);
	}

}
