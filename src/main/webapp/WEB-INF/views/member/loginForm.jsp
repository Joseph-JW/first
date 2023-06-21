<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>


<link rel="stylesheet" href="../resources/login/login.css">
<script src="../resources/login/loginForm.js"></script>
<script type="text/javascript">
$(function() {
	$(".login_button").on("click", function(e) {
		e.preventDefault();
		if (isValid()) {
			$("form").submit();
		}
	});
	
	function isValid() {
		const id = $("#login_userid").val();
		const pw = $("#login_userpw").val();
			
		$("#error_userid").text("");
		$("#error_userpw").text("");
			
		if(id === "") {
			alert("아이디를 입력해주세요.");
			$("#login_userid").focus();
			return false;
		}	
		if(pw === "") {
			alert("비밀번호를 입력해주세요.");
			$("#login_userpw").focus();
			return false;
		}
		return true;
	}
	
	let error = "<c:out value='${error}' />";
	console.log(error);
	if(error === "") {
		return;
	}
	if(error == "nonUser") {
		$("#login_userid").focus();
	} else {
		$("#login_userpw").focus();
	}
	
	let msg = (error === "nonUser") ? "존재하지 않는 사용자입니다." : "비밀번호가 일치하지 않습니다.";
	alert(msg);
})
</script>
<title>로그인창</title>
<div id="contents">
	<form action="/member/login" method="post">
            <div id="cont1">
                <span class="underline">로그인</span>
            </div>
            <div id="cont2">
                <span>대구광역시립 중앙도서관</span> 방문을 환영합니다
            </div>
            <div id="cont3">
                <div id="cont3_inner">
                    <div id="cont3_inner_a">
                        <div id="cont3_in1">
                            <img src="../resources/images/login.png" alt="">
                        </div>
                        <div id="cont3_in2">
                            <div id="cont3_in2_a">
                                <input type="text" class="loginBox" id="login_userid" name="userid" value="${memberVO.userid}" placeholder="아이디">
                                <input type="password" class="loginBox" id="login_userpw" name="userpw" value="${memberVO.userpw}" placeholder="비밀번호">
                            </div>
                            <div id="cont3_in2_b">
                                <button class="login_button" type="submit">로그인</button>
                            </div>
                            
                        </div>
                        <div id="cont3_in3">
                            <div id="cont3_in3_a">
                                <ul>
                                    <li>회원가입 ▶</li>
                                    <li>아이디 찾기 ▶</li>
                                    <li>비밀번호 찾기 ▶</li>
                                </ul>
                                
                            </div><hr>
                            <div id="cont3_in3_b">
                                <span>※ 기존 회원은 통합회원 인증 후 로그인할 수 있습니다.</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
	</form> 
</div>
<%@ include file="../include/footer.jsp" %>