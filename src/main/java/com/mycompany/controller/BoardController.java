package com.mycompany.controller;

import java.util.List;

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

import com.mycompany.domain.BoardVO;
import com.mycompany.domain.BookVO;
import com.mycompany.domain.Criteria;
import com.mycompany.domain.PageDTO;
import com.mycompany.service.BoardService;
import com.mycompany.service.BookService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/board/*")
@Log4j2
public class BoardController {
	@Setter(onMethod_ =  @Autowired)
	private BoardService boardService;
	
	@Setter(onMethod_ =  @Autowired)
	private BookService bookService;
	
	
	@GetMapping("/register")
	public String registerForm() {
		return "/board/registerForm";
	}
	
	@PostMapping("/register")
	public String register(BoardVO vo, RedirectAttributes rttr) {
		boardService.register(vo);
		rttr.addFlashAttribute("result", vo.getBno());
		return "redirect:/board/list";
	}
	
	@GetMapping("/list")
	public String list(Criteria criteria, Model model) {
		List<BoardVO> list = boardService.getList(criteria);
		model.addAttribute("list", list);
		int total = boardService.getTotal(criteria);
		model.addAttribute("pageDTO", new PageDTO(criteria, total));
		log.info(list + "total: " + total);
		return "/board/list";
	}
	
	@GetMapping("/get")
	public String get(@RequestParam("bno")Long bno, Criteria criteria, Model model) {
		model.addAttribute("board",	boardService.get(bno));
		return "/board/get";
	}
	
	@GetMapping("/modify")
	public String modify(@RequestParam("bno")Long bno, Criteria criteria, Model model) {
		model.addAttribute("board",	boardService.get(bno));
		return "/board/modify";
	}
	
	@PostMapping("/modify")
	public String modifyOk(BoardVO vo, Criteria criteria, RedirectAttributes rttr) {
		if(boardService.modify(vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", criteria.getPageNum());
		rttr.addAttribute("amount", criteria.getAmount());
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno")Long bno, Criteria criteria, RedirectAttributes rttr) {
		if (boardService.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", criteria.getPageNum());
		rttr.addAttribute("amount", criteria.getAmount());
		return "redirect:/board/list";
	}
	
	@GetMapping("/search")
	public String search(Model model) {

		return "/board/search";
	}
	
	// 제목 검색
	@ResponseBody
	@GetMapping(value = "/searchBook", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<BookVO>> searchBooksByTitle(@RequestParam("keyword") String keyword) {
	  List<BookVO> books = bookService.searchBooksByTitle(keyword);
	  return new ResponseEntity<>(books, HttpStatus.OK);
	}

	@GetMapping("/education")
	public String education() {
		return "/board/education";
	}
	
	@GetMapping("/cultureEvent")
	public String cultureEvent() {
		return "/board/cultureEvent";
	}
	
	@GetMapping("/information")
	public String information() {
		return "/board/information";
	}
	
	@GetMapping("/guide")
	public String guide() {
		return "/board/guide";
	}
	
	@GetMapping("/library")
	public String library() {
		return "/board/library";
	}
	

	@GetMapping("/test")
	public String test() {
		return "/board/test";
	}
	
}
