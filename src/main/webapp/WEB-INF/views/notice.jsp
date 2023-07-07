<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="../resources/includes/css/style.css">
<link rel="stylesheet" href="../resources/admin/css/notice.css">


<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
			<div class="mypage__content ac-review customercare">
					<div class="float-wrap">
						<h4 class="mypage__sub-title">공지사항</h4>
						<c:if test="${mVo.id eq 202300001}">
						<button class="btnX">글 등록</button>
						</c:if>
					</div>

					<div class="notice-contents">
						<div id="notice" class="notice-table">
							<div class="notice-table-head show--pc">
								<div class="flex flex-items-center">
									<div class="notice-table-head__num">번호</div>
									<div class="notice-table-head__content">내용</div>
									<div class="notice-table-head__writer">작성자</div>
									<div class="notice-table-head__date">등록일</div>
								</div>
							</div>
							<ul class="notice-table-body">

								<li id="2" class="notice-table-body__item">
									<div class="notice-list notice__item flex">
										<div
											class="notice-list__item notice-list__num text-left show--pc">
											<span class="notice__num">2</span>
										</div>
										<div class="notice-list__item notice-list__subject">
											<div class="notice-subject flex flex-items-between">
												<div class="notice__title">개인정보처리방침 개정 내용 안내
													(2022.01.30~)</div>
												<div class="notice__date">2023-01-12</div>
											</div>
										</div>
									</div>
									<div class="notice-view notice__item">
										<div class="notice-view__item">
											<div class="notice__cont">
												2023.01.30(월)부터 개인정보처리방침이 일부 변경됩니다. </br> 탬버린즈는 회원님의 개인정보를 안전하게
												활용, 보호하기 위한 노력과 관련 법규 준수에 최선을 다하고 있습니다. </br> </br> 1. 주요 개정 내용 </br> </br> (1)
												제 4 조(개인정보의 처리위탁) </br> - 기존 </br> ① LF logistics - 배송 </br> ② 엔에치엔한국사이버결제㈜
												- 결제대행 </br> ③ ㈜아이코드, ㈜다우기술 - SMS, MMS 등 문자메세지 발송 </br> ④ 주식회사 컴홈 -
												카카오톡 메세지 발송 </br> ⑤ ㈜진승정보기술 - POS </br> </br> </br> - 변경* </br> ① NAVER PAY - 결제 </br> ②
												KCP - 결제 및 현금영수증 발행 </br> ③ 카카오페이 - 결제 </br> ④ CJ대한통운 - 배송 </br> ⑤ LF
												Logistics Korea.LTD - 배송 </br> ⑥ 팝빌 - 카카오톡 메시지 발송 </br> ⑦ ㈜ 아이코드,
												㈜다우기술 - 문자 메시지 발송 </br> ⑧ ㈜ 채널코퍼레이션 - 고객 통화 및 챗 상담, 챗봇 서비스 제공 </br> ⑨
												㈜ 신세계아이앤씨 - 매장 POS 결제 서비스 제공 </br> </br> </br> 2. 시행 일정 </br> </br> 시행일 : 2023. 1.
												30. (개인정보처리방침 공고일: 2022. 1. 23.)
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
											<span class="notice__num">1</span>
										</div>
										<div class="notice-list__item notice-list__subject">
											<div class="notice-subject flex flex-items-between">
												<div class="notice__title">개인정보처리방침 개정 내용 안내
													(2022.12.02~)</div>
												<div class="notice__date">2022-12-09</div>
											</div>
										</div>
									</div>
									<div class="notice-view notice__item">
										<div class="notice-view__item">
											<div class="notice__cont">
												2022.12.02(금)부터 개인정보처리방침이 일부 변경됩니다. </br> 탬버린즈는 회원님의 개인정보를 안전하게
												활용, 보호하기 위한 노력과 관련 법규 준수에 최선을 다하고 있습니다.</br> </br> </br> 1. 주요 개정 내용</br> </br> (1) 제
												4 조(개인정보의 처리위탁)</br> *처리 위탁 받는 자(수탁자) : 우체국 → LF logistics로 변경</br> </br>
												(2) 제 6 조(개인정보 보호업무 및 관련 고충사항 처리 부서)</br> *개인정보관리책임자 이메일 :
												privacy@gentlemonster.com → privacy@tamburins.com로 변경</br> </br> (3) 제
												6조 (개인정보 보호업무 및 관련 고충사항 처리 부서)</br> </br> A. 기존</br> - 개인정보침해신고센터 전화 :
												(국번없이)118 / URL : http://privacy.kisa.or.kr</br> - 대검찰청 사이버수사과 전화
												:(국번없이)1301 / URL : http://www.spo.go.kr</br> - 경찰청 사이버안전국 전화 :
												182 / URL : http://cyberbureau.police.go.kr</br> </br> B. 변경</br> -
												개인정보침해신고센터 전화 : (국번없이)118 / URL : http://privacy.kisa.or.kr</br>
												- 개인정보보호 포털 전화 : (국번없이)118 / URL :
												https://www.privacy.go.kr/</br> - 경찰청 사이버수사국 전화 : (국번없이)182 / URL
												: http://cyberbureau.police.go.kr</br> </br> (4) 제 2조 (개인정보의 수집항목 및 수집
												• 이용 목적)</br> </br> A. 기존</br> * 필수항목 : 성명, 본인확인 값(CI), 이메일, 주소, 생년월일, 성별,
												휴대전화번호, 온라인 회원의 아이디(ID) 및 비밀번호, 휴대전화번호, 구매거래 내역, 누적금액 내역</br> *
												선택항목 : 정보 수신 동의 여부 (이메일TM, 우편물)</br> </br> B. 변경 </br> * 필수항목 : [직접 가입]
												이메일, 비밀번호, 이름, 전화번호, 생년월일, 본인확인기관에서 제공하는 본인인증결과값(CI) [카카오로
												가입하기] 카카오 이용자 식별ID, 이름, 전화번호, 이메일, 본인확인기관에서 제공하는
												본인인증결과값(CI),생년월일</br> [네이버로 가입하기] 네이버 이용자 식별ID, 이름, 전화번호, 이메일,
												본인확인기관에서 제공하는 본인인증결과값(CI),생년월일</br> * 선택항목 : [직접 가입] 성별, [마케팅 및
												광고에의 활용] 이름, 이메일, 전화번호, 생년월일, 쿠키, 접속IP정보, 본인확인기관에서 제공하는
												본인인증결과값(CI)</br> </br> </br> 2. 시행 일정</br> 시행일 : 2022. 12. 2. (개인정보처리방침 공고일:
												2022. 11. 23)</br> </br> </br> </br> 감사합니다.
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