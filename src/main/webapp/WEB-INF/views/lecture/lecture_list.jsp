<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/includes/css/style.css">
<link rel="stylesheet" href="../resources/lecture/css/lecture_list.css">
<link rel="stylesheet" href="../resources/lecture/css/timeTable.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<button type="button" id="timeTableForListCollapse" class="btn btn-primary">시간표 확인</button>
     	<div id="timeTableForList">
     		<div class="title">
				<h4>▼ ${mVo.name}님 강의 시간표 </h4>
			</div>
			<div class="content">
				<div class="time_table-table" id="tableble">
					<div class="time_table-table-head">
						<div class="time_table-table-head__time">시간 / 요일</div>
						<div class="time_table-table-head__time">MON</div>
						<div class="time_table-table-head__time">TUE</div>
						<div class="time_table-table-head__time">WED</div>
						<div class="time_table-table-head__time">THR</div>
						<div class="time_table-table-head__time">FRI</div>
					</div>
					<div class="time_table-table-body">
						<c:forEach var="i" begin="0" end="3">
							<div>
								<div id="time${i}" class="time_table-table-body__time">
									<c:if test="${i == 0}">
				                        08:00~11:00
				                </c:if>
									<c:if test="${i == 1}">
				                        11:00~14:00
				                </c:if>
									<c:if test="${i == 2}">
				                        14:00~17:00
				                </c:if>
									<c:if test="${i == 3}">
				                        17:00~20:00
				                </c:if>
								</div>
								<div id="mon${i}" class="time_table-table-body__mon">
									<c:forEach var="table" items="${bList}">
										<c:if test="${table.lecture_time eq 'A' && i == 0}">
				                           ${table.lecture_name}<br>
				                           ${table.professor_name}<br>
				                           ${table.classroom}
				                    </c:if>
										<c:if test="${table.lecture_time eq 'F' && i == 1}">
				                           ${table.lecture_name}<br>
				                           ${table.professor_name}<br>
				                           ${table.classroom}
				                    </c:if>
										<c:if test="${table.lecture_time eq 'K' && i == 2}">
				                           ${table.lecture_name}<br>
				                           ${table.professor_name}<br>
				                           ${table.classroom}
				                    </c:if>
										<c:if test="${table.lecture_time eq 'P' && i == 3}">
				                           ${table.lecture_name}<br>
				                           ${table.professor_name}<br>
				                           ${table.classroom}
				                    </c:if>
									</c:forEach>
								</div>
								<div id="tue${i}" class="time_table-table-body__tue">
									<c:forEach var="table" items="${bList}">
										<c:if test="${table.lecture_time eq 'B' && i == 0}">
				                           ${table.lecture_name}<br>
				                           ${table.professor_name}<br>
				                           ${table.classroom}
				                    </c:if>
										<c:if test="${table.lecture_time eq 'G' && i == 1}">
				                           ${table.lecture_name}<br>
				                           ${table.professor_name}<br>
				                           ${table.classroom}
				                    </c:if>
										<c:if test="${table.lecture_time eq 'L' && i == 2}">
				                           ${table.lecture_name}<br>
				                           ${table.professor_name}<br>
				                           ${table.classroom}
				                    </c:if>
										<c:if test="${table.lecture_time eq 'Q' && i == 3}">
				                           ${table.lecture_name}<br>
				                           ${table.professor_name}<br>
				                           ${table.classroom}
				                    </c:if>
									</c:forEach>
								</div>
								<div id="wed${i}" class="time_table-table-body__wed">
									<c:forEach var="table" items="${bList}">
										<c:if test="${table.lecture_time eq 'C' && i == 0}">
				                           ${table.lecture_name}<br>
				                           ${table.professor_name}<br>
				                           ${table.classroom}
				                    </c:if>
										<c:if test="${table.lecture_time eq 'H' && i == 1}">
				                           ${table.lecture_name}<br>
				                           ${table.professor_name}<br>
				                           ${table.classroom}
				                    </c:if>
										<c:if test="${table.lecture_time eq 'M' && i == 2}">
				                           ${table.lecture_name}<br>
				                           ${table.professor_name}<br>
				                           ${table.classroom}
				                    </c:if>
										<c:if test="${table.lecture_time eq 'R' && i == 3}">
				                           ${table.lecture_name}<br>
				                           ${table.professor_name}<br>
				                           ${table.classroom}
				                    </c:if>
									</c:forEach>
								</div>
								<div id="thr${i}" class="time_table-table-body__thr">
									<c:forEach var="table" items="${bList}">
										<c:if test="${table.lecture_time eq 'D' && i == 0}">
				                           ${table.lecture_name}<br>
				                           ${table.professor_name}<br>
				                           ${table.classroom}
				                    </c:if>
										<c:if test="${table.lecture_time eq 'I' && i == 1}">
				                           ${table.lecture_name}<br>
				                           ${table.professor_name}<br>
				                           ${table.classroom}
				                    </c:if>
										<c:if test="${table.lecture_time eq 'N' && i == 2}">
				                           ${table.lecture_name}<br>
				                           ${table.professor_name}<br>
				                           ${table.classroom}
				                    </c:if>
										<c:if test="${table.lecture_time eq 'S' && i == 3}">
				                           ${table.lecture_name}<br>
				                           ${table.professor_name}<br>
				                           ${table.classroom}
				                    </c:if>
									</c:forEach>
								</div>
								<div id="fri${i}" class="time_table-table-body__fri">
									<c:forEach var="table" items="${bList}">
										<c:if test="${table.lecture_time eq 'E' && i == 0}">
				                           ${table.lecture_name}<br>
				                           ${table.professor_name}<br>
				                           ${table.classroom}
				                    </c:if>
										<c:if test="${table.lecture_time eq 'J' && i == 1}">
				                           ${table.lecture_name}<br>
				                           ${table.professor_name}<br>
				                           ${table.classroom}
				                    </c:if>
										<c:if test="${table.lecture_time eq 'O' && i == 2}">
				                           ${table.lecture_name}<br>
				                           ${table.professor_name}<br>
				                           ${table.classroom}
				                    </c:if>
										<c:if test="${table.lecture_time eq 'T' && i == 3}">
				                           ${table.lecture_name}<br>
				                           ${table.professor_name}<br>
				                           ${table.classroom}
				                    </c:if>
									</c:forEach>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
     	</div>


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
				<div class="lecture_list-table-head__semester">수강학기</div>
				<div class="lecture_list-table-head__student_full">최대수강인원</div>
				<div class="lecture_list-table-head__credit">수강학점</div>
				<div class="lecture_list-table-head__check">선 택</div>
			</div>
			<div class="lecture_list-table-body">
				<c:forEach var="lec_list" items="${list}" varStatus="vs">
					<div class="lecture_list_body_row">
						<c:if test="${lec_list.depart_code eq mVo.depart_code || lec_list.depart_code eq 10}">
							<c:choose>
								<c:when test="${lec_list.semester ne '2학기' && serverTime.getMonth() eq 'JULY'}">
									<%@ include file="../lecture/list.jsp"%> <!-- 1학기 -->
								</c:when>
								<c:when test="${lec_list.semester ne '1학기' && serverTime.getMonth() eq 'SEPTEMBER'}">
									<%@ include file="../lecture/list.jsp"%> <!-- 2학기 -->
								</c:when>
							</c:choose>
						</c:if>
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
									<c:choose>
										<c:when test="${list.lecture_code < 2700}">
                                    		${list.student_full} / 20
                                     </c:when>
									 <c:otherwise>
                                    		${list.student_full} / 10
                                     </c:otherwise>
									</c:choose>
								</c:if>
							</c:forEach>
						</div>
						<div class="lec_select-table-body__credit">${basket.credit}</div>
						<div class="lecture_list-table-body__check">
							<input type="button" class="check_del" id="${vs.index}"
								value="삭 제">
						</div>
						<input type="hidden" id="lec_select-table-body__lecture_code" value="${basket.lecture_code}">
						<input type="hidden" id="lec_select-table-body__lecture_name" value="${basket.lecture_name}">
						<input type="hidden" id="lec_select-table-body__professor_name" value="${basket.professor_name}">
						<input type="hidden" id="lec_select-table-body__grade" value="${basket.grade}">
						<input type="hidden" id="lec_select-table-body__classroom" value="${basket.classroom}">
						<input type="hidden" id="lec_select-table-body__lecture_time" value="${basket.lecture_time}">
						<input type="hidden" id="lec_select-table-body__lecture_year" value="${basket.lecture_year}">
						<input type="hidden" id="lec_select-table-body__semester" value="${basket.semester}">
					</div>
				</c:forEach>
			</div>
		</div>
	</form>

	<form id="calculate">
		<div class="calculate" style="float: right; margin-right: 120px;">
			<h4>수강 학점 합계 : ${bList.size() * 3}</h4>
			<button class="submitMyList">수강 확정</button>
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
      
      var btn = document.querySelectorAll(".search_btn");

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

      let id = ${mVo.id};
      var select = document.querySelectorAll(".check_in");
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
    
      function time() {
         now  = new Date();
         month = now.getMonth()+1;   //현재시간 중 달. 달은 0부터 시작하기 때문에 +1 
         if((month+"").length < 2){
             month="0"+month;   //달의 숫자가 1자리면 앞에 0을 붙임.
         }
         date = now.getDate();      //현재 시간 중 날짜.
         if((date+"").length < 2){
             date="0"+date;      
         }
         hour = now.getHours();   //현재 시간 중 시간.
         if((hour+"").length < 2){
         hour="0"+hour;      
         }
         min = now.getMinutes();   //현재 시간 중 시간.
         if((min+"").length < 2){
         min="0"+min;      
         }
         sec = now.getSeconds();   //현재 시간 중 시간.
         if((sec+"").length < 2){
         sec="0"+sec;      
         }
         today = month + "" + date + "" + hour + "" + min + "" + sec; 
      }
      

      /* 체크하면 바로 장바구니로 insert 하기!! */
      for (let i = 0; i < select.length; i++) {
         select[i]
               .addEventListener(
                     "click",
                     function() {
                        time();                        
                        if(today<${endDate}){
                        let number = parseInt(stu_full[i].value);
                        number++;
                        if (stu_full[i].value >= 20) {
                           alert("전공 최대 수강 인원을 넘었습니다.");
                           style.display = "none";
                        } else if (lec_code[i].value > 2700
                              && stu_full[i].value >= 10) {
                           alert("교양 최대 수강 인원을 넘었습니다.");
                           style.display = "none";
                        }

                        const data1 = {
                           id : id,
                           lecture_code : lec_code[i].value,
                           lecture_name : lec_name[i].value,
                           professor_name : pro_name[i].value,
                           grade : grade[i].value,
                           classroom : classroom[i].value,
                           lecture_time : lec_time[i].value,
                           lecture_year : lec_year[i].value,
                           semester : semester[i].value,
                           student_full : number,
                           credit : credit[i].value
                        }

                        $
                              .ajax({
                                 type : "POST",
                                 url : "/lecture/lecture_list",
                                 async : true,
                                 data : data1,
                                 success : function(result) {
                                    console
                                          .log("result: "
                                                + result);
                                    if (result === "inputSuccess") {
                                       alert('장바구니 들어갔음');
                                       location.href = "/lecture/lecture_list";
                                    } else if (result === "fail_time") {
                                       alert('강의 시간이 겹칩니다.');
                                    } else {
                                       alert('최대 수강 학점을 초과하였습니다. (최대 수강 학점 : 24학점)');
                                    }
                                 },
                                 error : function(request, status,
                                       error) {
                                    alert("code:" + request.status
                                          + "\n" + "message:"
                                          + request.responseText
                                          + "\n" + "error:"
                                          + error);
                                 }
                              });
                        }else{
                           alert("수강 신청이 종료되었습니다.");
                           location.href = "/student/main";
                        }
                     })
      }

      /* 장바구니 지우기!! */
      var check_del = document.querySelectorAll(".check_del");
      var code_b = document
            .querySelectorAll("#lec_select-table-body__lecture_code");
      for (let i = 0; i < check_del.length; i++) {
         check_del[i].addEventListener("click", function() {
            time();            
            if(today<${endDate}){
            let number = parseInt(stu_full[i].value);
            number--;
            const data2 = {
               id : id,
               lecture_code : code_b[i].value,
               lecture_year : lec_year[i].value,
               student_full : number
            }

            $.ajax({
               type : "POST",
               url : "/lecture/delete.do",
               async : true,
               data : data2,
               success : function(result) {
                  console.log("result: " + result);
                  if (result === "deleteSuccess") {
                     alert('장바구니 지워짐');
                     location.href = "/lecture/lecture_list";
                     //location.reload();
                  } else {
                     alert('장바구니 안 지워짐');
                  }
               },
               error : function(request, status, error) {
                  alert("code:" + request.status + "\n" + "message:"
                        + request.responseText + "\n" + "error:"
                        + error);
               }
            });
            }else{
               alert("수강 신청이 종료되었습니다.");
               location.href = "/student/main";
            }
         })
      }
   </script>
   
   <script src="../resources/includes/js/main.js"></script>
</body>
</html>