<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<title>게시글 수정</title>
<link rel="stylesheet" href="../resources/board/modify.css">

<style>
h2{
margin : 0 auto;
}
.board-info {
    font-family: 'Arial', sans-serif;
    font-size: 14px;
    line-height: 1.5;
    background-color: #f5f5f5;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    white-space: pre-wrap;
    word-break: break-all;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
		var formObj = $("form");
		$('button').on("click", function(e) {
			e.preventDefault();
			var operation = $(this).data("oper");
			console.log(operation);
			if(operation === 'remove') {
				alert('글이 삭제되었습니다.')
				formObj.attr("action", "/board/remove");
			} else if(operation ==='list') {
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				formObj.empty();
				formObj.attr("action", "/board/list").attr("method", "get");
				formObj.append(pageNumTag);
				formObj.append(amountTag);
			}
			formObj.submit();
		});
	});
</script>

<div id="contents">
	<div id="modi_1">
	    <span class="font-underline">공지사항</span>
	</div>
	<div id="modi_2">
	
	</div>
	<div id="modi_3">

		<div class="wrapper_read">
			<div class="read_head">
				<h3>게시글 수정</h3>
			</div>
			<div class="read_line"></div>
			<form action="/board/modify" method="post">
				<input type='hidden' name='pageNum' value='<c:out value="${criteria.pageNum}" />'>
				<input type='hidden' name='amount' value='<c:out value="${criteria.amount}" />'>
				<table class="read_table">
					<thead>
						<tr class="read_table_title">		
							<th align="left" style="padding-left: 20px">번호</th>
							<td width="5%"><input class="form-control" name="bno" 
								value='<c:out value="${board.bno}"/>' style="border:none" readonly="readonly"></td>
							<th align="center" style="padding-left: 40px">제목</th>
							<td align="left"> <input class="form-control" name="title"
									value='<c:out value="${board.title}"/>'></td>
						</tr>
					    <tr class="read_table_title">
							<th align="left" style="padding-left: 20px">작성자</th>
							<td><input style="border:none" class="form-control" name="writer"
									value='<c:out value="${board.writer}"/>' readonly="readonly"></td>
							<th align="center" style="padding-left: 40px">작성일</th>
							<td align="left"><input style="border:none" class="form-control" name="regDate"
									value='<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/>' readonly="readonly"></td>
						</tr>
					</thead>
					<tbody>
						<tr class="read_table_contents">
				      		<td colspan="4">
				      		<div style="padding: 0 30px;">
								<textarea class="read_content" name="content"><c:out value="${board.content}"/></textarea>
							</div>
							</td>
						</tr>
					</tbody>
		
				</table>
				<div class="read_table_button">
					<c:if test="${auth.userid eq board.writer}">
						<button type="submit" data-oper='modify' class="read_button" >수정</button>
						<button type="submit" data-oper='remove' class="read_button" >삭제</button>
					</c:if>
				<button type="submit" data-oper="list" class="read_button">List</button>
				</div>
			</form>
		</div>
	</div>	<!-- 333333333333333333 -->
	<div id="modi_4">
	</div>
</div>

<%@ include file="../include/footer.jsp" %>