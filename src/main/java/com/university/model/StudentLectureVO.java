package com.university.model;

import lombok.Data;

@Data
public class StudentLectureVO {

   private int id;
   private int lecture_code;
   private int score;   
   private double midterm_exam;
   private double final_exam;
   private int attendance;
   private double total;
   
}