<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>


<title>자료검색</title>

<link rel="stylesheet" href="../resources/board/search.css">
<script type="text/javascript">
$(function() {
	$("#searchForm").submit(function(event) {
		event.preventDefault(); // 폼의 기본 동작 중단
	 	var keyword = $("#keyword").val();

		$.ajax({
			type: "GET",
			url: "/board/searchBook",
			data: { keyword: keyword },
			success: function(data) {
				console.log(data)
				handleSearchResult(data);
	        },
			error: function() {
				alert("검색 요청 실패");
			}
		});
	});
	
	function handleSearchResult(data) {
	    let resultUL = $("#co1_ul");
	    resultUL.empty(); // 기존 검색 결과를 비웁니다.

	    if (data == null || data.length === 0) {
	        resultUL.html("<li align='center'>검색 결과가 없습니다.</li>");
	        return;
	    }

	    // 검색 결과를 반복문으로 돌면서 출력
	    for (var i = 0; i < data.length; i++) {
	        var book = data[i];
	        var isbn = book.isbn;

	        // 이미지를 로드하는 함수 호출
	        loadImages(isbn, i);

	        let str = "<li>";
	        str += "	<div class='co1_ab'>";
	        str += "		<div class='sch_cont3_a'>";
	        str += "			<input type='checkbox'>";
	        str += "		</div>";
	        str += "		<div class='sch_cont3_b'>";
	        str += "			<div class='uploadResult'><ul></ul></div>";
	        str += "		</div>";
	        str += "		<div class='sch_cont3_c'>";
	        str += "			<ul>";
	        str += "				<li>";
	        str += "				<div><ul class='searchResult'>";
	        str += "					<li>[도서] : " + book.booktitle + " </li>";
	        str += "					<li>저자 : " + book.bookwriter + "</li>";
	        str += "					<li>출판사 : " + book.publication + "</li>";
	        str += "					<li>출판일 : " + formatDate(book.publicationdate) + "</li>";
	        str += "					<li>소장도서관 : " + book.possession + "</li>";
	        str += "					<li>등록번호 : " + book.isbn + "</li>";
	        str += "					<li>대출가능여부 : " + (book.available == 0 ? "가능" : "불가능") + "</li>";
	        str += "				</ul></div>";
	        str += "				</li>";
	        str += "			</ul>";
	        str += "		</div>";
	        str += "	</div>";
	        str += "</li>";

	        resultUL.append(str);
	    }
	}

	function loadImages(isbn, index) {
	    $.getJSON(
	        "/book/getAttachList/" + isbn,
	        function (attachList) {
	            let str = "";
	            $(attachList).each(function (i, attach) {
	                if (attach.filetype) {
	                    let fileCallPath = encodeURIComponent(attach.uploadpath + "\\s_" + attach.uuid + "_" + attach.filename);
	                    str += "<li data-path='" + attach.uploadpath + "' data-uuid='" + attach.uuid + "'";
	                    str += "		data-filename='" + attach.filename + "' data-type='" + attach.image + "'>";
	                    str += "		<div>";
	                    str += "			<img width='100px' height='145px' src='/display?filename=" + fileCallPath + "'>";
	                    str += "		</div>";
	                    str += "</li>";
	                }
	            });

	            // 해당 검색 결과의 이미지 영역에 추가합니다.
	            $(".uploadResult").eq(index).find("ul").html(str);
	        }
	    );
	}	
	
	function formatDate(date) {
	    var formattedDate = new Date(date);
	    var year = formattedDate.getFullYear();
	    var month = ("0" + (formattedDate.getMonth() + 1)).slice(-2);
	    var day = ("0" + formattedDate.getDate()).slice(-2);
	
	    return year + "-" + month + "-" + day;
	}
	
})	//close
</script>


<div id="contents">
	<div id="search_1">
	    <span class="font-underline">자료검색</span>
	</div>
	<div id="search_2">
	    <form id="searchForm">
	
            <div id="search2_top">
                <div id="search2_box1">
                    <span>자료검색</span><br>
                    <div id="search2__schBox">
                        <input type="text" id="keyword" name="keyword" placeholder="  도서 제목을 입력하세요">
                    </div>
                </div>
                <div id="search2_box2">
                    <ul>
                        <li>저 자 
                            <input type="text" class="list">
                        </li>
                        <li>키워드
                            <input type="text" class="list">

                        </li>
                        <li>장르
                            <select class="title_area1" id="genre" name="genre" required="required">
                            	<option value="전체">전체</option>
								<option value="novel">소설</option>
								<option value="non-fiction">비픽션</option>
								<option value="thriller">스릴러</option>
								<option value="science-fiction">공상 과학</option>
								<option value="history">역사</option>
								<option value="self-help">자기계발</option>
								<option value="romance">로맨스</option>
								<option value="fantasy">판타지</option>
								<option value="mystery">추리</option>
								<option value="poetry">시</option>
							</select>
                        </li>
                    </ul>
                </div>
                <div id="search2_box3">
                    <ul>
                        <li>발행처
                            <input type="text" class="list">

                        </li>
                        <li>발행년도
                            <input type="text" class="list1">  ~<input type="text" class="list1">
                        </li>
                        <li>자료형태
                            <input type="radio" name="form1" value="통합" id="radio1">
                                <label for="form1">통합</label>
                            <input type="radio" name="form1" value="도서">
                                <label for="form1">도서</label>
                            <input type="radio" name="form1" value="비도서">
                                <label for="form1">비도서</label>
                        </li>
                    </ul>
                </div>

            </div>
            <div id="search2_bot">
                <div id="search2_bot_up">
                    <button id="sch_bot1" type="submit">검색하기</button>
                    <div id="sch_bot2">다국어입력기</div>
                    <div id="sch_bot3">검색초기화</div>      
                </div>
                <div id="search2_bot_down"></div>
            </div>
        </form>    
	</div>
    <div id="search_3">
		<div id="search_3_co1">
                <ul id="co1_ul">
                    
                 
                </ul>
		</div>
		
		<div id="search_3_co2">
	<!-- 	
			<button>이전</button>
			<button>ㅇㅇ</button>
			<button>다음</button>
			 -->
		</div>
		<div id="search_3_co3">
			<div id="co3_1">
				<span>도서 DB 이미지 제공 : 알라딘 인터넷서점</span>
			</div>

		</div>
	</div>
    <div id="search_4">
    	<span>담당부서 :&nbsp;</span>자료봉사과
		<span>담당자 :&nbsp;</span> 류주연
		<span>전화번호 :&nbsp;</span> 231-2063
    </div>
</div>        
        
<%@ include file="../include/footer.jsp" %>