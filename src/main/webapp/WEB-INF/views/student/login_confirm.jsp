<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="../resources/includes/css/button.css">
<link rel="stylesheet" href="../resources/student/css/pw_change.css">
<head>
<meta charset="UTF-8">
</head>
<body>
	<h2>학생 정보</h2>
	<div class="container" style="width: 50%; float: left;">
		<div class="form-group" style="font-size: 15px;">
			<form id="re_login_form" method="post" action="/student/loginConfirm"><br>
				사용자 ID : ${mVo.id}
				<div class="pw_wrap">
					<div class="pw_input_box"><br>
						비밀번호 확인 : <input class="pw_input" type="password" name="password">
					</div>
				</div>
				<c:if test="${result==0}">
					<div class="login_warn" style="color: red;">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
				</c:if>
				<div class="re_login_btn_wrap"><br>
					<input type="button" class="btn re_login_btn" id="re_login_btn" value="확 인">
				</div>
				<input type="hidden" name="id" value="${mVo.id}">
			</form>
		</div>
	</div>
	<script>
	$("#re_login_btn").click(function() {
			$("#re_login_form").submit();
		});
	</script>
</body>
</html>