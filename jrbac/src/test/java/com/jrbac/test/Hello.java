package com.jrbac.test;

import org.apache.shiro.crypto.hash.Md5Hash;

public class Hello {
	public static void main(String[] args) {
		String str = new Md5Hash("test").toString();
		System.out.println(str);
		String saved = "/jrbac/home/admin";
		String url = "/jrbac";
		System.out.println(saved.split(url)[1]);
		
		String fileName = "abc.def.jpg";
		String fileExt[] = fileName.split("\\.");
		System.out.println(fileExt[fileExt.length-1]);
		
		
	}
}
