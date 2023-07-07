<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>


	<form action="/" method="post" id="login_form">
		<h1>Login</h1>
		<div>
			<table>
				<tr>
					<th>아 이 디 : </th>
					<td><input type="text" name="id" placeholder="학번을 입력하세요."></td>
				</tr>
				<tr>
					<th>비 밀 번 호 : </th>
					<td><input type="password" name="password" placeholder="비밀번호를 입력하세요."></td>
				</tr>
			</table>
		</div>
		<input type="submit" value="Submit" class="login_btn">
	</form>
	
	<script>
		$(".login_btn").on("click", function() {			
	        $("#login_form").submit();
		});
	</script>
	 
</body>
</html>