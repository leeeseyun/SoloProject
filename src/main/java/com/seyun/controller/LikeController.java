package com.seyun.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.seyun.domain.LikeVO;
import com.seyun.service.LikeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/like/")
@RestController
@Log4j
@AllArgsConstructor
public class LikeController {
	
	private LikeService service;
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/up", consumes = "application/json", produces = {MediaType.TEXT_XML_VALUE})
	public ResponseEntity<String> up(@RequestBody LikeVO like){
		return service.likeUp(like) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PreAuthorize("principal.username == #like.userId")
	@DeleteMapping(value = "/{bno}/{userId}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<String> down(@RequestBody LikeVO like,
			@PathVariable("bno")Long bno, @PathVariable("userId")String userId){
		
		return service.likeDown(bno, userId) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping(value = "/{bno}/{userId}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<LikeVO> getState(@PathVariable("bno")Long bno, @PathVariable("userId")String userId){
		log.info("getState");
		log.info(service.findLike(bno, userId));
		
		return new ResponseEntity<>(service.findLike(bno, userId), HttpStatus.OK);
	}
}
