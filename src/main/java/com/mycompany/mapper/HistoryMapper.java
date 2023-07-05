package com.mycompany.mapper;

import com.mycompany.domain.HistoryVO;

public interface HistoryMapper {
	public void insert(HistoryVO history);
	public HistoryVO update(HistoryVO history);
}
