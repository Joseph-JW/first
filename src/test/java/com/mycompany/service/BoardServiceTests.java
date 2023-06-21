package com.mycompany.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mycompany.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.mycompany.config.RootConfig.class, com.mycompany.config.SecurityConfig.class})
@Log4j2
public class BoardServiceTests {
	@Setter(onMethod_ =  @Autowired)
	private BoardService service;
	
	@Test
	public void testRegister() {
		BoardVO vo = new BoardVO("register테스트", "내용테스트1", "작가1");
		service.register(vo);
	}
}
