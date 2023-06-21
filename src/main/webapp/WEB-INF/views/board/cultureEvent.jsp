<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<title>독서문화행사</title>


<link rel="stylesheet" href="../resources/board/cultureEvent.css">

 
<script type="text/javascript">
$(function() {
	tab3()
})

function tab3() {
	    $("#cul_3_tab_btn>a").click(function() {
	        var idx = $(this).index()

	        $("#cul_3_tab_cont>div").hide()
	        $("#cul_3_tab_cont>div").eq(idx).show()
	    })
	}

</script>

<div id="contents">
	<div id="culture_1">
	    <span class="font-underline">독서문화행사</span>
	</div>
	<div id="culture_2">
	
	</div>
	<div id="culture_3">
		<div id="cul_3_con1">
			<div id="cul_3_tab">
                    <div id="cul_3_tab_btn">
                        <a href="#">도서관주간</a>
                        >
                        <a href="#">독서의달</a>
                        >
                    </div>
                    <div id="cul_3_tab_cont">
                        <div id="reading_week">
                            <ul>
                                <li>
                                    <div class="culture">
                                        <div class="cul_title"><h2>도서관주간</h2></div>
                                        <div class="cul_content">
                                        	<span><img src="../resources/images/culSpan.gif" alt="">  기간</span><br>
                                        	<p>
                                        		- 매년 4월 12일 ~ 4월 18일 (1주일간)
                                        	</p>
                                        	<span><img src="../resources/images/culSpan.gif" alt="">  주요행사</span><br>
                                        	<p>
                                        		- 도서관 이용법 및 독서관련 행사<br>
                                        		- 특별강연회 (명사초청 강연회, 저자와의 만남 등)<br>
                                        		- 영화, 음악 감상<br>
                                        		- 특별공연 및 전시회<br>
                                        		-도서관주간 홍보 (표어, 포스터, 홍보물 제작)
                                        	</p>
                                        	<span><img src="../resources/images/culSpan.gif" alt="">  주최</span><br>
                                        	<p>
                                        		- 한국도서관협회
                                        	</p>
                                        	<span><img src="../resources/images/culSpan.gif" alt="">  후원</span><br>
                                        	<p>
                                        		- 문화체육관광부
                                        	</p>
                                        	<span><img src="../resources/images/culSpan.gif" alt="">  문의처</span><br>
                                        	<p>
                                        		- 독서문화과(☎231-2042)
                                        	</p>
                                        	<img class="cul_bg_img" src="../resources/images/week.png" alt="">
                                        </div>
                                     </div>
                                </li>
                            </ul>
                       	</div>
                      	<div id="reading_month">
                            <ul>
                                <li>
                                    <div class="culture">
                                        <div class="cul_title"><h2>독서의달</h2></div>
                                        <div class="cul_content">
                                        	<span><img src="../resources/images/culSpan.gif" alt="">  기간</span><br>
                                        	<p>
                                        		- 매년 9월 / 1개월
                                        	</p>
                                        	<span><img src="../resources/images/culSpan.gif" alt="">  주요행사</span><br>
                                        	<p>
                                        		- 독서 및 문화관련 행사<br>
                                        		- 특별강연회(저자와의 만남 등)<br>
                                        		- 영화, 음악 감상<br>
                                        		- 특별공연 및 전시회<br>
                                        		-도서관주간 홍보 (표어, 포스터, 홍보물 제작)
                                        	</p>
                                        	<span><img src="../resources/images/culSpan.gif" alt="">  근거</span><br>
                                        	<p>
                                        		- 독서문화진흥법 제12조[독서의 달 행사 등]<br>
                                        		- 독서문화진흥법시행령 제11조[독서의 달 등]
                                        	</p>
                                        	<span><img src="../resources/images/culSpan.gif" alt="">  문의처</span><br>
                                        	<p>
                                        		- 독서문화과(☎231-2042)
                                        	</p>
                                        	<img class="cul_bg_img" src="../resources/images/week.png" alt="">
                                        </div>
                                     </div>
                                </li>
                            </ul>
                        </div>
					</div>
				</div>
			</div>
	</div>

	<div id="culture_4">
		<span>담당부서 :&nbsp;</span>독서문화과
		<span>담당자 :&nbsp;</span> 홍우경
		<span>전화번호 :&nbsp;</span> 231-2042
	</div>
</div>
<%@ include file="../include/footer.jsp" %>