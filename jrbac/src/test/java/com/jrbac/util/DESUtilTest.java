package com.jrbac.util;

import org.junit.Test;

public class DESUtilTest {


	@Test
	public void testDecryption() throws Exception {
	String password = 	"oEtoaxGK9ns=";
	System.out.println(DESUtil.decryption(password, "12345678"));
	}

}
