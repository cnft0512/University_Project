package com.university.model;

import java.util.Date;

import lombok.Data;

@Data
public class StudentVO {

	private int id;
	private String password;
	private String name;
	private int depart_code;
	private String depart_name;
	private int academic_status;
	private int score_avg;
	private int credit_full;
	private Date birth;
	private String post;
	private String address_1;
	private String address_2;
	private String email;
	private String phone;
	private Date create_date;
	
}
