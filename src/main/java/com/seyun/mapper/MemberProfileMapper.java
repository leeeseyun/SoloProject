package com.seyun.mapper;

import java.util.List;

import com.seyun.domain.MemberProfileVO;

public interface MemberProfileMapper {
	
	public void insert(MemberProfileVO mpVO);
	
	public List<MemberProfileVO> findByUserId(String userId);
	
	public void delete(String userId);
}
