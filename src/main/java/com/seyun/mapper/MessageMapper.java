package com.seyun.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.seyun.domain.MessageVO;

public interface MessageMapper {
	//둘의 대화기록 조회 0이면 없음
	public Integer getChatExistsOf(@Param("sender")String sender, @Param("receiver")String receiver);
	
	public List<MessageVO> getChatOf(@Param("sender")String sender, @Param("receiver")String receiver);
	
	public Integer insert(MessageVO message);
	
	
	
	//내 대화기록 조회
	public Integer getMyChatListCheck(String sender);
	
	public List<MessageVO> getMyChatList(String sender);
}
