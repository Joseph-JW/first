package com.mycompany.persistence;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mycompany.domain.RentalVO;
import com.mycompany.mapper.RentalMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.mycompany.config.RootConfig.class, com.mycompany.config.SecurityConfig.class})
@Log4j2
public class RentalMapperTests {
	@Setter(onMethod_ =  @Autowired)
	private RentalMapper mapper;
	
	
	//@Test
	public void testGetUserid() {
		//RentalVO vo = mapper.get("test1");
		//log.info(vo);
	}
	
	@Test
	public void testGetList() {
		List<RentalVO> list = mapper.getList();
		for (RentalVO vo : list) {
			log.info(vo.toString());
		}
	}
}
