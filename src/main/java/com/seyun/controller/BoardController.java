package com.seyun.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.seyun.domain.BoardAttachVO;
import com.seyun.domain.BoardVO;
import com.seyun.domain.Criteria;
import com.seyun.domain.PageDTO;
import com.seyun.service.BoardService;
import com.seyun.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping({"/community/*", "/event/*", "/notice/*", "/*"})
@AllArgsConstructor
public class BoardController {

	private BoardService service;
	private MemberService mService;
	
	@GetMapping("/list")
	public void list(Criteria criteria, Model model, HttpServletRequest req) {
		
		
		if(req.getRequestURI().equals("/community/list")) {
			int total = service.getTotalCountCommunity(criteria);
			log.info("1");
			log.info("list" + criteria);
			model.addAttribute("list", service.getListCommunity(criteria));
			model.addAttribute("pageMaker", new PageDTO(criteria, total));
		}else if(req.getRequestURI().equals("/event/list")) {
			int total = service.getTotalCountEvent(criteria);
			log.info("1");
			log.info("list" + criteria);
			model.addAttribute("list", service.getListEvent(criteria));
			model.addAttribute("pageMaker", new PageDTO(criteria, total));
		}else {
			int total = service.getTotalCountNotice(criteria);
			log.info("1");
			log.info("list" + criteria);
			model.addAttribute("list", service.getListNotice(criteria));
			model.addAttribute("pageMaker", new PageDTO(criteria, total));
		}
	}
	
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register() {
		log.info("register");
	}
	
	
	@PostMapping("/register")		//
	@PreAuthorize("isAuthenticated()")
	public String register(BoardVO board, RedirectAttributes rttr, HttpServletRequest req) {
		
		log.info("register : " + board);
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> {
				log.info(attach);
			});
		}
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		
		if(req.getRequestURI().equals("/community/register")) {
			return "redirect:/community/list";
		}else if(req.getRequestURI().equals("/event/register")) {
			return "redirect:/event/list";
		}else {
			return "redirect:/notice/list";
		}
	}
	
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno")Long bno, 
			@ModelAttribute("criteria") Criteria criteria, 
			Model model) {
		log.info("/get or modify");
		model.addAttribute("board", service.get(bno));
	}
	
	@PreAuthorize("principal.username == #board.writer")
	@PostMapping("/modify")
	public String modify(BoardVO board, Criteria criteria, 
			RedirectAttributes rttr, HttpServletRequest req) {
		log.info("modify:" + board);
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		if(req.getRequestURI().equals("/community/modify")) {
			return "redirect:/community/list" + criteria.getListLink();
		}else if(req.getRequestURI().equals("/event/modify")) {
			return "redirect:/event/list" + criteria.getListLink();
		}else {
			return "redirect:/notice/list" + criteria.getListLink();
		}
		
	}
	
	@PreAuthorize("principal.username == #writer")
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, Criteria criteria,
			RedirectAttributes rttr, @RequestParam("writer") String writer, 
			HttpServletRequest req) {
		log.info("remove:" + bno);
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		if(service.remove(bno)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}
		
		if(req.getRequestURI().equals("/community/remove")) {
			return "redirect:/community/list" + criteria.getListLink();
		}else if(req.getRequestURI().equals("/event/remove")) {
			return "redirect:/event/list" + criteria.getListLink();
		}else {
			return "redirect:/notice/list" + criteria.getListLink();
		}
		
	}
	
	
	private void deleteFiles(List<BoardAttachVO> attachList) {
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		log.info("delete attach file.........");
		log.info(attachList);
		attachList.forEach(attach ->{
			try {
				Path file = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());
				Files.deleteIfExists(file);
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\s_" + attach.getUuid() + "_" + attach.getFileName());
					Files.delete(thumbNail);
				}
			}catch(Exception e) {
				log.error("delete file error" + e.getMessage());
			}
		});
	}


	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno){
		log.info("getAttachList : " + bno);
		
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}
	

	@GetMapping("/main")
	public void main(Model model) {
		model.addAttribute("newEvent", service.getNewEvent());
		model.addAttribute("newNotice", service.getNewNotice());
	}
}
