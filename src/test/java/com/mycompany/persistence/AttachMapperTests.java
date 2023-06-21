package com.mycompany.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mycompany.domain.AttachVO;
import com.mycompany.mapper.AttachMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.mycompany.config.RootConfig.class, com.mycompany.config.SecurityConfig.class})
@Log4j2
public class AttachMapperTests {
	@Setter(onMethod_ =  @Autowired)
	private AttachMapper mapper;
	
	@Test
	public void testInsert() {
		AttachVO vo = new AttachVO();
		vo.setUuid("3");
		vo.setFilename("홍");
		vo.setFiletype(true);
		vo.setUploadpath("path");
		vo.setIsbn(6L);
		mapper.insert(vo);
	}
}
