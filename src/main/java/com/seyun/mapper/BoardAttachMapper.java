package com.seyun.mapper;

import java.util.List;

import com.seyun.domain.BoardAttachVO;

public interface BoardAttachMapper {
	
	public void insert(BoardAttachVO vo);
	
	public List<BoardAttachVO> findByBno(Long bno);
	
	public void deleteAll(Long bno);

	public List<BoardAttachVO> getOldFiles();
}
