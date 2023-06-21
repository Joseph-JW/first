package com.mycompany.mapper;

import java.util.List;

import com.mycompany.domain.AttachVO;

public interface AttachMapper {
	public void insert(AttachVO vo);
	public List<AttachVO> findByIsbn(Long isbn);
}
