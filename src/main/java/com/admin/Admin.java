package com.admin;

public class Admin {
	private String ad_id;
	private String name;
	private String email;
	private String password;
	public Admin(String ad_id, String name, String email, String password) {
		
		this.ad_id = ad_id;
		this.name = name;
		this.email = email;
		this.password = password;
	}
	public String getAd_id() {
		return ad_id;
	}
	public String getName() {
		return name;
	}
	public String getEmail() {
		return email;
	}
	public String getPassword() {
		return password;
	}
	

		
	
}
