package com.university.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.university.util.Criteria;
import com.university.model.BasketVO;
import com.university.model.LectureVO;
import com.university.model.StudentLectureVO;
import com.university.model.StudentVO;
import com.university.service.LectureService;
import com.university.service.StudentService;

@Controller
@RequestMapping("/lecture/*")
public class LectureController {

	private static final Logger log = LoggerFactory.getLogger(LectureController.class);

	@Autowired
	private LectureService lService;

	@Autowired
	private StudentService sService;

	// Lecture List
	@GetMapping("/lecture_list")
	public String listGET(Criteria cri, Model model, HttpSession session) throws Exception {
		log.info("강의 목록 페이지 진입");
		StudentVO sVo = (StudentVO) session.getAttribute("mVo"); // 세션 물고 들어오기
		LocalDateTime serverTime = (LocalDateTime) session.getAttribute("serverTime");
		List<LectureVO> list = lService.getList(serverTime.getYear(), cri.getKeyword(), cri.getType(), cri.getTypeArr());
		model.addAttribute("list", list);
		model.addAttribute("bList", lService.getLecture(sVo.getId()));
		return "lecture_list";
	}

	// insert into Basket
	@PostMapping("/lecture_list")
	@ResponseBody
	public String listPOST(BasketVO bVo, Model model, Criteria cri, HttpSession session, int student_full)
			throws Exception {
		log.info("BasketVO : " + bVo);
		StudentVO sVo = (StudentVO) session.getAttribute("mVo");
		List<BasketVO> bList = lService.getLecture(sVo.getId());
		LocalDateTime serverTime = (LocalDateTime) session.getAttribute("serverTime");
		// list에서 lecture_time만 분류
		List<String> timeList = new ArrayList<String>();
		for (int i = 0; i < bList.size(); i++) {
			timeList.add(bList.get(i).getLecture_time());
		}
		// 강의 시간 겹치지 않게 하기
		if (!timeList.contains(bVo.getLecture_time())) {
			// 학점 : 24학점까지만 신청 가능
			if (bList.size() * 3 < 24) {
				lService.addLecture(bVo); // 장바구니 넣기
				lService.addCount(bVo.getLecture_code(), student_full, bVo.getLecture_year());
				model.addAttribute("list",
						lService.getList(serverTime.getYear(), cri.getKeyword(), cri.getType(), cri.getTypeArr()));
				model.addAttribute("bList", bList);
				return "inputSuccess";
			} else {
				return "fail";
			}
		} else {
			return "fail_time";
		}
	}

	// delete from Basket
	@PostMapping("/delete.do")
	@ResponseBody
	public String deleteBasketPOST(BasketVO bVo, Model model, Criteria cri, HttpSession session, int student_full)
			throws Exception {
		log.info("강의 삭제");
		lService.addCount(bVo.getLecture_code(), student_full, bVo.getLecture_year());
		lService.deleteLecture(bVo); // 장바구니 삭제
		return "deleteSuccess";
	}

	@PostMapping("/myList.do")
	@ResponseBody
	public String addMyListPOST(BasketVO bVo) throws Exception {
		log.info("나의 강의에 넣기");
		lService.addMyList(bVo); // 나의 강의 넣기
		return "addMyList";
	}

	// Time Table
	@GetMapping("/timeTable")
	public String timeTableGET(HttpSession session, Model model, HttpServletRequest request) throws Exception {
		log.info("시간표 페이지 진입");
		StudentVO sVo = (StudentVO) session.getAttribute("mVo");
		if (request.getParameter("lecture_yearNsemester") != null) {
			System.out.println(request.getParameter("lecture_year"));
			StudentLectureVO slVo = new StudentLectureVO();
			String[] lecture_yearNsemester = request.getParameter("lecture_yearNsemester").split(",");
			slVo.setLecture_year(Integer.parseInt(lecture_yearNsemester[0]));
			slVo.setSemester(lecture_yearNsemester[1]);
			model.addAttribute("semester", slVo.getSemester());
			model.addAttribute("year", slVo.getLecture_year());
			model.addAttribute("sllist", sService.getStudentLectureList(sVo.getId(), slVo.getLecture_year(), slVo.getSemester()));
			return "timeTable";
		} else {
			return "timeTable";
		}
	}

}