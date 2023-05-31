package com.seyun.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.seyun.domain.MemberProfileVO;
import com.seyun.domain.MemberVO;
import com.seyun.mapper.MemberMapper;
import com.seyun.mapper.MemberProfileMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class MemberServiceImpl implements MemberService{
	
	
	@Autowired
	private PasswordEncoder pwencoder;
	
	private MemberMapper mapper;
	private MemberProfileMapper mpMapper;
	
	@Override
	public MemberVO get(String userId) {
		log.info("Member Get...." + userId);
		return mapper.read(userId);
	}

	@Override
	public void register(MemberVO member) {
		member.setUserPw(pwencoder.encode(member.getUserPw()));
		mapper.insert(member);
		log.info("Member register...." + member);
		
		if(member.getMemberProfile() == null || member.getMemberProfile().size() <= 0) {
			return;
		}
		member.getMemberProfile().forEach(profile ->{
			profile.setUserId(member.getUserId());
			mpMapper.insert(profile);
		});
	
	}

	@Override
	public int registerAuth(String userId) {
		log.info("register Auth : " + userId);
		return mapper.insertAuth(userId);
	}
	
	@Override
	public List<MemberProfileVO> getMemberProfile(String userId) {
		log.info("get Attach list by bno :" + userId);
		if(mpMapper.findByUserId(userId)==null) {
			return mpMapper.findByUserId("default");
		}else {
			return mpMapper.findByUserId(userId);
		}
	}
}
