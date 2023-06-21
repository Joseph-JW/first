package com.mycompany.mapper;

import com.mycompany.domain.MemberVO;

public interface MemberMapper {
	public void insert(MemberVO vo);
	public MemberVO selectMemberByUserid(String userid);
	public int update(MemberVO vo);
	public int delete(String userid);
}
