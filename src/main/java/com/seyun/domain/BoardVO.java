package com.seyun.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long rn;
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private Date updateDate;
	private String category;

	private int likeCnt;
	private int replyCnt;
	
	private List<BoardAttachVO> attachList;
	
}
