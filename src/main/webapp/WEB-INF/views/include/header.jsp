<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="../resources/css/style.css">	
 	<link rel="stylesheet" href="../resources/css/header.css">
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="stylesheet" href="../resources/bxslider/jquery.bxslider.css">
	<script src="../resources/bxslider/jquery.bxslider.min.js"></script>
	
<script type="text/javascript">
$(function() {
	let msg = "${msg}";
	if (msg === "") {
		return;
	}
	let txt;
	if (msg === "logout") {
		txt = "로그아웃 되었습니다.";
	}
	alert(txt);
	

})	//close

</script>

</head>
<body>
	<header id="header">
        <div id="headerTop">
			<div id="mLogo">
				<a href="http://localhost:8090/"><img src="../resources/images/main_logo.png" alt=""></a>
			</div>
			<div id="sign">
				<ul>
				<c:choose>
					<c:when test="${!empty auth}">
						<li>
							<span><c:out value="${auth.username}"></c:out>님 반갑습니다.</span>
							<span class="bar">&nbsp;&nbsp;|</span>
						</li>
						<li>
							<a href="/member/memberModify">회원정보수정
								<span class="bar">&nbsp;&nbsp;|</span>
							</a>
						</li>
						<li>
							<a href="/member/logout">로그아웃
								<span class="bar">&nbsp;&nbsp;|</span>
							</a>
						</li>
					</c:when>
					<c:otherwise>				
						<li>
							<a href="/member/login">통합허브시스템 로그인
								<span class="bar">&nbsp;&nbsp;|</span>
							</a>
						</li>
						<li>
							<a href="/member/signup">회원가입
								<span class="bar">&nbsp;&nbsp;|</span>
							</a>
						</li>
						<li>
							<a href="/member/findId">아이디찾기
								<span class="bar">&nbsp;&nbsp;|</span>
							</a>
						</li>
						<li>
							<a href="/member/findPw">비밀번호찾기
		  						<span class="bar">&nbsp;&nbsp;|</span>
							</a>
						</li>
					</c:otherwise>
				</c:choose>
					<li>
						<a href="#">통합회원인증</a>
					</li>
				</ul>
			</div>
			<div id="sns">
				<a href="#"><img src="../resources/images/facebook.png" alt=""></a>
					<span></span>
	                    <a href="#"><img src="../resources/images/instagram.png" alt=""></a>
			</div>
		</div>
        <hr>
		<nav id="nav">
			<ul>
				<li>
					<a href="/board/search">자료검색</a>
					<ul>
						<li></li>
						<li></li>
						<li></li>
					</ul>
				</li>
				<li>
 					<a href="/board/education">평생교육</a>
					<ul>
						<li></li>
						<li></li>
					    <li></li>
                    </ul>
				</li>
				<li>
					<a href="/board/cultureEvent">독서문화행사</a>
					<ul>
						<li></li>
						<li></li>
						<li></li>
						</ul>
				</li>
				<li>
					<a href="/board/list">열린공간</a>
					<ul>
						<li></li>
						<li></li>
						<li></li>
					</ul>
				</li>
				<li>
					<a href="/board/information">정보공개</a>
					<ul>
						<li></li>
						<li></li>
						<li></li>
                        </ul>
				</li>
				<li>
					<a href="/board/guide">도서관안내</a>
					<ul>
						<li></li>
						<li></li>
						<li></li>
					</ul>
				</li>
				<li>
					<a href="/book/register">도서등록</a>
					<ul>
						<li></li>
						<li></li>
						<li></li>
					</ul>
				</li>
        	</ul>
    	</nav>
	</header>
</body>
</html>