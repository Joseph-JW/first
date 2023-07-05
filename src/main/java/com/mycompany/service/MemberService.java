package com.mycompany.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.domain.AuthVO;
import com.mycompany.domain.MemberVO;
import com.mycompany.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class MemberService {
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwEncoder;
	
	public void signup(MemberVO vo) {
		vo.setUserpw(pwEncoder.encode(vo.getUserpw()));
		mapper.insert(vo);
	}
	
	public AuthVO authenticate(MemberVO memberVO) throws Exception {
		
		MemberVO selectVO = mapper.selectMemberByUserid(memberVO.getUserid());
		if(selectVO == null) {
			throw new Exception("nonUser");
		}
		if(!pwEncoder.matches(memberVO.getUserpw(), selectVO.getUserpw())) {
			throw new Exception("noMatch");
		}
		
		AuthVO authVO = new AuthVO();
		authVO.setUserid(selectVO.getUserid());
		authVO.setUsername(selectVO.getUsername());
		return authVO;
	}
	
	public MemberVO selectMemberByUserid(String userid) {
		return mapper.selectMemberByUserid(userid);
	}
	
	public boolean modify(MemberVO vo) {
		vo.setUserpw(pwEncoder.encode(vo.getUserpw()));
		return mapper.update(vo) == 1;
	}
	
	public boolean remove(String userid) {
		return mapper.delete(userid) == 1;
	}
	
	public MemberVO findId(String username, String phone) {
		return mapper.findId(username, phone);
	}
	
	public MemberVO selectForFindPw(MemberVO vo) {
		return mapper.selectForFindPw(vo);
	}
	
	public boolean modifyPw(MemberVO vo) {
		vo.setUserpw(pwEncoder.encode(vo.getUserpw()));
		return mapper.updatePw(vo) == 1;
	}
	
}
