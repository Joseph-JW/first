<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>


<title>도서</title>

<link rel="stylesheet" href="../resources/book/bookList.css">


 
<script type="text/javascript">
$(function() {
	$(".get").on("click", function(e) {
		e.preventDefault();	
		let form = $('<form></form>');
		form.attr("method", "get");
		form.attr("action", "/book/getBook");
	    form.append("<input type='hidden' name='isbn' value='" + $(this).attr("value") + "'>");
	    form.append("<input type='hidden' name='pageNum' value='" + <c:out value="${pageDTO.criteria.pageNum}"/> + "'>");
	    form.append("<input type='hidden' name='amount' value='" + <c:out value="${pageDTO.criteria.amount}"/> + "'>");
		form.appendTo("body");
		form.submit();
	});
	
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		let form = $('<form></form>');
		form.attr("method", "get");
		form.attr("action", "/book/list");
	    form.append("<input type='hidden' name='pageNum' value='" + $(this).attr("href") + "'>");
	    form.append("<input type='hidden' name='amount' value='" + <c:out value="${pageDTO.criteria.amount}"/> + "'>");
		form.appendTo("body");
		form.submit();
	});
	
 	// list에 이미지 표시
	let list = new Array();
	<c:forEach items="${book}" var="list">
		list.push(<c:out value="${list.isbn}" />);
	</c:forEach>
	$.getJSON(
			"/book/getAttachListOnList",
			{list : list},
			function(data) {
				console.log(data);
				let str = "";
				let keys = Object.keys(data).sort((a, b) => Number(b)-Number(a));
				$(keys).each(function(i, isbn) {
					let attach = data[isbn];
					console.log(isbn);
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
	
	$("input[type='checkbox']").on("change", function() {
	    if ($(this).is(":checked")) {
	        var isbn = $(this).closest(".co1_ab").find(".get").val();
	        console.log(isbn); // 가져온 ISBN 값 콘솔에 출력하거나 원하는 처리를 수행합니다.
	    }
	});


})	//close


</script>

<div id="contents">
	<div id="book_1">
	    <span class="font-underline">도서 목록</span>
	</div>
	<div id="book_2">
	
	</div>
	<div id="book_3">
		<div id="book3_co1">
                <ul id="co1_ul">
                    <li>
                    	<c:forEach items="${book}" var="book" varStatus="bookStatus">
                        <div class="co1_ab">
                            <div class="bookList_cont3_a">
                                <input type="checkbox">
                            </div>
                            <div class="bookList_cont3_b">
                                <div class="bookImg" id="<c:out value='${book.isbn}'/>" ></div>
                                <button class="get" value='<c:out value="${book.isbn }"/>'>도서정보</button>
                            </div>
                            <div class="bookList_cont3_c">
								<ul>
									<li>[도서] : <c:out value="${book.booktitle }"/></li>
									<li>저자 : <c:out value="${book.bookwriter }"/></li>
									<li>출판사 : <c:out value="${book.publication }"/></li>
									<li>출판일: <fmt:formatDate value="${book.publicationdate}" pattern="yyyy-MM-dd" /></li>
									<li>소장도서관 : <c:out value="${book.possession }"/></li>
									<li>등록번호 : <c:out value="${book.isbn }"/></li>
									<li>대출가능여부 : 
										<c:choose>
									        <c:when test="${book.available == 0}">가능
											</c:when>
											<c:otherwise> 불가능
											</c:otherwise>
										</c:choose>
									</li>
									<li>
										
									</li>
								</ul>
                            </div>
                        </div>
                        </c:forEach>
                    </li>
                 
                </ul>
		</div>
	</div>
	<div id="book_4">
	
	<!-- page -->
		<div class="board_page">
			<ul class="pagination">
				<c:if test="${pageDTO.prev}">
					<li class="paginate_button previous">
						<a href="${pageDTO.startPage-1}">Prev</a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${pageDTO.startPage}" end="${pageDTO.endPage}">
					<li class="paginate_button ${pageDTO.criteria.pageNum == num? 'active_list' : '' }">
						<a href="${num}" >${num}</a>
					</li>
				</c:forEach>
				<c:if test="${pageDTO.next}">
					<li class="paginate_button next">
						<a href="${pageDTO.endPage+1}">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
	
	</div>
</div>
<%@ include file="../include/footer.jsp" %>