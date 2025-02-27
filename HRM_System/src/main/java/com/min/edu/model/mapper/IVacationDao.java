package com.min.edu.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.min.edu.dto.VacationDto;

@Mapper
public interface IVacationDao {

	public List<VacationDto> vacationList();
	
	public int insertVacation(Map<String, Object> map);
	
	public int selectExtraTime(String empId);
	
	public int updateExtraTime(Map<String, Integer> map);
}
