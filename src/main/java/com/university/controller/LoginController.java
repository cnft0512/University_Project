package com.university.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Locale;
import java.util.zip.DataFormatException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.university.model.RegistrationDate;
import com.university.model.StudentVO;
import com.university.service.LoginService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {

   private static final Logger log = LoggerFactory.getLogger(LoginController.class);
   @Autowired
   private LoginService lService;
   @Autowired
   private BCryptPasswordEncoder pwEncoder;

   RegistrationDate dates = new RegistrationDate();
   
   @GetMapping("/")
   public String loginGET() {
      log.info("로그인 페이지 진입");
      return "login";
   }

   @PostMapping("/")
   public String loginPOST(HttpServletRequest request, StudentVO sVo, RedirectAttributes rttr,Model model,Locale locale) throws Exception {
      HttpSession session = request.getSession();
      String originPw = "";
      String encodePw = "";
      StudentVO sVo2 = lService.memberLogin(sVo);
      
      LocalDateTime serverTime = LocalDateTime.now();
      
      if (sVo2 != null) {
         originPw = sVo.getPassword();
         encodePw = sVo2.getPassword();
         Date date = sVo2.getBirth();
         SimpleDateFormat formatter = new SimpleDateFormat("yyMMdd");
         String birth = formatter.format(date);
         // answer 값을 체크해서 초기 비밀번호일 때 비밀번호 바꾸는 모달창 띄우기
         if (true == pwEncoder.matches(originPw, encodePw)) {
            if (true == pwEncoder.matches(birth, encodePw)) {
               System.out.println("answer 1");
               rttr.addFlashAttribute("answer", 1);
            } else {
               System.out.println("answer 0");
               rttr.addFlashAttribute("answer", 0);
            }
            sVo2.setPassword(" ");
            session.setAttribute("mVo", sVo2);
            session.setAttribute("serverTime", serverTime);
            session.setAttribute("logInTime",serverTime.format(DateTimeFormatter.ofPattern("MMddHHmmss")));
            session.setAttribute("startDate", dates.getSTARTDATE());
            session.setAttribute("endDate", dates.getENDDATE());
            log.info("로그인 완료");
            return "redirect:/student/main";
         } else {
            rttr.addFlashAttribute("result", 0);
            log.info("로그인 실패1");
            return "login";
         }
      } else {
         rttr.addFlashAttribute("result", 0);
         log.info("로그인 실패2");
         return "login";
      }
   }

   /* 메인페이지 로그아웃 */
   @GetMapping("/logout")
   public String logoutMainGET(HttpServletRequest request) throws Exception {
      log.info("로그아웃");
      HttpSession session = request.getSession();
      session.invalidate();
      return "redirect:/";
   }

   @GetMapping("/notice")
   public String noticeGET() {
      log.info("공지사항 진입");
      return "notice";
   }
   
   
}