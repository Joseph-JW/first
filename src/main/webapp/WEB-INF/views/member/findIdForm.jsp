<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>


<title>아이디찾기</title>

<link rel="stylesheet" href="../resources/login/findForm.css">


 
<script type="text/javascript">
$(function() {
	$('#find_id_go').on('submit', function(event) {
        // 폼의 입력값을 가져옵니다.
        var username = $('#username').val();
        var phone = $('#phone').val();

        // 입력값이 비어있는 경우 폼 제출을 중단합니다.
        if (username === '' || phone === '') {
            // "잘못된 접근입니다" 알림을 표시합니다.
            alert('잘못된 접근입니다.');

            // 폼 제출을 중단합니다.
            event.preventDefault();
        }
    });
	
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
		
		<form method="post" action="/member/findId" id="find_id_go">
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