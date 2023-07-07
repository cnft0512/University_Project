<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="../resources/admin/css/lecture_detail.css">
<link rel="stylesheet" href="../resources/includes/button.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<title>강의 상세 페이지</title>
</head>
<body>

	<h2>강의 상세 페이지</h2>
	<div class="container" style="width: 100%;">
		<div>
			
				
					<div class="lecture_detail-table-head">
						<div class="lecture_detail-table-head__id">강의코드</div>
						<div class="lecture_detail-table-head__name">강의명</div>
						<div class="lecture_detail-table-head__depart_name">담당교수</div>
						<div class="lecture_detail-table-head__midterm_score">학년</div>
						<div class="lecture_detail-table-head__final_score">강의실</div>
						<div class="lecture_detail-table-head__score_avg">강의시간</div>			
					</div>
					
					<div class="lecture_detail-table-body">
						<div class="lecture_detail-table-body__id">${lecture_info.lecture_code}</div>
						<div class="lecture_detail-table-body__name">${lecture_info.lecture_name}</div>
						<div class="lecture_detail-table-body__depart_name">${lecture_info.professor_name}</div>
						<div class="lecture_detail-table-body__midterm_score">${lecture_info.grade}</div>
						<div class="lecture_detail-table-body__final_score">${lecture_info.classroom}</div>
						<div class="lecture_detail-table-body__score_avg"></div>
						<br>
					
					</div>			
			
		</div>
	
	<div class="maintable" >
		<div class="lecture_detail-table-head">
		<div class="lecture_detail-table-head__id">학번</div>
			<div class="lecture_detail-table-head__name">이름</div>
			<div class="lecture_detail-table-head__depart_name">학과</div>
			<div class="lecture_detail-table-head__midterm_score">중간고사점수</div>
			<div class="lecture_detail-table-head__final_score">기말고사점수</div>
			<div class="lecture_detail-table-head__score_avg">평균</div>

		</div>


		
		<form id="lec_detail_form" class="lec_detail_form" action="/admin/lecture_detail">
			
		<div class="lecture_detail-table-body">
			<c:forEach var = "slist" items="${slist}" varStatus="vs">			
			<div class="lecture_detail-table-body__id2">${slist.id}</div>
			<div class="lecture_detail-table-body__name">
				<c:forEach var="student_info" items="${student_info}">
					<c:if test="${student_info.id eq slist.id}">
						${student_info.name}
					</c:if>									
				</c:forEach>	
			</div>
			<div class="lecture_detail-table-body__depart_name">				
				<c:forEach var="student_info" items="${student_info}">
					<c:if test="${student_info.id eq slist.id}">
						${student_info.depart_name}
					</c:if>									
				</c:forEach>	
			</div>
			<div class="lecture_detail-table-body__midterm_score">
				<select id="midterm_exam">
					<option value="null"></option>			
					<option value="A+">A+</option><!-- 4.5 4.3 4.0 -->
					<option value="A0">A0</option>
					<option value="A-">A-</option>
					<option value="B+">B+</option><!-- 3.5 3.3 3.0 -->
					<option value="B0">B0</option>
					<option value="B-">B-</option>
					<option value="C+">C+</option><!-- 2.5 2.3 2.0 -->
					<option value="C0">C0</option>
					<option value="C-">C-</option>
					<option value="D+">D+</option><!-- 1.5 1.3 1.0 -->
					<option value="D0">D0</option>
					<option value="D-">D-</option>
					<option value="F">F</option><!-- 0.0 -->			
				</select>
				 / ${slist.midterm_exam}
			</div>
			<div class="lecture_detail-table-body__final_score">
				<select id="final_exam">		
					<option value="null"></option>			
					<option value="A+">A+</option><!-- 4.5 4.3 4.0 -->
					<option value="A0">A0</option>
					<option value="A-">A-</option>
					<option value="B+">B+</option><!-- 3.5 3.3 3.0 -->
					<option value="B0">B0</option>
					<option value="B-">B-</option>
					<option value="C+">C+</option><!-- 2.5 2.3 2.0 -->
					<option value="C0">C0</option>
					<option value="C-">C-</option>
					<option value="D+">D+</option><!-- 1.5 1.3 1.0 -->
					<option value="D0">D0</option>
					<option value="D-">D-</option>
					<option value="F">F</option><!-- 0.0 -->			
				</select>
				 / ${slist.final_exam}
			<!--  <input type="text" name = "final_exam"> / ${slist.final_exam}--></div>
			<div class="lecture_detail-table-body__score_avg">${slist.total}</div>
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
		
		for(let i = 0; i<msb.length;i++){
			msb[i].addEventListener("change", function() {		
				const lecture_code = ${lecture_info.lecture_code};
				//const id = $(".lecture_detail-table-body__id2").text();
				let id = tid[i].innerText;
				const midterm_exam = msb[i].options[msb[i].selectedIndex].value;
				const data = {
					id : id,
					midterm_exam : midterm_exam,
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
				const final_exam = fsb[i].options[fsb[i].selectedIndex].value;
				const data = {
					id : id,
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

