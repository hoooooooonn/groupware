package com.test.edu;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;

import com.min.edu.HrmSystemApplication;
import com.min.edu.dto.ApprovalDto;
import com.min.edu.dto.RoomDto;
import com.min.edu.model.mapper.IApprovalDao;
import com.min.edu.model.mapper.IReservationDao;

@SpringBootTest
@ContextConfiguration(classes = HrmSystemApplication.class)
class Hoon_JUnitTest {

	@Autowired
	IReservationDao dao;
	@Autowired
	IApprovalDao apprDao;
	
	@Test
	public void myReservation() {
		List<RoomDto> lists = dao.myReservation("20240002");
		System.out.println(lists);
	}
	
	
//	@Test
	public void selectReservation() {
		List<RoomDto> list = dao.selectReservation("2025-02-27");
		System.out.println(list);
		
	}
	
	
//	@Test
	public void deleteReservation() {
		Map<String, Object> map = new HashMap<String, Object>(){{
			put("reserv_id", "10");
			put("emp_id", "20250005");
		}};
		
		int cnt = dao.deleteReservation(map);
		System.out.println(cnt);
		
	}
	
//	@Test
	public void insertReservation() {
		Map<String, Object> map = new HashMap<String, Object>(){{
			put("room_id", "R01");
			put("emp_id", "20250005");
			put("rev_date", "2025-02-27");
			put("slot", "3");
		}};
		
		int cnt = dao.insertReservation(map);
		System.out.println(cnt);
		
	}
	
//	@Test
	public void deleteRoom() {
		String room = "R05";
		int cnt = dao.deleteRoom(room);
		System.out.println(cnt);
	}
	
	
//	@Test
//	public void insertRoom() {
//		String name = "회의실E";
//		
//		int cnt = dao.insertRoom(name);
//		System.out.println(cnt);
//	}
	
//	@Test
	public void insertDocument() {
		Map<String, Object> map = new HashMap<String, Object>(){{
			put("emp_id", "20250050");
			put("doc_type", "휴가");
			put("title", "휴가신청제목");
			put("content", "휴가신청내용");
			put("doc_num", "VACA_2025_1");
		}};
		
		int cnt = apprDao.insertDocument(map);
		System.out.println(cnt);
	}
	
//	@Test
	public void insertApproval() {
		Map<String, Object> map = new HashMap<String, Object>(){{
			
			
			List<ApprovalDto>  lists = new ArrayList<ApprovalDto>();
			
			ApprovalDto dto1 = new ApprovalDto();
			dto1.setEmp_id("20240002");
			dto1.setSign("사인1");
			ApprovalDto dto2 = new ApprovalDto();
			dto2.setEmp_id("20220001");
			dto2.setSign("사인2");
			ApprovalDto dto3 = new ApprovalDto();
			dto3.setEmp_id("20180057");
			dto3.setSign("사인3");
			lists.add(dto1);
			lists.add(dto2);
			lists.add(dto3);
			
			put("doc_id", "71");
			put("approval", lists);
			put("apprv_id", 0);
	}};
	
	
		int cnt = apprDao.insertApproval(map);
		System.out.println(map.get("apprv_id"));
		System.out.println(cnt);
	}
}









