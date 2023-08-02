<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
   href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
   rel="stylesheet">

<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../resources/includes/modal.css">
<link rel="stylesheet" href="../resources/includes/css/style.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
   crossorigin="anonymous"></script>
   

</head>
<body>
   <nav id="sidebar">
      <div class="p-4 pt-5">
         <c:choose>
            <c:when test="${mVo.id eq '202300001' && mVo.name eq '관리자'}">
               <a href="/student/main" class="img logo rounded-circle mb-5"
                  style="background-image: url(../resources/includes/images/admin.png);"></a>
               <ul class="list-unstyled components mb-5">
                  <!--  <li><a href="#" onclick="class_registrationSTART()">수강 신청 기간 오픈</a></li>-->
                  <li><a href="#homeSubmenu" data-toggle="collapse"
                     aria-expanded="false" class="dropdown-toggle">학생 관리</a>
                     <ul class="collapse list-unstyled" id="homeSubmenu">
                        <li><a href="/admin/student_list">학생 조회</a></li>
                        <li><a href="/admin/join">학생 추가(학생처)</a></li>
                     </ul></li>

                  <li><a href="/admin/lecture_list">강의 관리</a></li>
                  <li><a href="/notice">공지사항 게시판</a></li>
               </ul>
            </c:when>

            <c:otherwise>
               <div class = "info_area">
               <div class = "photoZone" style="float:left;">
               <c:choose>
                  <c:when test="${img.img_name==null}">
                     <a href="/student/main" class="img logo rounded-circle mb-5"
                     style="background-image: url(/student_imgGET/null.png);"></a>
                  </c:when>
                  <c:otherwise>
                     <a href="/student/main" class="img logo rounded-circle mb-5"
                     style="background-image: url(/student_imgGET/${img.img_name});"></a>
                  </c:otherwise>
               </c:choose>
               </div>
               <div class ="infoZone" style="float: right;margin-right: 30px; margin-top: 20px; color:#643200;">
                  ${mVo.id}<br>
                  ${mVo.name}<br>
                  <c:forEach var="depart_list" items="${departlist}">
                        <c:if test="${mVo.depart_code eq depart_list.depart_code}">
                        ${depart_list.depart_name}
                        </c:if>                           
                  </c:forEach>      
               </div>
               </div>
               <br><br><br><br><br><br><br>
               <!--  
               <a href="#" class="img logo rounded-circle mb-5"
                  style="background-image: url(../resources/includes/images/logo.jpg);"></a>-->
               <ul class="list-unstyled components mb-5">
                  <li>
                  <!-- <a href="/lecture/lecture_list" id="class_registration">수강 신청</a> -->
                  
                  <c:choose>
                     <c:when test="${logInTime>startDate && logInTime<endDate}">
                        <a href="/lecture/lecture_list" class="class_registration">수강 신청</a>
                     </c:when>
                     <c:otherwise>
                        <a href="#">수강 신청 기간이 아닙니다.</a>
                     <script>
                     var link = document.location.href;
                     if(link === "http://localhost:8080/lecture/lecture_list"){                        
                        location.href = "/student/main";
                     }
                     </script>
                     </c:otherwise>
                  </c:choose>
                  
                  </li>
                  <li><a href="#homeSubmenu" data-toggle="collapse"
                     aria-expanded="false" class="dropdown-toggle">자기 정보 관리</a>
                     <ul class="collapse list-unstyled" id="homeSubmenu">
                        <li><a href="/student/loginConfirm" >비밀 번호 변경</a></li>   
                        <li><a href="/student/info">인적 사항 조회</a></li>
                        <li><a href="#" id="img_btn">사진 정보 수정</a></li>

                        <c:choose>
                           <c:when test="${img.img_name == null}">
                              <div id="modal" class="modal-overlay">
                                 <div class="modal-window">
                                    <div class="title">
                                       <h2>${mVo.name}님 사진 추가</h2>
                                    </div>
                                    <div class="close-area">X</div>
                                    <div style="float: left; width: 50%;">
                                       <div class="form-group">
                                       <form action = "/student/student_img" method="post" class="imgForm" enctype="multipart/form-data">
                                          <input type="file" id="student_img" name="student_img"
                                             accept=".jpg, .png" onchange="readURL(this);"/>
                                             <input type="hidden" name = "img_value" value = "0">
                                             </form>
         
                                       </div>
                                    </div>
                                    <div style="float: right; width: 50%; height: 80%;">
                                       <img id="preview" src="" style="width: 80%; height: 100%;" />
                                    </div>
                                 </div>
                                 <button type="button" id="create_btn"
                                 class="custom-btn btn-1" style="margin-bottom: 5px;">생성</button>
                              </div>
                              
                           </c:when>
                           <c:otherwise>
                              <div id="modal" class="modal-overlay">
                                 <div class="modal-window">
                                    <div class="title">
                                       <h2>${mVo.name}님 사진 수정</h2>
                                    </div>
                                    <div class="close-area">X</div>
                                    <div style="float: left; width: 50%;">
                                       <div class="form-group">                                       
                                          <form action = "/student/student_img" method="post" class="imgForm" enctype="multipart/form-data">
                                          <input type="file" id="student_img" name="student_img"
                                             accept=".jpg, .png" onchange="readURL(this);"/>
                                                <input type="hidden" name = "img_value" value = "1">
                                             </form>
                                       </div>
                                    </div>
                                    <div style="float: right; width: 50%; height: 80%;">
                                       <img id="preview" src=""
                                          style="width: 80%; height: 100%;" />
                                    </div>
                                 </div>
                                    <button type="button" id="create_btn"
                                 class="custom-btn btn-1" style="margin-bottom: 5px;">생성</button>
                              </div>
                           
                           </c:otherwise>                           
                        </c:choose>

                     </ul></li>
                  
                  <li><a href="#pageSubmenu" data-toggle="collapse"
                     aria-expanded="false" class="dropdown-toggle">강의 관리</a>
                     <ul class="collapse list-unstyled" id="pageSubmenu">
                        <li><a href="/student/my_lecture">나의 강의</a></li>
                        <li><a href="/lecture/timeTable">개인 시간표</a></li>
                     </ul></li>
                  <li><a href="/notice">공지사항 게시판</a></li>
               </ul>
            </c:otherwise>
         </c:choose>
      </div>
      <form action="/admin/class_registration_end" method="post" id="class_registrationForm"></form>
   </nav>
   
   <script src="../resources/includes/js/jquery.min.js"></script>
   <script src="../resources/includes/js/popper.js"></script>
   <script src="../resources/includes/js/bootstrap.min.js"></script>
   <script src="../resources/includes/js/main.js"></script>

   <script>
      
   function readURL(input) {
        if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function(e) {
            document.getElementById('preview').src = e.target.result;
          };
          reader.readAsDataURL(input.files[0]);
        } else {
          document.getElementById('preview').src = "";
        }
      }
   
   
   
   const modal = document.getElementById("modal")
   
   function modalOn() {
       modal.style.display = "flex"
   }
   function isModalOn() {
       return modal.style.display === "flex"
   }
   function modalOff() {
       modal.style.display = "none"
   }
   const btnModal = document.getElementById("img_btn")   
   btnModal.addEventListener("click", e => {
       modalOn()
   })
   
   const closeBtn = modal.querySelector(".close-area")
   closeBtn.addEventListener("click", e => {
       modalOff()
   })
   modal.addEventListener("click", e => {
       const evTarget = e.target
       if(evTarget.classList.contains("modal-overlay")) {
           modalOff()
       }
   })
   window.addEventListener("keyup", e => {
       if(isModalOn() && e.key === "Escape") {
           modalOff()
       }
   })
   
   $("#create_btn").on("click",function(){
      $(".imgForm").submit();
      this.close();
   })
   
   </script>
</body>
</html>