package com.university.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.university.model.StudentVO;

public class AdminInterceptor implements HandlerInterceptor{
@Override
public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception {
	HttpSession session = request.getSession();
	StudentVO sVo = (StudentVO)session.getAttribute("mVo");
	if(sVo ==null||sVo.getId()!=202300001) {
		response.sendRedirect("/");
		return false;
	}
	return true;
}
}
