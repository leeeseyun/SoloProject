package com.seyun.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.seyun.domain.Criteria;
import com.seyun.domain.ReplyVO;

public interface ReplyMapper {
	public int insert(ReplyVO reply);
	
	public ReplyVO read(Long rno);
	
	public int delete(Long rno);
	
	public int update(ReplyVO reply);
	
	public List<ReplyVO> getListWithPaging(@Param("criteria")Criteria criteria, @Param("bno")Long bno);
	
	public int getCountByBno(Long bno);
}
