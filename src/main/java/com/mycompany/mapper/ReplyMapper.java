package com.mycompany.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycompany.domain.Criteria;
import com.mycompany.domain.ReplyVO;

public interface ReplyMapper {
	public int insert(ReplyVO vo);
	public List<ReplyVO> getList(Long rno);
	public ReplyVO read(Long rno);
	public int update(ReplyVO reply);
	public int delete(Long rno);
	
	public List<ReplyVO> getListWithPaging(
			@Param("criteria") Criteria criteria, @Param("bno") Long bno);
	public int getTotalCount(Long bno);
}
