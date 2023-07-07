package com.university.model;

import lombok.Data;

@Data
public class LectureVO {

	private int lecture_code;
	private int depart_code;
	private String college_code;
	private String lecture_name;
	private String professor_name;
	private int grade;
	private String classroom;
	private String lecture_time;
	private int lecture_year;
	private String semester;
	private int student_full;
	private int credit;
	private String remarks;
	
}
