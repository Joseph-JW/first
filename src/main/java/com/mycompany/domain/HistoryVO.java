package com.mycompany.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class HistoryVO {
	private Long historyno;
    private Long isbn;
    private String userid;
    private Timestamp brdate;
    private Timestamp duedate;
    private Long brcode;
}
