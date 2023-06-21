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
public class BoardControllerTests {
	@Setter(onMethod_ =  {@Autowired} )
	private WebApplicationContext context;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	@Test
	public void testRegisterBoard() throws Exception {
	    String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
	            .param("title", "controller테스트")
	            .param("content", "테스트1")
	            .param("writer", "작가1"))
	    		.andReturn()
	    		.getModelAndView()
	    		.getViewName();
	    log.info(resultPage);
	    //param("[input name]", "입력값"])
	    //contextConfiguration -> jUnit과 위에 작업과는 다르기때문에 다 cofing 설정해줘야함
	    //백엔드에서 구성한 코드대로 정상작동하는지 프론트엔드 구성하기 전에도 알 수 있음
	}
}
