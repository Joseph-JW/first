<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>


<title>정보공개</title>

<link rel="stylesheet" href="../resources/board/information.css">


 
<script type="text/javascript">
$(function() {
	tab4()
})

function tab4() {
	    $("#inform_3_tab_btn>a").click(function() {
	        var idx = $(this).index()

	        $("#inform_3_tab_cont>div").hide()
	        $("#inform_3_tab_cont>div").eq(idx).show()
	    })
	}

</script>

<div id="contents">
	<div id="information_1">
	    <span class="font-underline">정보공개</span>
	</div>
	<div id="information_2">
	
	</div>
	<div id="information_3">
		<div id="inform_3_con1">
			<div id="inform_3_tab">
                    <div id="inform_3_tab_btn">
                        <a href="#">발주계획</a>
                        >
                        <a href="#">입찰정보</a>
                        >
                        <a href="#">개찰결과</a>
                        >
                    </div>
                    <div id="inform_3_tab_cont">
                        <div id="inform_plan">
                            <ul>
                                <li>
                                    <div class="information">
                                        <div class="inform_title"><h2>발주계획</h2></div>
                                        <div class="inform_content">
                                        	<div class="inform_box">
									            <div class="inform_inner">
									                <div class="inform_inner_left">
									                    <img src="../resources/images/inform.png" alt="">
									                </div>
									                <div class="inform_innter_right">
									                    <div class="inform_inner_top">
									                        <h3><img src="../resources/images/eduSpan.gif" alt="">&nbsp; 발주계획</h3>
									                        <p>아래의 버튼을 클릭하시면 입찰정보 페이지로 이동하실 수 있습니다.</p>
									                    </div>
									                    <a href=""><div class="inform_inner_bottom">
									                        발주계획 바로가기
									                    </div></a>
									                </div>
									            </div>
									        </div>
                                        </div>
                                     </div>
                                </li>
                            </ul>
                       	</div>
                       	<div id="inform_bid">
                            <ul>
                                <li>
                                    <div class="information">
                                        <div class="inform_title"><h2>입찰정보</h2></div>
                                        <div class="inform_content">
                                        	<div class="inform_box">
									            <div class="inform_inner">
									                <div class="inform_inner_left">
									                    <img src="../resources/images/inform.png" alt="">
									                </div>
									                <div class="inform_innter_right">
									                    <div class="inform_inner_top">
									                        <h3><img src="../resources/images/eduSpan.gif" alt="">&nbsp; 입찰정보</h3>
									                        <p>아래의 버튼을 클릭하시면 입찰정보 페이지로 이동하실 수 있습니다.</p>
									                    </div>
									                    <a href=""><div class="inform_inner_bottom">
									                        입찰정보 바로가기
									                    </div></a>
									                </div>
									            </div>
									        </div>
                                        </div>
                                     </div>
                                </li>
                            </ul>
                       	</div>
                       	<div id="inform_result">
                            <ul>
                                <li>
                                    <div class="information">
                                        <div class="inform_title"><h2>개찰결과</h2></div>
                                        <div class="inform_content">
                                        	<div class="inform_box">
									            <div class="inform_inner">
									                <div class="inform_inner_left">
									                    <img src="../resources/images/inform.png" alt="">
									                </div>
									                <div class="inform_innter_right">
									                    <div class="inform_inner_top">
									                        <h3><img src="../resources/images/eduSpan.gif" alt="">&nbsp; 개찰결과</h3>
									                        <p>아래의 버튼을 클릭하시면 입찰정보 페이지로 이동하실 수 있습니다.</p>
									                    </div>
									                    <a href=""><div class="inform_inner_bottom">
									                        개찰결과 바로가기
									                    </div></a>
									                </div>
									            </div>
									        </div>
                                        </div>
                                     </div>
                                </li>
                            </ul>
                       	</div>
                      
					</div>
				</div>
			</div>
	</div>
	<div id="information_4">
		<span>담당부서 :&nbsp;</span>독서문화과
		<span>담당자 :&nbsp;</span> 홍우경
		<span>전화번호 :&nbsp;</span> 231-2042
	</div>
</div>
<%@ include file="../include/footer.jsp" %>