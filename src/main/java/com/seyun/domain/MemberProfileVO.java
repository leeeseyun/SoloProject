package com.seyun.domain;


import lombok.Data;

@Data
public class MemberProfileVO {
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private String userId;
	
}
