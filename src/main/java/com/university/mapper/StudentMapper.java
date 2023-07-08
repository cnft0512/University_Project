package com.university.mapper;

import java.util.List;

import com.university.model.BasketVO;
import com.university.model.DepartmentVO;
import com.university.model.StudentLectureVO;
import com.university.model.StudentVO;
import com.university.model.Student_ImgVO;

public interface StudentMapper {
   
   //로그인시 사진 가져오기
   public Student_ImgVO getStudent_Img(int id);   

   //학생 사진 추가
   public void insert_student_img(Student_ImgVO siVo);
   
   //학생 사진 수정
   public void update_student_img(Student_ImgVO siVo);
   
   //기존 사진 제거
   public String delete_existing_img(Student_ImgVO siVo);
   
   //학과 목록
   public List<DepartmentVO> getDepartList();   

   //비밀번호 변경
   public void pwChange(StudentVO sVo);
   
   //인적 사항 조회
   public StudentVO getInfo(int id);
   
   //인적 사항 수정
   public void modifyInfo(StudentVO sVo);
   
   //수강 신청한 강의 목록 가져오기
   public List<BasketVO> getBasketList(int id);
   
   //수강 신청한 내 강의 정보 가져오기
   public List<StudentLectureVO> getStudentLectureList(int id);
   
   //수강 신청한 내 강의 개수 가져오기
   public int getStudentLectureCount(int id);
}