package com.mycompany.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mycompany.domain.RentalVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.mycompany.config.RootConfig.class, com.mycompany.config.SecurityConfig.class})
@Log4j2
public class RentalServiceTests {
	@Setter(onMethod_ =  @Autowired)
	private RentalService service;
	
	//@Test
	public void testRegister() {
		RentalVO vo = new RentalVO();
		vo.setIsbn(44L);
		vo.setBooktitle("테스트");
		vo.setUserid("test1");
		//service.register(vo);
	}
	
	//@Test
	public void testGet() {
		String userid = "test1";
//		RentalVO vo = service.get(userid);
	}
	
	@Test
	public void testGetList() {
		service.getList();
	}
	
	//@Test
	public void testModify() {
		RentalVO vo = new RentalVO();
		vo.setBrcode(3L);
		vo.setState("대출불가");
		service.modify(vo);
	}
	
	//@Test
	public void testDelete() {
		service.remove(3L);
	}
	
}
