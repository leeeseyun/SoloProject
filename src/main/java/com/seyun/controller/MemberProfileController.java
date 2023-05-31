package com.seyun.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.seyun.domain.MemberProfileVO;
import com.seyun.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/memberProfile/*")
@RestController
@Log4j
@AllArgsConstructor
public class MemberProfileController {
	
	private MemberService service;
	
	@GetMapping(value="/get/{userId}", produces= {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<MemberProfileVO> getProfile(@PathVariable("userId")String userId){
		
		
		return new ResponseEntity<>(service.getMemberProfile(userId).get(0), HttpStatus.OK);
	}
}
