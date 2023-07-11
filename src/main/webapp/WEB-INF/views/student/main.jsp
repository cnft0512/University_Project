<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
<title>test</title>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
   href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
   rel="stylesheet">

<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../resources/includes/css/style.css">
<link rel="stylesheet" href="../resources/student/css/pw_modal.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

</head>
<body>
   <div id = "logo" style="width:700px; height: 700px; margin: 0 auto;">
      메인
   </div>        
           
      
      <div id="pw_modal" class="modal-overlay">
      <div class="modal-window">
         <div class="title">
            <h2>비밀번호 변경</h2>
         </div>
         <div class="pw_close-area">X</div>
         <div style="float: left; width: 50%;">
            <div class="form-group">            
                  <div class="new_pw_input_box">
                     새로운 비밀번호 : <input type="password" class="new_pw_input" name="password" style="width:250px;">
                  </div>
                  <div class="new_pwck_input_box">
                     새로운 비밀번호 확인: <input type="password" class="new_pwck_input" style="width:250px;">
                  </div>
                  <span class="new_pwck_input_re_1" style="display: none; width:250px;">비밀번호가 일치합니다.</span>
                  <span class="new_pwck_input_re_2" style="display: none; width:250px;">비밀번호가 일치하지 않습니다.</span>                        
                  <span class="new_pwck_input_re_3" style="display: none; width:250px;">공백은 입력할 수 없습니다</span>      
                  <input type="hidden" id = "id" name = "id" value="${mVo.id}">      
            </div>
         </div>
         
      </div>
      <button type="button" id="pwChange_btn" class="custom-btn btn-1"
         style="margin-bottom: 5px;">비밀번호 변경</button>
   </div>
   
   <script>   
   
   let pwchk2 = false;
   let pwchk3 = false;
   
   $(document).ready(function() {      
      let result = ${answer};
      checkAlert(result);
      function checkAlert(result) {
         if (result === 0) {
            console.log("ok");
         }
         if (result === 1) {
            pw_modalOn()
         }
      }
   });
   
   const pw_modal = document.getElementById("pw_modal")
   
   function pw_modalOn() {
      pw_modal.style.display = "flex"
   }
   function ispw_modalOn() {
       return pw_modal.style.display === "flex"
   }
   function pw_modalOff() {
      pw_modal.style.display = "none"
   }
   const pw_modal_closeBtn = pw_modal.querySelector(".pw_close-area")
   pw_modal_closeBtn.addEventListener("click", e => {
      pw_modalOff()
   })
   
   pw_modal.addEventListener("click", e => {
       const evTarget = e.target
       if(evTarget.classList.contains("modal-overlay")) {
          pw_modalOff()
       }
   })
   window.addEventListener("keyup", e => {
       if(ispw_modalOn() && e.key === "Escape") {
          pw_modalOff()
       }
   })
   
   $('.new_pw_input').on("propertychange change keyup paste", function() {
         
            //비밀번호 공백 확인
            if ($(".new_pw_input").val() === "") {
               $('.new_pwck_input_re_3').css("display", "inline-block");
               $('.new_pwck_input_re_1').css("display", "none");
               $('.new_pwck_input_re_2').css("display", "none");
               pwchk2 = false;
            }else if( $(".new_pw_input").val() != $(".new_pwck_input").val()){
               $('.new_pwck_input_re_2').css("display", "inline-block");
               $('.new_pwck_input_re_1').css("display", "none");
               $('.new_pwck_input_re_3').css("display", "none");
               pwchk2 = false;
               pwchk3 = false;
            }else if( $(".new_pw_input").val() == $(".new_pwck_input").val()) {               
               $('.new_pwck_input_re_1').css("display", "inline-block");
               $('.new_pwck_input_re_2').css("display", "none");
               $('.new_pwck_input_re_3').css("display", "none");
               pwchk2 = true;
               pwchk3 = true;
            }
         
      }); 
      
   $('.new_pwck_input').on("propertychange change keyup paste", function() {
      
      //비밀번호 공백 확인
      if ($(".new_pwck_input").val() === "") {   
         $('.new_pwck_input_re_3').css("display", "inline-block");
         $('.new_pwck_input_re_2').css("display", "none");
         $('.new_pwck_input_re_1').css("display", "none");
         pwchk3 = false;
      }else if( $(".new_pwck_input").val() != $(".new_pw_input").val()){
         $('.new_pwck_input_re_2').css("display", "inline-block");
         $('.new_pwck_input_re_1').css("display", "none");   
         $('.new_pwck_input_re_3').css("display", "none");
         pwchk2 = false;
         pwchk3 = false;
      }else if( $(".new_pwck_input").val() == $(".new_pw_input").val()) {
         $('.new_pwck_input_re_1').css("display", "inline-block");
         $('.new_pwck_input_re_2').css("display", "none");
         $('.new_pwck_input_re_3').css("display", "none");
         pwchk2 = true;
         pwchk3 = true;
      }
   
   }); 
   
   $("#pwChange_btn").click(function() {
      console.log($("#id").val());
      if (pwchk2 == false) {
         alert('2번 틀림');
      } else if (pwchk3 == false) {
         alert('3번 틀림');

      } else if (pwchk2 && pwchk3 ) {

         const id = $("#id").val();
         const password = $(".new_pw_input").val();
         const data = {
            id : id,
            password : password

         };
         
         $.ajax({
            type : "POST",
            url : "/student/pwChange_First",
            async : true,
            data : data,
            success : function(result) {

               console.log("result: " + result);
               if (result === "changeSuccess") {
                  alert('비밀번호가 변경되었습니다.');
                  pw_modalOff()
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