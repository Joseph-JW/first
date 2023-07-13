<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>


<title>아이디찾기</title>

<link rel="stylesheet" href="../resources/login/findForm.css">


 
<script type="text/javascript">
$(function() {

})

 </script>

<div id="contents">
	<div id="find_1">
	    <span class="font-underline">아이디 확인</span>
	</div>
	<div id="find_2">
	
	</div>
	<div id="find_3">
		<div id="find_id">
		
		<form method="get" action="/member/login" >
			<div id="find_id_top">
				<div class="find_a">
					<h2>아이디 확인</h2>
				</div>
				<div class="find_f">
					<!-- check 값에 따라 결과 표시 -->
			        <c:if test="${check == 1}">
			            <p>일치하는 회원 정보가 없습니다.</p>
			        </c:if>
			        <c:if test="${check == 0}">
			            <p>회원 아이디: ${userid}</p>
			        </c:if>
		       	
				</div>

			</div>
			<div id="find_id_bottom">
				<button type="submit">확인</button>
			</div>
		</form>
		</div>

	</div>

	<div id="find_4">

	</div>
</div>


<%@ include file="../include/footer.jsp" %>