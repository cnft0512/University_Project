package com.university.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.university.util.Criteria;
import com.university.model.BasketVO;
import com.university.model.LectureVO;
import com.university.model.StudentLectureVO;

public interface LectureMapper {
   
   // 개설 교과 목록
   public List<LectureVO> getList(@Param("lecture_year")int lecture_year, @Param("keyword")String keyword, @Param("type")String type, @Param("typeArr")String[] typeArr);
   
   // 강의 총 갯수 + 검색 기능
   public int searchList(Criteria cri);
   
   // 나의 강의에서 아이디 갯수 세기
   public int getStudentCount(int lecture_code);
   
   // 강의 선택 후 장바구니 담기
   public int addLecture(BasketVO bVo);
   
   // 강의 선택 후 학생 정원 값 늘리기
   public void addCount(@Param("lecture_code")int lecture_code,@Param("lecture_year")int lecture_year);
   
   // 강의 선택 후 학생 정원 값 늘리기
   public void disCount(@Param("lecture_code")int lecture_code, @Param("lecture_year")int lecture_year);
   
   // 장바구니에 담은 강의 목록 불러오기
   public List<BasketVO> getLecture(int id);
   
   // 장바구니에서 강의 삭제하기
   public int deleteLecture(BasketVO bVo);
   
   // 나의 강의에 강의 목록 넣기
   public int addMyList(BasketVO bVo);
   
   // 나의 강의 목록 삭제하기
   public int deleteMyList(BasketVO bVo);
   
   // 나의 강의 목록 불러오기
   public List<StudentLectureVO> getMyList(int id);
   
}