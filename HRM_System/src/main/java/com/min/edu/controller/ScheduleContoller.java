package com.min.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ScheduleContoller {

	@GetMapping(value = "/schedule.do")
	public String calendar() {
		
		return "schedule";
	}
	
}
