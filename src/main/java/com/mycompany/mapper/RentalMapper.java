package com.mycompany.mapper;

import java.util.List;

import com.mycompany.domain.RentalVO;

public interface RentalMapper {
	public void insert(RentalVO vo);
	public List<RentalVO> get(String userid);
	public List<RentalVO> getList();
	public int update(RentalVO vo);
	public int delete(Long brcode);
	public int getTotalCount();
	public String getState(Long isbn);
}
