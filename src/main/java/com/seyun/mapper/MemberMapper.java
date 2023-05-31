package com.seyun.mapper;

import com.seyun.domain.MemberVO;

public interface MemberMapper {
	
	public MemberVO read(String userId);
	
	public int insert(MemberVO member);
	
	public int insertAuth(String userId);
	
	public MemberVO readTodayBirthMember(String birthDay);
}


