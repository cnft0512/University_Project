<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/student/css/pw_change.css">
<link rel="stylesheet" href="../resources/includes/css/button.css">
</head>
<body>

	<div class="change_pw_wrap">
		<div class="change_pw_name"> 
			<h2>비밀번호 변경</h2>
			<br>
			<div class="current_pw_input_box">
				현재 비밀번호 : <input class="current_pw_input" name="current_pw" type="password">
			</div>
			<span class="current_pwck_input_re_1">현재 비밀번호가 일치합니다.</span>
			<span class="current_pwck_input_re_2">현재 비밀번호가 일치하지 않습니다.</span>
			<br>
			<div class="new_pw_input_box">
				새로운 비밀번호 : <input class="new_pw_input" name="password" type="password">
			</div>
			<br>
			<div class="new_pwck_input_box">
				새로운 비밀번호 확인: <input class="new_pwck_input" type="password">
			</div>
			<span class="new_pwck_input_re_1">새로운 비밀번호 확인이 일치합니다.</span>
			<span class="new_pwck_input_re_2">새로운 비밀번호가 확인이 일치하지 않습니다.</span>
			<span class="new_pwck_input_re_3">비밀번호는 필수 정보입니다.</span>
				<input type="hidden" id="id" name="id" value="${mVo.id}">
			<br>
			<div class="pw_change_btn_wrap">
				<input type="button" class="btn pw_change_btn" value="비밀번호 변경">
			</div>
		</div>
	</div>

	<script>
		//비번 중복검사
		$('.current_pw_input').on(
				"propertychange change keyup paste input",
				function() {
					var current_pw = $('.current_pw_input').val();
					console.log(current_pw);
					var data = {
						password : current_pw
					}
					$.ajax({
						type : "post",
						url : "/student/pwCheck",
						data : data,
						success : function(result) {
							if (result == 'ok') {
								$('.current_pwck_input_re_1').css("display",
										"inline-block");
								$('.current_pwck_input_re_2').css("display",
										"none");
								pwchk1 = true;
							} else {
								$('.current_pwck_input_re_2').css("display",
										"inline-block");
								$('.current_pwck_input_re_1').css("display",
										"none");
								pwchk1 = false;
							}
						},
						error : function(error) {
							console.log("error" + error);

						}
					});

				});

		$('.new_pw_input').on("propertychange change keyup paste", function() {

			//비밀번호 공백 확인
			if ($(".new_pw_input").val() === "") {
				$('.new_pwck_input_re_3').css("display", "inline-block");
				$('.new_pwck_input_re_1').css("display", "none");
				$('.new_pwck_input_re_2').css("display", "none");
				pwchk2 = false;
			} else if ($(".new_pw_input").val() != $(".new_pwck_input").val()) {
				$('.new_pwck_input_re_2').css("display", "inline-block");
				$('.new_pwck_input_re_1').css("display", "none");
				$('.new_pwck_input_re_3').css("display", "none");
				pwchk2 = false;
				pwchk3 = false;
			} else if ($(".new_pw_input").val() == $(".new_pwck_input").val()) {
				$('.new_pwck_input_re_1').css("display", "inline-block");
				$('.new_pwck_input_re_2').css("display", "none");
				$('.new_pwck_input_re_3').css("display", "none");
				pwchk2 = true;
				pwchk3 = true;
			}

			console.log(pwchk2);
		}); //end of new password

		$('.new_pwck_input').on(
				"propertychange change keyup paste",
				function() {

					//비밀번호 공백 확인
					if ($(".new_pwck_input").val() === "") {
						$('.new_pwck_input_re_3').html('비밀번호 새창은 필수 정보입니다.');
						$('.new_pwck_input_re_3')
								.css("display", "inline-block");
						$('.new_pwck_input_re_1').css("display", "none");
						$('.new_pwck_input_re_2').css("display", "none");
						pwchk3 = false;
					} else if ($(".new_pwck_input").val() != $(".new_pw_input")
							.val()) {
						$('.new_pwck_input_re_2')
								.css("display", "inline-block");
						$('.new_pwck_input_re_1').css("display", "none");
						$('.new_pwck_input_re_3').css("display", "none");
						pwchk2 = false;
						pwchk3 = false;
					} else if ($(".new_pwck_input").val() == $(".new_pw_input")
							.val()) {
						$('.new_pwck_input_re_1')
								.css("display", "inline-block");
						$('.new_pwck_input_re_2').css("display", "none");
						$('.new_pwck_input_re_3').css("display", "none");
						pwchk2 = true;
						pwchk3 = true;
					}

					console.log(pwchk2);
				});

		$(".pw_change_btn").click(function() {

			if (pwchk1 == false) {
				alert('현재 비밀번호가 틀렸습니다.');

			} else if (pwchk2 == false) {
				alert('2번 틀림');
			} else if (pwchk3 == false) {
				alert('3번 틀림');

			} else if (pwchk1 && pwchk2 && pwchk3) {

				const id = $("#id").val();
				const password = $(".new_pw_input").val();
				const data = {
					id : id,
					password : password

				};

				$.ajax({
					type : "POST",
					url : "/student/pwChange",
					async : true,
					data : data,
					success : function(result) {

						console.log("result: " + result);
						if (result === "changeSuccess") {
							alert('비밀번호가 변경되었습니다.');
							location.href = "/student/main";
						} else {
							alert('현재 비밀번호가 틀렸습니다.');
						}
					},
					error : function(error) {
						console.log("error" + error);
					}
				});
			}
		});
	</script>

</body>
</html>