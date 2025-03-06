package com.min.edu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.min.edu.dto.AttendanceDto;
import com.min.edu.dto.EmployeeDto;
import com.min.edu.model.service.IAttendanceService;
import com.min.edu.model.service.IVacationService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class AttendanceController {

	private final IAttendanceService attendanceService;
	private final IVacationService vacationService;
	
	@GetMapping(value = "/attendance")
	public String attendanceListByEmpId(HttpSession session, Model model) {
		EmployeeDto loginVo = (EmployeeDto)session.getAttribute("loginVo");
		
		if (loginVo == null) {
			log.info("로그인 정보 없음.");
			return "redirect:/loginForm";
		}
		
		String empId = loginVo.getEmp_id();
		List<AttendanceDto> lists = attendanceService.attendanceListByEmpId(empId);
		model.addAttribute("lists", lists);

		return "attendance";
	}
	
	@PostMapping(value = "/insertAttendance")
	public String insertAttendance(HttpSession session, Model model) {
		log.info("출근 버튼 클릭");
		
		EmployeeDto loginVo = (EmployeeDto)session.getAttribute("loginVo");
		if (loginVo == null) {
			log.info("로그인 정보 없음.");
			return "redirect:/loginForm";
		}
		
		String empId = loginVo.getEmp_id();
		attendanceService.insertAttendanceLogic(empId);
		
		return "redirect:/homeList.do";
	}
	
	@PostMapping(value = "/updateAttendance")
	public ResponseEntity<Map<String, Object>> updateAttendance(HttpSession session, @RequestBody Map<String, String> infoAtten) {
		log.info("퇴근 버튼 클릭");
		
		EmployeeDto loginVo = (EmployeeDto)session.getAttribute("loginVo");
		if (loginVo == null) {
			log.info("로그인 정보 없음.");
			return ResponseEntity.badRequest().build();
		}
		
		String empId = loginVo.getEmp_id();
		attendanceService.updateAttendanceLogic(empId, infoAtten);
		
		Map<String, Object> response = new HashMap<>();
		response.put("isc", Boolean.TRUE);
		
		return ResponseEntity.ok(response);
	}
	
}
