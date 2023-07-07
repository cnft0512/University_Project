package com.university.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.university.mapper.StudentMapper;
import com.university.model.BasketVO;
import com.university.model.DepartmentVO;
import com.university.model.StudentLectureVO;
import com.university.model.StudentVO;
import com.university.model.Student_ImgVO;
@Service
public class StudentServiceImpl implements StudentService{
   
   @Autowired
   private StudentMapper sMapper;
   
   @Override
   public Student_ImgVO getStudent_Img(int id) throws Exception {
      return sMapper.getStudent_Img(id);
   }

   @Override
   public void insert_student_img(Student_ImgVO siVo) throws Exception {
      sMapper.insert_student_img(siVo);
   }

   @Override
   public void update_student_img(Student_ImgVO siVo) throws Exception {
      sMapper.update_student_img(siVo);
   }

   @Override
   public List<DepartmentVO> getDepartList() throws Exception {
      return sMapper.getDepartList();
   }

   @Override
   public void pwChange(StudentVO sVo) throws Exception {
      sMapper.pwChange(sVo);
   }

   @Override
   public StudentVO getInfo(int id) throws Exception {
      return sMapper.getInfo(id);
   }

   @Override
   public void modifyInfo(StudentVO sVo) throws Exception {
      sMapper.modifyInfo(sVo);
   }

   @Override
   public String delete_existing_img(Student_ImgVO siVo) {
      return sMapper.delete_existing_img(siVo);
   }

   @Override
   public List<BasketVO> getBasketList(int id) throws Exception {
      return sMapper.getBasketList(id);
   }

	@Override
	public List<StudentLectureVO> getStudentLectureList(int id) {
	   return sMapper.getStudentLectureList(id);
	}

}