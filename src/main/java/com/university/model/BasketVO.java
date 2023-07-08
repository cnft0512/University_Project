package com.university.model;

import lombok.Data;

@Data
public class BasketVO {
   
   private int id;                  // 학번으로 들어와야 함
   private int lecture_code;   // college_code + depart_code + lecture_code
   private String lecture_name;
   private String professor_name;
   private int grade;
   private String classroom;
   private String lecture_time;
   private int lecture_year;
   private String semester;
   private int student_full;
   private int credit;               // 수강 학점
   
   private int credit_count;         // 수강 학점 개수
   private int credit_total;         // 수강 학점 합계
   
   // 학점 합계 계산하기
   public void totalCredit() {
      this.credit_total = this.credit * this.credit_count ;
   }
   
}