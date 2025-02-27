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
public class ApprovalDto {

	private int apprv_id;
	private int doc_id;
	private String emp_id;
	private String apprv_level;
	private String apprv_status;
	private String apprv_date;
	private String sign;

}
