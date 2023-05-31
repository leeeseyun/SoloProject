package com.seyun.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.seyun.domain.MemberProfileVO;
import com.seyun.domain.MemberVO;
import com.seyun.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class CommonController {
	
	private MemberService service;
	
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied : " + auth);
		model.addAttribute("msg", "Access Denied");
	}
	
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		log.info("error : " + error);
		log.info("logout : " + logout);
		if(error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		if(logout != null) {
			model.addAttribute("logout", "Logout~~~~~~");
		}
	}
	
	@GetMapping("/customLogout")
	public void logoutGET() {
		log.info("custom logout");
	}
	
	@PostMapping("/customLogout")
	public void logoutPOST() {
		log.info("post custon logout");
	}
	
	@GetMapping("/customRegister")
	public void registerGet() {
		log.info("registerget");
	}
	
	@Transactional
	@PostMapping("/customRegister")
	public String registerPost(MemberVO member) {
		log.info("registerpost");
		log.info("register Member : " + member);
		
		service.register(member);
		service.registerAuth(member.getUserId());
		
		return "redirect:/customLogin";
	}
	
	
	
}
