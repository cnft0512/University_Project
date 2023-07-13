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
<link rel="stylesheet" href="../resources/includes/button.css">
<link rel="stylesheet" href="../resources/includes/validation.css">

<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js"
	type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />


</head>
<body>

	<h2>학생 등록</h2>
	<div class="container" style="width: 50%;">
		<div style="float: left;">
			<form method="POST" id="signup-form" class="signup-form">



				<div class="form-group">
					<label for="name" class="form-label required">이름</label><br> <input
						type="text" name="name" id="name" required /> <br>
					<span class="final_name_ck">이름을 입력해주세요.</span>
				</div>

				<div class="form-group">
					<label for="depart_code" class="form-label required">소속학과코드</label><br>
					<select id="depart_code" name="depart_codeNname" required
						style="width: 300px; height: calc(1.5em + 0.75rem + 2px); border-color: #ced4da; border-radius: 0.25rem;">
						<option>학과 선택 해주세요</option>
						<c:forEach var="i" begin="0" end="${list.size()}">
							<option value="${list[i].depart_code} ${list[i].depart_name}">${list[i].depart_code}&nbsp;${list[i].depart_name}</option>
						</c:forEach>
					</select> <br>
					<span class="final_depart_code_ck">소속학과를 입력해주세요.</span>
				</div>

				<div class="form-group">
					<label for="birth" class="form-label required">생년월일</label> <input
						id="datepicker" name="birth" width="300" required
						autocomplete="off" /> <span class="final_birth_ck">생년월일을
						입력해주세요.</span>
				</div>

				<div class="form-group">
					<label for="post" class="form-label required">우편번호</label><br>
					<input class="post_input" name="post" style="width: 150px;"
						readonly>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<div class="custom-btn btn-1" onclick="execution_daum_address()">
						<span>주소찾기</span>
					</div>
				</div>
				<div class="form-group">
					<label for="address_1" class="form-label required">주소</label><br>
					<input class="address_1_input" name="address_1" id="address_1"
						readonly required> <br>
					<span class="final_address_1_ck">주소를 입력해주세요.</span>
				</div>
				<div class="form-group">
					<label for="address_2" class="form-label required">상세주소</label><br>
					<input class="address_2_input" name="address_2" id="address_2"
						readonly required> <br>
					<span class="final_address_2_ck">상세주소를 입력해주세요.</span>
				</div>
				<div class="form-group">
					<label for="email" class="form-label required">이메일 주소</label><br>
					<input type="text" name="email" id="email" required /> <br>
					<span class="final_email_ck">이메일 주소를 입력해주세요.</span>
				</div>
				<div class="form-group">
					<label for="phone" class="form-label required">전화번호</label><br>
					<input type="text" name="phone" id="phone" required /> <br>
					<span class="final_phone_ck">전화번호를 입력해주세요.</span>
				</div>

				<button id="join_btn" type="button" class="custom-btn btn-1">확인</button>
			</form>
		</div>
	</div>
	<script>
	/* 유효성 검사 통과유무 변수 */
	var nameCheck = false; // 이름
	var birthCheck = false; // 생년월일
	var depart_codeCheck = false; // 학과코드
	var address_1Check = false; // 주소1
	var address_2Check = false; // 주소2
	var emailCheck = false; // 이메일
	var phoneCheck = false; // 휴대폰
	const dc = document.getElementById('depart_code');
	
	$('#datepicker').datepicker({
		uiLibrary : 'bootstrap4',
		format : 'yyyy/mm/dd'
	});
	
	$("#join_btn").click(function() {
		$("#signup-form").submit;
	});
	$(document).ready(	
			function() {
				/* 회원가입 버튼 작동 */
				$("#join_btn").click(function() {
							// 에러 쓸거고 포커스 쓸거고 -> CSS
							/* 입력값 변수 */
							var name = $('#name').val();
							var birth = $('#datepicker').val();
							var depart_code = $('#depart_code').val();
							var address_1 = $('#address_1').val();
							var address_2 = $('#address_2').val();
							var email = $('#email').val();
							var phone = $('#phone').val();

							/* 이름 유효성 검사 */
							if (name == "") {
								$('.final_name_ck').css('display', 'block');
								$('#name').css("border-color","red");
								nameCheck = false;
							} else {
								$('.final_name_ck').css('display', 'none');
								$('#name').css("border-color","#ced3da");
								nameCheck = true;
							}
							
							/* 생년월일 유효성 검사 */
							if (birth == "") {
								$('.final_birth_ck').css('display', 'block');
								$('#datepicker').css("border-color","red");
								birthCheck = false;
							} else {
								$('.final_birth_ck').css('display', 'none');
								$('#datepicker').css("border-color","#ced3da");
								birthCheck = true;
							}
							
							/* 학과 선택 유효성 검사 */
							if (dc.options[dc.selectedIndex].text === "학과 선택 해주세요") {
								$('.final_depart_code_ck').css('display', 'block');
								$('#depart_code').css("border-color","red");
								depart_codeCheck = false;
							} else {
								$('.final_depart_code_ck').css('display', 'none');
								$('#depart_code').css("border-color","#ced3da");
								depart_codeCheck = true;
							}
							
							/* 주소 유효성 검사 */
							if (address_1 == "") {
								$('.final_address_1_ck').css('display', 'block');
								$('#address_1').css("border-color","red");
								address_1Check = false;
							} else {
								$('.final_address_1_ck').css('display', 'none');
								$('#address_1').css("border-color","#ced3da");
								address_1Check = true;
							}
							if (address_2 == "") {
								$('.final_address_2_ck').css('display', 'block');
								$('#address_2').css("border-color","red");
								address_2Check = false;
							} else {
								$('.final_address_2_ck').css('display', 'none');
								$('#address_2').css("border-color","#ced3da");
								address_2Check = true;
							}
							
							/* 이메일 유효성 검사 */
							if (email == "") {
								$('.final_email_ck').css('display', 'block');
								$('#email').css("border-color","red");
								emailCheck = false;
							} else {
								$('.final_email_ck').css('display', 'none');
								$('#email').css("border-color","#ced3da");
								emailCheck = true;
							}
							
							/* 휴대폰 유효성 검사 */
							if (phone == "") {
								$('.final_phone_ck').css('display', 'block');
								$('#phone').css("border-color","red");
								phoneCheck = false;
							} else {
								$('.final_phone_ck').css('display', 'none');
								$('#phone').css("border-color","#ced3da");
								phoneCheck = true;
							}
							
							/* 최종 유효성 검사 */
							if (nameCheck && birthCheck && depart_codeCheck && address_1Check
									&& address_2Check && emailCheck
									&& phoneCheck) {
								alert("회원가입");
								$("#signup-form").attr("action", "/admin/join");
								$("#signup-form").submit();
							}
							return false;
						});
			});

	/* 다음 주소 연동 */
	function execution_daum_address() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName
										: data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 주소변수 문자열과 참고항목 문자열 합치기
							addr += extraAddr;

						} else {
							addr += ' ';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						$(".post_input").val(data.zonecode);
						$(".address_1_input").val(addr);
						// 커서를 상세주소 필드로 이동한다.
						$(".address_2_input").attr("readonly", false);
						$(".address_2_input").focus();
					}
				}).open();
	}
	</script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>




