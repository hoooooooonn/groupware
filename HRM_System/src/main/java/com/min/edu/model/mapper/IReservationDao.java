package com.min.edu.model.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.min.edu.dto.RoomDto;

@Mapper
public interface IReservationDao {

	public List<RoomDto> selectReservation(String currDay);
	
	public List<RoomDto> myReservation(String emp);
	
	public int deleteReservation(Map<String, Object> map);
	
	public int insertReservation(Map<String, Object> map);
	
	public int insertRoom(Map<String, Object> map);
}
