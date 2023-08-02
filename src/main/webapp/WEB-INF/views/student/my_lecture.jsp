<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
   href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
   rel="stylesheet">

<link rel="stylesheet" href="../resources/includes/css/style.css">
<link rel="stylesheet" href="../resources/student/css/my_lecture.css">
<link rel="stylesheet" href="../resources/includes/button.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
   crossorigin="anonymous"></script>
</head>
<body>
   <h2>나의 강의 페이지</h2><br>
   <form id="my_lecture_form" class="my_lecture_form" action="/student/my_lecture" method="get">
   <select name = "lecture_yearNsemester" id = "year">
      <c:forEach var="i" begin="0" end="5">
         <option value = "${serverTime.toString().substring(0,4)-i},1학기" <c:if test="${serverTime.toString().substring(0,4)-i eq year && semester ne '2학기'}">selected = 'selected'</c:if> >${serverTime.toString().substring(0,4)-i} - 2학기</option>
         <option value = "${serverTime.toString().substring(0,4)-i},2학기" <c:if test="${serverTime.toString().substring(0,4)-i eq year && semester ne '1학기'}">selected = 'selected'</c:if> >${serverTime.toString().substring(0,4)-i} - 1학기 </option>
      </c:forEach>
   </select>
   <div class="maintable">
      <div class="my_lecture-table-head">
         <div class="my_lecture-table-head__depart_code">강의코드</div>
         <div class="my_lecture-table-head__depart_name">강의명</div>
         <div class="my_lecture-table-head__professor_name">담당교수</div>
         <div class="my_lecture-table-head__lecture_time">강의시간</div>
         <div class="my_lecture-table-head__classroom">강의실</div>
         <div class="my_lecture-table-head__midterm_exam">중간 성적</div>
         <div class="my_lecture-table-head__final_exam">기말 성적</div>
         <div class="my_lecture-table-head__score_avg">학기 평균</div>

      </div>
   </div>
   
      <div class="my_lecture-table-body">
         <c:forEach var="sllist_year" items="${sllist_year}" varStatus="vs">
            <div id="click">
               <div class="my_lecture-table-body__depart_code">${sllist_year.lecture_code}</div>
               <div class="my_lecture-table-body__depart_name">${sllist_year.lecture_name}</div>
               <div class="my_lecture-table-body__professor_name">${sllist_year.professor_name}</div>
               <div class="my_lecture-table-body__lecture_time">
                  <c:choose>
                     <c:when test="${sllist_year.lecture_time eq 'A'}">
                        <월> 08:00 ~ 11:00 
                     </c:when>
                     <c:when test="${sllist_year.lecture_time eq 'B'}">
                        <화> 08:00 ~ 11:00 
                     </c:when>
                     <c:when test="${sllist_year.lecture_time eq 'C'}">
                        <수> 08:00 ~ 11:00 
                     </c:when>
                     <c:when test="${sllist_year.lecture_time eq 'D'}">
                        <목> 08:00 ~ 11:00 
                     </c:when>
                     <c:when test="${sllist_year.lecture_time eq 'E'}">
                        <금> 08:00 ~ 11:00 
                     </c:when>
                     <c:when test="${sllist_year.lecture_time eq 'F'}">
                        <월> 11:00 ~ 14:00 
                     </c:when>
                     <c:when test="${sllist_year.lecture_time eq 'G'}">
                        <화> 11:00 ~ 14:00 
                     </c:when>
                     <c:when test="${sllist_year.lecture_time eq 'H'}">
                        <수> 11:00 ~ 14:00 
                     </c:when>
                     <c:when test="${sllist_year.lecture_time eq 'I'}">
                        <목> 11:00 ~ 14:00 
                     </c:when>
                     <c:when test="${sllist_year.lecture_time eq 'J'}">
                        <금> 11:00 ~ 14:00 
                     </c:when>
                     <c:when test="${sllist_year.lecture_time eq 'K'}">
                        <월> 14:00 ~ 17:00 
                     </c:when>
                     <c:when test="${sllist_year.lecture_time eq 'L'}">
                        <화> 14:00 ~ 17:00 
                     </c:when>
                     <c:when test="${sllist_year.lecture_time eq 'M'}">
                        <수> 14:00 ~ 17:00 
                     </c:when>
                     <c:when test="${sllist_year.lecture_time eq 'N'}">
                        <목> 14:00 ~ 17:00 
                     </c:when>
                     <c:when test="${sllist_year.lecture_time eq 'O'}">
                        <금> 14:00 ~ 17:00 
                     </c:when>
                     <c:when test="${sllist_year.lecture_time eq 'P'}">
                        <월> 17:00 ~ 20:00 
                     </c:when>
                     <c:when test="${sllist_year.lecture_time eq 'Q'}">
                        <화> 17:00 ~ 20:00 
                     </c:when>
                     <c:when test="${sllist_year.lecture_time eq 'R'}">
                        <수> 17:00 ~ 20:00 
                     </c:when>
                     <c:when test="${sllist_year.lecture_time eq 'S'}">
                        <목> 17:00 ~ 20:00 
                     </c:when>
                     <c:when test="${sllist_year.lecture_time eq 'T'}">
                        <금> 17:00 ~ 20:00 
                     </c:when>
                  </c:choose>
               </div>
               <div class="my_lecture-table-body__classroom">${sllist_year.classroom}</div>
               <div class="my_lecture-table-body__midterm_exam">
                  <c:choose>
                     <c:when test="${sllist_year.midterm_exam eq '4.5'}">A+</c:when>
                     <c:when test="${sllist_year.midterm_exam eq '4.3'}">A</c:when>
                     <c:when test="${sllist_year.midterm_exam eq '4.0'}">A-</c:when>
                     <c:when test="${sllist_year.midterm_exam eq '3.5'}">B+</c:when>
                     <c:when test="${sllist_year.midterm_exam eq '3.3'}">B</c:when>
                     <c:when test="${sllist_year.midterm_exam eq '3.0'}">B-</c:when>
                     <c:when test="${sllist_year.midterm_exam eq '2.5'}">C+</c:when>
                     <c:when test="${sllist_year.midterm_exam eq '2.3'}">C</c:when>
                     <c:when test="${sllist_year.midterm_exam eq '2.0'}">C-</c:when>
                     <c:when test="${sllist_year.midterm_exam eq '1.5'}">D+</c:when>
                     <c:when test="${sllist_year.midterm_exam eq '1.3'}">D</c:when>
                     <c:when test="${sllist_year.midterm_exam eq '1.0'}">D-</c:when>
                     <c:when test="${sllist_year.midterm_exam eq '0.0'}">F</c:when>
                  </c:choose>
               </div>
               <div class="my_lecture-table-body__final_exam">
                  <c:choose>
                     <c:when test="${sllist_year.final_exam eq '4.5'}">A+</c:when>
                     <c:when test="${sllist_year.final_exam eq '4.3'}">A</c:when>
                     <c:when test="${sllist_year.final_exam eq '4.0'}">A-</c:when>
                     <c:when test="${sllist_year.final_exam eq '3.5'}">B+</c:when>
                     <c:when test="${sllist_year.final_exam eq '3.3'}">B</c:when>
                     <c:when test="${sllist_year.final_exam eq '3.0'}">B-</c:when>
                     <c:when test="${sllist_year.final_exam eq '2.5'}">C+</c:when>
                     <c:when test="${sllist_year.final_exam eq '2.3'}">C</c:when>
                     <c:when test="${sllist_year.final_exam eq '2.0'}">C-</c:when>
                     <c:when test="${sllist_year.final_exam eq '1.5'}">D+</c:when>
                     <c:when test="${sllist_year.final_exam eq '1.3'}">D</c:when>
                     <c:when test="${sllist_year.final_exam eq '1.0'}">D-</c:when>
                     <c:when test="${sllist_year.final_exam eq '0.0'}">F</c:when>
                  </c:choose>
               </div>
               <div id="my_lecture-table-body__score_avg" class="my_lecture-table-body__score_avg">${(sllist_year.midterm_exam + sllist_year.final_exam)/2}</div>
            </div>
         </c:forEach>
      </div>
      <input type="hidden" name = "id" value="${mVo.id}">
   </form>
   <div class="corner">
      <div class="my_lecture-table-head__credit_full">졸업학점</div>
      <div class="my_lecture-table-body__credit_full">${sllist.size()*3} / 140</div>
      <div class="my_lecture-table-head__total_score_avg">총 평균학점</div>
      <div id="total" class="my_lecture-table-body__total_score_avg"></div>
   </div>
   <script>
      var avg = document.querySelectorAll("#my_lecture-table-body__score_avg")
      let avg_result =0;
      
      $(document).ready(function() {
         for(let i=0; i<avg.length;i++){
            avg_result += parseFloat(avg[i].innerText);            
         }
         $("#total").text((avg_result/avg.length).toFixed(2));
      });
      
      
      const select_year = document.getElementById("year");
      
      select_year.addEventListener("change", function() {   
         $(".my_lecture_form").submit();
      });
      
      /*
      <input type="text" name = "midterm_exam" id="midterm" maxlength='2' style="width: 50px; height:25px;">
      $('#midterm').on("propertychange change keyup paste input", function() {
         var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\_┼<>@\#$%&\'\"\\\(\=]/gi;
         const regex = /^[ㄱ-ㅎ가-힣e-zE-Z0-9^f]+$/;
         const regEn = /[G-Zg-z0-9ㄱ-ㅎ가-힣^eE]+/;
         if (regExp.test(this.value) || regEn.test(this.value)) {

            alert("A,B,C,D,F와 +,-를 제외한 문자는 입력하실수 없습니다.");

            this.value = this.value.substring(0, this.value.length - 1); // 입력한 특수문자 한자리 지움

         }
      });
      */
   
   
</script>

</body>
</html>