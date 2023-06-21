package com.mycompany.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.mycompany.domain.AttachVO;
import com.mycompany.domain.BookVO;
import com.mycompany.domain.Criteria;
import com.mycompany.domain.PageDTO;
import com.mycompany.domain.RentalVO;
import com.mycompany.service.BookService;
import com.mycompany.service.MemberService;
import com.mycompany.service.RentalService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/book/*")
@Log4j2
public class BookController {
	@Setter(onMethod_ =  @Autowired)
	private BookService bookService;
	
	@Setter(onMethod_ =  @Autowired)
	private MemberService memberService;
	
	@Setter(onMethod_ =  @Autowired)
	private RentalService rentalService;
	
	
	
	@GetMapping("/register")
	public String bookRegisterForm() {
		
		return "book/bookRegister";
	}
	
	@PostMapping("/register")
	public String BookRegister(BookVO vo, RedirectAttributes rttr) {
		bookService.register(vo);
		rttr.addFlashAttribute("isbn", vo.getIsbn());
		return "redirect:/book/list";
	}
	
	@GetMapping("/list")
	public String bookList(Model model, Criteria criteria) {
	    List<BookVO> bookList = bookService.getList(criteria);
	    model.addAttribute("book", bookList);
	    int total = bookService.getTotal(criteria);
	    model.addAttribute("pageDTO", new PageDTO(criteria, total));
	    log.info(bookList + "total : " + total);
	    return "book/bookList";
	}
	
	
	@GetMapping("/getBook")
	public String getBook(@RequestParam("isbn") Long isbn, Criteria criteria, Model model) {
	    model.addAttribute("book", bookService.get(isbn));
	    return "book/getBook";
	}
	
	
	@GetMapping("/rentalList")
	public String rental(Model model) {
		List<RentalVO> rentalList = rentalService.getList();
	    model.addAttribute("rental", rentalList);
	    
	    int total = rentalService.getTotal();
	    model.addAttribute("total", total);
		return "book/bookRental";
	}
	
	@PostMapping("/rentalList")
	public String rentalReturn(RentalVO rental, Model model) {
		System.out.println("다다다" +rental.getState());
		if(rental.getState().equals("대출중")) {
			rental.setState("반납");
			rentalService.modify(rental);
			System.out.println("가가가");
		} else {
			rentalService.remove(rental.getBrcode());
			System.out.println("나나나");
		}
		List<RentalVO> rentalList = rentalService.getList();
	    model.addAttribute("rental", rentalList);
		return "redirect:/book/rentalList";
	}
	
	@GetMapping("/rentalRegister")
	public String rentalRegister(Model model) {
		List<BookVO> bookList = bookService.getList();
	    model.addAttribute("book", bookList);
	    
		return "book/rentalRegister";
	}
	
	@PostMapping("/rentalRegister") 
	public String rentalRegister(RentalVO rental, RedirectAttributes rttr) {
		rentalService.register(rental);
		return "redirect:/book/rentalList";
	}
	
	@ResponseBody
	@GetMapping(value = "/getAttachList/{isbn}",
			produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AttachVO>> getAttachList(
			@PathVariable("isbn") Long isbn) {
		log.info("getAttachList : " + isbn );
		return new ResponseEntity<>(bookService.getAttachList(isbn), HttpStatus.OK);
	}
	
	@GetMapping("/bookReturn")
	public String bookReturn() {
	
	    return "book/bookReturn";
	}
	
	//list에 img표시
	@ResponseBody
	@GetMapping(value = "/getAttachListOnList",
			produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> getAttachListOnList(
			@RequestParam(value = "list[]") List<Long> list) {
		log.info("getAttachListOnList : " + list.stream().collect(Collectors.toList()));
		Map<Long, List<AttachVO>> map = new HashMap<Long, List<AttachVO>>();
		for(Long isbn : list) {
			map.put(isbn, bookService.getAttachList(isbn));
		}
		String gson = new Gson().toJson(map, HashMap.class);
		return new ResponseEntity<>(gson, HttpStatus.OK);
	}
	
	/*
	 * @PostMapping("/bookReturn") public String bookReturn(RentalVO rental,
	 * HttpServletRequest request, Model model) { rental =
	 * rentalService.get(rental.getUserid()); // 매개 변수로 현재 로그인된 userid를 전달
	 * model.addAttribute("book", rental); return "redirect:/book/bookReturn"; }
	 */
	
	
	/*
	@PostMapping("/rental") 
	public String rental(MemberVO member, BookVO book, RentalVO rental, Model model) {
		rental.setIsbn(book.getIsbn());
		rental.setBooktitle(book.getBooktitle());
		rental.setUserid(member.getUserid());
		rentalService.register(rental);
		
		return null; 
	}
	 */
}
