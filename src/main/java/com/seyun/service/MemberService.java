package com.seyun.service;

import java.util.List;

import com.seyun.domain.MemberProfileVO;
import com.seyun.domain.MemberVO;

public interface MemberService {
	
	public MemberVO get(String userId);
	
	public void register(MemberVO member);
	
	public int registerAuth(String userId);
	
	public List<MemberProfileVO> getMemberProfile(String userId);
}
