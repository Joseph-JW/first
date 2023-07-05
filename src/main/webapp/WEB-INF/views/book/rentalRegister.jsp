<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    // 현재 시간을 가져오기 위해 Date 객체를 생성합니다.
    Date currentDate = new Date();

    // Calendar 객체를 사용하여 현재 시간에 7일을 더합니다.
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(currentDate);
    calendar.add(Calendar.DAY_OF_MONTH, 7);
    Date futureDate = calendar.getTime();

    // 출력할 날짜 형식을 지정합니다.
    SimpleDateFormat dateFormat = new SimpleDateFormat("yy-MM-dd");

    // 현재 시간과 7일 후의 시간을 지정한 형식으로 변환하여 출력합니다.
    String formattedCurrentDate = dateFormat.format(currentDate);
    String formattedFutureDate = dateFormat.format(futureDate);
%>

<title>도서 대여</title>

<link rel="stylesheet" href="../resources/book/bookRental.css">


 
<script type="text/javascript">

$(function() {
	let userid = "<c:out value='${auth.userid}' />";
	let message = "<c:out value='${message}' />";
	
	
	$('#rental_btn').click(function(e) {
		if (userid == "" || userid == null) {
			e.preventDefault(); 
			alert("로그인이 필요합니다. 로그인 후에 대출 신청해주세요.");
		} else{

			$("form").submit;
		}
		
	});
	
	
	
});	//close

</script>

<div id="contents">
	<div id="rental_1">
	    <span class="font-underline">도서 대출 신청</span>
	</div>
	<div id="rental_2">
	
	</div>
	<div id="rental_3">
		<div id="rental_contents">
		<div id="rental_con1">
				<h2>대출 신청</h2>
				<br>
		</div>

		<form role="form" action="/book/rentalRegister" method="post">
		
		<div id="rental_con2">
			
			<table class="rental_info">
				<thead>
					<tr class="rental_title">
						<th>도서제목</th>
						<th>대여자</th>
						<th>대여일</th>
						<th>반납일</th>
						<th>대출상태</th>
					</tr>
				</thead>
				<tbody>
					
						<tr class="rental_list">
							<td>
								<select name="booktitle">
								    <c:forEach items="${book}" var="bookItem">
								        <c:forEach items="${bookItem.booktitle}" var="title">
								            <option value="${title}">${title}</option>
								        </c:forEach>
								    </c:forEach>
								</select>
							</td>
	
							<td>
								<input type="hidden" name="userid" value='<c:out value="${auth.userid}" />' />
								<c:out value="${auth.userid}" />
							</td>
			
							<td>
								<%= formattedCurrentDate %>
							</td>					
			
							<td>
								<%= formattedFutureDate %>
							</td>
	
							<td><c:out value="${rental.state}" /></td>
							
							

						</tr>
				</tbody>
			</table>
		</div>
		<div id="rental_con3">
			<input type="hidden" name="state" value="<c:out value='${rental.state}' />">
			<button type="submit" class="rental_button" id="rental_btn">대출신청</button>
			
		
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
		</form>
		
		</div>
	</div>
	<div id="rental_4">
										
	</div>
</div>
<%@ include file="../include/footer.jsp" %>