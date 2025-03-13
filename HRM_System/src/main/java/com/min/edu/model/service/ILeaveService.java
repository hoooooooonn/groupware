package com.min.edu.model.service;

import java.util.List;
import java.util.Map;

public interface ILeaveService {
	
	public int countLeavePage();

	public List<Map<String, Object>> selectLeavePage(Map<String, Object> map);
	
	public List<Map<String, Object>> leaveList();
	
	public List<Map<String, Object>> leaveListByEmpId(String empId, String startDate, String endDate);
}
