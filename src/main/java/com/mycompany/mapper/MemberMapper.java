package com.mycompany.mapper;

import com.mycompany.domain.MemberVO;

public interface MemberMapper {
	public void insert(MemberVO vo);
	public MemberVO selectMemberByUserid(String userid);
	public int update(MemberVO vo);
	public int delete(String userid);
	public MemberVO findId(String username, String phone);

	public MemberVO selectForFindPw(MemberVO vo);
	public int updatePw(MemberVO vo);
}
