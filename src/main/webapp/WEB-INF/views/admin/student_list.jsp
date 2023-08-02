<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student List Page</title>
<link rel="stylesheet" href="../resources/includes/css/style.css">
<link rel="stylesheet" href="../resources/admin/css/student_list.css">
<link rel="stylesheet" href="../resources/includes/button.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

	<form action="/admin/student_list" method="post" id="student_form" enctype="multipart/form-data">
		<div class="float-wrap">
			<h4 class="mypage__sub-title">학생 조회</h4>
		</div>
		<div class="maintable">
			<div class="student_list-table-head">
				<div class="student_list-table-head__id">학번</div>
				<div class="student_list-table-head__name">이름</div>
				<div class="student_list-table-head__depart_name">학과</div>
				<div class="student_list-table-head__academic_status">재학여부</div>
				<div class="student_list-table-head__birth">생년월일</div>
				<div class="student_list-table-head__address">주소</div>
				<div class="student_list-table-head__email">이메일</div>
				<div class="student_list-table-head__phone">전화번호</div>
				<div class="student_list-table-head__button">학번 및 비밀번호 생성</div>
			</div>
			<div class="student_list-table-body">
				<c:forEach var="student_list" items="${slist}" varStatus="vs">
					<div class="student_list_body_row">
						<div class="student_list-table-body__id">
							<c:if test="${student_list.id != 0}">
		                        ${student_list.id}
		                  	</c:if>
						</div>
						<div class="student_list-table-body__name">${student_list.name}</div>
						<div class="student_list-table-body__depart_name">${student_list.depart_name}</div>
						<div class="student_list-table-body__academic_status">
							<c:if test="${student_list.academic_status == 0}">재학 중</c:if>
							<c:if test="${student_list.academic_status == 1}">휴학</c:if>
							<c:if test="${student_list.academic_status == 2}">군휴학</c:if>
							<c:if test="${student_list.academic_status == 3}">재적</c:if>
							<c:if test="${student_list.academic_status == 4}">자퇴</c:if>
						</div>
						<div class="student_list-table-body__birth">
							<fmt:formatDate pattern="yyyy/MM/dd" value="${student_list.birth}" />
						</div>
						<div class="student_list-table-body__address">${student_list.address_1}<br>
							${student_list.address_2} (${student_list.post})
						</div>
						<div class="student_list-table-body__email">${student_list.email}</div>
						<div class="student_list-table-body__phone">${student_list.phone}</div>
						<div class="student_list-table-body__button">
							<c:if test="${student_list.id==0}">
								<button type="button" id="create_btn" value="${vs.index}"
									class="custom-btn btn-1" style="margin-bottom: 5px;">생성</button>
								<!-- button default 값은 submit 이기때문에 type에 button으로 선언해줘야함 -->
							</c:if>
						</div>
						<input type="hidden" id="hidden_id" value="<fmt:formatDate pattern='yyyy' value='${student_list.create_date}'/>${student_list.depart_code}">
						<input type="hidden" id="hidden_password" value="<fmt:formatDate pattern="yyMMdd" value="${student_list.birth}" />">
						<input type="hidden" id="hidden_name" value="${student_list.name}">
						<input type="hidden" id="hidden_depart_code" value="${student_list.depart_code}">
						<input type="hidden" id="hidden_address_2" value="${student_list.address_2}">
					</div>

					<div class="accordion-box">
						<ul class="list">
							<li>
								<div class="contents">
									<div class="student_list-table-head">
										<div class="student_list-table-head__lecture_name">강의명</div>
										<div class="student_list-table-head__professor_name">교수명</div>
										<div class="student_list-table-head__lecture_year">수강연도</div>
										<div class="student_list-table-head__midterm_exam">중간고사 성적</div>
										<div class="student_list-table-head__final_exam">기말고사 성적</div>
										<div class="student_list-table-head__score_avg">학점 평균</div>
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
												<div class="student_list-table-body__score_avg">${mylist.total}</div>
												<br>
											</c:if>
										</c:forEach>
									</div>
									<div class="corner">
										<div class="student_list-table-head__credit_full">졸업학점</div>
										<div class="student_list-table-body__credit_full" id="credit_total">${sllist.size()} / 140</div>
										<div class="student_list-table-head__total_score_avg">총 평균학점</div>
										<div class="student_list-table-body__total_score_avg" id="avg_total"> / </div>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</c:forEach>
			</div>
		</div>
	</form>


	<script>
		var create_btn = document.querySelectorAll("#create_btn");
		var sform = $("#student_form");
		var name = document.querySelectorAll(".student_list-table-body__name");
		var depart_name = document
				.querySelectorAll(".student_list-table-body__depart_name");
		var birth = document
				.querySelectorAll(".student_list-table-body__birth");
		var email = document
				.querySelectorAll(".student_list-table-body__email");
		var phone = document
				.querySelectorAll(".student_list-table-body__phone");
		var address = document
				.querySelectorAll(".student_list-table-body__address");
		var hidden_id = document.querySelectorAll("#hidden_id");
		var hidden_name = document.querySelectorAll("#hidden_name");
		var hidden_password = document.querySelectorAll("#hidden_password");
		var hidden_depart_code = document
				.querySelectorAll("#hidden_depart_code");
		var hidden_address_2 = document.querySelectorAll("#hidden_address_2");
		var student_img = document.querySelectorAll("#student_img");

		// 학번 생성하기
		for (let i = 0; i < create_btn.length; i++) {
			create_btn[i].addEventListener("click", function() {
				/* create_btn의 i번째 value값 = vs.index */
				sform.append('<input type="hidden" name="id" value="'+hidden_id[create_btn[i].value].value+'">')
				//sform.append('<input type="hidden" name="id" value="202300001">')
				sform.append('<input type="hidden" name="name" value="'+hidden_name[create_btn[i].value].value+'">')
				sform.append('<input type="hidden" name="password" value="'+hidden_password[create_btn[i].value].value+'">')
				//sform.append('<input type="hidden" name="password" value="admin">')
				sform.append('<input type="hidden" name="depart_code" value="'+hidden_depart_code[create_btn[i].value].value+'">')
				sform.append('<input type="hidden" name="address_2" value="'+hidden_address_2[create_btn[i].value].value+'">')
				sform.submit();
			});
		}
		
		var s_list = document.querySelectorAll(".student_list_body_row");
		var contents = document.querySelectorAll(".contents");
		var active = false;
		var midterm_exam = document.querySelectorAll(".student_list-table-body__midterm_exam");
		var final_exam = document.querySelectorAll(".student_list-table-body__final_exam");
		var avg = document.querySelectorAll(".student_list-table-body__score_avg");
		var s_id = document.querySelectorAll(".student_list-table-body__id");
		var sl_id = document.querySelectorAll("#hidden_id");
		let credit_result = 0;
		let avg_result = 0;
	      
	      for (let i=0; i < ${slist.size()}; i++) {
	         s_list[i].addEventListener("click", function() {
	        	// Accordion
	            $(contents[i]).slideToggle();
	            if(active == false) {
	            	$(this).css('background-color', '#aaf0d1');
	                active = true;
	                
	            } else {
	            	var divStyle = $(this).prop("style");
	                divStyle.removeProperty("background-color");
	                active = false;
	            }
	         });
	      }
		
	    /*
		var midterm_exam = document.querySelectorAll(".student_list-table-body__midterm_exam");
		var final_exam = document.querySelectorAll(".student_list-table-body__final_exam");
		var avg = document.querySelectorAll(".student_list-table-body__score_avg");
		var s_id = document.querySelectorAll(".student_list-table-body__id");
		var sl_id = document.querySelectorAll("#hidden_id");
		let credit_result = 0;
		let avg_result = 0;
		
		// 졸업학점 계산하기
		$(document).ready(function () {
			for(let i=0; i < midterm_exam.length; i++) {
				if (s_id[i] == sl_id[i]) {
					//console.log(midterm_exam[i].innerText);
					//credit_result += (parseInt(midterm_exam[i].innerText) + parseInt(final_exam[i].innerText));
				}
			}
			$("#credit_total").text((credit_result) / 140);
		});
		
		// 평균학점 계산하기
		$(document).ready(function () {
			for(let i=0; i < avg.length; i++) {
				if (s_id[i] == sl_id[i]) {
					avg_result += parseFloat(avg[i].innerText);
					console.log(avg_result);
				}
			}
			$("#avg_total").text((avg_result / avg.length).toFixed(2));
		});	
		*/
		
		/*
	    $(document).ready(function() {
	    	for(let i=0; i < id.length; i++) {
	    		for(let j=0; j < avg.length; j++){
	    			console.log(avg[j].innerText);
			    	//avg_result += parseFloat(avg[j].innerText);
	    		}
	    	}
		    $("#total").text((avg_result / avg_total).toFixed(2));
	    });
		*/
	</script>
</body>
</html>