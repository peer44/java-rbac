package com.jrbac.test;

public class TestAddress {
	private String city;
	private String area;
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	@Override
	public String toString() {
		return "TestAddress [city=" + city + ", area=" + area + "]";
	}
	

}
