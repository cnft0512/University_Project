<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/includes/css/style.css">
<link rel="stylesheet" href="../resources/admin/css/lecture_list.css">
<link rel="stylesheet" href="../resources/includes/button.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
   crossorigin="anonymous"></script>
</head>
<body>
   <!-- 검색 영역 -->
   <div class="search_wrap">
      <form id="search_form" action="/admin/lecture_list" method="get">
         <div class="search_area">
            <select name="type">
               <option value=" "
                  <c:out value="${pageMaker.cri.type==null?'selected':'' }"/>>-------</option>
               <option value="N"
                  <c:out value="${pageMaker.cri.type eq 'N'?'selected':'' }"/>>강의명</option>
               <option value="T"
                  <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>강의시간</option>
               <option value="P"
                  <c:out value="${pageMaker.cri.type eq 'P'?'selected':'' }"/>>교수명</option>
               <option value="C"
                  <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>강의실</option>
               <option value="G"
                  <c:out value="${pageMaker.cri.type eq 'G'?'selected':'' }"/>>수강학년</option>
            </select> <input type="text" name="keyword"
               value='<c:out value="${pageMaker.cri.keyword}" />'> 
            <button class='btn search_btn'>검 색</button>
         </div>
      </form>
   </div>

   <form action="/admin/lecture_detail" id="lec_list_form">
      <div class="float-wrap">
         <h4 class="mypage__sub-title">개설 강좌 조회</h4>
         
      </div>


      <div class="maintable">
         <div class="lecture_list-table-head">

            <div class="lecture_list-table-head__lecture_code">과목 코드</div>
            <div class="lecture_list-table-head__lecture_name">강의명</div>
            <div class="lecture_list-table-head__professor_name">교수명</div>
            <div class="lecture_list-table-head__grade">수강학년</div>
            <div class="lecture_list-table-head__classroom">강의실</div>
            <div class="lecture_list-table-head__lecture_time">강의시간</div>
            <div class="lecture_list-table-head__semester">수강학기</div>
            <div class="lecture_list-table-head__student_full">인원</div>
            <div class="lecture_list-table-head__credit">수강학점</div>
            <div class="lecture_list-table-head__button">조회</div>
            

         </div>
         <div class="lecture_list-table-body" style="overflow-y: scroll; height: auto; max-height: 600px;">
            <c:forEach var="lec_list" items="${list}" varStatus="vs">
               <div class="lecture_list_body_row">
                  <div class="lecture_list-table-body__lecture_code">${lec_list.lecture_code}
                  <input type="hidden" id = "hidden_total" value = "${lec_list.college_code}${lec_list.depart_code}${lec_list.lecture_code}">
                  </div>                  
                  <div class="lecture_list-table-body__lecture_name">${lec_list.lecture_name}</div>
                  <div class="lecture_list-table-body__professor_name">${lec_list.professor_name}</div>
                  <div class="lecture_list-table-body__grade">${lec_list.grade}</div>
                  <div class="lecture_list-table-body__classroom">${lec_list.classroom}</div>
                  <div class="lecture_list-table-body__lecture_time">
                     <c:choose>
                        <c:when test="${lec_list.lecture_time eq 'A'}">
                           <월> 08:00 ~ 11:00
                        </c:when>
                        <c:when test="${lec_list.lecture_time eq 'B'}">
                           <화> 08:00 ~ 11:00
                        </c:when>
                        <c:when test="${lec_list.lecture_time eq 'C'}">
                           <수> 08:00 ~ 11:00
                        </c:when>
                        <c:when test="${lec_list.lecture_time eq 'D'}">
                           <목> 08:00 ~ 11:00
                        </c:when>
                        <c:when test="${lec_list.lecture_time eq 'E'}">
                           <금> 08:00 ~ 11:00
                        </c:when>
                        <c:when test="${lec_list.lecture_time eq 'F'}">
                           <월> 11:00 ~ 14:00
                        </c:when>
                        <c:when test="${lec_list.lecture_time eq 'G'}">
                           <화> 11:00 ~ 14:00
                        </c:when>
                        <c:when test="${lec_list.lecture_time eq 'H'}">
                           <수> 11:00 ~ 14:00
                        </c:when>
                        <c:when test="${lec_list.lecture_time eq 'I'}">
                           <목> 11:00 ~ 14:00
                        </c:when>
                        <c:when test="${lec_list.lecture_time eq 'J'}">
                           <금> 11:00 ~ 14:00
                        </c:when>
                        <c:when test="${lec_list.lecture_time eq 'K'}">
                           <월> 14:00 ~ 17:00
                        </c:when>
                        <c:when test="${lec_list.lecture_time eq 'L'}">
                           <화> 14:00 ~ 17:00
                        </c:when>
                        <c:when test="${lec_list.lecture_time eq 'M'}">
                           <수> 14:00 ~ 17:00
                        </c:when>
                        <c:when test="${lec_list.lecture_time eq 'N'}">
                           <목> 14:00 ~ 17:00
                        </c:when>
                        <c:when test="${lec_list.lecture_time eq 'O'}">
                           <금> 14:00 ~ 17:00
                        </c:when>
                        <c:when test="${lec_list.lecture_time eq 'P'}">
                           <월> 17:00 ~ 20:00
                        </c:when>
                        <c:when test="${lec_list.lecture_time eq 'Q'}">
                           <화> 17:00 ~ 20:00
                        </c:when>
                        <c:when test="${lec_list.lecture_time eq 'R'}">
                           <수> 17:00 ~ 20:00
                        </c:when>
                        <c:when test="${lec_list.lecture_time eq 'S'}">
                           <목> 17:00 ~ 20:00
                        </c:when>
                        <c:when test="${lec_list.lecture_time eq 'T'}">
                           <금> 17:00 ~ 20:00
                        </c:when>                        
                     </c:choose>
                  
                  </div>
                  <div class="lecture_list-table-body__semester">   ${lec_list.semester}</div>
               
                  <div class="lecture_list-table-body__student_full">0 /
                     ${lec_list.student_full}</div>
                  <div class="lecture_list-table-body__credit">${lec_list.credit}</div>
                  <div class="lecture_list-table-body__button">      
                  <button id="view_btn" value="${vs.index}" class="custom-btn btn-1"
                        style="margin-bottom: 5px;">조회</button>
                  </div>
               </div>
            </c:forEach>

         </div>
      </div>
   </form>


   


   <script type="text/javascript">
      let sForm = $('#search_form');
      let lForm = $('#lec_list_form');

      
         /* 검색 버튼 동작 */
         $("#search_form button").on("click", function(e) {
            e.preventDefault();
            /* 검색 키워드 유효성 검사 */
            if (!sForm.find("input[name='keyword']").val()) {
               alert("키워드를 입력하십시오.");
               return false;
            }
            if (!sForm.find("select[name='type']").val()) {
               alert("검색 타입을 설정하십시오.");
               return false;
            }
            sForm.find("input[name='pageNum']").val(1);
            sForm.submit();
         });

      /* ajax array
      var array = {${lec_list}};
      jQuery.ajaxSettings.traditional = true; // 배열 데이터 직렬화
       
      $.ajax({
         type : "post",
         url : "/lecture/list",
         data: {"lec_list" : array},  
          success: function (data){
             console.log("data : " + data);
              //bForm.prepend("<input type='hidden' name='lecture_code' value='"+ $(this).attr('id') + "'>");
            //bForm.prepend("<input type='hidden' name='select' value='"+ status + "'>");
          },
          error: function (error){
              alert("에러");
              //bForm.attr("action", "/lecture/list");
          }
      });
       */

      var target = document.querySelectorAll(".select");
      var view_btn = document.querySelectorAll("#view_btn");
      var lecture_code = document.querySelectorAll(".lecture_list-table-body__lecture_code");
      var numx;
      for (let i = 0; i < view_btn.length; i++) {
         view_btn[i].addEventListener("click", function() {
            $("#lec_list_form").prepend("<input type='hidden' name='lecture_code' value='"+ lecture_code[view_btn[i].value].innerText + "'>")
            $("#lec_list_form").submit();
         });
      }

      /*
      var status = this.checkedIndex.value;
      bForm.append("<input type='hidden' name='lecture_code' value='"+ $(this).attr('lecture_code') + "'>");
      //for (int j=0; j < status.size(); j++) {
         
      //}
      bForm.append("<input type='hidden' name='select' value='"+ status + "'>");
      bForm.attr("method", "post");
      bForm.submit();
       */
   </script>
</body>
</html>