package com.university.service;

import org.springframework.stereotype.Service;

import com.university.model.StudentVO;

@Service
public interface LoginService {

	/*로그인*/
	public StudentVO memberLogin(StudentVO sVo) throws Exception;
	

}
