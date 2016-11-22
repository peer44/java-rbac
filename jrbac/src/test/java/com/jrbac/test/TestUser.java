package com.jrbac.test;

public class TestUser {
	private String username;
	private int age;
	private TestAddress address;
	
	public TestUser(String username, int age, TestAddress address) {
		super();
		this.username = username;
		this.age = age;
		this.address = address;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public TestAddress getAddress() {
		return address;
	}
	public void setAddress(TestAddress address) {
		this.address = address;
	}
	

}
