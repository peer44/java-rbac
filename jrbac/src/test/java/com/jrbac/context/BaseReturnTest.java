package com.jrbac.context;

import org.junit.Test;

import com.jrbac.test.TestAddress;
import com.jrbac.test.TestUser;

public class BaseReturnTest {

	@Test
	public void testResponse() {
		TestAddress address= new TestAddress();
		address.setCity("四川");
		address.setArea("成都");
		TestUser testUser = new TestUser("张三", 12, address);
		System.out.println(BaseReturn.response(testUser));
	}

}
