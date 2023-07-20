<%@page import="com.university.model.RegistrationDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="../resources/admin/css/notice.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
   crossorigin="anonymous"></script>
</head>
<body>
         <div class="mypage__content ac-review customercare">
               <div class="float-wrap">
                  <h4 class="mypage__sub-title">공지사항</h4>
               </div>

               <div class="notice-contents">
                  <div id="notice" class="notice-table">
                     <div class="notice-table-head show--pc">
                        <div class="notice-list notice__item flex">
                           <div class="notice-table-head__num">번호</div>
                           <div class="notice-table-head__content">내용</div>
                           <div class="notice-table-head__writer">작성자</div>
                           <div class="notice-table-head__date">등록일</div>
                     </div>
                     </div>
                     <ul class="notice-table-body">

               <li id="3" class="notice-table-body__item">
                  <div class="notice-list notice__item flex">
                     <div
                        class="notice-list__item notice-list__num text-left show--pc">
                        <span class="notice__num"
                           style="position: absolute; left: 4.5%;">3</span>
                     </div>
                     <div class="notice-list__item notice-list__subject"
                        style="width: 1350px;">
                        <div class="notice-subject flex flex-items-between">
                           <div class="notice__title">2023-여름계절학기 재수강 연결 일정 공고</div>
                           <div class="notice__title"
                              style="position: absolute; left: 74%;">관리자</div>
                           <div class="notice__date"
                              style="position: absolute; left: 90%;">2023-07-19</div>
                        </div>
                     </div>
                  </div>
                  <div class="notice-view notice__item">
                     <div class="notice-view__item">
                        <div class="notice__cont">
                           2023학년도 여름계절학기 재수강 연결 일정을 아래와 같이 공고함. <br> <br> - 아 래
                           - <br> <br> 1. 일 정 : 6. 22(목) ∼ 7. 3(월) 오전 9시~오후 5시 <br>
                           <br> 2. 방 법 : 학교 홈페이지 → 종합정보시스템 → 수업/수강관리 →재수강과목선택 → 이전 취득
                           <br> <br> 성적 조회 후 재수강 대상 성적 선택 → 저장 <br> <br>


                           3. 자세한 사항은 첨부파일(재수강 연결 안내문)과 수강편람 중 "재수강" 안내를 참조하시기 바랍니다. <br>
                           <br> 2023. 6. 19. <br> <br> 교무처장
                           <div class="back-list-btn show--pc">
                              <button type="button" class="underline" onClick="goList();">목록으로
                                 돌아가기</button>
                           </div>
                        </div>
                     </div>
                  </div>
               </li>

               <li id="2" class="notice-table-body__item">
                  <div class="notice-list notice__item flex">
                     <div
                        class="notice-list__item notice-list__num text-left show--pc">
                        <span class="notice__num"
                           style="position: absolute; left: 4.5%;">2</span>
                     </div>
                     <div class="notice-list__item notice-list__subject"
                        style="width: 1350px;">
                        <div class="notice-subject flex flex-items-between">
                           <div class="notice__title">2024학년도 학교현장실습(교육실습) 신청 안내</div>
                           <div class="notice__title"
                              style="position: absolute; left: 74%;">관리자</div>
                           <div class="notice__date"
                              style="position: absolute; left: 90%;">2023-07-18</div>
                        </div>
                     </div>
                  </div>
                  <div class="notice-view notice__item">
                     <div class="notice-view__item">
                        <div class="notice__cont">
                           2024학년도 학교현장실습(교육실습) 신청 절차에 대해 아래와 같이 안내하오니, 실습 예정자들은 해당 내용을

                           확인하시고 기간내 각 소속캠퍼스 학사종합지원센터로 서류 제출하시기 바랍니다. <br> <br>-
                           아 래 - <br> <br> 1. 대 상 : 사범대학 및 교직과정 설치학과 교직과정이수예정자 중
                           2024년 1학기에 7학기 이상 등록자 <br> <br> 2. 제출서류 : 교육실습신청서 및
                           교육실습승낙서(개인이 실습 학교를 구해오는 학생) 각 1부. <br> <br> 3. 제출기한 :
                           2023.7.17(월) ~ 2023.12.01(금) <br> <br> 4. 제 출 처 : 가.
                           방문제출 - 소속 캠퍼스 학사종합지원센터 <br> <br> 나. 우편제출 <br> <br>
                           - 서울캠퍼스 : 서울시 학사종합지원센터 교직담당 <br> <br> 5. 유의사항 <br>
                           <br> 가. 개인이 실습 학교를 구해 교육실습을 진행하는 경우,
                           <교육실습 승낙서>에 해당 학교장 직인을 받아 <교육실습 신청서>와 함께 캠퍼스별
                           학사종합지원센터로 제출하여아 함. <br>
                           <br>
                           (서울캠퍼스 학생중, 개인이 구한 교육실습 예정 학교에서 실습 승낙 요청을 전자결재 진행을 원하는 경우, 서울
                           학사종합지원센터 교육실습 담당자에게 별도 연락 바람.) <br>
                           <br>

                           나. 사범대학 교육실습협력교(교육실습 자매교)에서 교육실습을 진행하고자 하는 경우, <교육실습신청서>만

                           작성하여 캠퍼스별 학사종합지원센터로 제출바람.(추후 학교에서 실습학교 배정 후. 결과 공지함.) <br>
                           <br>

                           다. 교육실습은 매년 1학기에만 진행 가능하며 교육실습 희망자는 2024년 1학기 수강신청시 반드시

                           ＇학교현장실습＇ 과목을 수강신청해야 함. <br>
                           <br>
                           6. 문 의 <br>
                           <br>
                           가. 서울캠퍼스 : 02-0000-0000 <br>
                           <br>


                           2023. 7. <br>
                           <br>



                           사범대학장ㆍ교무처장
                           <div class="back-list-btn show--pc">
                              <button type="button" class="underline" onClick="goList();">목록으로
                                 돌아가기</button>
                           </div>
                        </div>
                     </div>
                  </div>
               </li>

               <li id="1" class="notice-table-body__item">
                  <div class="notice-list notice__item flex">
                     <div
                        class="notice-list__item notice-list__num text-left show--pc">
                        <span class="notice__num"
                           style="position: absolute; left: 4.5%;">1</span>
                     </div>
                     <div class="notice-list__item notice-list__subject"
                        style="width: 1350px;">
                        <div class="notice-subject flex flex-items-between">
                           <div class="notice__title">2023학년도 제1학기 수강신청 일정 안내</div>
                           <div class="notice__title"
                              style="position: absolute; left: 74%;">관리자</div>
                           <div class="notice__date"
                              style="position: absolute; left: 90%;">2023-01-28</div>
                        </div>
                     </div>
                  </div>
                  <div class="notice-view notice__item">
                     <div class="notice-view__item">
                        <div class="notice__cont">
                           2023학년도 제1학기 수강신청 일정을 아래와 같이 공고합니다. <br> <br> - 아 래 -
                           <br> <br> 1. 주요안내 <br> <br> 가. 수강신청/변경 및
                           취소는 기간 내에 반드시 본인이 해야 함 <br> <br> 나. 비밀번호 유출로 인한 사고
                           예방을 위해 수강신청 전 본인의 비밀번호 변경 권장 <br> <br> 다. 수강신청한 과목을
                           매매 또는 거래하였을 경우, 학생징계규정에 의해 징계의 사유가 될 수 있음 <br> <br>

                           라. 학사운영의 투명성 및 공정성을 제고하기 위해 교수-자녀 간 강의 수강을 지양하기 바람 <br> <br>
                           2023. 1. 28. <br> <br> 교무처장
                           <div class="back-list-btn show--pc">
                              <button type="button" class="underline" onClick="goList();">목록으로
                                 돌아가기</button>
                           </div>
                        </div>
                     </div>
                  </div>
               </li>



            </ul>
                  </div>
               </div>
            </div>
         

   <script type="text/javascript">
        let innnerWidth = window.innerWidth;

        function noticeOpen() {

            let target = $(this).closest('li');
            let targetId = target.attr('id');
            
            if (!$(this).hasClass('is-open')) {
                // 열때
                $('.notice-contents')[0].dataset.index = targetId
                //alert(targetId);
                
                $('.notice-list.is-open').removeClass('is-open');
                $('.notice-view.active').removeClass('active');
                $(this).addClass('is-open');
                $(this).next().addClass('active');
                if (innerWidth < 1101) {
                    // 모바일
                    $('.notice-view').slideUp();
                    $(this).next('.notice-view').slideDown();
                }

                // $('.notice-table-body__item').removeClass('active');

            } else {
                goList(this)
            }
        }

        function goList(item) {
            var that = item ? item : $('.is-open')[0]

            // 닫을때
            $('.notice-contents')[0].removeAttribute('data-index')
            $(that).removeClass('is-open');
            $(that).next().removeClass('active');

            if (innerWidth < 1101) {
                $('.notice-view').slideUp();
            }
        }

        // function noticeToggle() {
        //     if (!$(this).hasClass('is-open')) {
        //         $('.notice-list').removeClass('is-open');
        //         $(this).addClass('is-open');
        //         $('.notice-view').slideUp();
        //         $(this).next('.notice-view').slideDown();
        //     } else {
        //         $('.notice-list').removeClass('is-open');
        //         $('.notice-view').slideUp();
        //     }
        // }

        

        document.addEventListener('DOMContentLoaded', function () {
            $('.notice-list').on('click', noticeOpen);
        });

        var lastWidth = window.innerWidth
        window.addEventListener('resize', function () {
            if (window.innerWidth < 1101 && lastWidth >= 1101) {
                // 웹 > 모바일
                if ($('.notice-contents').is('[data-index]')) {
                    $('.notice-view.active').css({
                        display: 'block',
                        overflow: 'hidden'
                    })
                }
                lastWidth = window.innerWidth
            } else if (window.innerWidth >= 1101 && lastWidth < 1101) {
                // 모바일 > 웹
                $('.notice-view.active').removeAttr('style')
                lastWidth = window.innerWidth
            }
        });

        function getUrl() {
            const _url = new URL(document.location.href);
            const params = new URLSearchParams(_url.search);
            return [_url, params]
        }

        function setParams(page, index) {
            const [_url, params] = getUrl();
            // 1. 파라미터 page, index 넣기
            const state = {'page': page}
            for (const key in state) {
                if (Object.hasOwnProperty.call(state, key)) {
                    params.set(key, state[key]);
                    if (!state[key]) params.delete(key);
                } else {
                    console.log('없을때')
                }
            }

            window.history.pushState(state, '', `${_url.origin + _url.pathname}?${params}`);
            pageView()
        }

        function pageView() {
            const [_url, params] = getUrl();
            const currentPage = params.get('view');
            //console.log('index: ', index);
            console.log('params!: ', currentPage);

            const noticeContents = document.querySelector(".notice-contents");
            noticeContents.dataset.index = currentPage
        }

        window.addEventListener('popstate', pageView)
</script>

</body>
</html>