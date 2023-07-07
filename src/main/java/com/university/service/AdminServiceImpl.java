package com.university.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.university.mapper.AdminMapper;
import com.university.model.DepartmentVO;
import com.university.model.LectureVO;
import com.university.model.StudentLectureVO;
import com.university.model.StudentVO;
import com.university.model.Student_ImgVO;
import com.university.util.Criteria;
@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminMapper aMapper;

	@Override
	public List<LectureVO> getList(Criteria cri) throws Exception {
		return aMapper.getList(cri);
	}

	
	@Override
	public List<DepartmentVO> getDepartList() throws Exception {
		return aMapper.getDepartList();
	}

	@Override
	public List<StudentVO> getStudentList() throws Exception {
		return aMapper.getStudentList();
	}


	@Override
	public void insert_student(StudentVO sVO) throws Exception {
		aMapper.insert_student(sVO);
	}


	@Override
	public void update_studentId(StudentVO sVO) throws Exception {
		aMapper.update_studentId(sVO);
	}


	@Override
	public LectureVO getLectureInfo(int lecture_code) throws Exception {
		return aMapper.getLectureInfo(lecture_code);
	}


	@Override
	public List<StudentLectureVO> getStudent_lectureList(int lecture_code) throws Exception {
		return aMapper.getStudent_lectureList(lecture_code);
	}


	@Override
	public void update_mid_score(StudentLectureVO slVO) throws Exception {
		aMapper.update_mid_score(slVO);
	}



	@Override
	public void update_final_score(StudentLectureVO slVO) throws Exception {
		aMapper.update_final_score(slVO);
	}

}