<!-- 유효성 검사 validate 사용 (datepicker와 외부 script가 겹침) 
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>

<script>
$(document).ready(function() {  
	
	jQuery.validator.setDefaults({
	    focusInvalid: false,
	    focusCleanup: false, 
	    onkeyup: false,
	    onclick : false,
	    showErrors: function(errorMap, errorList) {
	        $.each(this.validElements(), function (index, element) {
	            var $element = $(element);
	            $element.removeData("title") 
	                .tooltip("destroy");
	            $element.closest('.form-group').removeClass('has-error').addClass('has-success');
	        });
	        $.each(errorList, function (index, error) {
	            var $element = $(error.element);
	            if(!$element.data('title')){
	                $element.attr("title", error.message).tooltip({trigger: 'manual'}, {selector:1}).tooltip('show'); 
	                if($element.attr("type") == "radio"){
		                var text = $element.parent().find("span").text();
		                $element.parent().find("span").remove();
		                $element.after("<span>"+text+"</span>");
	                }
	            }else if($element.data('title') != error.message){
	                $element.attr('data-original-title', error.message).data("title", error.message).tooltip('show');
	            }
	            
	            $element.closest('.form-group').removeClass('has-success').addClass('has-error');
	        });
	    },        
	});

	
	$("#signup-form").validate({
		rules: {
			name : {required: true},
			phone : {required: true},
			email : {required: true},
			address_2 : {required: true},
			depart_code : {required: true},
			birth : {required: true}
	        },
		messages:{
			name : {required: "이름을 입력해주세요."},
			phone : { required: "휴대전화번호를 입력해주세요."},
			email : { required: "이메일을 입력해주세요."},
			depart_code : {required: "학과코드를 입력해주세요."},
			address_2 : {required: "상세주소를 입력해주세요."},
			birth : {required: "생년월일를 입력해주세요."}
		}
	});
	$("#join_btn").click(function(){
    	$("#signup-form").submit();
	});

});
</script>
<span class="error">
    const validityMessage = {
    	      badInput: '잘못된 입력입니다',
    	      patternMismatch: '_patternMismatch',
    	      rangeOverflow: '_rangeOverflow',
    	      rangeUnderflow: '_rangeUnderflow',
    	      stepMismatch: '_stepMismatch',
    	      tooLong: '_tooLong',
    	      tooShort: '6자 이상 입력하세요',
    	      typeMismatch: '이메일 주소 형식으로 입력하세요',
    	      valueMissing: '이메일을 반드시 입력하세요',
    	    }

    	    function getMessage(validity) {
    	      for (const key in validityMessage) {
    	        if (validity[key]) {
    	          return validityMessage[key]
    	        }
    	      }
    	    }

    	    function showError(input) {
    	      // 오류 메시지 스타일 
    	      document.querySelector('.error').textContent = getMessage(input.validity)
    	    }

    	    function onload() {
    	      document.querySelectorAll('input').forEach(input => {
    	        
    	        input.addEventListener('invalid', (e) => {
    	          document.forms[0].classList.add('was-validated');
    	          showError(input)

    	          /**
    	           * 브라우져 툴팁 숨김 
    	           */ 
    	          e.preventDefault();
    	        })

    	        input.addEventListener('input', () => {
    	          // 검증 후에 오류 메세지 표시 
    	          if (document.forms[0].classList.contains('was-validated')) {
    	            input.reportValidity()
    	          }
    	        })
    	      })
    	    }

    	    document.addEventListener('DOMContentLoaded', onload)

-->