package com.university.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.university.mapper.LoginMapper;
import com.university.model.StudentVO;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	LoginMapper lMapper;

	@Override
	public StudentVO memberLogin(StudentVO sVo) throws Exception {
		return lMapper.memberLogin(sVo);
	}

	

}
