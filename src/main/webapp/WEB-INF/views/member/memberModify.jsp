<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<title>회원정보수정</title>
<link rel="stylesheet" href="../resources/signup/memberModify.css">
<script src="../resources/signup/signup.js" defer></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
$(function() {
	
	
	/* 생년월일 */
	$("#birthday").on("input", function() {
	      var birthday = $(this).val();
	      if (birthday.length === 8) {
	        $("#phone1").focus();
	      }
	   });
	
	/* 전화번호 */
	$("#phone1").on("change", function() {
      var selectValue = $(this).val();
      if (selectValue != "") {
        $("#phone2").focus();
      }
    });
    $("#phone2").on("input", function(e) {
		let phone2 = $(this).val();
		if(phone2.length === 4) {
			$("#phone3").focus();
		}
	});
	$("#phone3").on("input", function(e) {
		let phone3 = $(this).val();
		if($("#phone1").val() != "" && $("#phone2").val().length === 4 && $("#phone3").val().length === 4) {
			$("#send").attr("style", "background-color: #ffffff; color: #0068ff; cursor: pointer;");
			$("#send").attr("disabled", false);
		}		
	});
	
	$("#send").on("click", function(e) {
		memberService.getToken($("#token"), $("#send"), $("#finished"), $("#timer"));
	});
	$("#finished").on("click", function(e) {
		memberService.getTimerIntervalConfirm($("#finished"));
	});
	
	/* 수정버튼 */
	$("#modify_button").on("click", function(e) {
		e.preventDefault();
		if (isValid()) {
			$("form").submit();
		} else {
			alert("정보가 올바르지 않습니다.")
		}
	})
	
	function isValid() {
		const userid = $("#signup_userid").val();
		const password1 = $("#signup_userpw").val();
		const password2 = $("#pwCk").val();
		const username = $("#name1").val();
		const gender = $("#gender").val();
		const birthday = $("#birthday").val();
		const location = $("#location").val();
		const postcode = $("#postcode").val();
		const email = $("#signup_email").val();
		const domain = $("#domain").val();
		const address = $("#sign_address").val();
		
		$("#error__userid").text("");
		$("#error__password1").text("");		
		$("#error__password2").text("");
		$("#error__name").text("");
		$("#error__gender").text("");
		$("#error__birthday").text("");
		//$("#error__address").text("");
		$("#error__email").text("");
		
		if(userid === "") {
			$("#error__userid").text("아이디가 올바르지 않습니다.");
			$("#signup_userid").focus();
			return false;
		}
		
		var regExp = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_\-+=])[a-zA-Z\d!@#$%^&*()_\-+=]{8,20}$/;
		if(regExp.test(password1) === false) {
			$("#error__password1").text("올바른 비밀번호가 아닙니다.");
			$("#signup_userpw").focus();
			return false;
		} 
		if(password1 === "") {
			$("#error__password1").text("비밀번호를 입력하세요.");
			$("#signup_userpw").focus();
			return false;
		}
		
		if(password2 === "") {
			$("#error__password2").text("비밀번호를 입력하세요.");
			$("#pwCk").focus();
			return false;
		}
		if(password1 !== password2) {
			$("#error__password1").text("비밀번호가 일치하지 않습니다.");
			$("#error__password2").text("비밀번호가 일치하지 않습니다.");
			return false;
		}
		if(username === "") {
			$("#error__name").text("이름이 올바르지 않습니다.");
			$("#name1").focus();
			return false;
		}
		
		const validEmail = ["-직접입력", "gmail.com", "naver.com", "daum.net", "yahoo.com", "hotmail.com", "iCloud.com"];
		if((email == null || email === "") && !validEmail.includes(domain)) {
			$("#error__email").text("이메일을 입력해 주세요.");
			$("#signup_email").focus();
			return false;
		}
		
		return true;
		}
	
	
	// 주소
	$("#sign_address, #detailAddress").on("input", function() {
		  var signAddress = $("#sign_address").val();
		  var detailAddress = $("#detailAddress").val();
		  var combinedAddr = signAddress + " " + detailAddress;
		  $("input[name='location']").val(combinedAddr);
		});

	
	
	// 이메일
	function selectMail() {
  let selectedMail = $('#mail-select').val();
  if (selectedMail === 'custom') {
    $('#domain').val('');
  } else {
    let selectedValue = $('#mail-select option:selected').text();
    $('#domain').val(selectedValue);
  }
  updateEmailField();
}
	  
	 $("#mail-select").on("change", function() {
		    selectMail();
		  });
	  
	 function updateEmailField() {
		    var signupEmail = $("#signup_email").val();
		    var domain = $("#domain").val();

		    $("#email_tt").val(signupEmail + "@" + domain);
	}
	  

})	//close
	
	function pwShow() {
		var type = $('#signup_userpw').attr('type');
		if (type === 'password') {
			$('#signup_userpw').attr('type', 'text');
		} else if (type === 'text') {
		    $('#signup_userpw').attr('type', 'password');
		 }		
	}
	
	function searchAddress(){
	    new daum.Postcode({
	    	oncomplete: function(data) {
	        console.log(data)
	        var address = data.address;
	        var postcode = data.zonecode;
			
	        document.getElementById("postcode").value = postcode
	        document.getElementById("address").value = address
	        }
	    }).open();
	}




</script>

