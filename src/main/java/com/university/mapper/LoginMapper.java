package com.university.mapper;

import com.university.model.StudentVO;

public interface LoginMapper {

	/* 로그인 */
	public StudentVO memberLogin(StudentVO sVo);
	
}
