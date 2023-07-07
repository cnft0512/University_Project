package com.university.controller;

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

import com.university.util.Criteria;
import com.university.model.BasketVO;
import com.university.model.StudentLectureVO;
import com.university.model.StudentVO;
import com.university.service.LectureService;

@Controller
@RequestMapping("/lecture/*")
public class LectureController {
	
	// test

   private static final Logger log = LoggerFactory.getLogger(LectureController.class);

   @Autowired
   private LectureService lService;

   // Lecture List
   @GetMapping("/lecture_list")
   public String listGET(Criteria cri, Model model, HttpServletRequest request) throws Exception {
      log.info("강의 목록 페이지 진입");
      HttpSession session = request.getSession();
      StudentVO sVo = (StudentVO) session.getAttribute("mVo");
      model.addAttribute("list", lService.getList(cri));
      model.addAttribute("bList", lService.getLecture(sVo.getId()));
      // log.info(cri.getKeyword());
      return "lecture_list";
   }

   // insert into Basket
   @PostMapping("/lecture_list")
   public String listPOST(BasketVO bVo, Model model, Criteria cri, HttpServletRequest request) throws Exception {
      log.info("BasketVO : " + bVo);
      HttpSession session = request.getSession();
      StudentVO sVo = (StudentVO) session.getAttribute("mVo");
      lService.addLecture(bVo);
      lService.addMyList(bVo);
      model.addAttribute("list", lService.getList(cri));
      model.addAttribute("bList", lService.getLecture(sVo.getId()));
      return "redirect:/lecture/lecture_list";
   }

   // delete from Basket
   @PostMapping("/delete.do")
   public String deleteBasketPOST(BasketVO bVo) throws Exception {
      log.info("강의 삭제");
      lService.deleteLecture(bVo);
      lService.deleteMyList(bVo);
      return "redirect:/lecture/lecture_list";
   }

   // Time Table
   @GetMapping("/timeTable")
   public String timeTableGET(HttpServletRequest request, Model model) throws Exception {
      log.info("시간표 페이지 진입");
      HttpSession session = request.getSession();
      StudentVO sVo = (StudentVO) session.getAttribute("mVo");
      model.addAttribute("bList", lService.getLecture(sVo.getId()));
      return "timeTable";
   }

}