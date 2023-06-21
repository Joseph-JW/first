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

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes = {com.mycompany.config.RootConfig.class, 
		com.mycompany.config.SecurityConfig.class, com.mycompany.config.ServletConfig.class})
@Log4j2
public class BookControllerTests {
	@Setter(onMethod_ =  {@Autowired} )
	private WebApplicationContext context;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	@Test
	public void testRegisterBook() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.get("/book/register")
	            .param("booktitle", "controller테스트")
	            .param("bookwriter", "저1")
	            .param("publication", "대한")
				.param("publicationdate", "2020-10-10")
				.param("possession", "동부")
				.param("available", "0"))
				.andReturn()
	    		.getModelAndView()
	    		.getViewName();
	    log.info(resultPage);
	}
	
	
}
