<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
		<input type="button" class="check_in" name="check_in" value="선 택"
			id="${vs.index}">
	</div>
	<!-- 일단 버튼으로 하고 나중에 체크박스 구현하기... 
                  <div class="lecture_list-table-body__check">
                     <input type="checkbox" class="check_in" id="check_in" name="check_in" 
                     value="${lec_list}" id="${vs.index}" style="zoom: 1.8;">
                  </div>
                  -->
	<input type="hidden" id="lecture_list-table-body__lecture_code"
		value="${lec_list.lecture_code}">
	<input type="hidden" id="lecture_list-table-body__lecture_name"
		value="${lec_list.lecture_name}">
	<input type="hidden" id="lecture_list-table-body__professor_name"
		value="${lec_list.professor_name}">
	<input type="hidden" id="lecture_list-table-body__grade"
		value="${lec_list.grade}">
	<input type="hidden" id="lecture_list-table-body__classroom"
		value="${lec_list.classroom}">
	<input type="hidden" id="lecture_list-table-body__lecture_time"
		value="${lec_list.lecture_time}">
	<input type="hidden" id="lecture_list-table-body__lecture_year"
		value="${lec_list.lecture_year}">
	<input type="hidden" id="lecture_list-table-body__semester"
		value="${lec_list.semester}">
	<input type="hidden" id="lecture_list-table-body__student_full"
		value="${lec_list.student_full}">
	<input type="hidden" id="lecture_list-table-body__credit"
		value="${lec_list.credit}">
