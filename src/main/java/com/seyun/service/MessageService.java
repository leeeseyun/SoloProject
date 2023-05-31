package com.seyun.service;

import java.util.List;

import com.seyun.domain.MessageVO;

public interface MessageService {
	
	public Integer getChatOfExists(String sender, String receiver);
	
	public List<MessageVO> getChatOf(String sender, String receiver);
	
	public Integer insert(MessageVO message);
	
	public List<MessageVO> getMyChatList(String sender);
	
	public Integer getMyChatListCheck(String sender);
}
