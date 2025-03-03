package com.min.edu.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.min.edu.dto.EmpPageDto;
import com.min.edu.dto.EmployeeDto;
import com.min.edu.model.service.IEmployeeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
@RequiredArgsConstructor
public class EmployeeController {
	
	private final IEmployeeService service;
	
//	@GetMapping(value = "/emp.do")
//	public String empList(Model model) {
//		log.info("EmployeeController empList GET 요청");
//	
//		List<EmployeeDto> empList = service.userSelectAll();
//		model.addAttribute("empList",empList);
//		
//		
//		return "empList";
//	}
	
	@GetMapping("/searchEmployee.do")
	public String searchEmployee(@RequestParam(value = "type", required = false) String type, 
	                              @RequestParam(value = "keyword", required = false) String keyword, 
	                              Model model) {
	    List<EmployeeDto> empList = new ArrayList<>();
	    
	    // 검색어가 없으면 전체 사원 목록을 반환
	    if (type == null || keyword == null || keyword.trim().isEmpty()) {
	        empList = service.userSelectAll();  // 전체 사원 목록 조회
	    } else {
	        // 검색어가 있는 경우 부서나 성명으로 검색
	        if ("dept".equals(type)) {
	            empList = service.sortDept(keyword);  // 부서별 검색
	        } else if ("name".equals(type)) {
	            empList = service.sortName(keyword);  // 이름별 검색
	        }
	    }

	    model.addAttribute("empList", empList);  // 모델에 전체 목록 또는 검색 결과 추가
	    return "empList";  // JSP로 반환
	}
	@GetMapping("/empList.do")
	public String empList(HttpSession session, Model model) {
	    String emp_id = (String) session.getAttribute("emp_id");

	    // 사용자가 관리자인지 확인
	    boolean isAdmin = service.isAdmin(emp_id);
	    
	    // 관리자라면 사원 목록을 그대로 전달
	    EmployeeDto empList = service.getOneUser(emp_id);

	    model.addAttribute("empList", empList);
	    model.addAttribute("isAdmin", isAdmin); // 관리자 여부를 JSP에 전달

	    return "empList";  // 관리자가 아닌 경우에도 같은 페이지로 이동
	}
	
	 @GetMapping("/empupload.do")
	    public String editEmployee(@RequestParam("emp_id") String emp_id, Model model) {
	        log.info("수정사원 : {}",emp_id);
	        
		    EmployeeDto employee = service.getOneUser(emp_id);

		    model.addAttribute("employee", employee);

	        return "editEmployee"; 
	    }
	 
	 @PostMapping("/updateEmployee.do")
	 public String updateEmp(@RequestParam String emp_id,@RequestParam String name,
			 @RequestParam String tel, @RequestParam String birth,
				@RequestParam int dept_id,
				@RequestParam String position,
				@RequestParam String phone,
				@RequestParam String email,
				HttpSession session,HttpServletResponse response
			 ) throws IOException {
		 response.setContentType("text/html; charset=UTF-8;");
		 
		 EmployeeDto inVo = EmployeeDto.builder()
				 
		 			.name(name)
		 			.dept_id(dept_id)
		 			.position(position)
		 			.phone(phone)
		 			.tel(tel)
		 			.email(email)
		 			.emp_id(emp_id)
		 			.birth(birth)
		 			.build();
		 
		 int n = service.updateUser(inVo);
		  if (n == 1) {
			  response.getWriter().print("<script>alert('수정완료'); window.history.back();</script>");

		    } else {
		    	response.getWriter().print("<script>alert('수정실패'); window.history.back();</script>");

		    }
		return null;
		 
	 }
	 
	 
	 @GetMapping("/regist.do")
		public String registEmployee () {
		 
		 return "registEmp";
	 }
	 
	 @PostMapping("/regist.do")
	 public String updateEmployee(@RequestParam String name,
			 @RequestParam String birth,
				@RequestParam int dept_id,
				@RequestParam String position,
				@RequestParam String phone,
				@RequestParam String tel,
				@RequestParam String email,
				@RequestParam String hire_date,
				Model model,HttpServletResponse response) throws IOException {
		 
		 EmployeeDto dto = EmployeeDto.builder()
				 
				    .name(name)
				    .birth(birth)
		 			.dept_id(dept_id)
		 			.position(position)
		 			.phone(phone)
		 			.tel(tel)
		 			.email(email)
		 			.hire_date(hire_date)
		 			.build();
		 
		 int n= service.insertEmployee(dto);
		 
		 if (n == 1) {
			 log.info("등록성공");

		    } else {
		    	log.info("등록실패");


	 }
		 return "redirect:/emp.do";
	 }

	 @GetMapping(value = "/emp.do")
	    public String empPageList(Model model, HttpServletRequest req, HttpServletResponse resp) {
	        // 페이지 정보 가져오기 (기본값: 1)
	        String pageParam = req.getParameter("page");
	        if (pageParam == null) {
	            pageParam = "1";
	        }
	        int selectPage = Integer.parseInt(pageParam);

	        // EmpPageDto 생성하여 페이징 정보 설정
	        EmpPageDto d = new EmpPageDto();
	        d.setTotalCount(service.countUser());  // 전체 글의 갯수 (예: 사원 수)
	        d.setCountList(10);  // 한 페이지에 표시될 글 갯수 (예: 10명씩)
	        d.setCountPage(5);   // 화면에 표시될 페이지 그룹 갯수 (예: 5페이지씩)
	        d.setTotalPage(d.getTotalCount());  // 전체 페이지 수 계산
	        d.setPage(selectPage); // 현재 페이지 설정 (여기서 setPage 내부에서 1 이상, totalPage 이하로 보정)
	        d.setStagePage(d.getPage()); // 현재 페이지 그룹의 시작 번호 계산
	        d.setEndPage();   // 현재 페이지 그룹의 끝 번호 계산


	        Map<String, Object> map = new HashMap<>();
	        int first = (d.getPage() - 1) * d.getCountList() + 1;  // 시작 번호
	        int last = d.getPage() * d.getCountList();             // 끝 번호
	        map.put("first", first);
	        map.put("last", last);

	        // 데이터 목록 가져오기
	        List<EmployeeDto> lists = service.selectAllUser(map);
	        model.addAttribute("empList", lists);
	        model.addAttribute("page", d);  // EmpPageDto 객체 전달

	        return "empList";  // JSP 파일명: empList.jsp
	    }
	}




	 
	 
	




	









