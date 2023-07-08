package com.university.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.university.model.StudentVO;
import com.university.model.Student_ImgVO;
import com.university.service.AdminService;
import com.university.service.LoginService;
import com.university.service.StudentService;

@Controller
@RequestMapping("/student/*")
public class StudentController {
   private static final Logger log = LoggerFactory.getLogger(StudentController.class);

   @Autowired
   private StudentService sService;   

   @Autowired
   private BCryptPasswordEncoder pwEncoder;
   
   @Autowired
   private LoginService lService;
   

   @GetMapping("/main")
   public String mainGET(HttpServletRequest request) throws NumberFormatException, Exception {
      log.info("main 진입");
      HttpSession session = request.getSession();
      StudentVO sVo = (StudentVO) session.getAttribute("mVo");
      session.setAttribute("img", sService.getStudent_Img(sVo.getId()));
      session.setAttribute("departlist", sService.getDepartList());
      return "main";
   }

   @PostMapping("/student_img")
   public String imgPOST(@RequestParam("student_img") MultipartFile file, HttpServletRequest request) throws Exception {
      HttpSession session = request.getSession();
      int value = Integer.parseInt(request.getParameter("img_value"));
      StudentVO sVo = (StudentVO) session.getAttribute("mVo");
      String fileOriName = file.getOriginalFilename(); // 원본명 가져오는 메소드
      System.out.println("yy : " + fileOriName.length());
      System.out.println("xx : " + file.getOriginalFilename());
      String extension = fileOriName.substring(fileOriName.lastIndexOf("."), fileOriName.length());
      UUID uuid = UUID.randomUUID();
      String fileName = uuid.toString() + extension;
      String uploadRoute = "C:\\spring\\University\\src\\main\\webapp\\resources\\student_img";
      File saveFile = new File(uploadRoute + "\\" + fileName); // 적용 후
      try {
         file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
      } catch (IllegalStateException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
      
      Student_ImgVO siVo = new Student_ImgVO();
      siVo.setId(sVo.getId());
      siVo.setImg_name(fileName);
      siVo.setImg_url(uploadRoute);
      siVo.setOri_img_name(fileOriName);

      if (value == 0) {
         sService.insert_student_img(siVo);
         return "redirect:/student/main";
      } else {
         String existing_img_name = sService.delete_existing_img(siVo);
         System.out.println("hi : "+existing_img_name);
         sService.update_student_img(siVo);
         File deleteFile = new File(uploadRoute + "\\" + existing_img_name); // 적용 후
         if(deleteFile.exists()) {    //삭제하고자 하는 파일이 해당 서버에 존재하면 삭제시킨다
            deleteFile.delete();
            System.out.println("기존 사진 삭제 완료");
         }
         return "redirect:/student/main";
      }

   }
   
   // 처음 로그인시 비밀번호 변경 요청
   @PostMapping("/pwChange_First")
   @ResponseBody
       public String pwChangeFirst(StudentVO sVo, HttpSession session) throws Exception {          
          log.info("첫 로그인시 비밀번호 변경 요청 발생");          
         String originPw = "";
         String encodePw = "";
         
         originPw = sVo.getPassword();      // 비밀번호 데이터 얻음
         System.out.println("받은 비번 : "+originPw);
         encodePw = pwEncoder.encode(originPw);      // 비밀번호 인코딩
         if(true == pwEncoder.matches(originPw, encodePw)) {
            System.out.println("성공");
         }
         sVo.setPassword(encodePw);      // 인코딩된 비밀번호 svo 객체에 다시 저장         
         //비밀번호 변경 성공시 로그인 세션 객체 다시 담음
         sService.pwChange(sVo);
         StudentVO sVo2 = lService.memberLogin(sVo);         
         session.setAttribute("mVo", sVo2);         
          return "changeSuccess";
       }   
   
   //인적 사항 페이지
   @GetMapping("/info")
   public String student_infoGET() throws Exception {
      log.info("인적 사항 조회 페이지 진입");
      return "info";
   }
   
   //인적 사항 수정 페이지
   @GetMapping("/info_modify")
   public String student_info_modifyGET() throws Exception {
      log.info("인적 사항 수정 페이지 진입");
      return "info_modify";
   }
   
   @PostMapping("/info_modify")
   public String student_info_modifyPOST(StudentVO sVo, HttpSession session) throws Exception{
      log.info("인적 사항 수정");      
      sService.modifyInfo(sVo);
      StudentVO sVo2 = lService.memberLogin(sVo);         
      session.setAttribute("mVo", sVo2);         
      return "info";
   }
   
   @GetMapping("/loginConfirm")
   public String loginConfirmGET() {
      log.info("재로그인창 진입");
      return "loginConfirm";
   }
   
   @PostMapping("/loginConfirm")
   public String loginConfirmPOST(HttpSession session, StudentVO sVo, RedirectAttributes rttr) throws Exception {
      log.info("재로그인");
      String rawPw = "";
      String encodePw = "";
      StudentVO sVo2 = lService.memberLogin(sVo);

      if (sVo2 != null) {// 아이디 비밀번호 일치(로그인 성공시)
         rawPw = sVo.getPassword(); // 사용자가 제출한 비밀번호
         encodePw = sVo2.getPassword(); // DB에 있는 인코딩된 비밀번호
         if (true == pwEncoder.matches(rawPw, encodePw)) {
            session.setAttribute("mVo", sVo2);
            return "redirect:/student/pwChange";
         } else { // 비밀번호가 불일치시
            rttr.addFlashAttribute("result", 0);
            return "redirect:/student/loginConfirm";
         }
      } else {
         rttr.addFlashAttribute("result", 0);
         return "redirect:/student/loginConfirm";
      }
      
   }
   
   @GetMapping("/pwChange")
   public String pwChangeGET() {
      log.info("비밀번호 변경 페이지 진입");
      return "pwChange";
   }
   
   @PostMapping("/pwCheck")
   @ResponseBody
   public String checkPw(String password, HttpSession session) throws Exception {

      log.info("비밀번호 확인 요청 발생");

      String result = null;

      StudentVO sVo = (StudentVO) session.getAttribute("mVo");

      log.info("DB 회원의 비밀번호 : " + sVo.getPassword());
      log.info("폼에서 받아온 비밀번호 : " + password);

      if (pwEncoder.matches(password, sVo.getPassword())) {
         result = "ok";
      } else {
         result = "fail";
      }
      return result;

   }
   // 비밀번호 변경 요청
   @PostMapping("/pwChange")
    @ResponseBody
    public String pwChange(StudentVO sVo, HttpSession session) throws Exception {
       
       log.info("비밀번호 변경 요청 발생");
       
       String originPw = "";
      String encodePw = "";
      
      originPw = sVo.getPassword();      // 비밀번호 데이터 얻음
      System.out.println("받은 비번 : "+originPw);
      encodePw = pwEncoder.encode(originPw);      // 비밀번호 인코딩
      if(true == pwEncoder.matches(originPw, encodePw)) {
         System.out.println("성공");
      }
      sVo.setPassword(encodePw);      // 인코딩된 비밀번호 svo 객체에 다시 저장         
      //비밀번호 변경 성공시 로그인 세션 객체 다시 담음
      sService.pwChange(sVo);
      StudentVO sVo2 = lService.memberLogin(sVo);         
      session.setAttribute("mVo", sVo2);         
       return "changeSuccess";
    }
   
   @GetMapping("/my_lecture")
      public String my_lectureGET(Model model, HttpSession session) throws Exception {
         log.info("나의 강의 페이지 진입");
         StudentVO sVo = (StudentVO) session.getAttribute("mVo");
         model.addAttribute("sVo",lService.memberLogin(sVo));
         model.addAttribute("blist",sService.getBasketList(sVo.getId()));
         model.addAttribute("sllist",sService.getStudentLectureList(sVo.getId()));
         model.addAttribute("count",sService.getStudentLectureCount(sVo.getId()));
         return "my_lecture";
      }
}