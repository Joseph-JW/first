package com.mycompany.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReplyVO {
	private	Long rno;
	private	Long bno;
	private	String reply;
	private	String replyer;
	private	Timestamp regdate;
	private	Timestamp updatedate;
}
