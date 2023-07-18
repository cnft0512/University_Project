<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>시간 / 요일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
			</tr>
		</thead>
		<tbody>
<div id="modal" class="modal-overlay">
	<div class="modal-window">
		<div class="title">
			<h4>${mVo.name}님 강의 시간표</h4>
		</div>
		<div class="close-area">X</div>
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
								<c:forEach var="basket" items="${bList}">
									<c:if test="${basket.lecture_time eq 'A' && i == 0}">
			                           ${basket.lecture_name}
			                    </c:if>
									<c:if test="${basket.lecture_time eq 'F' && i == 1}">
			                           ${basket.lecture_name}
			                    </c:if>
									<c:if test="${basket.lecture_time eq 'K' && i == 2}">
			                           ${basket.lecture_name}
			                    </c:if>
									<c:if test="${basket.lecture_time eq 'P' && i == 3}">
			                           ${basket.lecture_name}
			                    </c:if>
								</c:forEach>
							</div>
							<div id="tue${i}" class="time_table-table-body__tue">
								<c:forEach var="basket" items="${bList}">
									<c:if test="${basket.lecture_time eq 'B' && i == 0}">
			                           ${basket.lecture_name}
			                    </c:if>
									<c:if test="${basket.lecture_time eq 'G' && i == 1}">
			                           ${basket.lecture_name}
			                    </c:if>
									<c:if test="${basket.lecture_time eq 'L' && i == 2}">
			                           ${basket.lecture_name}
			                    </c:if>
									<c:if test="${basket.lecture_time eq 'Q' && i == 3}">
			                           ${basket.lecture_name}
			                    </c:if>
								</c:forEach>
							</div>
							<div id="wed${i}" class="time_table-table-body__wed">
								<c:forEach var="basket" items="${bList}">
									<c:if test="${basket.lecture_time eq 'C' && i == 0}">
			                           ${basket.lecture_name}
			                    </c:if>
									<c:if test="${basket.lecture_time eq 'H' && i == 1}">
			                           ${basket.lecture_name}
			                    </c:if>
									<c:if test="${basket.lecture_time eq 'M' && i == 2}">
			                           ${basket.lecture_name}
			                    </c:if>
									<c:if test="${basket.lecture_time eq 'R' && i == 3}">
			                           ${basket.lecture_name}
			                    </c:if>
								</c:forEach>
							</div>
							<div id="thr${i}" class="time_table-table-body__thr">
								<c:forEach var="basket" items="${bList}">
									<c:if test="${basket.lecture_time eq 'D' && i == 0}">
			                           ${basket.lecture_name}
			                    </c:if>
									<c:if test="${basket.lecture_time eq 'I' && i == 1}">
			                           ${basket.lecture_name}
			                    </c:if>
									<c:if test="${basket.lecture_time eq 'N' && i == 2}">
			                           ${basket.lecture_name}
			                    </c:if>
									<c:if test="${basket.lecture_time eq 'S' && i == 3}">
			                           ${basket.lecture_name}
			                    </c:if>
								</c:forEach>
							</div>
							<div id="fri${i}" class="time_table-table-body__fri">
								<c:forEach var="basket" items="${bList}">
									<c:if test="${basket.lecture_time eq 'E' && i == 0}">
			                           ${basket.lecture_name}
			                    </c:if>
									<c:if test="${basket.lecture_time eq 'J' && i == 1}">
			                           ${basket.lecture_name}
			                    </c:if>
									<c:if test="${basket.lecture_time eq 'O' && i == 2}">
			                           ${basket.lecture_name}
			                    </c:if>
									<c:if test="${basket.lecture_time eq 'T' && i == 3}">
			                           ${basket.lecture_name}
			                    </c:if>
								</c:forEach>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
		</tbody>
	</table>
</body>
</html>