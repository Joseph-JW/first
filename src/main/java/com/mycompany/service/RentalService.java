package com.mycompany.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.domain.HistoryVO;
import com.mycompany.domain.RentalVO;
import com.mycompany.mapper.HistoryMapper;
import com.mycompany.mapper.RentalMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class RentalService {
	@Setter(onMethod_ =  @Autowired)
	private RentalMapper mapper;

	@Setter(onMethod_ =  @Autowired)
	private HistoryMapper historyMapper;
	
	public void register(RentalVO vo) {
		mapper.insert(vo);
		
		HistoryVO history = new HistoryVO();
		history.setIsbn(vo.getIsbn());
		history.setUserid(vo.getUserid());
		//history.setBrcode(vo.getBrcode());
		historyMapper.insert(history);
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
	
	public String getState(Long isbn) {
		return mapper.getState(isbn);
	}

}
