package com.seyun.service;

import com.seyun.domain.LikeVO;

public interface LikeService {
	//insert
	public int likeUp(LikeVO like);
	//delete
	public int likeDown(Long bno, String userId);
	//select return int 0 or 1
	public LikeVO findLike(Long bno, String userId);
}
