package com.mycompany.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.domain.RentalVO;
import com.mycompany.mapper.RentalMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class RentalService {
	@Setter(onMethod_ =  @Autowired)
	private RentalMapper mapper;

	public void register(RentalVO vo) {
		mapper.insert(vo);
	}
	
	public List<RentalVO> getList() {
		return mapper.getList();
	}
	
	public List<RentalVO> get(String userid) {
		return mapper.get(userid);
	}
	
	public int modify(RentalVO vo) {
		return mapper.update(vo);
	}
	
	public int remove(Long brcode) {
		return mapper.delete(brcode);
	}
	
	public int getTotal() {
		return mapper.getTotalCount();
	}

}
