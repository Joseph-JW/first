<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>


<title>도서</title>

<link rel="stylesheet" href="../resources/book/getBook.css">


 
<script type="text/javascript">
$(function() {
	const operForm = $("#operForm");
	$("#list_btn").on("click", function(e) {
		operForm.find("#isbn").remove();
		operForm.attr("action","/book/list");
		operForm.submit();
	});

	let isbn = '<c:out value="${book.isbn}" />';
	console.log(isbn);
	$.getJSON(
		"/book/getAttachList/" + isbn,
		function(attachList) {
			console.log(attachList);
			let str = "";
			$(attachList).each(function(i, attach) {
				if (attach.filetype) {
					let fileCallPath = encodeURIComponent(attach.uploadpath + "\\s_" + attach.uuid + "_" + attach.filename);
					str += "<li data-path='" + attach.uploadpath + "' data-uuid='" + attach.uuid + "'";
					str += "		data-filename='" + attach.filename + "' data-type='" + attach.image + "'>";
					str += "		<div>";
					str += "			<img src='/display?filename=" + fileCallPath + "'>";
					str += "		</div>";
					str += "</li>";
				} else {
					str += "<li data-path='" + attach.uploadpath + "' data-uuid='" + attach.uuid + "'";
					str += "		data-filename='" + attach.filename + "' data-type='" + attach.filetype + "'>";
					str += "		<div>";
					str += "			<span> " + attach.filename + "</span>";
					str += "			<img src='/resources/img/attach.png'>";
					str += "		</div>";
					str += "</li>";
				}
			});
			$(".uploadResult ul").html(str);
		}
	);

	function showImage(fileCallPath) {
		//$(".bigPictureWrapper").css("display", "flex").show();
		//$(".bigPicture").html("<img src='/display?filename=" + fileCallPath + "'>").animate({ width: '100%', top: '0' }, 600);
	}

	$(".uploadResult").on("click", "li", function(e) {
		console.log("view image");
		let liObj = $(this);
		let path = encodeURIComponent(liObj.data("path") + "\\" + liObj.data("uuid") + "_" + liObj.data("filename"));
		if (liObj.data("type")) {
			//showImage(path);
		} else {
			if (path.toLowerCase().endsWith('pdf')) {
				// 새창
				window.open("/pdfviewer?filename=" + path);
			} else {
				// download
				window.location = "/downloadFile?filename=" + path;
			}
		}
	});

	/*
	$(".bigPictureWrapper").on("click", function(e) {
		$(".bigPictureWrapper").hide();
		$(".bigPicture").css("top", "15%");
	});
	*/
	
})//close


</script>

<div id="contents">
	<div id="getBook_1">
	    <span class="font-underline">도서 정보</span>
	</div>
	<div id="getBook_2">
	
	</div>
	<div id="getBook_3">
		<div id="get3_contents">
			<div class="get3_content">
				<div class="get3_cont1">
					<input type="checkbox">
				</div>
				<div class="get3_cont2">
					<div class="uploadResult">
						<ul></ul>
					</div>
				</div>
				<div class="get3_cont3">
					<ul>
						<li>[도서] : <c:out value="${book.booktitle }"/></li>
						<li>저자 : <c:out value="${book.bookwriter }"/></li>
						<li>장르 : <c:out value="${book.genre }"/></li>
						<li>출판사 : <c:out value="${book.publication }"/></li>
						<li>출판일: <fmt:formatDate value="${book.publicationdate}" pattern="yyyy-MM-dd" /></li>
						<li>도서번호 : <c:out value="${book.isbn }"/></li>
						<li>소장도서관 : <c:out value="${book.possession }"/></li>
						<li>대출가능여부 : 
							<c:choose>
						        <c:when test="${book.available == 0}">가능
								</c:when>
								<c:otherwise> 불가능
								</c:otherwise>
							</c:choose>
						</li>
					</ul>
				</div>
			</div>
		</div>		
	</div>
	<div id="getBook_4">
		<!-- modal -->
		<div class="read_bottom">
			<button id="list_btn">목록</button>
			<form id='operForm' action="/board/modify" method="get">
				<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
				<input type='hidden' name='pageNum' value='<c:out value="${criteria.pageNum}"/>'>
				<input type='hidden' name='amount' value='<c:out value="${criteria.amount}"/>'>
			</form>
		</div>
		
		<div class="bigPictureWrapper">
			<div class="bigPicture"></div>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>