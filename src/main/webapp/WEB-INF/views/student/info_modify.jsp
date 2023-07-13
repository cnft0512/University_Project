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
			<form method="POST" id="info_modify_form" action = "/student/info_modify">

				<div class="form-group">
					<label for="id" class="form-label required">${mVo.id}</label><br>
					<input type="hidden" name = "id" value = "${mVo.id}">
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
					<select name = "academic_status">
						<option value = "0">재학</option>
						<option value = "1">휴학</option>
						<option value = "2">군휴학</option>
						<option value = "3">재적</option>	
						<option value = "4">자퇴</option>					
					</select><br>					
				</div>

				<div class="form-group">										
							<button type="button" id="address_btn" onclick="execution_daum_address()">주소찾기</button>					
							<input class="post_input" name="post" style="width: 80px;" value = "${mVo.post}"	readonly>
							<input class="address_1_input" name="address_1" id="address_1" value = "${mVo.address_1}" readonly required>
							<input class="address_2_input" name="address_2" id="address_2" value = "${mVo.address_2}" readonly required>	<br>					
				</div>
			
				<div class="form-group">										
							<input type="text" name = "email" style="height: 23px; margin-top: 10px;" value = "${mVo.email}"><br>
						
				</div>
				<div class="form-group">						
							<input type="text" name = "phone" style="height: 23px; margin-top: 10px;" value = "${mVo.phone}"><br>
				</div>

				<button type="button" id="save_info_btn" onclick="save()">저장</button>
				<button type="button" id="cancel_btn" onclick="goBack()">취소</button>
				
			</form>
		</div>
	</div>
	<script>
	function save() {		
		$("#info_modify_form").submit();
	}
	
	function goBack(){
		window.history.back();
	}
	
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