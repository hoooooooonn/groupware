package com.min.edu.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.min.edu.dto.ApprovalDto;
import com.min.edu.dto.DocumentDto;
import com.min.edu.dto.EmployeeDto;
import com.min.edu.dto.FileUpDto;
import com.min.edu.dto.LeaveDto;
import com.min.edu.dto.SignDto;
import com.min.edu.dto.TripDto;
import com.min.edu.model.mapper.IEmployeeDao;
import com.min.edu.model.service.IApprovalService;
import com.min.edu.model.service.IEmployeeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ApprovalFormController {
	
	private final IApprovalService approvalService;

	// 결재문서 폼 이동------------------------------------------------------
	@GetMapping(value = "/vacationForm.do")
	public String vacation_form(Model model, HttpSession session) {
		
		EmployeeDto loginVo = (EmployeeDto) session.getAttribute("loginVo");
		String ename = loginVo.getName();
		
		return "vacationApproval";
	}

	@GetMapping(value = "/tripForm.do")
	public String trip_form() {
		return "tripApproval";
	}

  @GetMapping(value = "/reportForm.do")
	public String report_form() {
		return "reportApproval";
	}
	
	// 결재문서 임시저장------------------------------------------------------
	@PostMapping(value = "/TempReport.do")
	public String report_temp(Model model, HttpSession session,
								@RequestParam("title") String title,
								@RequestParam("content") String content,
								@RequestParam("doc_type") String doc_type,
								@RequestParam(value = "file", required = false) MultipartFile file,
								@RequestParam(value = "leave_start", required = false) String leave_start,
								@RequestParam(value = "leave_end", required = false) String leave_end,
								@RequestParam(value = "type", required = false) String type,
								@RequestParam(value = "trip_start", required = false) String trip_start,
								@RequestParam(value = "trip_end", required = false) String trip_end,
								@RequestParam(value = "destination", required = false) String destination,
								HttpServletRequest request) throws ParseException {
		
		// 로그인 세션 불러오기
		EmployeeDto loginVo = (EmployeeDto) session.getAttribute("loginVo");
		String name = loginVo.getName();
		
		// 공통 문서양식 저장
		DocumentDto dto = DocumentDto.builder()
					.name(name)
					.doc_type(doc_type)
					.title(title)
					.content(content)
					.build();
		
		int resultTemp = approvalService.insertSaveDoc(dto);
		int doc_id = approvalService.getDocId();
		
		if (doc_type.trim().equals("출장") && 
			    (trip_start != null && !trip_start.isEmpty()) || 
			    (trip_end != null && !trip_end.isEmpty()) || 
			    (destination != null && !destination.isEmpty())) {
			
			TripDto tripDto = TripDto.builder()
					.doc_id(doc_id)
					.trip_start(trip_start)
					.trip_end(trip_end)
					.destination(destination)
					.build();
			
			int resultTrip = approvalService.insertSaveTrip(tripDto);
			
			session.setAttribute("doc_id", doc_id);		
			
			return "redirect:/approval.do";
			
		} else if (doc_type.trim().equals("휴가") && 
		         (leave_start != null && !leave_start.isEmpty()) && 
		         (leave_end != null && !leave_end.isEmpty()) && 
		         (type != null && !type.isEmpty())) {

			// SimpleDateFormat을 사용하여 문자열을 Date로 변환
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        Date startDate = sdf.parse(leave_start);
	        Date endDate = sdf.parse(leave_end);

	        // 두 날짜의 차이 계산 (밀리초 기준)
	        long diffInMillies = endDate.getTime() - startDate.getTime();
	        int leave_days = (int) TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
			
			LeaveDto leaveDto = LeaveDto.builder()
					.doc_id(doc_id)
					.leave_start(leave_start)
					.leave_end(leave_end)
					.type(type)
					.leave_days(leave_days)
					.build();
			
			int resultLeave = approvalService.insertSaveLeave(leaveDto);
			
			session.setAttribute("doc_id", doc_id);		
			
			return "redirect:/approval.do";
			
		} else if(doc_type.trim().equals("보고서")) {

			if(file != null && !file.isEmpty()) {
				try {
					
					String uploadDir = request.getSession().getServletContext().getRealPath("fileup");
		            File uploadFolder = new File(uploadDir);
		            
		            if(!uploadFolder.exists()) {
		            	uploadFolder.mkdirs();
		            }
		            
		            String origin_name = file.getOriginalFilename();
		            String store_name = System.currentTimeMillis() + "_" + origin_name;
		            String file_path = uploadDir + File.separator + store_name;

		            File dest = new File(file_path);
		            file.transferTo(dest);

		            int size = (int) file.getSize();
		            
		            int resultTempFile = approvalService.insertTempFile(FileUpDto.builder()
						            		.doc_id(doc_id)
						            		.origin_name(origin_name)
						            		.store_name(store_name)
						            		.size(size)
						            		.file_path(file_path)
						            		.build());
		            
		            approvalService.updateTempFileExist(doc_id);
		            
		            model.addAttribute("origin_name", origin_name);
		            model.addAttribute("store_name", store_name);
		            model.addAttribute("file_path", file_path);
		            
				} catch (Exception e) {
					return "approval";
				}
			}
			
			session.setAttribute("doc_id", doc_id);		
			
			return "approval";
			
		}
		
		return "redirect:/approval.do";
		
	}
	
	// 결재문서 상신------------------------------------------------------
	@PostMapping(value = "/ApprovalReport.do")
	public String report_approval(Model model,
								  HttpSession session,
								  HttpServletRequest request,
								  @RequestParam("title") String title,
								  @RequestParam("content") String content,
								  @RequestParam(value = "file", required = false) MultipartFile file) {
		
		
		
		return "redirect:/approval.do";
	}
	
	// 결재선------------------------------------------------------
	@GetMapping(value = "/tree.do")
	public String tree() {
		return "tree";
	}
	
	public String getMethodName(@RequestParam String param) {
		return new String();
	}
	
}
