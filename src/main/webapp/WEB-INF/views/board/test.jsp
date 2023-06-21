<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>


<title>게시글 확인</title>

<link rel="stylesheet" href="../resources/board/test.css">


 
<script type="text/javascript">
$(document).ready(function() {
    $("#searchForm").submit(function(event) {
        event.preventDefault(); // 폼의 기본 동작 중단

        // 검색어 가져오기
        var keyword = $("#keyword").val();

        // AJAX 요청
        $.ajax({
            type: "GET",
            url: "/board/searchBook",
            data: { keyword: keyword },
            success: function(data) {
            	console.log(data)
                // 검색 결과를 처리하는 함수 호출
                handleSearchResult(data);
            },
            error: function() {
                alert("검색 요청 실패");
            }
        });
    });

    function handleSearchResult(data) {
        let str = "";
        let resultUL = $(".searchResult");
        if (data == null || data.length == 0) {
            resultUL.html(str);
            return;
        }

        // 검색 결과를 반복문으로 돌면서 출력
        for (var i = 0; i < data.length; i++) {
            var book = data[i];
			str += "<li id='result'>";
			str += "<div><ul>";
            str += "<li>[도서] : " + book.booktitle + " </li>";
            str += "<li>저자 : " + book.bookwriter + "</li>";
            str += "<li>출판사 : " + book.publication + "</li>";
            str += "<li>출판일 : " + formatDate(book.publicationdate) + "</li>";
            str += "<li>소장도서관 : " + book.possession + "</li>";
            str += "<li>등록번호 : " + book.isbn  + "</li>";
            str += "<li>대출가능여부 : " + (book.available == 0 ? "가능" : "불가능") + "</li>";
            str += "</ul></div><li>"
        }

        resultUL.html(str);
    }

    function formatDate(date) {
        var formattedDate = new Date(date);
        var year = formattedDate.getFullYear();
        var month = ("0" + (formattedDate.getMonth() + 1)).slice(-2);
        var day = ("0" + formattedDate.getDate()).slice(-2);

        return year + "-" + month + "-" + day;
    }
    $(".slider").bxSlider();
 })	//close

 </script>

<div id="contents">
	<div id="test_1">
	    <span class="font-underline">공지사항</span>
	</div>
	<div id="test_2">
	
	</div>
	<div id="test_3">
		<h1>도서 검색</h1>
    <form id="searchForm">
        <input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요">
        <input type="submit" value="검색">
    </form>
	    <div id="searchResult">
	    	<ul class="searchResult"></ul>
	    </div>
	</div>

	<div id="test_4">
		<div class="slider">
      <div>I am a slide.</div>
      <div>I am another slide.</div>
    </div>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>