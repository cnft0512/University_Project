package com.university.service;

import java.util.List;

import com.university.model.DepartmentVO;
import com.university.model.LectureVO;
import com.university.model.StudentLectureVO;
import com.university.model.StudentVO;
import com.university.model.Student_ImgVO;
import com.university.util.Criteria;

public interface AdminService {
   
   // 개설 교과 목록
   public List<LectureVO> getList(Criteria cri) throws Exception;   
   
   // 학과 목록
   public List<DepartmentVO> getDepartList() throws Exception;
   
   // 교과 상세 정보
   public LectureVO getLectureInfo(int lecture_code) throws Exception;
   
   // 수강 신청한 학생 목록
   public List<StudentLectureVO> getStudent_lectureList(int lecture_code) throws Exception;
      
   //학생 정보 출력
   public List<StudentVO> getStudentList() throws Exception;
   
   //학생 정보 입력
   public void insert_student(StudentVO sVO) throws Exception;
   
   //학번 정보 추가
   public void update_studentId(StudentVO sVO) throws Exception;
   
   // 중간시험 성적 입력
   public void update_mid_score(StudentLectureVO slVO) throws Exception;
   
   // 기말시험 성적 입력
   public void update_final_score(StudentLectureVO slVO) throws Exception;

}