package com.seyun.mapper;

import org.apache.ibatis.annotations.Param;

import com.seyun.domain.LikeVO;

public interface LikeMapper {
	//insert
	public int likeUp(LikeVO like);
	//delete
	public int likeDown(@Param("bno")Long bno, @Param("userId")String userId);
	//select return int 0 or 1
	public LikeVO findLike(@Param("bno")Long bno, @Param("userId")String userId);
}
