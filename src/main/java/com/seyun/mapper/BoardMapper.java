package com.seyun.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.seyun.domain.BoardVO;
import com.seyun.domain.Criteria;

public interface BoardMapper {
	
	//@Select("select * from tbl_board where bno > 0")
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPagingCommunity(Criteria criteria);
	
	public int getTotalCountCommunity(Criteria criteria);
	
	public List<BoardVO> getListWithPagingEvent(Criteria criteria);
	
	public int getTotalCountEvent(Criteria criteria);
	
	public List<BoardVO> getListWithPagingNotice(Criteria criteria);
	
	public int getTotalCountNotice(Criteria criteria);
	
	public void insert(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public Integer delete(Long bno);
	
	public Integer update(BoardVO board);
	
	public void updateReplyCnt(@Param("bno")Long bno, 
			@Param("amount")int amount);
	
	public void updateLikeCnt(@Param("bno")Long bno, @Param("likeAmount")int likeAmount);
	
	public BoardVO getNewEvent();
	
	public BoardVO getNewNotice();
	
	
}