<div id="contents">
	<div id="modi_1">
	    <span class="font-underline">회원정보</span>
	</div>
	<div id="modi_2">
	
	</div>
	<div id="modi_3">
			<form action="/member/memberModify" method="post">
			<div id="cont-2">
            <div id="cont-name">
                <h3>회원정보수정</h3>
            </div>
            <div id="cont-cont">
                <ul id="signup">
                    <li>
                        <div class="need">아이디</div>
                        <div class="needs">
                            <div id="id">
                                <input type="text" id="signup_userid" name="userid" value = "<c:out value='${vo.userid}' />" readonly="readonly">
                           
                                <div class="error" id="error__userid"></div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="need">비밀번호<span>*</span></div>
                        <div class="needs">
                            <div id="pwd">
                                <div>
                                	<div>
		                                <input type="password" id="signup_userpw" name="userpw" maxlength="20">
		                                <button type="button" onClick="pwShow()">보기</button>
	                                </div>
	                                <div class="error" id="error__password1"></div>
	                             	<div>
	                           			<p>※ 영문, 숫자, 특수문자 혼합한 8~20자 사용하세요.</p>
                                	</div>
                                </div>
                                
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="need">비밀번호 확인<span>*</span></div>
                        <div class="needs">
                            <div id="pwdCk">
                                <input type="password" id="pwCk">
                                <div class="error" id="error__password2"></div>
                            </div>
                        </div>                    
                    </li>
                    <li>
                        <div class="need">이름<span>*</span></div>
                        <div class="needs">
                            <div id="name">
                                <input type="text" id="name1" name="username" value = "<c:out value='${vo.username}' />" maxlength="8" >
                                <div class="error" id="error__name"></div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="need">성별<span>*</span></div>
                        <div class="needs">
                            <div id="sex">
                                <select id="gender" name="gender" value = "<c:out value='${vo.gender}' />" >
                                    <option value="남자">남자</option>
                                    <option value="여자">여자</option>
                                    <option value="기타">기타</option>
                                  </select>
                                  <div class="error" id="error__gender"></div>
                            </div>
                        </div>
                        
                    </li>
                    <li>
                        <div class="need">생년월일<span>*</span></div>
                        <div class="needs">
                            <div id="birth">
                                <input type="text" id="birthday" name="birth" value = "<c:out value='${vo.birth}' />" >
                                <div class="error" id="error__birthday"></div>
                                <p>※ 생년월일 8자리를 숫자만 입력해 주세요. 예)19991231</p>
                            </div>
                        </div>
                        
                    </li>
                    <li>
                        <div class="need">연락처<span>*</span></div>
                        <div class="needs">
                            <div id="phone">
                                <div>
                                <select name="phone1" id="phone1" value = "<c:out value='${phone1}' />" >
                                    <option value="010">010</option>
                                    <option value="011">011</option>
                                    <option value="016">016</option>
                                    <option value="019">019</option>
                                    <option value="02">02</option>
                                    <option value="031">031</option>
                                    <option value="032">032</option>
                                    <option value="033">033</option>
                                    <option value="041">041</option>
                                    <option value="042">042</option>
                                    <option value="043">043</option>
                                    <option value="044">044</option>
                                    <option value="051">051</option>
                                    <option value="052">052</option>
                                    <option value="053">053</option>
                                    <option value="054">054</option>
                                    <option value="055">055</option>
                                    <option value="061">061</option>
                                    <option value="062">062</option>
                                    <option value="063">063</option>
                                    <option value="064">064</option>

                                </select>
                                - <input type="text" id="phone2" name="phone2" value = "<c:out value='${phone2}' />" > - 
                                	<input type="text" id="phone3" name="phone3" value = "<c:out value='${phone3}' />" >
                            	</div>
                            	<div>
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
		         		</div>
                    </li>
                   
                   	
                    <li>
                        <div class="need">주소<span>*</span></div>
                        <div class="needs">
                            <div id="sign_addr">
                                <input type="text" name="postcode" id="postcode" placeholder="우편번호" disabled>
                                <button type="button" onClick="searchAddress()" id="schAddr">주소 검색</button><br>
                                <input type="text" id="sign_address" name="sign_address" placeholder="주소" disabled>
                                <input type="text" id="detailAddress" id="detailAddress" placeholder="상세주소">
                                <input type="hidden" name="location">                               
                                <div class="error" id="error__address"></div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="need">이메일</div>
                        <div class="needs">
                            <div id="email">
								
                                <input type='text' id="signup_email" name="email_addr" value = "<c:out value='${email1}' />"/>@
                                <input type='text' id="domain" name="email_domain" value = "<c:out value='${domain}' />"/> 
                                <input type='hidden' name='email' id="email_tt"/>
                                <select onchange="selectMail()" id="mail-select">
                                    <option value="custom">-직접입력</option>
                                    <option value="gmail">gmail.com</option>
                                    <option value="naver">naver.com</option>
                                    <option value="daum">daum.net</option>
                                    <option value="yahoo">yahoo.com</option>
                                    <option value="hotmail">hotmail.com</option>
                                    <option value="icloud">icloud.com</option>
                                </select>
                                <div class="error" id="error__email"></div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div id="signup_btn">
                <button type="submit" id="modify_button">수정</button>  <button type="reset">취소</button>
            </div>
	</div>
				
			</form>
		</div>
	</div>	<!-- 333333333333333333 -->
	<div id="modi_4">
	</div>
</div>

<%@ include file="../include/footer.jsp" %>