package com.mycompany.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.domain.BoardVO;
import com.mycompany.domain.Criteria;
import com.mycompany.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class BoardService {
	@Setter(onMethod_ =  @Autowired)
	private BoardMapper mapper;
	
	public void register(BoardVO vo) {
		mapper.insert(vo);
	}
	
	public List<BoardVO> getList() {
		return mapper.getList();
	}
	
	public List<BoardVO> getList(Criteria criteria) {
		return mapper.getListWithPaging(criteria);
	}
	
	public int getTotal(Criteria criteria) {
		return mapper.getTotalCount(criteria);
	}

	public BoardVO get(Long bno) {
		return mapper.read(bno);	
	}

	public boolean modify(BoardVO vo) {
		return mapper.update(vo) == 1;
	}
	
	public boolean remove(Long bno) {
		return mapper.delete(bno) == 1;
	}
}
