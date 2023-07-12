package com.university.model;

import lombok.Data;

@Data
public class StudentLectureVO {

   private int id;
   private int lecture_code; 
   private String lecture_name;
   private String professor_name;
   private int grade;
   private String classroom;
   private String lecture_time;   
   private int lecture_year;
   private String semester;
   private double midterm_exam;
   private double final_exam;
   private double total;
   
}