package com.mycompany.controller;



import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.domain.AuthVO;
import com.mycompany.domain.MemberVO;
import com.mycompany.service.MemberService;

import lombok.Setter;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	@Setter(onMethod_ =  @Autowired)
	private MemberService memberService;
	
	@GetMapping("/signup")
	public String signupForm() {
		return "/member/signup";
	}
	
	@PostMapping("/signup")
	public String signupSubmit(@RequestParam("email") String email, @RequestParam("location") String location,
			//@RequestParam(name = "sign_address", required = false) String sign_address, @RequestParam(name = "detailAddress", required = false) String detailAddress, 
			@RequestParam("phone1") String phone1, @RequestParam("phone2") String phone2, @RequestParam("phone3") int phone3, MemberVO vo, HttpSession session) {
		/* 
		if ((sign_address != null || sign_address  != "") && detailAddress != null) {
			String address = sign_address + " " + detailAddress;
			vo.setLocation(address);
		} else if(sign_address != null || sign_address != ""){
			String address = sign_address;
			vo.setLocation(address);
		}
		*/
		String phone = phone1 + phone2 + phone3;
		vo.setPhone(phone);
		
		String userpw = vo.getUserpw();
		memberService.signup(vo);
		try {
			vo.setUserpw(userpw);
			AuthVO authVO =  memberService.authenticate(vo);
			session.setAttribute("auth", authVO);
		} catch (Exception e) {			
		}
		return "redirect:/";
	}
	
	@GetMapping("/memberModify")
	public String memberModify(HttpSession session, Model model) {
		AuthVO auth = (AuthVO) session.getAttribute("auth");
		String userid = auth.getUserid();
		MemberVO vo = memberService.selectMemberByUserid(userid);
		model.addAttribute("vo", vo);
		
		String phoneNumber = vo.getPhone();
		String phone1 = phoneNumber.substring(0, 3);
		String phone2 = phoneNumber.substring(3, 7);
		String phone3 = phoneNumber.substring(7);
		
		model.addAttribute("phone1", phone1);
		model.addAttribute("phone2", phone2);
		model.addAttribute("phone3", phone3);
		
		String email = vo.getEmail();
		String[] emailParts = email.split("@");
		String email1 = emailParts[0];
		String domain = emailParts[1];
		
		model.addAttribute("email1", email1);
		model.addAttribute("domain", domain);
		
		
		return "/member/memberModify";
	}
	
	@PostMapping("/memberModify")
	public String memberModified(@RequestParam("email") String email, @RequestParam("location") String location,
			@RequestParam("phone1") String phone1, @RequestParam("phone2") String phone2, @RequestParam("phone3") int phone3, 
			MemberVO vo, HttpSession session) {
		
		String phone = phone1 + phone2 + phone3;
		vo.setPhone(phone);
		
		String userpw = vo.getUserpw();
		memberService.modify(vo);
		try {
			vo.setUserpw(userpw);
			AuthVO authVO =  memberService.authenticate(vo);
			session.setAttribute("auth", authVO);
		} catch (Exception e) {			
		}
		
		return "redirect:/";
	}
	
	@GetMapping("/login")
	public String loginForm() {
		return "/member/loginForm";
	}
	
	@PostMapping("/login")
	public String loginSubmit(MemberVO vo, RedirectAttributes rttr, HttpSession session) { 
		try {
			AuthVO authVO = memberService.authenticate(vo);
			session.setAttribute("auth", authVO);
			String userURI = (String) session.getAttribute("userURI");
			if(userURI != null) {
				session.removeAttribute("userURI");
				return "redirect:" + userURI;
			}
			return "redirect:/";
		} catch (Exception e) {
			rttr.addFlashAttribute("error", e.getMessage());
			rttr.addFlashAttribute("memberVO", vo);
			return "redirect:/member/login";
		}
 	}
	
	
	@GetMapping("/logout")
	public String logout(RedirectAttributes rttr, HttpSession session) {
		session.removeAttribute("auth");
		rttr.addFlashAttribute("msg", "logout");
		return "redirect:/";
	}
	
	@GetMapping("/findId")
	public String findIdForm() {
		return "/member/findForm";
	}
	
	@PostMapping("/findId")
	public String findId(@Param("param1") String username, @Param("param2") String phone, Model model) {
		MemberVO member = memberService.findId(username, phone);
		if(member == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("userid", member.getUserid());
		}
		
		return "redirect:/member/findId";
	}
}
