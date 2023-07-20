<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../resources/includes/css/style.css">
<link rel="stylesheet" href="../resources/admin/css/lecture_detail.css">
<link rel="stylesheet" href="../resources/includes/button.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<body>
	<h2>성적 상세 페이지</h2>
	<div class="container" style="width: 100%;">
		<div>
			<div class="lecture_detail-table-head">
				<div class="lecture_detail-table-head__id">강의코드</div>
				<div class="lecture_detail-table-head__name">강의명</div>
				<div class="lecture_detail-table-head__depart_name">담당교수</div>
				<div class="lecture_detail-table-head__midterm_score">학년</div>
				<div class="lecture_detail-table-head__final_score">강의실</div>
				<div class="lecture_detail-table-head__lecture_time"></div>
			</div>
			<div class="lecture_detail-table-body">
				<div class="lecture_detail-table-body__id">${lecture_info.lecture_code}</div>
				<div class="lecture_detail-table-body__name">${lecture_info.lecture_name}</div>
				<div class="lecture_detail-table-body__depart_name">${lecture_info.professor_name}</div>
				<div class="lecture_detail-table-body__midterm_score">${lecture_info.grade}</div>
				<div class="lecture_detail-table-body__final_score">${lecture_info.classroom}</div>
				<div class="lecture_detail-table-body__lecture_time"></div>
				<br>
			</div>
		</div>
		<div class="maintable">
			<div class="lecture_detail-table-head">
				<div class="lecture_detail-table-head__id">학번</div>
				<div class="lecture_detail-table-head__name">이름</div>
				<div class="lecture_detail-table-head__depart_name">학과</div>
				<div class="lecture_detail-table-head__midterm_score">중간고사점수</div>
				<div class="lecture_detail-table-head__final_score">기말고사점수</div>
				<div class="lecture_detail-table-head__score_avg">평균</div>
			</div>
			<form id="lec_detail_form" class="lec_detail_form" action="/admin/score_detail">
				<div class="lecture_detail-table-body">
					<c:forEach var="slist" items="${slist}" varStatus="vs">
						<div class="lecture_detail-table-body__id2">${slist.id}</div>
						<div class="lecture_detail-table-body__name">
							<c:forEach var="student_info" items="${student_info}">
								<c:if test="${student_info.id eq slist.id}">${student_info.name}</c:if>
							</c:forEach>
						</div>
						<div class="lecture_detail-table-body__depart_name">
							<c:forEach var="student_info" items="${student_info}">
								<c:if test="${student_info.id eq slist.id}">${student_info.depart_name}</c:if>
							</c:forEach>
						</div>
						<div class="lecture_detail-table-body__midterm_score">
							<select id="midterm_exam">
								<option value="-1"></option>
								<option value="4.5">A+</option>
								<!-- 4.5 4.3 4.0 -->
								<option value="4.3">A0</option>
								<option value="4.0">A-</option>
								<option value="3.5">B+</option>
								<!-- 3.5 3.3 3.0 -->
								<option value="3.3">B0</option>
								<option value="3.0">B-</option>
								<option value="2.5">C+</option>
								<!-- 2.5 2.3 2.0 -->
								<option value="2.3">C0</option>
								<option value="2.0">C-</option>
								<option value="1.5">D+</option>
								<!-- 1.5 1.3 1.0 -->
								<option value="1.3">D0</option>
								<option value="1.0">D-</option>
								<option value="0.0">F</option>
								<!-- 0.0 -->
							</select> &nbsp;/&nbsp;
							<c:choose>
								<c:when test="${slist.midterm_exam eq '4.5'}">A+</c:when>
								<c:when test="${slist.midterm_exam eq '4.3'}">A</c:when>
								<c:when test="${slist.midterm_exam eq '4.0'}">A-</c:when>
								<c:when test="${slist.midterm_exam eq '3.5'}">B+</c:when>
								<c:when test="${slist.midterm_exam eq '3.3'}">B</c:when>
								<c:when test="${slist.midterm_exam eq '3.0'}">B-</c:when>
								<c:when test="${slist.midterm_exam eq '2.5'}">C+</c:when>
								<c:when test="${slist.midterm_exam eq '2.3'}">C</c:when>
								<c:when test="${slist.midterm_exam eq '2.0'}">C-</c:when>
								<c:when test="${slist.midterm_exam eq '1.5'}">D+</c:when>
								<c:when test="${slist.midterm_exam eq '1.3'}">D</c:when>
								<c:when test="${slist.midterm_exam eq '1.0'}">D-</c:when>
								<c:when test="${slist.midterm_exam eq '0.0'}">F</c:when>
								<c:when test="${slist.midterm_exam eq null}"></c:when>
							</c:choose>
						</div>
						<div class="lecture_detail-table-body__final_score">
							<select id="final_exam">
								<option value="-1"></option>
								<option value="4.5">A+</option>
								<!-- 4.5 4.3 4.0 -->
								<option value="4.3">A0</option>
								<option value="4.0">A-</option>
								<option value="3.5">B+</option>
								<!-- 3.5 3.3 3.0 -->
								<option value="3.3">B0</option>
								<option value="3.0">B-</option>
								<option value="2.5">C+</option>
								<!-- 2.5 2.3 2.0 -->
								<option value="2.3">C0</option>
								<option value="2.0">C-</option>
								<option value="1.5">D+</option>
								<!-- 1.5 1.3 1.0 -->
								<option value="1.3">D0</option>
								<option value="1.0">D-</option>
								<option value="0.0">F</option>
								<!-- 0.0 -->
							</select> &nbsp;/&nbsp;
							<c:choose>
								<c:when test="${slist.final_exam eq '4.5'}">A+</c:when>
								<c:when test="${slist.final_exam eq '4.3'}">A</c:when>
								<c:when test="${slist.final_exam eq '4.0'}">A-</c:when>
								<c:when test="${slist.final_exam eq '3.5'}">B+</c:when>
								<c:when test="${slist.final_exam eq '3.3'}">B</c:when>
								<c:when test="${slist.final_exam eq '3.0'}">B-</c:when>
								<c:when test="${slist.final_exam eq '2.5'}">C+</c:when>
								<c:when test="${slist.final_exam eq '2.3'}">C</c:when>
								<c:when test="${slist.final_exam eq '2.0'}">C-</c:when>
								<c:when test="${slist.final_exam eq '1.5'}">D+</c:when>
								<c:when test="${slist.final_exam eq '1.3'}">D</c:when>
								<c:when test="${slist.final_exam eq '1.0'}">D-</c:when>
								<c:when test="${slist.final_exam eq '0.0'}">F</c:when>
							</c:choose>
						</div>
						<div class="lecture_detail-table-body__score_avg">${(slist.midterm_exam + slist.final_exam)/2}</div>
						<br>
					</c:forEach>
				</div>
			</form>
		</div>
	</div>
	
	<script>
      var msb = document.querySelectorAll("#midterm_exam");
      var fsb = document.querySelectorAll("#final_exam");
      var tid = document.querySelectorAll(".lecture_detail-table-body__id2");
      var avg = document.querySelectorAll(".lecture_detail-table-body__score_avg")
      for(let i = 0; i<msb.length;i++){         
         msb[i].addEventListener("change", function() {            
            const lecture_code = ${lecture_info.lecture_code};
            let id = tid[i].innerText;
            const midterm_exam = msb[i].options[msb[i].selectedIndex].value;
            const final_exam = fsb[i].options[fsb[i].selectedIndex].value;
            const data = {
               id : id,
               midterm_exam : midterm_exam,
               final_exam : final_exam,
               lecture_code : lecture_code
            };
            if (!confirm("성적을 "+midterm_exam+"으로 확정하시겠습니까?")) {
               alert("다시 입력해주세요");
             } else {
                 alert("성적 입력 완료");
                 $.ajax({
                  type : "POST",
                  url : "/admin/lecture_detail",
                  async : true,
                  data : data,
                  success : function(result) {
                     console.log("result: " + result);                   
                     location.reload();                     
                  },
                  error : function(request, status, error) {
                     alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                  }
               });                 
             }
         });
         
         fsb[i].addEventListener("change", function() {            
            const lecture_code = ${lecture_info.lecture_code};
            let id = tid[i].innerText;            
            const midterm_exam = msb[i].options[msb[i].selectedIndex].value;
            const final_exam = fsb[i].options[fsb[i].selectedIndex].value;
            const data = {
               id : id,
               midterm_exam : midterm_exam,
               final_exam : final_exam,
               lecture_code : lecture_code
            };

            if (!confirm("성적을 "+final_exam+"으로 확정하시겠습니까?")) {
                 alert("다시 입력해주세요");
             } else {
                 alert("성적 입력 완료");
                 $.ajax({
                  type : "POST",
                  url : "/admin/lecture_detail",
                  async : true,
                  data : data,
                  success : function(result) {
                     console.log("result: " + result);
                     location.reload();
                  },
                  error : function(request, status, error) {
                     alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                  }
               });       
             }
         });
      }
	</script>
</body>
</html>