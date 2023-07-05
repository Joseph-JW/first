<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>


<title>비밀번호찾기</title>

<link rel="stylesheet" href="../resources/login/findForm.css">


 
<script type="text/javascript">
$(function() {

	$("#findPw_button").on("click", function(e) {
		e.preventDefault();
		if(isValid()) {
			$("form").submit();
			alert("비밀번호가 변경되었습니다.");
			
		} else{
			alert("다시 확인해주세요");
		}
		
	})
	
	function isValid() {
		const userpw = $("#userpw").val();
		const pwCk = $("#pwCk").val();

		
		$("#error__userpw").text("");		
		$("#error__pwCk").text("");
		
		var regExp = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_\-+=])[a-zA-Z\d!@#$%^&*()_\-+=]{8,20}$/;
		if(regExp.test(userpw) === false) {
			$("#error__userpw").text("올바른 비밀번호가 아닙니다.");
			$("#userpw").focus();
			return false;
		} 
		
		if(userpw === "") {
			$("#error__pwCk").text("비밀번호를 확인해 주세요");
			$("#pwCk").focus();
			return false;
		}
		if(pwCk === "") {
			$("#error__pwCk").text("비밀번호를 확인해 주세요");
			$("#pwCk").focus();
			return false;
		}
		if(userpw !== pwCk) {
			alert("비밀번호가 일치하지않습니다");
			return false;
		}
		return true;
	}
})

 </script>

<div id="contents">
	<div id="find_1">
	    <span class="font-underline">비밀번호 변경</span>
	</div>
	<div id="find_2">
	
	</div>
	<div id="find_3">
		<div id="find_id">
		
		<form method="post" action="/member/modifyPw">
			<div id="find_id_top">
				<div class="find_a">
					<h2>비밀번호 변경</h2>
				</div>
				<div class="find_e">
	                	<p>※ 영문, 숫자, 특수문자 혼합한 8~20자 사용하세요.</p>
                    </div>
				<div class="find_b">
					<label for="userpw">새 비밀번호 </label>
					<input type="hidden" name="userid" value="<c:out value='${member.userid }' />">
		            <input type="password" id="userpw" name="userpw" maxlength="20">
		            <div class="error" id="error__userpw"></div>
		            
				</div>
				<div class="find_b">
					<label for="pwCk">비밀번호확인</label>
					<input type="password" id="pwCk">
					<div class="error" id="error__pwCk"></div>
				</div>

			</div>
			<div id="find_id_bottom">
				<button type="submit" id="findPw_button">확인</button>
			</div>
		</form>
		</div>

	</div>

	<div id="find_4">

	</div>
</div>


<%@ include file="../include/footer.jsp" %>