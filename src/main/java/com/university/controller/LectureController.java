package com.university.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.university.util.Criteria;
import com.university.model.BasketVO;
import com.university.model.LectureVO;
import com.university.model.StudentVO;
import com.university.service.LectureService;

@Controller
@RequestMapping("/lecture/*")
public class LectureController {

	private static final Logger log = LoggerFactory.getLogger(LectureController.class);

	@Autowired
	private LectureService lService;

	// Lecture List
	@GetMapping("/lecture_list")
	public String listGET(Criteria cri, Model model, HttpSession session) throws Exception {
		log.info("강의 목록 페이지 진입");
		StudentVO sVo = (StudentVO) session.getAttribute("mVo");
		List<LectureVO> list = lService.getList(cri);
		for(int i=0; i<list.size();i++) {
			LectureVO lVo = list.get(i);
			lVo.setStudent_full(lService.getStudentCount(lVo.getLecture_code()));
		}
		model.addAttribute("list", list);
		model.addAttribute("bList", lService.getLecture(sVo.getId()));
		return "lecture_list";
	}

	// insert into Basket
	@PostMapping("/lecture_list")
	public String listPOST(BasketVO bVo, Model model, Criteria cri, HttpSession session) throws Exception {
		log.info("BasketVO : " + bVo);
		StudentVO sVo = (StudentVO) session.getAttribute("mVo");
		lService.addLecture(bVo); // 장바구니 넣기
		lService.addMyList(bVo); // 나의 강의 넣기
		model.addAttribute("list", lService.getList(cri));
		model.addAttribute("bList", lService.getLecture(sVo.getId()));
		return "redirect:/lecture/lecture_list";
	}

	// delete from Basket
	@PostMapping("/delete.do")
	public String deleteBasketPOST(BasketVO bVo) throws Exception {
		log.info("강의 삭제");
		lService.deleteLecture(bVo); // 장바구니 삭제
		lService.deleteMyList(bVo); // 나의 강의 삭제
		return "redirect:/lecture/lecture_list";
	}

	// Time Table
	@GetMapping("/timeTable")
	public String timeTableGET(HttpSession session, Model model) throws Exception {
		log.info("시간표 페이지 진입");
		StudentVO sVo = (StudentVO) session.getAttribute("mVo");
		model.addAttribute("bList", lService.getLecture(sVo.getId()));
		return "timeTable";
	}

}