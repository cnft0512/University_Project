package com.university.model;

import java.util.Date;

import lombok.Data;

@Data
public class Student_ImgVO {
	private int id;
	private Date regDate, updateDate;
	private String created_by, modified_by,img_name,img_url,ori_img_name;
}
