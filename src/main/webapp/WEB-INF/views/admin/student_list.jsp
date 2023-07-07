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

	<form action="/admin/student_list" method="post" id="student_form"  enctype="multipart/form-data">
		<div class="float-wrap">
			<h4 class="mypage__sub-title">학생 조회</h4>
			<button type="button" id = "test">테스트</button>
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
				<div class="student_list-table-head__score">성적 관리</div>

			</div>



			<div class="student_list-table-body">
			

				<c:forEach var="student_list" items="${slist}" varStatus="vs">	
					<div class="student_list_body_row">
						<div class="student_list-table-body__id">
						<c:if test="${student_list.id != 0}">
							${student_list.id}
						</c:if>		
							<!--<fmt:formatDate pattern='yyyy'
								value='${student_list.create_date}' />${student_list.depart_code}${vs.count}-->
						</div>
						<div class="student_list-table-body__name">${student_list.name}</div>
						<div class="student_list-table-body__depart_name">${student_list.depart_name}</div>
						<div class="student_list-table-body__academic_status">${student_list.academic_status}</div>
						<div class="student_list-table-body__birth">
							<fmt:formatDate pattern="yyyy/MM/dd"
								value="${student_list.birth}" />
						</div>
						<div class="student_list-table-body__address">${student_list.address_1}
							${student_list.address_2} (${student_list.post})</div>
						<div class="student_list-table-body__email">${student_list.email}</div>
						<div class="student_list-table-body__phone">${student_list.phone}</div>
						<div class="student_list-table-body__button">		
						<c:if test="${student_list.id==0}">					
						<button type="button" id="create_btn" value="${vs.index}" class="custom-btn btn-1"
								style="margin-bottom: 5px;">생성</button>
						<!-- button default 값은 submit 이기때문에 type에 button으로 선언해줘야함 -->	
						<!-- 
							<button type="button" id="modal_btn" value="${vs.index}" class="custom-btn btn-1"
								style="margin-bottom: 5px;">생성</button>
								 
								 <div id="modal" class="modal-overlay">
								        <div class="modal-window">
								            <div class="title">
								                <h2>${student_list.name}님 사진 추가</h2>
								            </div>
								            <div class="close-area">X</div>
								            <div style="float:left; width: 50%;">
								            <div class="form-group">
												<label for="student_img" class="form-label required">학생 사진</label>
												<input type="file" id="student_img" name="student_img" accept="image/jpeg"/>
											</div>
											<div class="form-group">
												<label for="student_img" class="form-label required">생성될 학번</label>
												<fmt:formatDate pattern='yyyy' value='${student_list.create_date}'/>${student_list.depart_code}${vs.count}																					
											</div>
											<div class="form-group">
												<label for="student_img" class="form-label required">초기 비밀번호</label>
												<fmt:formatDate pattern="yyyyMMdd" value="${student_list.birth}"/>									
											</div>
											</div>
											<div style="float:right; width:50%; height: 80%;">
											<img id="preview" src="" style="width: 80%; height: 100%;"/>
											</div>
											<button type="button" id="create_btn" value="${vs.index}" class="custom-btn btn-1"
												style="margin-bottom: 5px;">생성</button>
								        </div>
   								 </div>		
   								 -->						
						</c:if>
						</div>
						<div class="student_list-table-body__score">		
						<c:if test="${student_list.id != 0 && student_list.id != '202300001'}">
							<button type="button" id="score_btn" value="${vs.index}" class="custom-btn btn-1"
								style="margin-bottom: 5px;">성적</button>
								</c:if>
						</div>
						<input type="hidden" id="hidden_id" value="<fmt:formatDate pattern='yyyy' value='${student_list.create_date}'/>${student_list.depart_code}">
						<input type="hidden" id="hidden_password" value = "<fmt:formatDate pattern="yyMMdd" value="${student_list.birth}" />">
						<input type="hidden" id="hidden_name" value = "${student_list.name}">
						<input type="hidden" id="hidden_depart_code" value = "${student_list.depart_code}">
						<input type="hidden" id="hidden_address_2" value = "${student_list.address_2}">						
					</div>
				</c:forEach>		
			</div>
		</div>
	</form>


	<script>
		var create_btn = document.querySelectorAll("#create_btn");
		var score_btn = document.querySelectorAll("#score_btn");
		var test_btn = document.querySelectorAll("#test_btn");
		var sform = $("#student_form");
		var name = document.querySelectorAll(".student_list-table-body__name");
		var depart_name = document.querySelectorAll(".student_list-table-body__depart_name");
		var birth = document.querySelectorAll(".student_list-table-body__birth");
		var email = document.querySelectorAll(".student_list-table-body__email");
		var phone = document.querySelectorAll(".student_list-table-body__phone");
		var address = document.querySelectorAll(".student_list-table-body__address");
		var hidden_id = document.querySelectorAll("#hidden_id");
		var hidden_name = document.querySelectorAll("#hidden_name");
		var hidden_password = document.querySelectorAll("#hidden_password");
		var hidden_depart_code = document.querySelectorAll("#hidden_depart_code");
		var hidden_address_2 = document.querySelectorAll("#hidden_address_2");
		var student_img = document.querySelectorAll("#student_img");
		
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
		
		for (let i = 0; i < score_btn.length; i++) {
			score_btn[i].addEventListener("click", function() {
				sform.attr("action","/admin/score_detail");
				sform.submit();
			});
		}
	</script>
</body>
</html>