<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<title>공지사항</title>
<link rel="stylesheet" href="../resources/board/list.css">



<script type="text/javascript">
$(function() {
	$(".write_btn").on("click", function(e) {
		self.location = "/board/register";
	});
	
	let result = '<c:out value="${result}"/>';
		
	checkModal(result);
	history.replaceState({}, null, null);
	function checkModal(result) {
		if(result ==='' || history.state) {
			return;
		}
		if(parseInt(result) > 0) {
			result = parseInt(result) + " 번 글이 등록되었습니다.";
		} else {
			result = "처리 완료!"
		}
		alert(result);
	}
	
	$(".get").on("click", function(e) {
		e.preventDefault();	
		let form = $('<form></form>');
		form.attr("method", "get");
		form.attr("action", "/board/get");
	    form.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
	    form.append("<input type='hidden' name='pageNum' value='" + <c:out value="${pageDTO.criteria.pageNum}"/> + "'>");
	    form.append("<input type='hidden' name='amount' value='" + <c:out value="${pageDTO.criteria.amount}"/> + "'>");
		form.appendTo("body");
		form.submit();
	});
	
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		let form = $('<form></form>');
		form.attr("method", "get");
		form.attr("action", "/board/list");
	    form.append("<input type='hidden' name='pageNum' value='" + $(this).attr("href") + "'>");
	    form.append("<input type='hidden' name='amount' value='" + <c:out value="${pageDTO.criteria.amount}"/> + "'>");
		form.appendTo("body");
		form.submit();
	});
	
	let list = new Array();
	<c:forEach items="${list}" var="board">
		list.push(<c:out value="${board.bno}" />);
	</c:forEach>
	$.getJSON(
			"/replies/cnt",
			{list : list},
			function(data) {
				let keys = Object.keys(data);
				$(keys).each(function(i, bno) {
					let replyCnt = data[bno];
					let text = $("a[name=" + bno + "]").text().trim() + " [" + replyCnt + "]";
					$("a[name=" + bno + "]").text(text);
				});
	});
	
})	//close
</script>
<div id="contents">
	<div id="noti-1">
	    <span class="font-underline">공지사항</span>
	</div>
	<div id="noti-2">
	
	</div>
	<div id="noti-3">
		<table class="board_table">
			<thead>
				<tr class="table_title" >
					<th width="7%">번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody class="table_content">
				<c:if test="${empty list}" >
					<tr>
						<td>
							<p align="center">
								<b>등록된 글이 없습니다.</b>
							</p>
						</td>
					</tr>
				</c:if>
				<c:if test="${!empty list}" >
					<c:forEach items="${list}" var="board" varStatus="boardStauts">
						<tr class="tr_list">
							<td align="center"><c:out value="${board.bno}" /></td>
							<td align="left" style="padding-left: 10px">
								<a class="get" href='<c:out value="${board.bno}"/>' name='<c:out value="${board.bno}"/>'>
									<c:out value="${board.title }" />
								</a>				
							</td>
							<td align="center"><c:out value="${board.writer }" /></td>
							<td align="center">
								<c:choose>
									<c:when test="${board.regdate} == ${board.updatedate}">
										<fmt:formatDate pattern="YY-MM-dd hh:mm" value="${board.regdate }"/>
									</c:when>
									<c:otherwise>
										<fmt:formatDate pattern="YY-MM-dd hh:mm" value="${board.updatedate }"/>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
				 	</c:forEach>
				</c:if>
			</tbody>
		</table>
	
	</div>
	<div id="noti-4">
	
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
		
		<div class="board_bottom">
				<button class="write_btn" id="writed_btn">글쓰기</button>
		</div>
	</div>
</div>	
<%@ include file="../include/footer.jsp" %>