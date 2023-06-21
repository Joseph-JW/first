package com.mycompany.persistence;

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
public class BookCheckoutMapperTests {
	@Setter(onMethod_ =  @Autowired)
	private RentalMapper mapper;
	
	//brcode, isbn, userid, brdate, duedate, state
	//@Test
	public void testInsertBook() {
		RentalVO vo = new RentalVO();
		//vo.setIsbn(42L);
		//vo.setUserid("test1");
		mapper.insert(vo);
	}
	

}
