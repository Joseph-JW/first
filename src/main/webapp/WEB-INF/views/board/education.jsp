<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<title>평생 교육</title>


<link rel="stylesheet" href="../resources/board/education.css">

 
<script type="text/javascript">
$(function() {
	tab3()
})

function tab3() {
	    $("#edu_3_tab_btn>a").click(function() {
	        var idx = $(this).index()

	        $("#edu_3_tab_cont>div").hide()
	        $("#edu_3_tab_cont>div").eq(idx).show()
	    })
	}
</script>

<div id="contents">
	<div id="edu_1">
	    <span class="font-underline">평생교육</span>
	</div>
	<div id="edu_2">
	
	</div>
	<div id="edu_3">
		<div id="edu_3_con1">
			<div id="edu_3_tab">
                    <div id="edu_3_tab_btn">
                        <a href="#">영유아</a>
                        >
                        <a href="#">어린이</a>
                        >
                        <a href="#">성인</a>
                        >
                        <a href="#">시니어 프로그램</a>
                        >
                        <a href="#">사람책 열람행사</a>
                    </div>
                    <div id="edu_3_tab_cont">
                        <div id="infant">
                            <ul>
                                <li>
                                    <div class="education">
                                        <div class="edu_title"><h2>영유아</h2></div>
                                        <div class="edu_content">
                                        	<span><img src="../resources/images/eduSpan.gif" alt="">  운영기간</span><br>
                                        	<p>
                                        		- 3~4월, 6~7월 / 예정
                                        	</p>
                                        	<span><img src="../resources/images/eduSpan.gif" alt="">  모집대상</span><br>
                                        	<p>
                                        		- 대구시내(경산시, 칠곡군 포함)에 거주하는 12개월~7세 영유아 및 부모(양육자) 80여명
                                        	</p>
                                        	<span><img src="../resources/images/eduSpan.gif" alt="">  신청방법</span><br>
                                        	<p>
                                        		- 도서관 홈페이지 온라인(홈페이지 주소) 신청, 별도의 로그인 필요 없음
                                        	</p>
                                        	<span><img src="../resources/images/eduSpan.gif" alt="">  다자녀(만19세 미만 3자녀 이상) 가족 우대</span><br>
                                        	<p>
                                        		- 다자녀가정 지원 등 출산장려정책 관련 강좌별 수강생 모집 정원의 10%는 다자녀(만 19세 미만3자녀 이상) 가족으로 추가 모집
                                        		<br>&nbsp;※ 단, 방문접수 시 신분증 및 주민등록표등본 또는 가족관계증명서 확인
                                        	</p>
                                        	<span><img src="../resources/images/eduSpan.gif" alt="">  수강료</span><br>
                                        	<p>
                                        		- 무료(단, 교재 및 재료비는 본인부담)
                                        	</p>
                                        	<span><img src="../resources/images/eduSpan.gif" alt="">  수강생 유의사항</span><br>
                                        	<p>
                                        		- 3~4월, 6~7월 / 예정
                                        	</p>
                                        	<img class="edu_bg_img" src="../resources/images/infant.png" alt="">
                                        </div>
                                     </div>
                                </li>
                            </ul>
                       	</div>
                      	<div id="children">
                            <ul>
                                <li>
                                    <div class="education">
                                        <div class="edu_title"><h2>어린이</h2></div>
                                        <div class="edu_content">
                                        	<span><img src="../resources/images/eduSpan.gif" alt="">  운영기간</span><br>
                                        	<p>
                                        		- 방학특별프로그램 : 겨울(1월중), 봄(2월중), 여름(8월중)
                                        		<br>- 토요도서관학교 : 1기(5~6월), 2기(6~7월), 3기(9~10월)
                                        		<br>&nbsp;※공휴일이 있을 경우 변동 가능
                                        	<span><img src="../resources/images/eduSpan.gif" alt="">  신청방법</span><br>
                                        	<p>
                                        		- 도서관 홈페이지 온라인(홈페이지 주소) 신청, 별도의 로그인 필요 없음
                                        	</p>
                                        	<span><img src="../resources/images/eduSpan.gif" alt="">  다자녀(만19세 미만 3자녀 이상) 가족 우대</span><br>
                                        	<p>
                                        		- 정원의 10% 다자녀(만 19세 미만 또는 3자녀 이상)가족 추가 모집
                                        		<br>- 방문신청 시 신분증 및 가족관계증명서 또는 주민등록표등본 지참(온라인신청자는 개강일에 확인)
                                        		<br>※ 다자녀가정 : 두 자녀를 양육하면서 셋째이상 자녀를 출산 또는 입양하여 양육하는 가정
                                        	</p>
                                        	<span><img src="../resources/images/eduSpan.gif" alt="">  수강료</span><br>
                                        	<p>
                                        		- 무료(단, 교재 및 재료비는 본인부담)
                                        	</p>
                                        	<span><img src="../resources/images/eduSpan.gif" alt="">  수강생 유의사항</span><br>
                                        	<p>
                                        		- 1인 2강좌 신청가능, 방문신청 시 신분증 지참
                                        		<br>- 1인 2강좌 신청가능, 방문신청 시 신분증 지참
                                        		<br>- 등록 후 불참하거나 50% 미만 출석자는 다음 학기 수강 제한 할 수 있음
                                        		<br>- 아래와 같은 사유 발생 시 등록을 취소하고 대기자에게 기회를 줌
                                        		<br>&nbsp;&nbsp;· 첫 수업 결석(단, 도서관에 연락한 경우는 예외)
                                        		<br>&nbsp;&nbsp;· 2회 이상 연속 결석(질병치료 등의 특별한 사유 시 예외)
                                        	</p>
                                        	<img class="edu_bg_img" src="../resources/images/children.png" alt="">
                                        </div>
                                     </div>
                                </li>
                            </ul>
                        </div>
                        <div id="adult">
                            <ul>
                                <li>
                                    <div class="education">
                                        <div class="edu_title"><h2>성인</h2></div>
                                        <div class="edu_content">
                                        	<span><img src="../resources/images/eduSpan.gif" alt="">  운영기간</span><br>
                                        	<p>
                                        		- 평생교육프로그램 : 상반기(3~4월), 하반기(9~10월))
                                        		<br>&nbsp;※공휴일이 있을 경우 변동 가능
                                        	</p>
                                        	<span><img src="../resources/images/eduSpan.gif" alt="">  신청방법</span><br>
                                        	<p>
                                        		- 도서관 홈페이지 온라인(홈페이지 주소) 신청, 별도의 로그인 필요 없음
                                        	</p>
                                        	<span><img src="../resources/images/eduSpan.gif" alt="">  다자녀(만19세 미만 3자녀 이상) 가족 우대</span><br>
                                        	<p>
                                        		- 정원의 10% 다자녀(만 19세 미만 또는 3자녀 이상)가족 추가 모집
                                        		<br>- 방문신청 시 신분증 및 가족관계증명서 또는 주민등록표등본 지참(온라인신청자는 개강일에 확인)
                                        		<br>※ 다자녀가정 : 두 자녀를 양육하면서 셋째이상 자녀를 출산 또는 입양하여 양육하는 가정
                                        	</p>
                                        	<span><img src="../resources/images/eduSpan.gif" alt="">  수강료</span><br>
                                        	<p>
                                        		- 무료(단, 교재 및 재료비는 본인부담)
                                        	</p>
                                        	<span><img src="../resources/images/eduSpan.gif" alt="">  수강생 유의사항</span><br>
                                        	<p>
                                        		- 1인 2강좌 신청가능, 방문신청 시 신분증 지참
                                        		<br>- 1인 2강좌 신청가능, 방문신청 시 신분증 지참
                                        		<br>- 등록 후 불참하거나 50% 미만 출석자는 다음 학기 수강 제한 할 수 있음
                                        		<br>- 아래와 같은 사유 발생 시 등록을 취소하고 대기자에게 기회를 줌
                                        		<br>&nbsp;&nbsp;· 첫 수업 결석(단, 도서관에 연락한 경우는 예외)
                                        		<br>&nbsp;&nbsp;· 2회 이상 연속 결석(질병치료 등의 특별한 사유 시 예외)
                                        	</p>
                                        	<img class="edu_bg_img" src="../resources/images/children.png" alt="">
                                        </div>
                                     </div>
                                </li>
                            </ul>
                        </div>
                        <div id="senior">
                            <ul>
                                <li>
                                    <div class="education">
                                        <div class="edu_title"><h2>시니어 프로그램</h2></div>
                                        <div class="edu_content">
                                        	<span><img src="../resources/images/eduSpan.gif" alt="">  운영기간</span><br>
                                        	<p>
                                        		- 평생교육프로그램 : 상반기(3~4월), 하반기(9~10월))
                                        		<br>&nbsp;※공휴일이 있을 경우 변동 가능
                                        	</p>
                                        	<span><img src="../resources/images/eduSpan.gif" alt="">  신청방법</span><br>
                                        	<p>
                                        		- 도서관 홈페이지 온라인(홈페이지 주소) 신청, 별도의 로그인 필요 없음
                                        	</p>
                                        	<span><img src="../resources/images/eduSpan.gif" alt="">  다자녀(만19세 미만 3자녀 이상) 가족 우대</span><br>
                                        	<p>
                                        		- 정원의 10% 다자녀(만 19세 미만 또는 3자녀 이상)가족 추가 모집
                                        		<br>- 방문신청 시 신분증 및 가족관계증명서 또는 주민등록표등본 지참(온라인신청자는 개강일에 확인)
                                        		<br>※ 다자녀가정 : 두 자녀를 양육하면서 셋째이상 자녀를 출산 또는 입양하여 양육하는 가정
                                        	</p>
                                        	<span><img src="../resources/images/eduSpan.gif" alt="">  수강료</span><br>
                                        	<p>
                                        		- 무료(단, 교재 및 재료비는 본인부담)
                                        	</p>
                                        	<span><img src="../resources/images/eduSpan.gif" alt="">  수강생 유의사항</span><br>                                        	<p>
                                       		- 1인 2강좌 신청가능, 방문신청 시 신분증 지참
                                       		<br>- 1인 2강좌 신청가능, 방문신청 시 신분증 지참
                                       		<br>- 등록 후 불참하거나 50% 미만 출석자는 다음 학기 수강 제한 할 수 있음
                                       		<br>- 아래와 같은 사유 발생 시 등록을 취소하고 대기자에게 기회를 줌
                                       		<br>&nbsp;&nbsp;· 첫 수업 결석(단, 도서관에 연락한 경우는 예외)
                                       		<br>&nbsp;&nbsp;· 2회 이상 연속 결석(질병치료 등의 특별한 사유 시 예외)
                                       	</p>
                                       	<img class="edu_bg_img" src="../resources/images/senior.png" alt="">
                                       </div>
                                    </div>
                               </li>
                           </ul>
                       </div>
                       <div id="people">
                           <ul>
                               <li>
                                   <div class="education">
                                       <div class="edu_title"><h2>사람책 열람행사</h2></div>
                                       <div class="edu_content">
                                       	<span><img src="../resources/images/eduSpan.gif" alt="">  운영기간</span><br>
                                       	<p>
                                       		- 평생교육프로그램 : 상반기(3~4월), 하반기(9~10월))
                                       		<br>&nbsp;※공휴일이 있을 경우 변동 가능
                                       	</p>
                                       	<span><img src="../resources/images/eduSpan.gif" alt="">  신청방법</span><br>
                                       	<p>
                                       		- 도서관 홈페이지 온라인(홈페이지 주소) 신청, 별도의 로그인 필요 없음
                                       	</p>
                                       	<span><img src="../resources/images/eduSpan.gif" alt="">  수강료</span><br>
                                       	<p>
                                       		- 무료(단, 교재 및 재료비는 본인부담)
                                       	</p>
                                       	<img class="edu_bg_img" src="../resources/images/people.png" alt="">
                                       </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
          
                    </div>
                </div>
		</div>
	</div>

	<div id="edu_4">
		<span>담당부서 :&nbsp;</span>독서문화과
		<span>담당자 :&nbsp;</span> 김효금
		<span>전화번호 :&nbsp;</span> 231-2049
	</div>
</div>
<%@ include file="../include/footer.jsp" %>