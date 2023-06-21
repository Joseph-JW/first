package com.mycompany.domain;

import lombok.Data;

@Data
public class AuthVO {
	private String userid;
	private String username;
	

	public AuthVO() {
	}
	
	public AuthVO(String userid, String username) {
		this.userid = userid;
		this.username = username;
	}
}
