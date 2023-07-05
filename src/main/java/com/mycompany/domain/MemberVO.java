package com.mycompany.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {
	private String userid;
	private String userpw;
	private String username;
	private String postcode;
	private String location;
	private String gender;
	private int birth;
	private String email;
	private Timestamp regdate;
	private Timestamp updatedate;
	private String phone;
	
	public MemberVO() {

	}
	
	
	
	public MemberVO(String userid, String userpw, String username, String location, String gender, int birth,
			String email) {
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.location = location;
		this.gender = gender;
		this.birth = birth;
		this.email = email;
	}



	public MemberVO(String userid, String userpw) {
		this.userid = userid;
		this.userpw = userpw;
	}

}
