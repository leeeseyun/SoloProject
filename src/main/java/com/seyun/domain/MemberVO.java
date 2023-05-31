package com.seyun.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String userId;
	private String userPw;
	private String userName;
	private boolean enabled;
	private String birthDay;
	
	private List<MemberProfileVO> memberProfile;
	
	private Date regDate;
	private Date updateDate;
	private List<AuthVO> authList;
	
}
