<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>


<title>도서</title>

<link rel="stylesheet" href="../resources/book/bookRental.css">


 
<script type="text/javascript">
$(function() {
	const operForm = $("#operForm");
	
	$("#list_btn").on("click", function(e) {
		 window.location.href = "/book/list";
	});

//	updateButton();
	
})


</script>

<div id="contents">
	<div id="rental_1">
	    <span class="font-underline">도서 대출 현황</span>
	</div>
	<div id="rental_2">
	
	</div>
	<div id="rental_3">
		<div id="rental_contents">
		<div id="rental_con1">
				<h2>대출 목록</h2>
				<br>
				<h4>대여중인 도서 : <c:out value="${total}" /></h4>
		</div>
		<div id="rental_con2">
			
			<table class="rental_info">
				<thead>
					<tr class="rental_title">
						<th>대출코드</th>
						<th>도서코드</th>
						<th>도서제목</th>
						<th>대여자</th>
						<th>대여일</th>
						<th>반납일</th>
						<th>대출상태</th>
						<th>반납</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${rental}" var="rental" varStatus="rentalStatus">
						<tr class="rental_list">
							<td><c:out value="${rental.brcode}" /></td>
						
							<td><c:out value="${rental.isbn}" /></td>
	
							<td><c:out value="${rental.booktitle}" /></td>
	
							<td><c:out value="${rental.userid}" /></td>
			
							<td>
								<fmt:formatDate pattern="YY-MM-dd" value="${rental.brdate}"/>
							</td>					
			
							<td>
								<fmt:formatDate pattern="YY-MM-dd" value="${rental.duedate}"/>
							</td>
							<td><c:out value="${rental.state}" /></td>
							
								<td>
								<form id='operForm' action="/book/rentalList" method="post">
									<input type='hidden' id='brcode' name='brcode' value='<c:out value="${rental.brcode}"/>'>
									<input type='hidden' id='state' name='state' value='<c:out value="${rental.state}"/>'>
							<c:if test="${auth.userid eq 'admin'}">
									<c:if test="${rental.state eq '반납'}">
										<button class="return_btn" id='return_chk' type="submit">반납완료</button>
									</c:if>
								
							</c:if>			
							<c:if test="${auth.userid eq rental.userid}">
									<c:if test="${rental.state eq '반납'}">
										<p>반납 확인중</p>
									</c:if>
									<c:if test="${rental.state eq '대출중'}">
										<button class="return_btn" id='return_btn' type="submit">반납하기</button>
									</c:if>
							</c:if>			
								</form>
								</td>
						</tr>
					</c:forEach>		
				</tbody>
			</table>

		</div>
		<div id="rental_con3">
			<button class="rental_button" id="list_btn">도서목록</button>
			
			<form id='operForm' action="/book/bookList" method="get">
			</form>
<%-- 			
			<c:if test="${auth.userid eq rental.userid}">
				<button class="rental_button" id="myRental">대출 신청</button>
			</c:if>
			<c:if test="${not empty auth}">
				<button class="rental_button" id="rentalList">대출 현황</button>
			</c:if>
			 --%>
			 
			 
			<!-- 버튼 클릭 이동
			<form id='operForm' action="/book/modify" method="get">
			</form>
			
			 -->
		</div>
		</div>
	</div>
	<div id="rental_4">

	</div>
</div>
<%@ include file="../include/footer.jsp" %>