<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<h2>학생 정보</h2>
	<div class="container" style="width: 50%;">
		<div style="float: left; width: 10%;">
			<div class="form-group">
				<label for="head_id" class="form-label required">학번</label><br>
			</div>

			<div class="form-group">
				<label for="head_name" class="form-label required">이름</label><br>
			</div>

			<div class="form-group">
				<label for="head_department" class="form-label required">학과</label><br>
			</div>

			<div class="form-group">
				<label for="head_birth" class="form-label required">생년월일</label><br>
			</div>
			
			<div class="form-group">
				<label for="head_academic_status" class="form-label required">재학여부</label><br>
			</div>
			

			<div class="form-group">
				<label for="head_address" class="form-label required">주소</label><br>

			</div>
			<div class="form-group">
				<label for="head_email" class="form-label required">이메일</label><br>
			</div>
			<div class="form-group">
				<label for="head_phone" class="form-label required">전화번호</label><br>
			</div>
		</div>
		<div id = "nomal_form" style="float: right; width: 90%;">
			

				<div class="form-group">
					<label for="id" class="form-label required">${mVo.id}</label><br>
				</div>

				<div class="form-group">
					<label for="name" class="form-label required">${mVo.name}</label><br>
				</div>

				<div class="form-group">
					<label for="department" class="form-label required">${mVo.depart_code}
						<c:forEach var="depart_list" items="${departlist}">
							<c:if test="${mVo.depart_code eq depart_list.depart_code}">
								${depart_list.depart_name}
								</c:if>
						</c:forEach>
					</label><br>
				</div>

				<div class="form-group">
					<label for="birth" class="form-label required"><fmt:formatDate
							pattern="yyyy/MM/dd" value="${mVo.birth}" /></label><br>
				</div>
				
				<div class="form-group">
					<label for="birth" class="form-label required">
					<c:choose>
						<c:when test="${mVo.academic_status eq 0}">
							재학
						</c:when>
						<c:when test="${mVo.academic_status eq 1}">
							휴학
						</c:when>
						<c:when test="${mVo.academic_status eq 2}">
							군휴학
						</c:when>
						<c:when test="${mVo.academic_status eq 3}">
							재적
						</c:when>
						<c:otherwise>
							자퇴
						</c:otherwise>
					</c:choose>
					</label><br>
				</div>

				<div class="form-group">
					<label for="address" class="form-label required">(${mVo.post})
						${mVo.address_1} ${mVo.address_2}</label><br>
				</div>

				<div class="form-group">
					<label for="email" class="form-label required">${mVo.email}</label><br>
				</div>
				<div class="form-group">
					<label for="phone" class="form-label required">${mVo.phone}</label><br>
				</div>

				<button type="button" id="modify_info_btn" onclick="location.href='/student/info_modify'">수정</button>

			
		</div>
	</div>
	
</body>
</html>