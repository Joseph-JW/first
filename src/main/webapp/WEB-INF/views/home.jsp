<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../resources/css/style.css">
	<!-- <link rel="stylesheet" href="../resources/css/header.css"> -->
    <link rel="stylesheet" href="../resources/css/slide.css">
    <link rel="stylesheet" href="../resources/css/contents.css">
    <link rel="stylesheet" href="../resources/css/footer.css">
    
    
    
    
    <script src="../resources/js/app.js"></script>
    <title>홈화면</title>
<script type="text/javascript">
$(function() {
	$(".get").on("click", function(e) {
		e.preventDefault();	//.get(a태그) even 처리방지
		let form = $('<form></form>');
		form.attr("method", "get");
		form.attr("action", "/board/get");
	    form.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
	    form.append("<input type='hidden' name='pageNum' value='" + <c:out value="${pageDTO.criteria.pageNum}"/> + "'>");
	    form.append("<input type='hidden' name='amount' value='" + <c:out value="${pageDTO.criteria.amount}"/> + "'>");
		form.appendTo("body");
		form.submit();
	});
	
	let list = new Array();
	<c:forEach items="${bookList}" var="list">
		list.push(<c:out value="${list.isbn}" />);
	</c:forEach>
	$.getJSON(
			"/book/getAttachListOnList",
			{list : list},
			function(data) {
				let str = "";
				let keys = Object.keys(data).sort((a, b) => Number(b)-Number(a));
				$(keys).each(function(i, isbn) {
					let attach = data[isbn];
					//console.log(isbn);
					if(attach[0] != null) {
						if(attach[0].filetype) {
							let fileCallPath = encodeURIComponent(attach[0].uploadpath + "\\s_" 
									+ attach[0].uuid + "_" + attach[0].filename);
							html = "<img src='/display?filename=" + fileCallPath + "'>";
						} else {
							html = "<img src='/resources/images/book.png'>";
						}
						$("#" + isbn).html(html);
					}
				});
	});
	
	$(".getBook").on("click", function(e) {
		e.preventDefault();	//.get(a태그) even 처리방지
		let form = $('<form></form>');
		form.attr("method", "get");
		form.attr("action", "/book/getBook");
	    form.append("<input type='hidden' name='isbn' value='" + $(this).attr("href") + "'>");
	    form.append("<input type='hidden' name='pageNum' value='" + <c:out value="${pageDTO.criteria.pageNum}"/> + "'>");
	    form.append("<input type='hidden' name='amount' value='" + <c:out value="${pageDTO.criteria.amount}"/> + "'>");
		form.appendTo("body");
		form.submit();
	});
	
	
	    $('#slider').bxSlider({
	        mode: 'horizontal',  // 슬라이더 모드 (horizontal 또는 vertical)
	        auto: true,         // 자동 슬라이드 여부
	        pause: 3000,        // 슬라이드 간의 일시 정지 시간 (밀리초)
	        controls: false,     // 이전/다음 버튼 표시 여부
	        pager: false,         // 페이저(인디케이터) 표시 여부
	        minSlides: 7,
	        maxSlides: 7,
	        moveSlides: 1,
	        slideWidth: 130,
	        slideMargin: 10
	    });

})	//close


