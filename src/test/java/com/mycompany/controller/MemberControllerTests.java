package com.mycompany.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.mycompany.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes = {com.mycompany.config.RootConfig.class, 
		com.mycompany.config.SecurityConfig.class, com.mycompany.config.ServletConfig.class})
@Log4j2
public class MemberControllerTests {
	@Setter(onMethod_ =  {@Autowired} )
	private WebApplicationContext context;
	// 컨트롤러 테스트때 @WebAppConfiguration랑 	private WebApplicationContext context;있어야함
	
	private MockMvc mockMvc;
	 
	
	@Before
	public void setup() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	@Test
	public void testSurvey2ndRegisterSurvey() throws Exception {
	    String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/member/signup")
	            .param("userid", "test")
	            .param("username", "테스트")
	            .param("userpw", "1234")
	            .param("location", "대구")
	            .param("email", "")
	            .param("birth", "20000101")
	            .param("gender", "남성"))
	    		.andReturn()
	    		.getModelAndView()
	    		.getViewName();
	    log.info(resultPage);
	}
	
}
