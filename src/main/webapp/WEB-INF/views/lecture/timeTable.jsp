<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/includes/css/style.css">
<link rel="stylesheet" href="../resources/lecture/css/timeTable.css">
<title>Time Table Page</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
   crossorigin="anonymous"></script>
</head>
<body>
   <form>
      <h2>시간표</h2>
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
                     <c:forEach var="basket" items="${sllist}">
                        <c:if test="${basket.lecture_time eq 'A' && i == 0}">
                           ${basket.lecture_name}<br>
                           ${basket.professor_name}<br>
                           ${basket.classroom}
                              </c:if>
                        <c:if test="${basket.lecture_time eq 'F' && i == 1}">
                           ${basket.lecture_name}<br>
                           ${basket.professor_name}<br>
                           ${basket.classroom}
                              </c:if>
                        <c:if test="${basket.lecture_time eq 'K' && i == 2}">
                           ${basket.lecture_name}<br>
                           ${basket.professor_name}<br>
                           ${basket.classroom}
                              </c:if>
                        <c:if test="${basket.lecture_time eq 'P' && i == 3}">
                           ${basket.lecture_name}<br>
                           ${basket.professor_name}<br>
                           ${basket.classroom}
                              </c:if>
                     </c:forEach>
                  </div>
                  <div id="tue${i}" class="time_table-table-body__tue">
                     <c:forEach var="basket" items="${sllist}">
                        <c:if test="${basket.lecture_time eq 'B' && i == 0}">
                           ${basket.lecture_name}<br>
                           ${basket.professor_name}<br>
                           ${basket.classroom}
                              </c:if>
                        <c:if test="${basket.lecture_time eq 'G' && i == 1}">
                           ${basket.lecture_name}<br>
                           ${basket.professor_name}<br>
                           ${basket.classroom}
                              </c:if>
                        <c:if test="${basket.lecture_time eq 'L' && i == 2}">
                           ${basket.lecture_name}<br>
                           ${basket.professor_name}<br>
                           ${basket.classroom}
                              </c:if>
                        <c:if test="${basket.lecture_time eq 'Q' && i == 3}">
                           ${basket.lecture_name}<br>
                           ${basket.professor_name}<br>
                           ${basket.classroom}
                              </c:if>
                     </c:forEach>
                  </div>
                  <div id="wed${i}" class="time_table-table-body__wed">
                     <c:forEach var="basket" items="${sllist}">
                        <c:if test="${basket.lecture_time eq 'C' && i == 0}">
                           ${basket.lecture_name}<br>
                           ${basket.professor_name}<br>
                           ${basket.classroom}
                              </c:if>
                        <c:if test="${basket.lecture_time eq 'H' && i == 1}">
                           ${basket.lecture_name}<br>
                           ${basket.professor_name}<br>
                           ${basket.classroom}
                              </c:if>
                        <c:if test="${basket.lecture_time eq 'M' && i == 2}">
                           ${basket.lecture_name}<br>
                           ${basket.professor_name}<br>
                           ${basket.classroom}
                              </c:if>
                        <c:if test="${basket.lecture_time eq 'R' && i == 3}">
                           ${basket.lecture_name}<br>
                           ${basket.professor_name}<br>
                           ${basket.classroom}
                              </c:if>
                     </c:forEach>
                  </div>
                  <div id="thr${i}" class="time_table-table-body__thr">
                     <c:forEach var="basket" items="${sllist}">
                        <c:if test="${basket.lecture_time eq 'D' && i == 0}">
                           ${basket.lecture_name}<br>
                           ${basket.professor_name}<br>
                           ${basket.classroom}
                              </c:if>
                        <c:if test="${basket.lecture_time eq 'I' && i == 1}">
                           ${basket.lecture_name}<br>
                           ${basket.professor_name}<br>
                           ${basket.classroom}
                              </c:if>
                        <c:if test="${basket.lecture_time eq 'N' && i == 2}">
                           ${basket.lecture_name}<br>
                           ${basket.professor_name}<br>
                           ${basket.classroom}
                              </c:if>
                        <c:if test="${basket.lecture_time eq 'S' && i == 3}">
                           ${basket.lecture_name}<br>
                           ${basket.professor_name}<br>
                           ${basket.classroom}
                              </c:if>
                     </c:forEach>
                  </div>
                  <div id="fri${i}" class="time_table-table-body__fri">
                     <c:forEach var="basket" items="${sllist}">
                        <c:if test="${basket.lecture_time eq 'E' && i == 0}">
                           ${basket.lecture_name}<br>
                           ${basket.professor_name}<br>
                           ${basket.classroom}
                              </c:if>
                        <c:if test="${basket.lecture_time eq 'J' && i == 1}">
                           ${basket.lecture_name}<br>
                           ${basket.professor_name}<br>
                           ${basket.classroom}
                              </c:if>
                        <c:if test="${basket.lecture_time eq 'O' && i == 2}">
                           ${basket.lecture_name}<br>
                           ${basket.professor_name}<br>
                           ${basket.classroom}
                              </c:if>
                        <c:if test="${basket.lecture_time eq 'T' && i == 3}">
                           ${basket.lecture_name}<br>
                           ${basket.professor_name}<br>
                           ${basket.classroom}
                              </c:if>
                     </c:forEach>
                  </div>
           </div>
            </c:forEach>
         </div>
      </div>
   </form>
</body>
</html>