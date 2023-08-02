package com.university.service;

import java.util.List;

import com.university.util.Criteria;
import com.university.model.BasketVO;
import com.university.model.LectureVO;
import com.university.model.StudentLectureVO;

public interface LectureService {

   // 개설 교과 목록 불러오기
   public List<LectureVO> getList(int lecture_year, String keyword, String type, String[] typeArr) throws Exception;

   // 강의 총 갯수 + 검색 기능
   public int searchList(Criteria cri) throws Exception;

   // 나의 강의 목록 불러오기
   public int getStudentCount(int lecture_code) throws Exception;

   // 강의 선택 후 장바구니 담기
   public int addLecture(BasketVO bVo) throws Exception;
   
   // 강의 선택 후 학생 정원 값 늘리기
   public void addCount(int lecture_code,int lecture_year)throws Exception;
   
   // 강의 선택 후 학생 정원 값 늘리기
   public void disCount(int lecture_code,int lecture_year)throws Exception;

   // 장바구니에 담은 강의 목록 불러오기
   public List<BasketVO> getLecture(int id) throws Exception;

   // 장바구니에서 강의 삭제하기
   public int deleteLecture(BasketVO bVo) throws Exception;
   
   // 나의 강의에 강의 목록 넣기
   public int addMyList(BasketVO bVo) throws Exception;
   
   // 나의 강의 목록 삭제하기
   public int deleteMyList(BasketVO bVo) throws Exception;
   
   // 나의 강의 목록
   public List<StudentLectureVO> getMyList(int id) throws Exception;

}