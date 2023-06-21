package com.mycompany.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mycompany.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.mycompany.config.RootConfig.class, com.mycompany.config.SecurityConfig.class})
@Log4j2
public class MemberServiceTests {
	@Setter(onMethod_ =  @Autowired)
	private MemberService service;
	
	@Test
	public void testSignupMember() {
		MemberVO vo = new MemberVO();
		vo.setUserid("test1");
		vo.setUserpw("12344");
		vo.setUsername("매퍼테스트1");
		vo.setLocation("서울");
		vo.setGender("여");
		vo.setBirth(19870101);
		vo.setEmail("asdf@test");
		service.signup(vo);
	}
}