</script>
<div id="wrap">
		
        <div id="slide">
            <div id="top-sl">
                <img src="../resources/images/main.jpg" alt="">
                <p><span>시민과 함께</span>한 100년, <span>새로운 도약</span>의 100년</p>
                <div id="tot-srh">
                    <p>통합자료검색</p>
                    <input type="text" id="tot-srh_box" placeholder=" 검색어를 입력하세요">
                    <button class="tot-srh_btn"></button>
                </div>
            </div>
            <div id="bot-sl">
                <ul>
                    <li>
                        <div class="quick_menu">
                            <a href="/book/list">
                                <img src="../resources/images/quick_08.png" alt="">
                            </a>
                            <a href="/book/list"></a>
                        </div>
                        <a href="/book/list">도서 목록</a>
                    </li>
                    <li>
                        <div class="quick_menu">
                            <a href="/book/rentalRegister">
                                <img src="../resources/images/quick_02.png" alt="">
                            </a>
                            <a href="/book/rentalRegister"></a>
                        </div>
                        <a href="/book/rentalRegister">도서대출신청</a>
                    </li>
                    <li>
                        <div class="quick_menu">
                            <a href="book/rentalList">
                                <img src="../resources/images/quick_01.png" alt="">
                            </a>
                            <a href="book/rentalList"></a>
                        </div>
                        <a href="/book/rentalList">대출조회</a>
                    </li>
                    <li>
                        <div class="quick_menu">
                            <a href="">
                                <img src="../resources/images/quick_04.png" alt="">
                            </a>
                            <a href="#"></a>
                        </div>
                        <a href="">자료검색</a>
                    </li>
                    <li>
                        <div class="quick_menu">
                            <a href="#">
                                <img src="../resources/images/quick_03.png" alt="">
                            </a>
                            <a href="#"></a>
                        </div>
                        <a href="">수강신청</a>
                    </li>
                    <li>
                        <div class="quick_menu">
                            <a href="#">
                            <img src="../resources/images/quick_05.png" alt="">
                            </a>
                            <a href="#"></a>
                        </div>
                        <a href="">이달의행사</a>
                    </li>
                    <li>
                        <div class="quick_menu">
                            <a href="">
                                <img src="../resources/images/quick_06.png" alt="">
                            </a>
                            <a href="#"></a>
                        </div>
                        <a href="">대구전자도서관</a>
                    </li>
                    <li>
                        <div class="quick_menu">
                            <a href="">
                                <img src="../resources/images/quick_07.png" alt="">
                            </a>
                            <a href="#"></a>
                        </div>
                        <a href="">대구학생전자도서관</a>
                    </li>
                </ul>

            </div>
        </div>
        <hr>
        <div id="contents">
            <div id="cont1">
                <div id="tab1">
                    <div id="tab1-btn">
                        <a href="#">공지사항</a>
                        /
                        <a href="#">입찰정보</a>
                    </div>
                    <div id="tab1-contents">
                        <div id="notice">
                            <ul>
                            	<c:forEach items="${list}" var="board" varStatus="boardStatus" begin="0" end="6">
                            		<li><a class="get" href='<c:out value="${board.bno}"/>'>
                                    <span>${board.title }</span>
                                    <span>
      									<c:choose>
											<c:when test="${board.regdate} == ${board.updatedate}">
												<fmt:formatDate pattern="YY-MM-dd" value="${board.regdate }"/>
											</c:when>
											<c:otherwise>
												<fmt:formatDate pattern="YY-MM-dd" value="${board.updatedate }"/>
											</c:otherwise>
										</c:choose>
                                    </span>
                                </a></li>
                            	
                            	</c:forEach>

                            </ul>
                        </div>
                        <div id="bid">
                            <ul>
                                <li><a href="#">
                                    <span>입찰1</span>
                                    <span>날짜1</span>
                                </a></li>
                                <li><a href="#">
                                    <span>입찰2</span>
                                    <span>날짜2</span>
                                </a></li>
                                <li><a href="#">
                                    <span>입찰3</span>
                                    <span>날짜3</span>
                                </a></li>
                                <li><a href="#">
                                    <span>입찰4</span>
                                    <span>날짜4</span>
                                </a></li>
                                <li><a href="#">
                                    <span>입찰5</span>
                                    <span>날짜5</span>
                                </a></li>
                                <li><a href="#">
                                    <span>입찰6</span>
                                    <span>날짜6</span>
                                </a></li>
                                <li><a href="#">
                                    <span>입찰7</span>
                                    <span>날짜7</span>
                                </a></li>
                            </ul>
                        </div>
                    </div>
                     
                </div>
                <div id="tab2">
                    <div id="tab2-btn">
                        <a href="#">권장도서</a>
                        /
                        <a href="#">신간도서</a>
                        /
                        <a href="#">대출베스트</a>
                    </div>
                    <div id="tab2-contents">
                        <div id="recom">
                            <ul>
                                <li>
                                    <div class="book">
                                        <a href="#">
                                            <img src="../resources/images/book.png" alt="권장도서1" class="book_img">
                                            <div class="book_title">권장도서</div>
                                            <div class="book_wrier">저자</div>
                                        </a>
                                     </div>
                                </li>
                                <li>
                                    <div class="book">
                                    <a href="#">
                                        <img src="../resources/images/book.png" alt="권장도서2" class="book_img">
                                        <div class="book_title">권장도서</div>
                                        <div class="book_wrier">저자</div>
                                    </a>
                                 </div>
                                </li>
                                 <li>
                                    <div class="book">
                                        <a href="#">
                                            <img src="../resources/images/book.png" alt="권장도서3" class="book_img">
                                            <div class="book_title">권장도서</div>
                                            <div class="book_wrier">저자</div>
                                        </a>
                                     </div>
                                 </li>
                            </ul>
                        </div>
                        <div id="new">
                            <ul>
                            <c:forEach items="${bookList}" var="bookList" varStatus="bookListStatus" begin="0" end="2">
                                <li>
                                    <div class="book">
                                        <a class="getBook" href='<c:out value="${bookList.isbn}"/>'>
                                            <div class="book_img" id="<c:out value='${bookList.isbn}'/>" >
											</div>
                                            <div class="book_title"><c:out value="${bookList.booktitle }" /></div>
                                            <div class="book_wrier"><c:out value="${bookList.bookwriter}" /></div>
                                        </a>
                                     </div>
                                </li>
                            </c:forEach>
                                
                            </ul>
                        </div>
                        <div id="loan">
                            <ul>
                                <li>
                                    <div class="book">
                                        <a href="#">
                                            <img src="../resources/images/book.png" alt="신간도서1" class="book_img">
                                            <div class="book_title">대출도서</div>
                                            <div class="book_wrier">저자</div>
                                        </a>
                                     </div>
                                </li>
                                <li>
                                    <div class="book">
                                    <a href="#">
                                        <img src="../resources/images/book.png" alt="신간도서2" class="book_img">
                                        <div class="book_title">대출도서</div>
                                        <div class="book_wrier">저자</div>
                                    </a>
                                 </div>
                                </li>
                                 <li>
                                    <div class="book">
                                        <a href="#">
                                            <img src="../resources/images/book.png" alt="신간도서3" class="book_img">
                                            <div class="book_title">대출도서</div>
                                            <div class="book_wrier">저자</div>
                                        </a>
                                     </div>
                                 </li>
                            </ul>
                        </div>
          
                    </div>
                </div>
                <div id="tab3">
                    <a href="#">
                        <img src="../resources/images/gallery01.png" alt="">
                    </a>
                </div>
            </div>
            <div id="cont2">
                <div id="ban1">
                    <a href="#" target="_blank" title="새창으로 열립니다.">
                        국립어린이청소년도서관 독서도움자료<br>
                        <span>다국어 동화구연</span>
                    </a>
                </div>
                <div id="ban2">
                    <a href="#" target="_blank" title="새창으로 열립니다.">
                        장애인 무료 택배 서비스<br>
                        <span>책나래</span>
                    </a>
                </div>
                <div id="ban3">
                    <a href="" target="_blank" title="새창으로 열립니다.">
                        국가상호대차 서비스<br>
                        <span>책바다</span>
                    </a>
                </div>
                <div id="ban4">
                    <a href="" target="_blank" title="새창으로 열립니다.">
                        협력형 온라인 지식정보서비스<br>
                        <span>사서에게 물어보세요</span>
                    </a>
                </div>
            </div>
            <div id="banner">
                <div id="banner-tab1">
                   <b>배너모음 ○○○○</b>
                </div>
                <div id="banner-tab2">
                    <ul id="slider">
                        <li><a href="#" target="_blank" title="새창으로 열립니다.">
                            <img src="../resources/images/banner01.png" alt="">
                        </a></li>
                        <li><a href="#" target="_blank" title="새창으로 열립니다.">
                            <img src="../resources/images/banner02.png" alt="">
                        </a></li>
                        <li><a href="#" target="_blank" title="새창으로 열립니다.">
                            <img src="../resources/images/banner03.png" alt="">
                        </a></li>
                        <li><a href="#" target="_blank" title="새창으로 열립니다.">
                            <img src="../resources/images/banner04.png" alt="">
                        </a></li>
                        <li><a href="#" target="_blank" title="새창으로 열립니다.">
                            <img src="../resources/images/banner05.png" alt="">
                        </a></li>
                        <li><a href="#" target="_blank" title="새창으로 열립니다.">
                            <img src="../resources/images/banner06.png" alt="">
                        </a></li>
                        <li><a href="#" target="_blank" title="새창으로 열립니다.">
                            <img src="../resources/images/banner07.png" alt="">
                        </a></li>
                        <li><a href="#" target="_blank" title="새창으로 열립니다.">
                            <img src="../resources/images/banner08.png" alt="">
                        </a></li>
                        <li><a href="#" target="_blank" title="새창으로 열립니다.">
                            <img src="../resources/images/banner09.png" alt="">
                        </a></li>
                        <li><a href="#" target="_blank" title="새창으로 열립니다.">
                            <img src="../resources/images/banner10.png" alt="">
                        </a></li>
                        <li><a href="#" target="_blank" title="새창으로 열립니다.">
                            <img src="../resources/images/banner11.jpg" alt="">
                        </a></li>
                        <li><a href="#" target="_blank" title="새창으로 열립니다.">
                            <img src="../resources/images/banner12.jpg" alt="">
                        </a></li>
                        <li><a href="#" target="_blank" title="새창으로 열립니다.">
                            <img src="../resources/images/banner13.jpg" alt="">
                        </a></li>
                        <li><a href="#" target="_blank" title="새창으로 열립니다.">
                            <img src="../resources/images/banner14.jpg" alt="">
                        </a></li>
                        <li><a href="#" target="_blank" title="새창으로 열립니다.">
                            <img src="../resources/images/banner15.jpg" alt="">
                        </a></li>
                    </ul>
                </div>
            </div>
        </div>
</div>

<script>
let mainText = document.querySelector("#top-sl>p")

window.addEventListener('scroll', function(){
    let value = this.window.scrollY
    /* scroll했을 때 Y좌표값을 확인하고  */

    if(value>60) {
        mainText.style.animation="disappear 1s ease-out forwards";
    } else{
        mainText.style.animation='slide 1s ease-out';
    }
    /* forwards를 해줘서 원래위치로 돌아오지 않도록 하지만 영영 가버림ㅋㅋ */
})
</script>        
<%@ include file="include/footer.jsp" %>
 