package com.mycompany.domain;

import lombok.Data;

@Data
public class AttachVO {
	private String uuid;
	private String uploadpath;
	private String filename;
	private boolean filetype;
	
	private Long isbn;
}
