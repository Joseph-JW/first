package com.mycompany.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RentalVO {
	private Long brcode;
	private Long isbn;
	private String userid;
	private Timestamp brdate;
	private Timestamp duedate;
	private String state;
	
	private String booktitle;
}


