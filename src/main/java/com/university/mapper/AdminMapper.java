package com.university.mapper;

import java.util.List;

import com.university.model.DepartmentVO;
import com.university.model.LectureVO;
import com.university.model.StudentLectureVO;
import com.university.model.StudentVO;
import com.university.model.Student_ImgVO;
import com.university.util.Criteria;

public interface AdminMapper {
	
	// 개설 교과 목록
	public List<LectureVO> getList(Criteria cri);

	// 학과 목록
	public List<DepartmentVO> getDepartList();

	// 강의 상세 정보
	public LectureVO getLectureInfo(int lecture_code);

	// 강의 수강신청한 학생 목록
	public List<StudentLectureVO> getStudent_lectureList(int lecture_code);
	
	// 성적 조회 시 과목 불러오기
	public List<StudentLectureVO> getMyList();

	// 학생 정보 출력
	public List<StudentVO> getStudentList();

	// 학생 정보 입력
	public void insert_student(StudentVO sVO);

	// 학번 정보 추가
	public void update_studentId(StudentVO sVO);

	// 중간시험 성적 입력
	public void update_mid_score(StudentLectureVO slVO);

	// 기말시험 성적 입력
	public void update_final_score(StudentLectureVO slVO);

	// 수강신청 기간 종료시 basket에서 student_lecture로 복사
	public void copyBasketToStudent_lecture();

	// 수강신청 기간 종료시 basket 삭제
	public void deleteBasket();
	
	//관리자 계정 생성
	public void adminCreate(String encodePW);
	
}