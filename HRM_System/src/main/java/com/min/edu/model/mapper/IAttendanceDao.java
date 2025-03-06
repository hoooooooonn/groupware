package com.min.edu.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.min.edu.dto.AttendanceDto;

@Mapper
public interface IAttendanceDao {

	public List<AttendanceDto> attendanceList();
	
	public List<AttendanceDto> attendanceListByEmpId(String empId);
	
	public int insertAttendance(String empId);
	
	public int updateAttendance(String empId);
	
	public int checkAttendance(String empId);
	
	public String selectClockIn(String empId);
	
	public String selectClockOut(String empId);
	
	public int calAttendance(String empId);
	
	public String selectAttendtype(String empId);
	
	public int updateAttendtype(Map<String, Object> map);
	
	public int updateUseExtraTime(Map<String, Object> map);
	
}
