package com.mycompany.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class BookVO {
	private Long isbn;
    private String booktitle;
    private String bookwriter;
    private String publication;
    private String possession;
    private String genre;
    private Date publicationdate;
    private int available;
   
    private String userId;
    private Long rn;
    private Long bno;
    
	private List<AttachVO> attachList;	// file 여러개 저장용
}
