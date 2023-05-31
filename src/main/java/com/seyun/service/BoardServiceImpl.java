package com.seyun.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seyun.domain.BoardAttachVO;
import com.seyun.domain.BoardVO;
import com.seyun.domain.Criteria;
import com.seyun.mapper.BoardAttachMapper;
import com.seyun.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class BoardServiceImpl implements BoardService{
	
	private BoardMapper mapper;
	private BoardAttachMapper attachMapper;

	@Override	//
	public void register(BoardVO board) {
		log.info("register...." + board);
		mapper.insert(board);
		
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		board.getAttachList().forEach(attach ->{
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
	}

	@Override	//
	public BoardVO get(Long bno) {
		log.info("get......." + bno);
		
		return mapper.read(bno);
	}
	
	@Transactional
	@Override	//
	public boolean modify(BoardVO board) {
		log.info("modify....." + board);
		attachMapper.deleteAll(board.getBno());
		boolean modifyResult = mapper.update(board) == 1;
		if(modifyResult && board.getAttachList() != null) {
			board.getAttachList().forEach(attach ->{
				attach.setBno(board.getBno());
				attachMapper.insert(attach);
			});
		}
		return modifyResult;
	}

	@Override	//
	public boolean remove(Long bno) {
		log.info("remove......." + bno);
		
		attachMapper.deleteAll(bno);
		
		return mapper.delete(bno) == 1;
	}

	@Override	//
	public List<BoardVO> getListCommunity(Criteria criteria) {
		criteria.calOffset();
		log.info("getList.....withPaging");
		return mapper.getListWithPagingCommunity(criteria);
	}

	@Override
	public int getTotalCountCommunity(Criteria criteria) {
		log.info("getTotalCount........");
		return mapper.getTotalCountCommunity(criteria);
	}
	
	@Override	//
	public List<BoardVO> getListEvent(Criteria criteria) {
		criteria.calOffset();
		log.info("getList.....withPaging");
		return mapper.getListWithPagingEvent(criteria);
	}

	@Override
	public int getTotalCountEvent(Criteria criteria) {
		log.info("getTotalCount........");
		return mapper.getTotalCountEvent(criteria);
	}
	
	@Override	//
	public List<BoardVO> getListNotice(Criteria criteria) {
		criteria.calOffset();
		log.info("getList.....withPaging");
		return mapper.getListWithPagingNotice(criteria);
	}

	@Override
	public int getTotalCountNotice(Criteria criteria) {
		log.info("getTotalCount........");
		return mapper.getTotalCountNotice(criteria);
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		log.info("get Attach list by bno :" + bno);
		return attachMapper.findByBno(bno);
	}

	@Override
	public BoardVO getNewEvent() {
		return mapper.getNewEvent();
	}

	@Override
	public BoardVO getNewNotice() {
		return mapper.getNewNotice();
	}
	
	
}
