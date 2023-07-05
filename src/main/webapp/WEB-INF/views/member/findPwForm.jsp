<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>


<title>비밀번호찾기</title>
<script src="../resources/signup/signup.js" defer></script>
<link rel="stylesheet" href="../resources/login/findForm.css">


 
<script type="text/javascript">
$(function() {
	
	var failMessage = "${fail}";
    if (failMessage) {
        alert(failMessage);
    }
	
	$("#phone").on("input", function(e) {
		let phoneck = $(this).val();
		if(phoneck.length === 10) {
			$("#send").attr("style", "background-color: #ffffff; color: #0068ff; cursor: pointer;");
			$("#send").attr("disabled", false);
		}
	})
	
	
	// 인증
	$("#send").on("click", function(e) {
		memberService.getToken($("#token"), $("#send"), $("#finished"), $("#timer"));
	});
	$("#finished").on("click", function(e) {
		memberService.getTimerIntervalConfirm($("#finished"));
	});
	
	
	$("#findPw_button").on("click", function(e) {
		e.preventDefault();
		if(isValid()) {
			$("form").submit();
		} else {
			alert("입력정보를 다시 확인해 주세요");
		}
	})
	
	function isValid() {
		const userid = $("#userid").val();
		const username = $("#username").val();
		const phone = $("#phone").val();
		const finished = $("#finished").text();
		if(userid === "" || username === "" || phone === "" ) {
			return false;
		}
		if(finished !== "인증완료") {
			return false;	
		}
		return true;
	}


	
})	//close

 </script>

<div id="contents">
	<div id="find_1">
	    <span class="font-underline">비밀번호 찾기</span>
	</div>
	<div id="find_2">
	
	</div>
	<div id="find_3">
		<div id="find_id">
		
		<form method="post" action="/member/findPw">
			<div id="find_id_top">
				<div class="find_a">
					<h2>비밀번호 찾기</h2>
				</div>
				<div class="find_b">
					<label for="userid">아이디 </label>
					<input type="text" id="userid" name="userid"  required="required">
				</div>
				<div class="find_b">
					<label for="username">이    름 </label>
					<input type="text" id="username" name="username" required="required">
				</div>
				<div class="find_b">
					<label for="phone">연락처 </label>
					<input type="text" id="phone" name="phone" required="required" maxlength="11">
				</div>
				<div class="find_d">
					<span id="token">000000</span>
						<button class="auth_button" id="send" type="button" disabled="disabled" >
							인증번호 전송
						</button>
						<span id="timer">3:00</span>
						<button class="auth_button" id="finished" type="button" disabled="disabled" >
							인증완료
						</button>
				</div>
			</div>
			<div id="find_id_bottom">
				<button type="submit" id="findPw_button">확인</button>
				<button type="reset">취소</button>
			</div>
		
		</form>
		</div>

	</div>

	<div id="find_4">

	</div>
</div>


<%@ include file="../include/footer.jsp" %>