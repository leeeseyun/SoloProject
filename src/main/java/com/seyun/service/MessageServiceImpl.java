package com.seyun.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.seyun.domain.MessageVO;
import com.seyun.mapper.MessageMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class MessageServiceImpl implements MessageService{
	
	private MessageMapper mapper;

	@Override
	public Integer getChatOfExists(String sender, String receiver) {
		
		int count = mapper.getChatExistsOf(sender, receiver);
		
		log.info(count);
		
		return count;
	}

	@Override
	public List<MessageVO> getChatOf(String sender, String receiver) {
		return mapper.getChatOf(sender, receiver);
	}
	
	@Override
	public Integer insert(MessageVO message) {
		return mapper.insert(message);
	}
	
	
	
	@Override
	public List<MessageVO> getMyChatList(String sender) {
		return mapper.getMyChatList(sender);
	}

	@Override
	public Integer getMyChatListCheck(String sender) {
		return mapper.getMyChatListCheck(sender);
	}

}
