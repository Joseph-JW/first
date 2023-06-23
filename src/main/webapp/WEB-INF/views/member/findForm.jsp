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
	    <span class="font-underline">아이디찾기</span>
	</div>
	<div id="find_2">
	
	</div>
	<div id="find_3">
		<div id="find_id">
		
		<form method="post" action="/member/findId">
			<div id="find_id_top">
				<div class="find_a">
					<h2>아이디 찾기</h2>
				</div>
				<div class="find_b">
					<label for="username">이    름 </label>
					<input type="text" id="username" name="username">
				</div>
				<div class="find_b">
					<label for="phone">연락처 </label>
					<input type="text" id="phone" name="phone">
				</div>
			</div>
			<div id="find_id_bottom">
				<button type="submit">확인</button>
				<button type="reset">취소</button>
			</div>
			
			<c:if test="${check == 1}">
				<script type="text/javascript">
					opener.document.findform.name.value = "";				
					opener.document.findform.phone.value = "";				
				</script>
				<label>일치하는 정보가 존재하지 않습니다</label>
			</c:if>
			<c:if test="${check == 0}">
				<label>찾으시는 아이디는 '${userid }' 입니다</label>
				<div>
					<button type="button" value="확인"></button>
					
				</div>
			</c:if>

		</form>
		</div>

	</div>

	<div id="find_4">

	</div>
</div>

<script type="text/javascript">

	function closeTheWindow() {
		self.close();
	}
 </script>
<%@ include file="../include/footer.jsp" %>