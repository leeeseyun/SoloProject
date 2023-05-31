package com.seyun.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MessageVO {
	private Long mno;
	private String sender;
	private String receiver;
	private String message;
	private Date sendDate;
}
