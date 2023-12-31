package com.mycompany.mapper;

import java.util.List;

import com.mycompany.domain.BoardVO;
import com.mycompany.domain.Criteria;

public interface BoardMapper {
	public void insert(BoardVO vo);
	public List<BoardVO> getList();
	public BoardVO read(Long bno);
	public int update(BoardVO vo);
	public int delete(Long bno);
	public List<BoardVO> getListWithPaging(Criteria criteria);
	public int getTotalCount(Criteria criteria);
}
