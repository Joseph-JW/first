package com.mycompany.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mycompany.domain.MemberVO;
import com.mycompany.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.mycompany.config.RootConfig.class, 
		com.mycompany.config.SecurityConfig.class, com.mycompany.config.ServletConfig.class})
@Log4j2
public class MemberMapperTests {
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper mapper;
	
	@Test
	public void testInsert() {
		MemberVO vo = new MemberVO();
		vo.setUserid("admin");
		vo.setUserpw("1234");
		vo.setUsername("테스트");
		vo.setLocation("대구");
		vo.setGender("남");
		vo.setBirth(19890516);
		mapper.insert(vo);
	}
	
	
}
