<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/includes/css/style.css">
<link rel="stylesheet" href="../resources/lecture/css/lecture_list.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
   crossorigin="anonymous"></script>
</head>
<body onload="load()">
   <!-- 검색 영역 -->
   <div class="search_wrap">
      <form id="search_form" name="search_form">
         <div class="search_area">
            <select name="type">
               <option value=" "
                  <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>-------</option>
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
            <button class="search_btn">검 색</button>
         </div>
      </form>
   </div>


   <form id="lec_list_form" name="lec_list_form" method="post">
      <div class="float-wrap">
         <h4 class="mypage__sub-title">개설 강좌 조회</h4>
      </div>
      <div class="maintable">
         <div class="lecture_list-table-head">
            <div class="lecture_list-table-head__lecture_code">강의코드</div>
            <div class="lecture_list-table-head__lecture_name">강의명</div>
            <div class="lecture_list-table-head__professor_name">교수명</div>
            <div class="lecture_list-table-head__grade">수강학년</div>
            <div class="lecture_list-table-head__classroom">강의실</div>
            <div class="lecture_list-table-head__lecture_time">강의시간</div>
            <div class="lecture_list-table-head__semester">
            <select id="semester">	<!-- 수강학기 -->
	            <option value="1학기">1학기</option>
	            <option value="2학기">2학기</option>
            </select>
            </div>
            <div class="lecture_list-table-head__student_full">최대수강인원</div>
            <div class="lecture_list-table-head__credit">수강학점</div>
            <div class="lecture_list-table-head__check">선 택</div>
         </div>
         <div class="lecture_list-table-body">
            <c:forEach var="lec_list" items="${list}" varStatus="vs">
               <div class="lecture_list_body_row">
                  <div class="lecture_list-table-body__lecture_code">${lec_list.lecture_code}</div>
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
                  <div class="lecture_list-table-body__semester">${lec_list.semester}</div>
                  <div class="lecture_list-table-body__student_full">
                  	<c:choose>
	                  	<c:when test="${lec_list.lecture_code < 2700}">	                  		
	                  		${lec_list.student_full} / 20
	                  	</c:when>
	                  	<c:otherwise>
	                  		${lec_list.student_full} / 10
	                  	</c:otherwise>
                  	</c:choose>
                  </div>
                  <div class="lecture_list-table-body__credit">${lec_list.credit}</div>
                  <div class="lecture_list-table-body__check">
                     <input type="button" class="check_in" name="check_in" value="선 택" id="${vs.index}">
                  </div>
                  <!-- 일단 버튼으로 하고 나중에 체크박스 구현하기... 
                  <div class="lecture_list-table-body__check">
                     <input type="checkbox" class="check_in" id="check_in" name="check_in" 
                     value="${lec_list}" id="${vs.index}" style="zoom: 1.8;">
                  </div>
                  -->
                  <input type="hidden" id="lecture_list-table-body__lecture_code" value="${lec_list.lecture_code}">
                  <input type="hidden" id="lecture_list-table-body__lecture_name" value="${lec_list.lecture_name}">
                  <input type="hidden" id="lecture_list-table-body__professor_name" value="${lec_list.professor_name}">
                  <input type="hidden" id="lecture_list-table-body__grade" value="${lec_list.grade}">
                  <input type="hidden" id="lecture_list-table-body__classroom" value="${lec_list.classroom}">
                  <input type="hidden" id="lecture_list-table-body__lecture_time" value="${lec_list.lecture_time}">
                  <input type="hidden" id="lecture_list-table-body__lecture_year" value="${lec_list.lecture_year}">
                  <input type="hidden" id="lecture_list-table-body__semester" value="${lec_list.semester}">
                  <input type="hidden" id="lecture_list-table-body__student_full" value="${lec_list.student_full}">
                  <input type="hidden" id="lecture_list-table-body__credit" value="${lec_list.credit}">
               </div>
            </c:forEach>
         </div>
      </div>
   </form>

   <form id="basket_form" method="post" action="/lecture/delete.do">
      <div class="float-wrap">
         <h4 class="mypage__sub-title">수강 신청 목록</h4>
      </div>
      <div class="maintable">
         <div class="lecture_list-table-head">
            <div class="lecture_list-table-head__lecture_code">강의코드</div>
            <div class="lecture_list-table-head__lecture_name">강의명</div>
            <div class="lecture_list-table-head__professor_name">교수명</div>
            <div class="lecture_list-table-head__grade">수강학년</div>
            <div class="lecture_list-table-head__classroom">강의실</div>
            <div class="lecture_list-table-head__lecture_time">강의시간</div>
            <div class="lecture_list-table-head__semester">수강학기</div>
            <div class="lecture_list-table-head__student_full">최대수강인원</div>
            <div class="lecture_list-table-head__credit">수강학점</div>
            <div class="lecture_list-table-head__check">삭 제</div>
         </div>
         <div class="lec_list-table-body">
            <c:forEach var="basket" items="${bList}" varStatus="vs">
               <div class="lecture_list_body_row">
                  <div class="lec_select-table-body__lecture_code">${basket.lecture_code}</div>
                  <div class="lec_select-table-body__lecture_name">${basket.lecture_name}</div>
                  <div class="lec_select-table-body__professor_name">${basket.professor_name}</div>
                  <div class="lec_select-table-body__grade">${basket.grade}</div>
                  <div class="lec_select-table-body__classroom">${basket.classroom}</div>
                  <div class="lec_select-table-body__lecture_time">
                     <c:choose>
                        <c:when test="${basket.lecture_time eq 'A'}">
                           <월> 08:00 ~ 11:00
                        </c:when>
                        <c:when test="${basket.lecture_time eq 'B'}">
                           <화> 08:00 ~ 11:00
                        </c:when>
                        <c:when test="${basket.lecture_time eq 'C'}">
                           <수> 08:00 ~ 11:00
                        </c:when>
                        <c:when test="${basket.lecture_time eq 'D'}">
                           <목> 08:00 ~ 11:00
                        </c:when>
                        <c:when test="${basket.lecture_time eq 'E'}">
                           <금> 08:00 ~ 11:00
                        </c:when>
                        <c:when test="${basket.lecture_time eq 'F'}">
                           <월> 11:00 ~ 14:00
                        </c:when>
                        <c:when test="${basket.lecture_time eq 'G'}">
                           <화> 11:00 ~ 14:00
                        </c:when>
                        <c:when test="${basket.lecture_time eq 'H'}">
                           <수> 11:00 ~ 14:00
                        </c:when>
                        <c:when test="${basket.lecture_time eq 'I'}">
                           <목> 11:00 ~ 14:00
                        </c:when>
                        <c:when test="${basket.lecture_time eq 'J'}">
                           <금> 11:00 ~ 14:00
                        </c:when>
                        <c:when test="${basket.lecture_time eq 'K'}">
                           <월> 14:00 ~ 17:00
                        </c:when>
                        <c:when test="${basket.lecture_time eq 'L'}">
                           <화> 14:00 ~ 17:00
                        </c:when>
                        <c:when test="${basket.lecture_time eq 'M'}">
                           <수> 14:00 ~ 17:00
                        </c:when>
                        <c:when test="${basket.lecture_time eq 'N'}">
                           <목> 14:00 ~ 17:00
                        </c:when>
                        <c:when test="${basket.lecture_time eq 'O'}">
                           <금> 14:00 ~ 17:00
                        </c:when>
                        <c:when test="${basket.lecture_time eq 'P'}">
                           <월> 17:00 ~ 20:00
                        </c:when>
                        <c:when test="${basket.lecture_time eq 'Q'}">
                           <화> 17:00 ~ 20:00
                        </c:when>
                        <c:when test="${basket.lecture_time eq 'R'}">
                           <수> 17:00 ~ 20:00
                        </c:when>
                        <c:when test="${basket.lecture_time eq 'S'}">
                           <목> 17:00 ~ 20:00
                        </c:when>
                        <c:when test="${basket.lecture_time eq 'T'}">
                           <금> 17:00 ~ 20:00
                        </c:when>                        
               </c:choose>
                  </div>
                  <div class="lec_select-table-body__semester">${basket.semester}</div>
                  <div class="lec_select-table-body__student_full">
                  <c:forEach var="list" items="${list}">
                 	<c:if test="${list.lecture_code eq basket.lecture_code}">
                 		${list.student_full}
                 	</c:if>
                 	</c:forEach>
                  </div>
                  <div class="lec_select-table-body__credit">${basket.credit}</div>
                  <div class="lecture_list-table-body__check">
                     <input type="button" class="check_del" id="${vs.index}" value="삭 제" >
                  </div>
                  <input type="hidden" id="lec_select-table-body__lecture_code" value="${basket.lecture_code}">
                  <input type="hidden" id="lec_select-table-body__lecture_name" value="${basket.lecture_name}">
                  <input type="hidden" id="lec_select-table-body__professor_name" value="${basket.professor_name}">
                  <input type="hidden" id="lec_select-table-body__grade" value="${basket.grade}">
                  <input type="hidden" id="lec_select-table-body__classroom" value="${basket.classroom}">
                  <input type="hidden" id="lec_select-table-body__lecture_time" value="${basket.lecture_time}">
                  <input type="hidden" id="lec_select-table-body__lecture_year" value="${basket.lecture_year}">
                  <input type="hidden" id="lec_select-table-body__semester" value="${basket.semester}">
                  <input type="hidden" id="lec_select-table-body__credit" value="${basket.credit}">
               </div>
            </c:forEach>
         </div>
      </div>
   </form>

   <form id="hidden_form">
      <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
      <input type="hidden" name="type" value="${pageMaker.cri.type}">
   </form>

   <script type="text/javascript">
      let sForm = $('#search_form');
      let lForm = $('#lec_list_form');
      let bForm = $('#basket_form');
      let hForm = $('#hidden_form');

      var btn = document.querySelectorAll(".search_btn");

      /* 검색 버튼 동작 */
      $(btn).on("click", function(e) {
         e.preventDefault();               
         /* 검색 키워드 유효성 검사 */
         let selectType = $(".search_area select").val();
         let findWord = $(".search_area input[name='keyword']").val();
         if (selectType == ' ') {
            alert("검색 종류를 선택하세요.");
            return false;
         }
         if (!findWord) {
            alert("키워드를 입력하세요.");
            return false;
         }
         hForm.find("input[name='type']").val(selectType);
         hForm.find("input[name='keyword']").val(findWord);
         hForm.submit(); // 페이지 바뀌면서 검색
      });

      
      var select = document.querySelectorAll(".check_in");
      //var select = document.getElementsByName('check').selected = true;
      var lec_code = document.querySelectorAll("#lecture_list-table-body__lecture_code");
      var lec_name = document.querySelectorAll("#lecture_list-table-body__lecture_name");
      var pro_name = document.querySelectorAll("#lecture_list-table-body__professor_name");
      var grade = document.querySelectorAll("#lecture_list-table-body__grade");
      var classroom = document.querySelectorAll("#lecture_list-table-body__classroom");
      var lec_time = document.querySelectorAll("#lecture_list-table-body__lecture_time");
      var lec_year = document.querySelectorAll("#lecture_list-table-body__lecture_year");
      var semester = document.querySelectorAll("#lecture_list-table-body__semester");
      var stu_full = document.querySelectorAll("#lecture_list-table-body__student_full");
      var credit = document.querySelectorAll("#lecture_list-table-body__credit");
      var test = document.querySelectorAll(".lecture_list-table-body");

      /* 체크하면 바로 장바구니로 insert 하기!! */
      for (let i=0; i < select.length; i++) {
         select[i].addEventListener("click",function() {
        	if(stu_full[select[i].id].value >= 20){
        		alert("안됨");
        		test.style.display = "none";        		
        	}
        	 
            lForm.append("<input type='hidden' name='id' value='"+ ${mVo.id} +"'>");
            lForm.append("<input type='hidden' name='lecture_code' value='"+ lec_code[select[i].id].value +"'>");
            lForm.append("<input type='hidden' name='lecture_name' value='"+ lec_name[select[i].id].value +"'>");
            lForm.append("<input type='hidden' name='professor_name' value='"+ pro_name[select[i].id].value +"'>");
            lForm.append("<input type='hidden' name='grade' value='"+ grade[select[i].id].value +"'>");
            lForm.append("<input type='hidden' name='classroom' value='"+ classroom[select[i].id].value +"'>");
            lForm.append("<input type='hidden' name='lecture_time' value='"+ lec_time[select[i].id].value +"'>");
            lForm.append("<input type='hidden' name='lecture_year' value='"+ lec_year[select[i].id].value +"'>");
            lForm.append("<input type='hidden' name='semester' value='"+ semester[select[i].id].value +"'>");
            lForm.append("<input type='hidden' name='student_full' value='"+ stu_full[select[i].id].value +"'>");
            lForm.append("<input type='hidden' name='credit' value='"+ credit[select[i].id].value +"'>");
            lForm.attr("action", "/lecture/lecture_list");
            lForm.submit();   
         	// 장바구니에 강의 담으면 수강인원 (1++), 삭제하면 (1--)
            /*
            if (select[i].selected) {
            	stu_full[select[i].id].value++;
            	lForm.append("<input type='hidden' name='student_full' value='"+ stu_full[select[i].id].value +"'>");
            }
            */
         })
      }
      
      /* 새로고침...? */
      function load() {
         window.onkeydown = function() {
            var kcode = event.keyCode;
             if(kcode == 116) {   // F5 Key
                // reload
             }
         }
      }
      
      /* 장바구니 지우기!! */
      var check_del = document.querySelectorAll(".check_del");
      var code_b = document.querySelectorAll("#lec_select-table-body__lecture_code");
      for(let i=0; i< check_del.length; i++){
         check_del[i].addEventListener("click", function() {
            bForm.append("<input type='hidden' name='id' value='"+ ${mVo.id} +"'>");
            bForm.append("<input type='hidden' name='lecture_code' value='"+ code_b[check_del[i].id].value +"'>");
            bForm.attr("action", "/lecture/delete.do");
          	bForm.attr("method", "post");
            bForm.submit();
         })
      }
   </script>
</body>
</html>