<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/includes/css/style.css">
<link rel="stylesheet" href="../resources/admin/css/score.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<form action="/admin/score" method="post" id="score_form">
		<div class="float-wrap">
			<h4 class="mypage__sub-title">성적 조회</h4>
		</div>
		<div class="maintable">
			<div class="student_list-table-head">
				<div class="student_list-table-head__id">학번</div>
				<div class="student_list-table-head__name">이름</div>
				<div class="student_list-table-head__depart_name">학과</div>
				<div class="student_list-table-head__academic_status">재학여부</div>
				<div class="student_list-table-head__score_avg">평균학점</div>
				<div class="student_list-table-head__credit_full">총 수강학점</div>
			</div>
			<div class="student_list-table-body">
				<c:forEach var="student_list" items="${slist}" varStatus="vs">
					<div class="student_list_body_row">
						<div class="student_list-table-body__id">${student_list.id}</div>
						<div class="student_list-table-body__name">${student_list.name}</div>
						<div class="student_list-table-body__depart_name">${student_list.depart_name}</div>
						<div class="student_list-table-body__academic_status">
							<c:if test="${student_list.academic_status == 0}">
								재학
							</c:if>
							<c:if test="${student_list.academic_status == 1}">
								휴학
							</c:if>
							<c:if test="${student_list.academic_status == 2}">
								군휴학
							</c:if>
							<c:if test="${student_list.academic_status == 3}">
								재적
							</c:if>
							<c:if test="${student_list.academic_status == 4}">
								자퇴
							</c:if>
						</div>
						<div class="student_list-table-body__score_avg">
							<c:forEach var="count" items="${sllist}">
								${count. / count}
							</c:forEach>
						</div>
						<div class="student_list-table-body__credit_full"></div>
					</div>

					<div class="accordion-box">
						<ul class="list">
							<li>
								<div class="contents">
									<div class="student_list-table-head">
										<div class="student_list-table-head__lecture_name">강의명</div>
										<div class="student_list-table-head__professor_name">교수명</div>
										<div class="student_list-table-head__lecture_year">수강연도</div>
										<div class="student_list-table-head__midterm_exam">중간고사
											성적</div>
										<div class="student_list-table-head__final_exam">기말고사 성적</div>
									</div>
									<div class="student_list-table-body">
										<c:forEach var="mylist" items="${sllist}">
											<c:if test="${student_list.id eq mylist.id}">
												<div class="student_list-table-body__lecture_name">${mylist.lecture_name}</div>
												<div class="student_list-table-body__professor_name">${mylist.professor_name}</div>
												<div class="student_list-table-body__lecture_year">${mylist.lecture_year}</div>
												<div class="student_list-table-body__midterm_exam">
													<c:choose>
														<c:when test="${mylist.midterm_exam eq null}"></c:when>
														<c:when test="${mylist.midterm_exam eq '4.5'}">A+</c:when>
														<c:when test="${mylist.midterm_exam eq '4.3'}">A</c:when>
														<c:when test="${mylist.midterm_exam eq '4.0'}">A-</c:when>
														<c:when test="${mylist.midterm_exam eq '3.5'}">B+</c:when>
														<c:when test="${mylist.midterm_exam eq '3.3'}">B</c:when>
														<c:when test="${mylist.midterm_exam eq '3.0'}">B-</c:when>
														<c:when test="${mylist.midterm_exam eq '2.5'}">C+</c:when>
														<c:when test="${mylist.midterm_exam eq '2.3'}">C</c:when>
														<c:when test="${mylist.midterm_exam eq '2.0'}">C-</c:when>
														<c:when test="${mylist.midterm_exam eq '1.5'}">D+</c:when>
														<c:when test="${mylist.midterm_exam eq '1.3'}">D</c:when>
														<c:when test="${mylist.midterm_exam eq '1.0'}">D-</c:when>
														<c:when test="${mylist.midterm_exam eq '0.0'}">F</c:when>
													</c:choose>
												</div>
												<div class="student_list-table-body__final_exam">
													<c:choose>
														<c:when test="${mylist.final_exam eq '4.5'}">A+</c:when>
														<c:when test="${mylist.final_exam eq '4.3'}">A</c:when>
														<c:when test="${mylist.final_exam eq '4.0'}">A-</c:when>
														<c:when test="${mylist.final_exam eq '3.5'}">B+</c:when>
														<c:when test="${mylist.final_exam eq '3.3'}">B</c:when>
														<c:when test="${mylist.final_exam eq '3.0'}">B-</c:when>
														<c:when test="${mylist.final_exam eq '2.5'}">C+</c:when>
														<c:when test="${mylist.final_exam eq '2.3'}">C</c:when>
														<c:when test="${mylist.final_exam eq '2.0'}">C-</c:when>
														<c:when test="${mylist.final_exam eq '1.5'}">D+</c:when>
														<c:when test="${mylist.final_exam eq '1.3'}">D</c:when>
														<c:when test="${mylist.final_exam eq '1.0'}">D-</c:when>
														<c:when test="${mylist.final_exam eq '0.0'}">F</c:when>
													</c:choose>
												</div>
												<br>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</li>
						</ul>
					</div>

				</c:forEach>
			</div>
		</div>
	</form>

	<script type="text/javascript">
		// Accordion
		var s_list = document.querySelectorAll(".student_list_body_row");
		var contents = document.querySelectorAll(".contents");
		var id = document.querySelectorAll(".student_list-table-body__id");
		
		for (let i=0; i < ${slist.size()}; i++) {
			s_list[i].addEventListener("click", function() {
				$(contents[i]).slideToggle("slow");     
			});
		}
		
		// 성적 입력하기
		var midterm_exam = document.querySelectorAll("#midterm_exam");
      	var final_exam = document.querySelectorAll("#final_exam");
        
	</script>
</body>
</html>