package com.mycompany.service;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mycompany.domain.BookVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.mycompany.config.RootConfig.class, com.mycompany.config.SecurityConfig.class})
@Log4j2
public class BookServiceTests {
	@Setter(onMethod_ =  @Autowired)
	private BookService service;
	
	//@Test
	public void testRegister() {
		BookVO vo = new BookVO();
		vo.setBooktitle("북테");
		vo.setBookwriter("나");
		vo.setPublication("대구");
		//vo.setPublicationdate(21-02-02");
		vo.setPossession("동");
		vo.setAvailable(0);
		service.register(vo);
	}
}
