package com.mycompany.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.domain.BoardVO;
import com.mycompany.domain.BookVO;
import com.mycompany.service.BoardService;
import com.mycompany.service.BookService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

/**
 * Handles requests for the application home page.
 */

@Controller
@Log4j2
public class HomeController {
	@Setter(onMethod_ =  @Autowired)
	private BoardService boardService;

	@Setter(onMethod_ =  @Autowired)
	private BookService bookService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		List<BoardVO> list = boardService.getList();
		model.addAttribute("list", list);
		
		List<BookVO> bookList = bookService.getListDesc();
	    model.addAttribute("bookList", bookList);
		
		return "/home";
	}
	
}
