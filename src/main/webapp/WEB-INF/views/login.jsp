<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png"
   href="../resources/login/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
   href="../resources/login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
   href="../resources/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
   href="../resources/login/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
   href="../resources/login/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
   href="../resources/login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
   href="../resources/login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
   href="../resources/login/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
   href="../resources/login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
   href="../resources/login/css/util.css">
<link rel="stylesheet" type="text/css"
   href="../resources/login/css/main.css">
<!--===============================================================================================-->
</head>
<body onkeyup="enterkey()">

   <div class="limiter">
      <div class="container-login100"
         style="background-image: url('../resources/login/images/university.jpg');">
         <div class="wrap-login100">
            <form class="login100-form validate-form" action="/" method="post"
               id="login_form">
               <span class="login100-form-logo"> <img id="mark"
                  src="../resources/login/images/logo_main.png">
               </span> <br> <br> <br>


               <div class="wrap-input100 validate-input"
                  data-validate="학번을 입력해주세요">
                  <input class="input100" type="text" id="id" name="id" placeholder="학번 입력" onkeyup="enterkey()">
                  <span class="focus-input100" data-placeholder="&#xf207;"></span>
               </div>

               <div class="wrap-input100 validate-input"
                  data-validate="비밀번호를 입력해주세요">
                  <input class="input100" type="password" name="password" placeholder="비밀번호 입력 (초기 = 생년월일 6자리)" onkeyup="enterkey()">
                  <span class="focus-input100" data-placeholder="&#xf191;"></span>
               </div>
            </form>
            <div class="contact100-form-checkbox">
               <input class="input-checkbox100" id="ckb1" type="checkbox"
                  name="remember-me"> <label class="label-checkbox100"
                  for="ckb1"> Remember ID </label>
            </div>

            <div class="container-login100-form-btn">
               <button class="login100-form-btn" id="login_btn">Login</button>
            </div>
            <br>
            <div class="container-login100-form-btn" id="adminCreateDiv">
               <button class="login100-form-btn" id="adminCreate">관리자 계정
                  생성</button>
            </div>
         </div>
      </div>
   </div>


   <div id="dropDownSelect1"></div>

   <!--===============================================================================================-->
   <script src="../resources/login/vendor/jquery/jquery-3.2.1.min.js"></script>
   <!--===============================================================================================-->
   <script src="../resources/login/vendor/animsition/js/animsition.min.js"></script>
   <!--===============================================================================================-->
   <script src="../resources/login/vendor/bootstrap/js/popper.js"></script>
   <script src="../resources/login/vendor/bootstrap/js/bootstrap.min.js"></script>
   <!--===============================================================================================-->
   <script src="../resources/login/vendor/select2/select2.min.js"></script>
   <!--===============================================================================================-->
   <script src="../resources/login/vendor/daterangepicker/moment.min.js"></script>
   <script
      src="../resources/login/vendor/daterangepicker/daterangepicker.js"></script>
   <!--===============================================================================================-->
   <script src="../resources/login/vendor/countdowntime/countdowntime.js"></script>
   <!--===============================================================================================-->
   <script src="../resources/login/js/main.js"></script>
   <script>
      $(document).ready(function() {

         // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 쿠키값 없으면 공백.
         var userLoginId = getCookie("userLoginId");
         $("input[name='id']").val(userLoginId);

         // ID가 있는경우 아이디 저장 체크박스 체크
         if ($("input[name='id']").val() != "") {
            $("#ckb1").attr("checked", true);
         }

         // 아이디 저장하기 체크박스 onchange
         $("#ckb1").change(function() {
            if ($("#ckb1").is(":checked")) { //checked true
               var userLoginId = $("input[name='id']").val();
               setCookie("userLoginId", userLoginId, 30); // 30일 동안 쿠키 보관
            } else { //checked false
               deleteCookie("userLoginId");
            }
         });

         // 아이디 저장하기가  눌린상태에서, ID를 입력한 경우
         $("input[name='id']").keyup(function() {
            if ($("#ckb1").is(":checked")) { //checked true
               var userLoginId = $("input[name='id']").val();
               setCookie("userLoginId", userLoginId, 30); // 30일 동안 쿠키 보관
            }
         });
      })

      function enterkey() {
         if (window.event.keyCode == 13) {
            // 엔터키가 눌렸을 때
            $("#login_form").submit();
         }
      }

      $("#login_btn").on("click", function() {
            $("#login_form").submit();
      });
      
      $("#adminCreate").on("click", function() {

         const data = {
            password : 'admin'
         }

         $.ajax({
            type : "POST",
            url : "/admin/adminCreate",
            async : true,
            data : data,
            success : function(result) {
               if (result === "CreateSuccess") {
                  alert('관리자 계정 생성 완료');
                  $("#adminCreateDiv").hide();
               }
            },
            error : function(request, status, error) {
               alert('기존의 관리자가 계정이 있습니다.');
               $("#adminCreateDiv").hide();
            }
         });

      })

      function setCookie(cookieName, value, exdays) {
         var exdate = new Date();
         exdate.setDate(exdate.getDate() + exdays);
         var cookieValue = escape(value)
               + ((exdays == null) ? "" : "; expires="
                     + exdate.toGMTString());
         document.cookie = cookieName + "=" + cookieValue;
      }

      function deleteCookie(cookieName) {
         var expireDate = new Date();
         expireDate.setDate(expireDate.getDate() - 1);
         document.cookie = cookieName + "= " + "; expires="
               + expireDate.toGMTString();
      }

      function getCookie(cookieName) {
         cookieName = cookieName + '=';
         var cookieData = document.cookie;
         var start = cookieData.indexOf(cookieName);
         var cookieValue = '';
         if (start != -1) {
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if (end == -1)
               end = cookieData.length;
            cookieValue = cookieData.substring(start, end);
         }
         return unescape(cookieValue);
      }
   </script>


</body>
</html>