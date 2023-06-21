package com.mycompany.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mycompany.domain.BoardVO;
import com.mycompany.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.mycompany.config.RootConfig.class, com.mycompany.config.SecurityConfig.class})
@Log4j2
public class BoardMapperTests {
	@Setter(onMethod_ =  @Autowired)
	private BoardMapper mapper;
	
	@Test
	public void testInsertBoard() {
		BoardVO vo = new BoardVO("테스트", "내용테스트", "작가1");
		mapper.insert(vo);
	}
}
