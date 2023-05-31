package com.seyun.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seyun.domain.Criteria;
import com.seyun.domain.ReplyPageDTO;
import com.seyun.domain.ReplyVO;
import com.seyun.mapper.BoardMapper;
import com.seyun.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ReplyServiceImpl implements ReplyService{
	
	private ReplyMapper mapper;
	private BoardMapper boardMapper;
	
	@Transactional
	@Override
	public int register(ReplyVO reply) {
		boardMapper.updateReplyCnt(reply.getBno(), 1);
		return mapper.insert(reply);
	}
	
	@Override
	public ReplyVO get(Long rno) {
		return mapper.read(rno);
	}
	
	@Override
	public int modify(ReplyVO reply) {
		return mapper.update(reply);
	}
	
	@Override
	public int remove(Long rno) {
		
		ReplyVO vo = mapper.read(rno);
		boardMapper.updateReplyCnt(vo.getBno(), -1);
		return mapper.delete(rno);
	}
	
	@Override
	public List<ReplyVO> getList(Criteria criteria, Long bno) {
		return mapper.getListWithPaging(criteria, bno);
	}
	
	@Override
	public ReplyPageDTO getListPage(Criteria criteria, Long bno) {
		criteria.calOffset();
		return new ReplyPageDTO(
				mapper.getCountByBno(bno), 
				mapper.getListWithPaging(criteria, bno)
		);
	}
}
