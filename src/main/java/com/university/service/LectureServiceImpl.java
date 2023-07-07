package com.university.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.university.mapper.LectureMapper;
import com.university.util.Criteria;
import com.university.model.BasketVO;
import com.university.model.DepartmentVO;
import com.university.model.LectureVO;
import com.university.model.StudentLectureVO;

@Service
public class LectureServiceImpl implements LectureService {
   
   @Autowired
   private LectureMapper lMapper;

   @Override
   public List<LectureVO> getList(Criteria cri) throws Exception {
      return lMapper.getList(cri);
   }

   @Override
   public int searchList(Criteria cri) throws Exception {
      return lMapper.searchList(cri);
   }
   
   @Override
   public List<StudentLectureVO> getStudent_lectureList(int lecture_code) throws Exception {
      return lMapper.getStudent_lectureList(lecture_code);
   }

   @Override
   public int addLecture(BasketVO bVo) throws Exception {
      return lMapper.addLecture(bVo);
   }
   
   @Override
   public List<BasketVO> getLecture(int id) throws Exception {
      return lMapper.getLecture(id);
   }

   @Override
   public int deleteLecture(BasketVO bVo) throws Exception {
      return lMapper.deleteLecture(bVo);
   }
   
   @Override
   public int addMyList(BasketVO bVo) throws Exception {
      return lMapper.addMyList(bVo);
   }
   
   @Override
   public int deleteMyList(BasketVO bVo) throws Exception {
      return lMapper.deleteMyList(bVo);
   }
   
   @Override
   public List<StudentLectureVO> getMyList(int id) throws Exception {
      return lMapper.getMyList(id);
   }

}