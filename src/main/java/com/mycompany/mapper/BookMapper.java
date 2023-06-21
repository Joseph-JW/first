package com.mycompany.mapper;

import java.util.List;

import com.mycompany.domain.BookVO;
import com.mycompany.domain.Criteria;

public interface BookMapper {
	public void insert(BookVO vo);
	public List<BookVO> getList();
	public BookVO read(Long isbn);
	public int update(BookVO vo);
	public int delete(Long isbn);
	public int getTotalCount();
	public BookVO getIsbn(String booktitle);
	public List<BookVO> getListDesc();
	
	public List<BookVO> searchBooksByTitle(String keyword);
	
	
	public List<BookVO> getListWithPaging(Criteria criteria);
	public int getTotalCount(Criteria criteria);
	
}
