package com.seyun.service;

import java.util.List;

import com.seyun.domain.BoardAttachVO;
import com.seyun.domain.BoardVO;
import com.seyun.domain.Criteria;

public interface BoardService {
	
	public void register(BoardVO board);
	
	public BoardVO get(Long bno);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);
	
	public List<BoardVO> getListCommunity(Criteria criteria);
	
	public int getTotalCountCommunity(Criteria criteria);
	
	public List<BoardVO> getListEvent(Criteria criteria);
	
	public int getTotalCountEvent(Criteria criteria);
	
	public List<BoardVO> getListNotice(Criteria criteria);
	
	public int getTotalCountNotice(Criteria criteria);
	
	public List<BoardAttachVO> getAttachList(Long bno);
	
	public BoardVO getNewEvent();
	
	public BoardVO getNewNotice();
}
