package com.seyun.task;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.seyun.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class BirthDayCheck {

	@Autowired
	private MemberMapper mapper;
	
	private String getToday() {
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		Calendar cal = Calendar.getInstance();
		String str = sdf.format(cal.getTime());
		log.info(str);
		return str;
	}
	
	@Scheduled(cron = "0 1 0 * * *")
	public void checkBirthday() {
		mapper.readTodayBirthMember(getToday());
	}
	
}
