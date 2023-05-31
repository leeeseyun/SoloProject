package com.seyun.service;

import org.springframework.stereotype.Service;

import com.seyun.domain.LikeVO;
import com.seyun.mapper.BoardMapper;
import com.seyun.mapper.LikeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Service
@AllArgsConstructor
@Log4j
public class LikeServiceImpl implements LikeService{

	private LikeMapper likeMapper;
	private BoardMapper boardMapper;
	
	@Override
	public int likeUp(LikeVO like) {
		log.info("likeUp" + like);
		boardMapper.updateLikeCnt(like.getBno(), 1);
		return likeMapper.likeUp(like);
	}

	@Override
	public int likeDown(Long bno, String userId) {
		boardMapper.updateLikeCnt(bno, -1);
		return likeMapper.likeDown(bno, userId);
	}

	@Override
	public LikeVO findLike(Long bno, String userId) {
		
		return likeMapper.findLike(bno, userId);
	}
}
