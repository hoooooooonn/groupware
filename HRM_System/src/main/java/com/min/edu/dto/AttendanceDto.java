package com.min.edu.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AttendanceDto {

	private int attend_id;
	private String emp_id;
	private String attend_date;
	private String clockin;
	private String clockout;
	private int total_time;
	private String attend_type;
	private int use_extra_time;

}
