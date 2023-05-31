package com.seyun.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.seyun.domain.MessageVO;
import com.seyun.service.MessageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/message/")
@RestController
@Log4j
@AllArgsConstructor
public class MessageController {
	
	private MessageService service;
	
	@GetMapping(value="/check/{sender}/{receiver}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<Integer> getChatExistsOf(@PathVariable("sender")String sender, @PathVariable("receiver")String receiver){
		return new ResponseEntity<>(service.getChatOfExists(sender, receiver), HttpStatus.OK);
	}
	
	@GetMapping(value = "/select/{sender}/{receiver}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<MessageVO>> getChatOf(@PathVariable("sender")String sender, @PathVariable("receiver")String receiver){
		log.info("receiver : "+receiver);
		log.info("sender : "+sender);
				
		return new ResponseEntity<>(service.getChatOf(sender, receiver), HttpStatus.OK);
	}
	
	@PostMapping(value = "/send", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> sendMessage(@RequestBody MessageVO message){
		int insertResult = service.insert(message);
		return insertResult == 1 ?
				new ResponseEntity<>("success", HttpStatus.OK) :
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/check/{sender}", produces= {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<Integer> getMyChatListCheck(@PathVariable("sender")String sender){
		return new ResponseEntity<>(service.getMyChatListCheck(sender), HttpStatus.OK);
	}
	
	@GetMapping(value="/select/{sender}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<MessageVO>> getMyChatList(@PathVariable("sender")String sender){
		return new ResponseEntity<>(service.getMyChatList(sender), HttpStatus.OK);
	}
}
