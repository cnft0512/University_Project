package com.university.controller;

import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.university.model.StudentLectureVO;
import com.university.model.StudentVO;
import com.university.service.AdminService;
import com.university.util.Criteria;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	private static final Logger log = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private AdminService aService;

	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	@GetMapping("/lecture_list")
	public String lectureListGET(Locale locale, Criteria cri, Model model) throws Exception {
		log.info("강의 조회 진입");
		model.addAttribute("list", aService.getList(cri));
		return "admin_lecture_list";
	}

	@GetMapping("/join")
	public String joinGET(Model model) throws Exception {
		log.info("학생 등록 진입");
		model.addAttribute("list", aService.getDepartList());
		return "join";
	}

	@PostMapping("/join")
	public String joinPOST(StudentVO sVo, String depart_codeNname) throws Exception {
		log.info("학생 등록 시작");
		String depart[] = depart_codeNname.split(" ");
		int depart_code = Integer.parseInt(depart[0]);
		sVo.setDepart_code(depart_code);
		sVo.setDepart_name(depart[1]);
		aService.insert_student(sVo);
		return "join";
	}

	@GetMapping("/student_list")
	public String studentListGET(Model model) throws Exception {
		log.info("학생 조회 진입");
		model.addAttribute("slist", aService.getStudentList());
		model.addAttribute("departlist", aService.getDepartList());
		model.addAttribute("sllist", aService.getMyList());
		return "student_list";
	}

	@PostMapping("/student_list")
	public String update_studentIdPOST(StudentVO sVo, Model model, HttpServletRequest request) throws Exception {
		log.info("학생 아이디 등록 시작");
		String rawPw = ""; // 인코딩 전 비밀번호
		String encodePw = ""; // 인코딩 후 비밀번호
		rawPw = sVo.getPassword(); // 인코딩 전 비밀번호를 가져와서
		System.out.println(rawPw);
		encodePw = pwEncoder.encode(rawPw); // 비밀번호 인코딩 후
		sVo.setPassword(encodePw); // 인코딩 된 비밀번호를 vo에 넣는다.
		aService.update_studentId(sVo); // 아이디 생성
		model.addAttribute("slist", aService.getStudentList());
		model.addAttribute("departlist", aService.getDepartList());
		return "student_list";
	}

	@GetMapping("/score")
	public String scoreGET(Model model) throws Exception {
		log.info("성적 조회 진입");
		model.addAttribute("slist", aService.getStudentList());
		model.addAttribute("sllist", aService.getMyList());
		return "score";
	}

	@GetMapping("/lecture_detail")
	public String lecture_detailGET(int lecture_code, Model model, StudentLectureVO slVo) throws Exception {
		log.info("강의 상세 진입");
		model.addAttribute("lecture_info", aService.getLectureInfo(lecture_code));
		model.addAttribute("student_info", aService.getStudentList());
		model.addAttribute("slist", aService.getStudent_lectureList(lecture_code));
		model.addAttribute("departlist", aService.getDepartList());
		return "lecture_detail";
	}

	@PostMapping("/lecture_detail")
	public String lecture_detailPOST(int lecture_code, StudentLectureVO slVo) throws Exception {
		log.info("성적 입력");
		if (slVo.getFinal_exam() != -1) {
			aService.update_final_score(slVo);
			return "lecture_detail";
		} else if (slVo.getMidterm_exam() != -1) {
			aService.update_mid_score(slVo);
			return "lecture_detail";
		}
		return "lecture_detail";

	}

	// 수강 신청 종료 후 나의 강의로 값 넘기기
	@Scheduled(cron = "00 50 19 01 08 *")
	public void class_registrationEND() throws Exception {
		log.info("수강신청 종료");
		aService.copyBasketToStudent_lecture();
		aService.deleteBasket();
	}

	// 관리자 자동 생성
	@PostMapping("/adminCreate")
	@ResponseBody
	public String adminCreate(String password) throws Exception {
		log.info("관리자 계정 생성");
		String encodePW = pwEncoder.encode(password);
		aService.adminCreate(encodePW);
		return "CreateSuccess";
	}

}