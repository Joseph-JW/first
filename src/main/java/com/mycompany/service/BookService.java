package com.mycompany.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.domain.AttachVO;
import com.mycompany.domain.BookVO;
import com.mycompany.domain.Criteria;
import com.mycompany.mapper.AttachMapper;
import com.mycompany.mapper.BookMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class BookService {
	@Setter(onMethod_ =  @Autowired)
	private BookMapper mapper;
	
	@Setter(onMethod_ =  @Autowired)
	private AttachMapper attachMapper;
	
	/*
	public void register(BookVO vo) {
		mapper.insert(vo);
	}
	*/
	@Transactional
	public void register(BookVO vo) {
		mapper.insert(vo);
		List<AttachVO> list = vo.getAttachList();
		if (list == null || list.isEmpty()) {
			return;
		}

		for (AttachVO attach : list) {
			attach.setIsbn(vo.getIsbn());
			System.out.println(attach.getIsbn());
			attachMapper.insert(attach);
		}
	}
	
	// img출력
	public List<AttachVO> getAttachList(Long isbn) {
		log.info("getAttachListByIsbn " + isbn);
		return attachMapper.findByIsbn(isbn);
	}
	
	
	public List<BookVO> getList() {
		return mapper.getList();
	}
	
	public List<BookVO> getListDesc() {
		return mapper.getListDesc();
	}
	
	//검색
	public List<BookVO> searchBooksByTitle(String title) {
        return mapper.searchBooksByTitle(title);
    }

	// paging
	public List<BookVO> getList(Criteria criteria) {
		return mapper.getListWithPaging(criteria);
	}
	//paging
	public int getTotal(Criteria criteria) {
		return mapper.getTotalCount(criteria);
	}
	
	public int getTotal() {
		return mapper.getTotalCount();
	}
	
	public BookVO get(Long isbn) {
		return mapper.read(isbn);
	}
	
	public boolean modify(BookVO vo) {
		return mapper.update(vo) == 1;
	}
	
	public boolean remove(Long isbn) {
		return mapper.delete(isbn) == 1;
	}
	

}
