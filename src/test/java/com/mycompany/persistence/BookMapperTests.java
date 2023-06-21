package com.mycompany.persistence;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mycompany.domain.BookVO;
import com.mycompany.mapper.BookMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.mycompany.config.RootConfig.class, com.mycompany.config.SecurityConfig.class})
@Log4j2
public class BookMapperTests {
	@Setter(onMethod_ =  @Autowired)
	private BookMapper mapper;
	
	//isbn, booktitle, bookwrier, publication, publication_date, possesion, available
	//@Test
	public void testInsertBook() {
		BookVO vo = new BookVO();
		vo.setBooktitle("제목");
		vo.setBookwriter("홍");
		vo.setPublication("한");

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date publicationDate;
		try {
		    publicationDate = dateFormat.parse("2023-06-09");
		    //vo.setPublicationdate(publicationDate);
		} catch (ParseException e) {
		    e.printStackTrace();
		}
		
		vo.setPossession("중구");
		vo.setAvailable(0);
		mapper.insert(vo);
	}
	
	//@Test
	public void testReadBook() {
		long isbn = 5L;
		BookVO vo = mapper.read(isbn);
		log.info(vo);
	}
	
	//@Test
	public void testDeleteBook() {
		long isbn = 4L;
		int count = mapper.delete(isbn);
		log.info("deleted : " + count);
	}

	//@Test
	public void testUpdateBook() {
		long isbn = 5L;
		BookVO vo = mapper.read(isbn);
		vo.setBooktitle("제목44");
		vo.setBookwriter("테슽");
		int count = mapper.update(vo);
		log.info("updated " + count);
	}
	
	//@Test
	public void testBookList() {
		List<BookVO> list = mapper.getList();
			for(BookVO vo: list) {
				log.info(vo.toString());
			}
	}
	
	@Test
	public void testBookCount() {
		int count = mapper.getTotalCount();
			log.info(count);
	}
}
