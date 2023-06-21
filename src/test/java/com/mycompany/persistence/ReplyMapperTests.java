package com.mycompany.persistence;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mycompany.domain.ReplyVO;
import com.mycompany.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.mycompany.config.RootConfig.class, com.mycompany.config.SecurityConfig.class})
@Log4j2
public class ReplyMapperTests {
	@Setter(onMethod_ =  @Autowired)
	private ReplyMapper mapper;
	
	//@Test
	public void testInsertReply() {
		long bno = 4L;
		
		for(int i=0; i<10; i++) {
			ReplyVO vo = new ReplyVO();
			vo.setBno(bno);
			vo.setReply("댓글 테스트 " + i);
			vo.setReplyer("replyer " + i);
			mapper.insert(vo);
		}
	}
	
	//@Test
	public void testRead() {
		long rno = 3L;
		ReplyVO vo = mapper.read(rno);
		log.info(vo);
	}
	
	//@Test
	public void testDelete() {
		long rno = 2L;
		int count = mapper.delete(rno);
		log.info("delete count : " + count);
	}
	
	//@Test
	public void testUpdate() {
		long rno = 3L;
		ReplyVO vo = mapper.read(rno);
		vo.setReply("updadted Reply");
		int count = mapper.update(vo);
		log.info("updated count : " + count);
	}
	
	//@Test
	public void testGetList() {
		long bno = 4L;
		List<ReplyVO> list = mapper.getList(bno);
			for (ReplyVO vo : list) {
				log.info(vo.toString());
		}
	}
}
