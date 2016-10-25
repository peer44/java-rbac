package com.jrbac.util;

import org.junit.Assert;
import org.junit.Test;

public class PasswordUtilTest {

	@Test
	public void testGetPassword() {
		String plainText="123456";
		String password = PasswordUtil.getPassword(plainText);
		// 4280d89a5a03f812751f504cc10ee8a5
		Assert.assertEquals("4280d89a5a03f812751f504cc10ee8a5", password);
	}

}
