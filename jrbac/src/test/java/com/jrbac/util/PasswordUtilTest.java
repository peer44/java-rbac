package com.jrbac.util;

import org.junit.Assert;
import org.junit.Test;

public class PasswordUtilTest {

	@Test
	public void testGetPassword() {
		String plainText="12345678";
		String password = PasswordUtil.getPassword(plainText);
		System.out.println(password);
		// e42584918d922300a0498dbb6e89745d
		Assert.assertEquals("e42584918d922300a0498dbb6e89745d", password);
	}

}
