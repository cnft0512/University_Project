package com.university.model;

import lombok.Data;

@Data
public class StudentLectureVO {

   private int id;
   private int lecture_code;
   private int score;   
   private String midterm_exam;
   private String final_exam;
   private int attendance;
   private int total;
   
}